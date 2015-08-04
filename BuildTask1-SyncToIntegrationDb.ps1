# Configuration
$schemaComparePath = 'C:\\Program Files\\Red Gate\\Schema Compare for Oracle 3\\SCO.exe'
$schemaRelativePath = "${bamboo.schemaRelativePath}"
$targetSchemaName = "${bamboo.OracleDbIntegrationSchema}"
$tns = "${bamboo.OracleTns}"
$username = "${bamboo.OracleDbUser}"
$password = "${bamboo.OracleDbPassword}"
$sourceName = "${bamboo.SourceSchemaName}"


# Logging config variables for troubleshooting
Write-Output "Using the following variables:"
Write-Output "schemaComparePath: $schemaComparePath"
Write-Output "schemaRelativePath: $schemaRelativePath"
Write-Output "targetSchemaName: $targetSchemaName"
Write-Output "tns: $tns"
Write-Output "username: $username"
Write-Output "password: has been set to the bamboo variable OracleDbPassword"
Write-Output "sourceName: $sourceName"

# Deploy changes using Redgate Schema Compare for Oracle
Write-Warning "Upgrading $targetSchemaName"

& $schemaComparePath -source "${bamboo.build.working.directory}\${bamboo.schemaRelativePath}{$sourceName}" -target "$username/$password@$tns{$targetSchemaName}" -deploy -scriptfile "${bamboo.build.working.directory}\artifacts\upgradeScript.sql" -report  "${bamboo.build.working.directory}\artifacts\diffReport.html" -reporttype Simple -includeidentical | Out-Host

# Logging the Schema Compare exit code and path to artifacts
Write-Output "Schema Compare for Oracle exited with code $lastExitCode"
Write-Output "UpgradeScript and diff report created and saved to ${bamboo.build.working.directory}\artifacts"

# Exit code 61 is simply telling us there are differences that have been deployed.
if( $lastExitCode -eq 61)
{
    exit 0
}