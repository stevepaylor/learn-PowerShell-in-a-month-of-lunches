Get-Process | ConvertTo-HTML | Out-File test1.html

Get-Process | Select-Object -Property Name,ID,CPU,PM | ConvertTo-Html |  Out-File test2.html

Get-Process | Select Name,ID,CPU,PM | ConvertTo-HTML | Out-File test3.html

# Get all property names for a process object
$GGet-Process | Get-Member -MemberType Property | Select-Object -ExpandProperty Name |  ConvertTo-Csv -NoTypeInformation | Out-File process_properties_name.csv

$GP_Name_List = Get-Process | Get-Member -MemberType Property | Select-Object Name | ConvertTo-Csv -NoTypeInformation

Get-Process |                 
Sort-Object CPU -Descending |  
Select-Object Name,ID,CPU      

# List all files in a directory with creation, last write, and last access times
# Change "C:\Path\To\Directory" to your target folder
$path = "C:\steve-power-shell-scripts"

try {
    if (-Not (Test-Path $path)) {
        throw "Directory not found: $path"
    }

    Get-ChildItem -Path "C:\Steve_powershell_scripts\learn-powershell-in-a-month-of-lunches\TestFolder2" -File -Recurse | 
        Select-Object `
            FullName,
            @{Name="Created"; Expression={$_.CreationTime}},
            @{Name="Modified"; Expression={$_.LastWriteTime}},
            @{Name="Accessed"; Expression={$_.LastAccessTime}} |
        Format-Table -AutoSize
}
catch {
    Write-Error $_
}

Use Compare-Object and Select-Object -ExpandProperty Name to compare just the names of the files in the folders to verify you have the same files.

This is a possible way. Remember, dir is an alias for Get-ChildItem. 

$reference =  Get-ChildItem ~/TestFolder2/TestFolder | Select-Object -ExpandProperty name
$difference = Get-ChildItem ~\TestFolder| Select-Object -ExpandProperty name | Compare-Object -ReferenceObject $ref -DifferenceObject $diff

PS> $object = [pscustomobject]@{
    name = 'USA'
    children = [pscustomobject]@{
        name = 'Southwest'
    }
}
PS> $object

name children
---- --------
USA  @{name=Southwest}

# Use the ExpandProperty parameter to expand the children property
PS> $object | Select-Object @{n="country"; e={$_.name}} -ExpandProperty children

name      country
----      -------
Southwest USA

# The original object has been altered
PS> $object

name children
---- --------
USA  @{name=Southwest; country=USA}

$object | Select-Object @{n="country"; e={$_.name}} -ExpandProperty children

$object = [pscustomobject]@{Name="CustomObject";List=@(1,2,3,4,5)}