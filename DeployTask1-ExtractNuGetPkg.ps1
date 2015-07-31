$nuget = '${bamboo.build.working.directory}\widget.0.${bamboo.buildNumber}.nupkg'
$destination = '${bamboo.build.working.directory}\extractedNuGet'

# Clean the destination directory.
If (Test-Path $destination) {
    rmdir $destination -Recurse -Force
}

# Extract the NuGet package
# Code copied from http://stackoverflow.com/questions/24672560/most-elegant-way-to-extract-a-directory-from-a-zipfile-using-powershell
[Reflection.Assembly]::LoadWithPartialName('System.IO.Compression.FileSystem')
[IO.Compression.ZipFile]::ExtractToDirectory($nuget, $destination)