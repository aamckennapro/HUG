$shortName = {
    if ($this.Name.Length -gt 15) {
        $short = $this.Name.Substring(0, 14) + "..."
        return $short
    }
    else { return $this.Name }
}

$spacey = {
    return " " * (15 - $this.Name.Length + 1)
}

function New-HugItem {
    param(
        [string]$Name,
        [string]$Value
    )
    
    $newItem = [PSCustomObject]@{
        Name = $Name
        Value = $Value
    }

    $memberShortName = @{
        MemberType  = "ScriptMethod"
        InputObject = $newItem
        Name        = "ShortName"
        Value       = $shortName
    }
    Add-Member @memberShortName

    $memberSpacey = @{
        MemberType  = "ScriptMethod"
        InputObject = $newItem
        Name        = "Spacey"
        Value       = $spacey
    }
    Add-Member @memberSpacey
    return $newItem
}
