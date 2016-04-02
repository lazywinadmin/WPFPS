# Functions
function Import-WPFDataGrid
{
	Param (
		[ValidateNotNull()]
		[Parameter(Mandatory = $true)]
		[System.Windows.Controls.DataGrid]$DataGrid,
		
		[ValidateNotNull()]
		[Parameter(Mandatory = $true)]
		$Item
	)
	BEGIN
	{
		Add-Type –assemblyName PresentationFramework
		Add-Type –assemblyName PresentationCore
		Add-Type –assemblyName WindowsBase
	}
	PROCESS
	{
		$DataGrid.ItemsSource = $Item
	}
}

Function Set-WPFFormVariable
{
	[CmdletBinding()]
	PARAM (
		[parameter(Mandatory)]
		[alias("Window")]
		$Form,
		
		[parameter(Mandatory)]
		[XML]$XAML,
		
		$Prefix="WPF")
	
	BEGIN
	{
		$GUI = $XAML.SelectNodes("//*[@Name]")
	}
	PROCESS
	{
		IF ($PSBoundParameters['Prefix'])
		{
			Foreach ($item in $GUI)
			{
				Set-Variable -Name "$Prefix$($item.Name)" -Value $Form.FindName($item.Name) -Scope global
			}
		}
		ELSE
		{
			Foreach ($item in $GUI)
			{
				Set-Variable -Name "($item.Name)" -Value $Form.FindName($item.Name) -Scope global
			}
		}
	} #Process
}

function Show-WPFForm
{
	PARAM (
	[Alias("Window")]	
	$Form)
	$Form.ShowDialog() | out-null
}

# XAML
$Xaml = @"
<Window x:Class="WpfApplication3.MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        xmlns:local="clr-namespace:WpfApplication3"
        mc:Ignorable="d"
        Title="WPFPS - DataGrid" Height="350" Width="525">
    <Grid>
        <DataGrid x:Name="dataGrid" RenderTransformOrigin="0.5,0.5">
        </DataGrid>
    </Grid>
</Window>
"@       

# Remove unnecessary pieces from xml
$Xaml = $xaml -replace 'mc:Ignorable="d"' -replace "x:N",'N' -replace '^<Win.*','<Window'

# Read the XAML
$Reader= New-Object -TypeName System.Xml.XmlNodeReader -ArgumentList ([xml]$xaml)

$Global:Window=[Windows.Markup.XamlReader]::Load( $reader )

# Find the Controls in the Window
([xml]$xaml).SelectNodes("//*[@Name]")

# Generate Variables for each Controls
Set-WPFFormVariable -Form $Window -XAML $Xaml -Prefix WPF

# Load tha DataGrid
Import-WPFDataGrid -DataGrid $WPFdataGrid -Item (Get-Process|select Name, Path)

# Show the UI
Show-WPFForm -Form $Window