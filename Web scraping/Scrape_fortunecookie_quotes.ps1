# $w = Invoke-WebRequest -Uri "http://www.fortunecookiemessage.com/archive.php?start=250"

# $w3 = $w.Links | select href

# $w3 | Out-File "C:\Users\gfran\OneDrive\Documents\WindowsPowerShell\fcqpage6.txt"

# Get-Content -Path "C:\Users\gfran\OneDrive\Documents\WindowsPowerShell\fcqpage6.txt" | ForEach {
#     $_.Remove(0,13)
#  } | Out-File "C:\Users\gfran\OneDrive\Documents\WindowsPowerShell\newfcquotes\fcqpage6new.txt"

# $w_space = Get-Content -Path "C:\Users\gfran\OneDrive\Documents\WindowsPowerShell\newfcquotes\fcqpage6new.txt"
# $w_space = $w_space.Replace('-',' ')
# $w_complete = $w_space | Select -Skip 11 | Select -SkipLast 3
# $w_complete | Out-File "C:\Users\gfran\OneDrive\Documents\WindowsPowerShell\newfcquotes\fcqpage6new.txt"

$counterweb = 0
$counterfile = 1

while ($counterweb -ne 800) {

$w = Invoke-WebRequest -Uri "http://www.fortunecookiemessage.com/archive.php?start=$counterweb"

$w3 = $w.Links | select href

$w3 | Out-File "C:\Users\gfran\OneDrive\Documents\WindowsPowerShell\fcqpage$counterfile.txt"

Get-Content -Path "C:\Users\gfran\OneDrive\Documents\WindowsPowerShell\fcqpage$counterfile.txt" | ForEach {
    $_.Remove(0,13)
 } | Out-File "C:\Users\gfran\OneDrive\Documents\WindowsPowerShell\newfcquotes\fcqpagenew$counterfile.txt"

$w_space = Get-Content -Path "C:\Users\gfran\OneDrive\Documents\WindowsPowerShell\newfcquotes\fcqpagenew$counterfile.txt"
$w_space = $w_space.Replace('-',' ')
$w_complete = $w_space | Select -Skip 11 | Select -SkipLast 3
$w_complete | Out-File "C:\Users\gfran\OneDrive\Documents\WindowsPowerShell\newfcquotes\fcqpagenew$counterfile.txt"
$counterweb+=50
$counterfile++
}

#combine all texts file into one
Get-ChildItem "C:\Users\gfran\OneDrive\Documents\WindowsPowerShell\newfcquotes" -include *.txt -rec | ForEach-Object {gc $_; ""} | out-file "C:\Users\gfran\OneDrive\Documents\WindowsPowerShell\newfcquotes\allinone.txt"
