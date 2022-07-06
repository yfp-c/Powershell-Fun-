$XMLFilePath = "C:\filepath\exampleXML.xml"
$XMLFile = [xml](Get-Content $XMLFilePath)
$targetnode = $XMLFile.SelectSingleNode("//config/Settingsapp/add[@tag='Instructional:Negative'][@value]")
$targetnode.SetAttribute("value", "https://thenewwebsiteyo-54.com")
$XMLFile.Save($XMLFilePath)