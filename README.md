# Powershell-for-Oracle-Database-CI-with-Bamboo
These are the scripts I have used to set up a CI process 
for an Oracle database using Atlassian Bamboo and PowerShell

Requires that the following Bamboo variables are set:

- SourceSchemaName
- schemaRelativePath
- OracleTns
- OracleDbUser
- OracleDbPassword
- OracleDbTestSchema
- OracleDbLiveSchema

This could probably be improved by using variable substitution 
and use a single TargetOracleDbSchema variable that is overridden
for different environments but I haven't exp[lored how to do that.