param(
    [parameter(Mandatory=$True)]
    [String]$hostname
    )

if ($hostname -ne $env:computername){
    Rename-Computer -NewName $hostname
    Write-Output "changed"
}
else{
    Write-Output "unchanged"
}