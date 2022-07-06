$JsonFilePath = "C:\filepath\exampleJson.json"

$JsonData = Get-Content $JsonFilePath -raw | ConvertFrom-Json
$JsonData.Update | % { if($JsonData.Bot.IdentityBotOrigin)
                        {
                            $JsonData.Bot.IdentityBotOrigin = "https:\\www.redro23.com/e232"
                        }
                        
                    }

$JsonData | ConvertTo-Json -depth 4 | Set-Content $JsonFilePath