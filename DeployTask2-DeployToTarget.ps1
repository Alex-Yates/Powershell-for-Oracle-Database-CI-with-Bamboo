$schemaComparePath = 'C:\\Program Files\\Red Gate\\Schema Compare for Oracle 3\\SCO.exe'

Write-Warning "Upgrading target DB"

# Create upgrade script using compare
& $schemaComparePath -source "${bamboo.build.working.directory}\extractedNuGet\state{WIDGETDEV}" -target "System/RedGate1@localhost{ODC_WIDGETLIVE}" -deploy -verbose -scriptfile "${bamboo.build.working.directory}\artifacts\upgradeScript.sql" -report  "${bamboo.build.working.directory}\artifacts\diffReport.html" -reporttype Simple -includeidentical | Out-Host

Write-Output "Schema Compare for Oracle exited with code $lastExitCode"
Write-Output "UpgradeScript and diff report created and saved to ${bamboo.build.working.directory}\artifacts"

# Exit code 61 is simply telling us there are differences that have been deployed.
if( $lastExitCode -eq 61)
{
    exit 0
}

