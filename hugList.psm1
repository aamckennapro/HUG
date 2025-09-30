# Let's see what importing other modules is like, the main hug.ps1 was getting extremely disorganized.

# This is going to look really weird, but thanks to how pwsh works I have to put all of the member functions
# BEFORE the object so that I can attach them within the Create-List function
# Getters / Accessors already exist within the object ($List.Name, $List.Items)
# Even adding new items is already built in with $List.Items.Add($Item)

# Methods
$AddItem = { # Even though $List.Items.Add($Item) exists, using this method is clearer
    param([PSCustomObject]$newItem) 
    if ($this.Items.IndexOf($newItem) -gt -1) { [void]$this.Items.Remove($newItem) }
    else {
        $this.Items.Add($newItem)
        Write-Output "Here you go! Added `"$($newItem.Name)`" with value `"$($newItem.Value)`" to `"$($this.Name)`"~!" 
    }
}

$FindItem = {
    param([string]$lookingFor)
    return $this.Items | Where { $_.Name -eq $lookingFor }
}

$RemoveItem = {
    param([string]$removeItemName)
    $removeItem = $this.FindItem($removeItemName)
    if ($removeItem.Length -eq 0) { Write-Error -Category InvalidArgument -Message "Error: $removeItemName does not exist in $this" }

    if ($this.Items.IndexOf($removeItem) -gt -1) { 
        [void]$this.Items.Remove($removeItem)
        Write-Output "Here you go! Removed `"$($removeItem.Name)`" with value `"$($removeItem.Value)`" from `"$($this.Name)`"~!"
    }
}

$ToHashtable = {
    $hashtable = @{}
    ForEach ($property in $this.psobject.Properties.Name) {
        $hashtable[$property] = $this.$property
    }
    return $hashtable
}

function New-HugList {
    param(
        [string]$Name
    )
    $newList = [PSCustomObject]@{
        Name = $Name
        Items = [System.Collections.Generic.List[PSCustomObject]]::new()
    }

    # Add methods
    $memberAddItem = @{
        MemberType  = "ScriptMethod"
        InputObject = $newList
        Name        = "AddItem"
        Value       = $AddItem
    }
    Add-Member @memberAddItem

    $memberFindItem = @{
        MemberType  = "ScriptMethod"
        InputObject = $newList
        Name        = "FindItem"
        Value       = $FindItem
    }
    Add-Member @memberFindItem

    $memberRemoveItem = @{
        MemberType  = "ScriptMethod"
        InputObject = $newList
        Name        = "RemoveItem"
        Value       = $RemoveItem
    }
    Add-Member @memberRemoveItem

    $memberToHashtable = @{
        MemberType  = "ScriptMethod"
        InputObject = $newList
        Name        = "ToHashtable"
        Value       = $ToHashtable
    }
    Add-Member @memberToHashtable

    return $newList
}

Export-ModuleMember -Function New-List
