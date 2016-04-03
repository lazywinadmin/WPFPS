# FUNCTIONS
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

function Add-WPFComboBoxItem
{
<#
	.SYNOPSIS
		Function to add items from a ComBox
	
	.DESCRIPTION
		Function to add items from a ComBox.
	
		System.windows.controls.listbox	
		https://msdn.microsoft.com/en-us/library/system.windows.controls.listbox(v=vs.110).aspx
	
	.PARAMETER ListBox
		Specifies the Listbox control
	
	.PARAMETER Items
		Specifies the items to add in the Listbox
	
	.PARAMETER Append
		Specifies that the Listbox
		
	.NOTES
		Francois-Xavier Cat
		lazywinadmin.com
		@lazywinadm
		github.com/lazywinadmin
#>
	Param (
		[ValidateNotNull()]
		[Parameter(Mandatory = $true)]
		[System.Windows.Controls.ComboBox]
		$ComboBox,
		
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

		    # Add Items
		    FOREACH ($i in $Item)
		    {
			    #$ComboBox.Items.Add($i)
                $ComboBox.Items.Add($i)|Out-Null
		    }
	}
}

function Remove-WPFComboBoxItem
{
<#
	.SYNOPSIS
		Function to Remove items from a ComboBox
	
	.DESCRIPTION
		Function to Remove items from a ComboBox
	
		System.windows.controls.combobox
		https://msdn.microsoft.com/en-us/library/system.windows.controls.combobox(v=vs.110).aspx
	
	.PARAMETER ComboBox
		Specifies the ComboBox control
	
	.PARAMETER SelectedItem
		Specifies the Selected item(s)
	
	.EXAMPLE
		Remove-WPFComboBoxItem -ComboBox $Combobox1 -SelectedItem
	
		Will remove all the selected item in the ComboBox $Combobox1
		
	.NOTES
		Francois-Xavier Cat
		lazywinadmin.com
		@lazywinadm
		github.com/lazywinadmin
#>
	Param (
		[ValidateNotNull()]
		[Parameter(Mandatory = $true)]
		[System.Windows.Controls.ComboBox]
		$ComboBox,
		
		[switch]$SelectedItem
	)
	BEGIN
	{
		Add-Type –assemblyName PresentationFramework
		Add-Type –assemblyName PresentationCore
		Add-Type –assemblyName WindowsBase
	}
	PROCESS
	{
		IF ($PSBoundParameters['SelectedItem'])
		{
			Foreach($item in $ComboBox.SelectedItem)
			{
				$ComboBox.Items.RemoveAt($comboBox.SelectedIndex)
                #$ComboBox.Items.Remove($comboBox.SelectedItem)
			}
		}
	}
}

# GUI
$Xaml = @"
<Window x:Class="WpfApplication4.MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        xmlns:local="clr-namespace:WpfApplication4"
        mc:Ignorable="d"
        Title="WPFPS - Combobox" Height="109.017" Width="324.898">
    <Grid>
        <ComboBox x:Name="comboBox" HorizontalAlignment="Left" Margin="10,10,0,0" VerticalAlignment="Top" Width="162"/>
        <Button x:Name="buttonGetServices" Content="Get Services" HorizontalAlignment="Left" Margin="177,10,0,0" VerticalAlignment="Top" Width="129"/>
        <Button x:Name="buttonRemoveSelected" Content="Remove Selected" HorizontalAlignment="Left" Margin="177,35,0,0" VerticalAlignment="Top" Width="129"/>

    </Grid>
</Window>

"@       

# PREPARE 
# Remove unnecessary pieces from xml
$Xaml = $xaml -replace 'mc:Ignorable="d"' -replace "x:N",'N' -replace '^<Win.*','<Window'

# Read the XAML
$Reader= New-Object -TypeName System.Xml.XmlNodeReader -ArgumentList ([xml]$xaml)

$Global:Window=[Windows.Markup.XamlReader]::Load( $reader )

# Generate Variables for each Controls
Set-WPFWindowVariable -Window $Window -XAML $Xaml -Prefix WPF

# Find the Variable of this environment
#Get-Variable WPF*

$array = $((Get-Process).Name |Select-Object -Unique)

# GET TO WORK
Add-WPFComboBoxItem -ComboBox $WPFcomboBox -Item (Get-Service).ServiceName


$WPFbuttonRemoveSelected.Add_Click({
    Remove-WPFComboBoxItem -SelectedItem -ComboBox $WPFcomboBox
   
})

# Show the Window
Show-WPFWindow -Window $Window