$ErrorActionPreference = "Stop"

$wsusconfig = (Get-WSUSServer).GetConfiguration()

if ($wsusconfig.AllUpdateLanguagesEnabled){
    $wsusconfig.AllUpdateLanguagesEnabled = $false
    $wsusconfig.SetEnabledUpdateLanguages("en")
    $wsusconfig.Save()
}

if (!("2016" -in (Get-WSUSProduct).title)){
    $wsus = (Get-WSUSServer).GetSubscription()
    $wsus.StartSynchronizationForCategoryOnly()

    while (($wsus.GetSynchronizationStatus()) -ne "Running"){
        continue
    }