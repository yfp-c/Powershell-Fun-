New-Item "C:\TestingPurpose" -ItemType Directory
# mkdir $(1..3 | %{"SubFolder$_"})
1..3 | foreach {mkdir C:\TestingPurpose\SubFolder$_}
1..50 | foreach {new-item -path C:\TestingPurpose\SubFolder1\TypeATest$_.txt}
51..100 | foreach {new-item -path C:\TestingPurpose\SubFolder2\TypeBTest$_.txt}
101..150 | foreach {new-item -path C:\TestingPurpose\SubFolder3\TypeCTest$_.txt}
101..150 | foreach {remove-item -path C:\TestingPurpose\SubFolder1\TypeCTest$_.txt}

# $srcpath = "C:\TestingPurpose\SubFolder3"
# $dstpath = "C:\TestingPurpose\SubFolder2"
# Get-ChildItem -File -Recurse -Path $srcpath |
#     ForEach-Object {
#         if($_.Name -like '*1.txt', '*3.txt', '*5.txt', '*7.txt', '*9.txt') {
#             Move-Item -Path $_.FullName -Destination $dstpath
#         }
#     }
# $srcpath = "C:\TestingPurpose\SubFolder3"
# $dstpath = "C:\TestingPurpose\SubFolder2"
# $files = $srcpath
# foreach ($file in $files) {
#     if ($file -like '*1.txt', '*3.txt', '*5.txt', '*7.txt', '*9.txt') {
#         Move-Item -Destination $dstpath
#     }
# }
# Finding odd digits and moving them
$srcpath = "C:\TestingPurpose"
$dstpath = "C:\TestingPurpose\SubFolder2"
Get-ChildItem -File -Recurse -Path $srcpath |
    ForEach-Object {
        # look for a digit
        if($_.BaseName -match '\d$') {
            # is that digit odd?
            if([int]($Matches[0]) % 2 -eq 1) {
                Move-Item -Path $_.FullName -Destination $dstpath
            }
        }
    }

# Finding even digits and moving them 
$srcpath = "C:\TestingPurpose"
$dstpath = "C:\TestingPurpose\SubFolder1"
Get-ChildItem -File -Recurse -Path $srcpath |
    ForEach-Object {
        # look for a digit
        if($_.BaseName -match '\d$') {
            # is that digit even?
            if([int]($Matches[0]) % 2 -eq 0) {
                Move-Item -Path $_.FullName -Destination $dstpath
            }
        }
    }

# Rename folders
Rename-Item -Path "C:\TestingPurpose\SubFolder1" -NewName "EvenFilesContainer"
Rename-Item -Path "C:\TestingPurpose\SubFolder2" -NewName "OddFilesContainer"


$TypeABCList = Get-ChildItem -File -Recurse "C:\TestingPurpose" | Where { !$_PSIsContainer } | Select FullName -ExpandProperty FullName

Get-Date -UFormat "%A %B/%d/%Y %T %Z"
$Time = Get-Date
$Time.ToUniversalTime()

$TypeABCListtxt = Write-Output "As of" $Time "files inside Testing Purpose are: " $TypeABCList
$TypeABCListtxt | Out-File -FilePath "C:\TestingPurpose\MasterFile.txt"