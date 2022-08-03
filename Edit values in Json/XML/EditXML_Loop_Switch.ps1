$XMLFilePath = ""
$XMLFile = [xml](Get-Content $XMLFilePath)
$keys = ("key1", "key2", "key3")
$values = ("value1", "value2", "value3")
$count=0
    $Title = "Please select from the choices below:"
    $Prompt = "Would you like to change the values, check the values or quit?"
    $Choices = [System.Management.Automation.Host.ChoiceDescription[]] @("&Change Values", "&Values Check", "&Quit")
    $Default = 1

    $Choice = $host.UI.PromptForChoice($Prompt,$Title,$Choices,$Default)
    switch($Choice){
        0 {write-host "Changing values..`n"
            foreach ($key in $keys) {
                $targetnode = $XMLFile.SelectSingleNode("//config/Settingsapp/add[@tag='$key'][@value]")
                $targetnode.SetAttribute("value", $values[$count])
                write-host "$count. $key value changed to" $values[$count]
                $count++
            }
            $XMLFile.Save($XMLFilePath)
        }
        1 {write-host "Checking values...`n"
            foreach ($key in $keys) {
                $targetnode = $XMLFile.SelectSingleNode("//config/Settingsapp/add[@tag='$key'][@value]")
                Write-Output "$($targetnode.OuterXML)"    
            }
        }
        2 {exit}
    }