# PowerShell Template for WPF GUIs.

# GUI (Can be generated with tools such as Visual Studio)
$Xaml = @"
<Window x:Class="WpfApplication4.MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        xmlns:local="clr-namespace:WpfApplication4"
        mc:Ignorable="d"
        Title="WPFPS - Combobox" Height="78.894" Width="278.279">
    <Grid>
        <ComboBox x:Name="comboBox" HorizontalAlignment="Left" Margin="10,10,0,0" VerticalAlignment="Top" Width="162"/>
        <Button x:Name="button" Content="Button" HorizontalAlignment="Left" Margin="177,10,0,0" VerticalAlignment="Top" Width="71"/>

    </Grid>
</Window>
"@       

<###

FUNCTIONS

####>

Function Set-WPFFormVariable
{
<#
	.SYNOPSIS
		Function to generate the Control Variables
	
	.DESCRIPTION
		Function to generate the Control Variables
	
	.PARAMETER Form
		Specifies the Form
	
	.PARAMETER XAML
		Specifies the XAML used
	
	.PARAMETER Prefix
		Specifies the Prefix of each Variable, default is WPF
	
	.EXAMPLE
		PS C:\> Set-WPFFormVariable -Form $Window -XAML $XAML -Prefix 'WPF'
	
	.NOTES
		Francois-Xavier Cat
		lazywinadmin.com
		@lazywinadm
		github.com/lazywinadmin
#>
	[CmdletBinding()]
	PARAM (
		[parameter(Mandatory)]
		[alias("Window")]
		$Form,
		
		[parameter(Mandatory)]
		[XML]$XAML,
		
		$Prefix = "WPF")
	
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
<#
	.SYNOPSIS
		Function to show the Form
	
	.DESCRIPTION
		Function to show the Form
	
	.PARAMETER Form
		Specifies the Form to Show
	
	.EXAMPLE
		PS C:\> Show-WPFForm -Form $Window
	
	.NOTES
		Francois-Xavier Cat
		lazywinadmin.com
		@lazywinadm
		github.com/lazywinadmin
#>
<#
	
	#>
	[CmdletBinding()]
	PARAM (
		[Parameter(Mandatory)]
		[Alias("Window")]
		[System.Windows.Window]
		$Form)
	BEGIN
	{
		Add-Type –assemblyName PresentationFramework
		Add-Type –assemblyName PresentationCore
		Add-Type –assemblyName WindowsBase
	}
	PROCESS
	{
		$Form.ShowDialog() | out-null
	}
}



<###

    PREPARE THE FORM

####>

# Remove unnecessary pieces from xml
$Xaml = $xaml -replace 'mc:Ignorable="d"' -replace "x:N",'N' -replace '^<Win.*','<Window'

# Read the XAML
$Reader= New-Object -TypeName System.Xml.XmlNodeReader -ArgumentList ([xml]$xaml)

$Global:Window=[Windows.Markup.XamlReader]::Load( $reader )

# Find and Generate Variables for each Controls
Set-WPFFormVariable -Form $Window -XAML $Xaml -Prefix WPF

# Find the Variable of this environment
#Get-Variable WPF*


<###

    WORK AREA

####>

# Examples:
#$Button.Add_Click({})
#$Window.Add_Loaded({gps|ogv})

#  find other possible events
#$Window|gm -MemberType method -force|ogv
# $Window|gm -MemberType Event|ogv


<###

    SHOW THE FORM

####>

# Show the Window
Show-WPFForm -Form $Window


<###

    CLEANUP

####>

# Examples:
#  Closing Events
#  $Window.Add_Closing({"Closing Form"})
#  $Window.Add_Closed({"GoodBye"})