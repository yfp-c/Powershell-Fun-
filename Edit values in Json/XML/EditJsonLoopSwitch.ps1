$File_location_1 = ""
$File_location_2 = ""
$File_location_3= ""

$url_1 = ""
$url_2 = ""
$url_3 = ""

$JsonFilePath = ($File_location_1, $File_location_2, $File_location_3)
foreach ($filepath in $JsonFilePath) {
    if ($filepath -eq $File_location_1) {
        $JsonData = -Get-content $filepath -raw | ConvertFrom-Json
        if ($JsonData.node.node -contains $url_1) {
            write-host "Value in $filepath contains url $url_1"
        }
        else { 
            $nodes = $JsonData.node.nodes
            $Title = "Please select from the choices below:"
            $Prompt = "The url in $filepath is $nodes, would you like to change to $url_1"
            $Choices = [System.Management.Automation.Host.ChoiceDescription[]] @("&Yes", "&No", "&Quit")
            $Default = 1

            $Choice = $host.UI.PromptForChoice($Prompt,$Title,$Choices,$Default)

            switch($Choice)
            {
                0 {write-host "You chose 'Yes'.. Changing url"
                $JsonData.update | % { if($JsonData.nodes.nodes)
                    {
                    $JsonData.nodes.nodes = $url_1
                    }   
                }
                    
                }
                1 {Write-Host "You chose 'no'.. moving on or exiting."}
                2 {exit}
            }
        }
    }
    elseif ($filepath -eq $File_location_2) {
        $JsonData = -Get-content $filepath -raw | ConvertFrom-Json
        if ($JsonData.node.node -contains $url_2) {
            write-host "Value in $filepath contains url $url_2"
        }
        else { 
            $nodes = $JsonData.node.nodes
            $Title = "Please select from the choices below:"
            $Prompt = "The url in $filepath is $nodes, would you like to change to $url_1"
            $Choices = [System.Management.Automation.Host.ChoiceDescription[]] @("&Yes", "&No", "&Quit")
            $Default = 1

            $Choice = $host.UI.PromptForChoice($Prompt,$Title,$Choices,$Default)

            switch($Choice)
            {
                0 {write-host "You chose 'Yes'.. Changing url"
                $JsonData.update | % { if($JsonData.nodes.nodes)
                    {
                    $JsonData.nodes.nodes = $url_2
                    }   
                }
                    
                }
                1 {Write-Host "You chose 'no'.. moving on or exiting."}
                2 {exit}
            }
        }
    }
}