#####THINGS TO ADD######
#-Error catching
#-Ability to handle multiple users, right now it will only do the first one and then clear the file
#this shouldn't be a big issue as long as 2 people don't populate the file at the same time

#Variables for Folder Location and filename of item to watch
#Global is used to trigger actions and maintain waiting loop
$folderLoc = "[FolderLocation]"
$fileName = "[FileName]"
$Global:FileChanged = $false

#Primary function, establishes variables to watch and processes the changes
function Wait-ForChange {

    #establish a File System Watcher that is pointed to the file designated in the variables section
    $fileWatcher = New-Object IO.FileSystemWatcher $folderLoc, $fileName -Property @{
        IncludeSubDirectories = $false
        EnableRaisingEvents = $true
    }

    #register the "Watcher" to flip the global variable when a file change occurs
    $onChange = Register-ObjectEvent $fileWatcher Changed -Action {$Global:FileChanged = $true}

    #loop keeps the watcher active until needed
    #once the file changes, while check fails and function will continue
    while($Global:FileChanged -eq $false){
        Start-Sleep -Milliseconds 100
    }

    #set file path and load user name from the file to the $user variable
    $path = $folderLoc + $fileName
    $user = Get-Content $path
    
    #Write-Host to test, Unlock-ADAccount to unlock
    Write-Host $users
    #Unlock-ADAccount -Identity $user

    #delete the contents of the users file, save empty file
    Clear-Content $path -Force

    #reset global to false, recall Wait-ForChange function, forcing an infinite loop
    $Global:FileChanged = $false
    Wait-ForChange
}

Wait-ForChange