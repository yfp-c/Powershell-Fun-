# Get all services which are stopped
Get-Service | where {$_.Status -eq "stopped"} | Format-Table

# Get all services whose name starts with letter "A"
Get-Service | Where-Object {$_.Name.StartsWith("A")} | select Name

# Get all services which are set to start automatically
# (look for property StartType  : Automatic)
Get-Service | Where-Object StartType -eq Automatic | select Name

# Restart-Service Winmgmt
Restart-Service Winmgmt

#5.) Export the service name and status into a text file.
# Example:
# Service Name,  Status
# Service A,   Running
# Service B,    Stopped