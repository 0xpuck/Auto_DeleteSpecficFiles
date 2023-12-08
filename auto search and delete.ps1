$paths = @("C:\Users\", "C:\Program Files\", "C:\Program Files (x86)\")

Write-Host "|--------------------------== Start Finding All log4j*.jar files ==---------------------|"
$total_sr = 0 #Initialize a bariable to store the total number of files searched
foreach ($path in $paths) {
    $files = Get-ChildItem -Path $path -Filter "log4j*.jar" -Recurse -ErrorAction SilentlyContinue
    $files | Format-Table -AutoSize
    $total_sr += ($files | Measure-Object).Count    
}
Write-Host "------------------------Total number of log4j*.jar files found: $total_sr----------------------"
Write-Host "|------------------------== Finished Finding All log4j*.jar files ==--------------------|"
Write-Host "*****************************************************************************************"
Write-Host "|--------------------------== Start Deleting log4j*.jar files ==------------------------|"
$total_dr = 0 #Initialize a bariable to store the total number of files deleted
foreach ($path in $paths) {
    $files = Get-ChildItem -Path $path -Filter "log4j*.jar" -Recurse -ErrorAction SilentlyContinue
    if ($files -ne $null) {
        $files | Remove-Item -ErrorAction SilentlyContinue
        Write-Host "------------------------------== $files Deleting Success ==----------------------------"
        $total_dr += ($files | Measure-Object).Count
    }
}
Write-Host "-----------------------Total number of log4j*.jar files deleted: $total_dr----------------------"
Write-Host "------------= From $total_sr flowering files, $total_dr flowering files deleted =------------"
Write-Host "|-------------------------------== Finished Deleting ==---------------------------------|"
Write-Host "*****************************************************************************************"
Write-Host "|---------------------== Start Re-Finding All log4j*.jar files ==-----------------------|"
$total_rsr = 0 #Initialize a bariable to store the total number of files searched
foreach ($path in $paths) {
    $files = Get-ChildItem -Path $path -Filter "log4j*.jar" -Recurse -ErrorAction SilentlyContinue
    $files | Format-Table -AutoSize
    $total_rsr += ($files | Measure-Object).Count    
}
Write-Host "------------------------Total number of log4j*.jar files found: $total_rsr-----------------------"
if($total_rsr -eq 0){
    Write-Host "\--------------------------------== Deleting Success ==---------------------------------/"
}
