$schemaComparePath = 'C:\\Program Files\\Red Gate\\Schema Compare for Oracle 3\\SCO.exe'

Write-Warning "Upgrading WIDGETTEST"

# Create upgrade script using compare
& $schemaComparePath -source "${bamboo.build.working.directory}\Widget\db\state{WIDGETDEV}" -target "System/RedGate1@localhost{WIDGETTEST}" -deploy -verbose -scriptfile "${bamboo.build.working.directory}\artifacts\upgradeScript.sql" -report  "${bamboo.build.working.directory}\artifacts\diffReport.html" -reporttype Simple -includeidentical | Out-Host

Write-Output "Schema Compare for Oracle exited with code $lastExitCode"

# Exit code 61 is simply telling us there are differences that have been deployed.
if( $lastExitCode -eq 61)
{
    exit 0
}