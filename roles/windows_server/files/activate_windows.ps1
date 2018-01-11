param(
    [parameter(Mandatory=$true)]
    [String]$License
    )

$ErrorActionPreference = "Stop"

$activate = Get-WmiObject -Query "select * from SoftwareLicensingService"
$activate.InstallProductKey($License)
$activate.RefreshLicenseStatus()