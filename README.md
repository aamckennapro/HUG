# HUG
HUG (**H**ere yo**U** **G**o) is a reimplementation of [holman/boom](https://github.com/holman/boom), written in pwsh.

## About
HUG lets you save a dictionary of text snippets using the command line, either by directly pasting the text into the command line (the boom method) or by pulling straight from your system clipboard.

## Goals
It can't be a repository without some feature goals! At a baseline, HUG will be able to do everything that boom can do.
 [ ] Parity with boom
 [ ] Saving text snippets from clipboard
 [ ] OSX support
 [ ] Linux support

## Usage
This will have some screenshots soon of the actual implementation, but for now you'll have to deal with words. You'll find the usage
is almost identical to boom. 

`hug help`

: Displays each possible command template

`hug`

: Displays a column of your lists, along with a column of how many snippets are saved in each list.

`hug urls`

: Creates a new list called 'urls'

`hug urls github https://github.com`

: Creates a new item called 'github', with the value 'https://github.com'

: Can also be used to replace an already existing snip, will prompt for confirmation if item already exists in list

`hug urls gitlab -clip`

: Creates a new item called 'gitlab', with the value from the clipboard (hopefully 'https://gitlab.com')

`hug github`

: Copies the 'github' value to your clipboard

: `hug urls github` is an equivalent command

`hug urls`

: Lists all items in the 'urls' list

`hug delete urls`

: Deletes an entire list, will prompt for confirmation if list isn't empty

`hug delete urls github`

: Only deletes the 'github' item in 'urls'

`hug all`

: Lists everything in a table format. list|item|value

`hug open urls`

: Opens all items in `urls` in your browser

`hug open github`

: Opens *just* github in the browser

`hug print github`

: Prints 'github' on the command line

`hug edit`

: Opens the JSON file responsible for storing HUG's data in your preferred editor

## Special Thanks
Obviously this isn't an original idea. I use PowerShell on the regular, so I figured I'd just reimplement a fantastic tool into one of
my preferred shells. Thanks to [Zach Holman](https://github.com/holman/) for creating the original repository, it's honestly 
surprising it took me this long to find it for the first time. 
