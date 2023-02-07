#####THINGS TO ADD######
#-Logging of who is doing the request and for who
#-Improve user interface

#Set location of file to write to
$fileLoc = "[FileName]"

#Query user for account name to be unlocked
Write-Host "Please provide the user ID of the account to be unlocked: "
$user_ID = Read-Host -Prompt " "

#Write to file, error catch should trigger if something fails
Try{
    Add-Content -Path $fileLoc -Value $user_ID
}
Catch{
    Write-Host "The file cannot be written to.  Please try again shortly."
}