$inputXML = @"
<Window x:Class="WpfApplication2.MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        xmlns:local="clr-namespace:WpfApplication2"
        mc:Ignorable="d"
        Title="WPFPS - ListBox" Height="366.496" Width="415.984">
    <Grid>
        <Button x:Name="buttonProcesses" Content="Processes" HorizontalAlignment="Left" Margin="190,10,0,0" VerticalAlignment="Top" Width="75"/>
        <ListBox x:Name="listBox" HorizontalAlignment="Left" Height="315" Margin="10,10,0,0" VerticalAlignment="Top" Width="175"/>
        <Button x:Name="buttonClear" Content="Clear" HorizontalAlignment="Left" Margin="190,60,0,0" VerticalAlignment="Top" Width="75"/>
        <TextBox x:Name="textBoxAppend" HorizontalAlignment="Left" Height="20" Margin="270,35,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="71"/>
        <Button x:Name="buttonAppend" Content="Append" HorizontalAlignment="Left" Margin="190,35,0,0" VerticalAlignment="Top" Width="75"/>
        <TextBox x:Name="textBoxSelected" HorizontalAlignment="Left" Height="20" Margin="270,86,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="71"/>
        <Button x:Name="buttonSelected" Content="Selected" HorizontalAlignment="Left" Margin="190,85,0,0" VerticalAlignment="Top" Width="75"/>
        <Button x:Name="button" Content="Hide/Show" HorizontalAlignment="Left" Margin="190,110,0,0" VerticalAlignment="Top" Width="75"/>

    </Grid>
</Window>

"@

$inputXML = $inputXML -replace 'mc:Ignorable="d"','' -replace "x:N",'N'  -replace '^<Win.*', '<Window'
[void][System.Reflection.Assembly]::LoadWithPartialName('presentationframework')
[xml]$XAML = $inputXML


# Read XAML
$Reader = New-Object System.Xml.XmlNodeReader $xaml
TRY
{
    $Form=[Windows.Markup.XamlReader]::Load( $reader )
}
CATCH
{
    Write-Host "Unable to load Windows.Markup.XamlReader. Double-check syntax and ensure .net is installed."
}
 
#===========================================================================
# Load XAML Objects In PowerShell
#===========================================================================
Function Set-WPFFormVariable
{
PARAM(
    $Form,
    $XAML,
    $Prefix)

    BEGIN{
        $GUI = $xaml.SelectNodes("//*[@Name]")
    }
    PROCESS
    {
        IF($PSBoundParameters['Prefix'])
        {
            Foreach ($item in $GUI)
            {
                Set-Variable -Name "$Prefix$($item.Name)" -Value $Form.FindName($item.Name)
            }
        }
        ELSE
        {
            Foreach ($item in $GUI)
            {
                Set-Variable -Name "$($item.Name)" -Value $Form.FindName($item.Name)
            }
        }
    }#Process
}
 
Function Get-FormVariables
{
    if ($global:ReadmeDisplay -ne $true){
        Write-host "If you need to reference this display again, run Get-FormVariables" -ForegroundColor Yellow;$global:ReadmeDisplay=$true
    }
    write-host "Found the following interactable elements from our form" -ForegroundColor Cyan
    get-variable WPF*
}
 
Set-WPFFormVariable -Form $Form -XAML $XAML
 
#===========================================================================
# Actually make the objects work
#===========================================================================

$Form.ShowDialog() | Out-Null