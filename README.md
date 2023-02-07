# PowerShell_Basics
Basic PowerShell scripts over the years

90_Day_Users.ps1 - Identifies all users who have not logged in to a domain within the last 90 days

Account_Unlock.ps1 - Used in conjunction with Account_Watch.ps1.  Prompts a user for a username to unlock, adds to a text file and saves.  Watch script picks up from there.

Account_Watch.ps1 - Watches a specific file for changes, same file that the previous script modifies.  When a change to the file is seen, the account belonging to the user name is unlocked.  This should be run under a scheduled task to start or turned into a service.  The account running this script requires the appropriate domain permissions to unlock accounts.

PS_AD_Commands.txt - Collection of very basic, sometimes helpful PowerShell commands for interacting with Active Directory
