$name = Read-Host -Prompt "Input your SAS service name"
get-service $name
stop-service $name
get-service $name

$name1 = Read-Host -Prompt "Input your SPSS service name"
get-service $name1
stop-service $name1
get-service $name1

$filetype = Read-Host -Prompt "Input search file name type. Ex:log4j-core-2.*.jar"
 
Add-Type -AssemblyName System.IO.Compression
Add-Type -AssemblyName System.IO.Compression.FileSystem

function myfunction{
param (
        $url
    )
$jar = [System.io.Compression.ZipFile]::Open($url, "Update")
$files = $jar.Entries | Where-Object { $_.Name -like "JndiLookup.class" }
$files | ForEach-Object { $_.Delete() }
$jar.Dispose()
}

Get-ChildItem -Path C:\ -Filter $filetype -Recurse -ErrorAction SilentlyContinue -Force | ForEach-Object {myfunction -url $_.Fullname}

start-service $name
get-service $name
start-service $name1
get-service $name1
