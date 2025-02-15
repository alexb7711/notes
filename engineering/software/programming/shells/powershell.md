# (Un)Archiving Items

## Zipping

## Unzipping 

In PowerShell v5+, there is an [__Expand-Archive command__](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.archive/Expand-Archive?view=powershell-6) (as well as Compress-Archive) built in:

```bash
Expand-Archive C:\a.zip -DestinationPath C:\a
```

# Searching 

## Search for a file

```bash
Get-ChildItem -Path [start search location] -Filter [search item] -Recurse -ErrorAction SilentlyContinue -Force
```