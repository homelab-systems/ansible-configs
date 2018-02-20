param(
    [paramater(Mandatory=$true)]
    [String]$user,
    [paramater(Mandatory=$true)]
    [String]$password,
    [paramater(Mandatory=$true)]
    [Int]$validity,
    )
    $ErrorActionPreference = "Stop"

    $secpass = ConverTo-SecureString $password -AsPlainText -Force
    $creds = New-Object System.Management.Automation.PSCredential ($user,$secpass)

    Install-ADCSCertificationAuthority -CAType EnterpriseRootCA -CryptoProviderName "RSA#Microsoft Software Key Storage Provider"`
    -KeyLength 2048 -HashAlgorithmName SHA256 -ValidityPeriod Years -ValidityPeriodUnits $validity -Credentials $creds -Confirm:$false