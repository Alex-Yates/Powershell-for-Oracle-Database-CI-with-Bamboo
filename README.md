# Powershell-for-Oracle-Database-CI-with-Bamboo
These are the scripts I have used to set up a CI process 
for an Oracle database using Atlassian Bamboo and PowerShell

I have documented how to configure Bamboo to run these scripts
here:

http://workingwithdevs.com/continuous-delivery-oracle-databases-bamboo-redgate-1/

These scripts require that the following Bamboo variables are set:

- SourceSchemaName
- schemaRelativePath
- OracleTns
- OracleDbUser
- OracleDbPassword
- OracleDbIntegrationSchema
- OracleDbLiveSchema

Also, DeployTask1 requires .NET 4.5.

This could probably be improved by using variable substitution 
with a single TargetOracleDbSchema variable that is overridden
for different environments but I haven't explored that.