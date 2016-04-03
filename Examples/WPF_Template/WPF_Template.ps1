# PowerShell Template for WPF GUIs.

# GUI (Can be generated with tools such as Visual Studio)
$Xaml = @"
<Window x:Class="WpfApplication7.MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        xmlns:local="clr-namespace:WpfApplication7"
        mc:Ignorable="d"
        Title="WPFPS" Height="350" Width="525">
    <Grid>
        <Button x:Name="button" Content="Button" HorizontalAlignment="Left" VerticalAlignment="Top" Width="75" Margin="10,5,0,0"/>
        <DataGrid x:Name="dataGrid" HorizontalAlignment="Left" Margin="10,30,0,0" VerticalAlignment="Top" Height="279" Width="497"/>

    </Grid>
</Window>
"@       

<###

FUNCTIONS

####>

Function Set-WPFWindowVariable
{
<#
	.SYNOPSIS
		Function to generate the Control Variables
	
	.DESCRIPTION
		Function to generate the Control Variables
	
	.PARAMETER Window
		Specifies the Window
	
	.PARAMETER XAML
		Specifies the XAML used
	
	.PARAMETER Prefix
		Specifies the Prefix of each Variable, default is WPF
	
	.EXAMPLE
		PS C:\> Set-WPFWindowVariable -Window $Window -XAML $XAML -Prefix 'WPF'
	
	.NOTES
		Francois-Xavier Cat
		lazywinadmin.com
		@lazywinadm
		github.com/lazywinadmin
#>
	[CmdletBinding()]
	PARAM (
		[parameter(Mandatory)]
		[alias("Form")]
		[System.Windows.Window]
		$Window,
		
		[parameter(Mandatory)]
		[XML]$XAML,
		
		$Prefix = "WPF")
	
	BEGIN
	{
		Add-Type –assemblyName PresentationFramework
		Add-Type –assemblyName PresentationCore
		Add-Type –assemblyName WindowsBase
		
		# Retrieve the Control in the XAML
		$GUI = $XAML.SelectNodes("//*[@Name]")
	}
	PROCESS
	{
		IF ($PSBoundParameters['Prefix'])
		{
			Foreach ($item in $GUI)
			{
				Set-Variable -Name "$Prefix$($item.Name)" -Value $Window.FindName($item.Name) -Scope global
			}
		}
		ELSE
		{
			Foreach ($item in $GUI)
			{
				Set-Variable -Name "($item.Name)" -Value $Window.FindName($item.Name) -Scope global
			}
		}
	} #Process
}

function Show-WPFWindow
{
<#
	.SYNOPSIS
		Function to show the Window
	
	.DESCRIPTION
		Function to show the Window
	
	.PARAMETER Window
		Specifies the Window to Show
	
	.EXAMPLE
		PS C:\> Show-WPFWindow -Window $Window
	
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
		[Alias("Form")]
		[System.Windows.Window]
		$Window)
	BEGIN
	{
		Add-Type –assemblyName PresentationFramework
		Add-Type –assemblyName PresentationCore
		Add-Type –assemblyName WindowsBase
	}
	PROCESS
	{
		$Window.ShowDialog() | out-null
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
Set-WPFWindowVariable -Window $Window -XAML $Xaml -Prefix WPF

# Find the Variable of this environment
#Get-Variable WPF*


<###

    WORK AREA

####>

# Examples:
$WPFbutton.Add_Click({
    
    #CODE GOES HERE
})


#  find other possible events
#$Window|gm -MemberType method -force|ogv
# $Window|gm -MemberType Event|ogv


<###

    SHOW THE FORM

####>

# Show the Window
Show-WPFWindow -Window $Window


<###

    CLEANUP

####>

# Examples:
#  Closing Events
#  $Window.Add_Closing({"Closing Form"})
#  $Window.Add_Closed({"GoodBye"})