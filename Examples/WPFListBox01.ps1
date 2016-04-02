#FUNCTIONS
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

##########

function Add-WPFListBoxItem
{
<#

#>
	Param (
		[ValidateNotNull()]
		[Parameter(Mandatory = $true)]
		[System.Windows.Controls.ListBox]
		$ListBox,
		
		[ValidateNotNull()]
		[Parameter(Mandatory = $true)]
		$Items,
		
		[Switch]$Append
		
	)
	BEGIN
	{
		#Add-Type -AssemblyName System.Windows.Controls
	}
	PROCESS
	{
		IF (-not $PSBoundParameters['Append'])
		{
			# Clear ListBox
			$ListBox.items.Clear()
		}
		
		# Add Items
		FOREACH ($item in $Items)
		{
			$ListBox.Items.Add($item)
		}
	} #PROCESS
} #Add-WPFListBoxItem

function Set-WPFListBox
{
PARAM(
[parameter(Mandatory)]
[System.Windows.Controls.ListBox]$ListBox,
[switch]$ScrollToCaret)

IF($PSBoundParameters['ScrollToCaret'])
{
    #$ListBox.SelectedIndex = -1
    $listBox.SelectedIndex = $listBox.Items.Count - 1
    $ListBox.ScrollIntoView($listBox.SelectedItem)
    }
}

function Clear-WPFListBox
{
	Param (
		[ValidateNotNull()]
		[Parameter(Mandatory = $true)]
		[System.Windows.Controls.ListBox]
		$ListBox
	)
	# Clear ListBox
	$ListBox.Items.Clear()
}#Clear-WPFListBox

function Enable-WPFButton
{
PARAM([System.Windows.Controls.Button]$Button)
$Button.IsEnabled = $true
}

function Disable-WPFButton
{
PARAM([System.Windows.Controls.Button]$Button)
$Button.IsEnabled = $false
}

function Get-WPFListBoxItem
{
<#

#>
	Param (
		[ValidateNotNull()]
		[Parameter(Mandatory = $true)]
		[System.Windows.Controls.ListBox]
		$ListBox,
        [Switch]$Selected
	)
    IF ($PSBoundParameters['Selected'])
    {
        $ListBox.SelectedItems
    }
}

function Get-WPFTextBoxText
{
    PARAM([System.Windows.Controls.TextBox]$TextBox)
    $TextBox.Text
}

function Set-WPFTextBoxText
{
    PARAM([System.Windows.Controls.TextBox]$TextBox,[String]$Text)
    $TextBox.Text = $Text
}

function Disable-WPFTextBox
{
    PARAM([System.Windows.Controls.TextBox]$TextBox)
    $Textbox.IsEnabled = $false
}

function Set-WPFControl
{
PARAM(
    $Hidden,
    $Visible
    
    )

}


#XAML
$xaml = @"
<Window x:Class="WpfApplication2.MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        xmlns:local="clr-namespace:WpfApplication2"
        mc:Ignorable="d"
        Title="WPFPS - ListBox" Height="268.956" Width="541.496">
    <Grid Height="238" VerticalAlignment="Top">
        <Button x:Name="buttonProcesses" Content="Get-Process" HorizontalAlignment="Left" Margin="201,14,0,0" VerticalAlignment="Top" Width="131"/>
        <ListBox x:Name="listBox" HorizontalAlignment="Left" Margin="10,0,0,0" Width="175"/>
        <Button x:Name="buttonClear" Content="Clear ListBox" HorizontalAlignment="Left" Margin="201,64,0,0" VerticalAlignment="Top" Width="131"/>
        <TextBox x:Name="textBoxAppend" HorizontalAlignment="Left" Height="20" Margin="345,39,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="128"/>
        <Button x:Name="buttonAppend" Content="Append Item" HorizontalAlignment="Left" Margin="201,39,0,0" VerticalAlignment="Top" Width="131"/>
        <TextBox x:Name="textBoxSelected" HorizontalAlignment="Left" Height="20" Margin="345,89,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="128"/>
        <Button x:Name="buttonSelected" Content="Get Selected" HorizontalAlignment="Left" Margin="201,89,0,0" VerticalAlignment="Top" Width="131"/>

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


Get-Variable WPF*

# Initiate controls
Disable-WPFButton -Button $WPFbuttonAppend
Disable-WPFTextBox -TextBox $WPFtextBoxSelected


$WPFbuttonProcesses.Add_Click({
    $process = Get-Process

    foreach ($item in $Process.Name)
    {
        #$WPFlistBox.Items.Add($item)
    }
    #$listBox.Items.AddRange($Items)
    #Load-ListBox -ListBox $WPFlistBox -Items $process.Name

    Add-WPFListBoxItem -ListBox $WPFlistBox -Items $process.Name
})

$WPFbuttonAppend.Add_Click({
    $text = Get-WPFTextBoxText -TextBox $WPFtextBoxAppend

    Add-WPFListBoxItem -ListBox $WPFlistBox -Items $text -Append
    Set-WPFListBox -ListBox $WPFlistBox -ScrollToCaret
})

$WPFbuttonClear.Add_Click({Clear-WPFListBox -ListBox $WPFlistBox})

$WPFbuttonSelected.Add_Click({
    $items = Get-WPFListBoxItem -ListBox $WPFlistBox -Selected
    $items
    Set-WPFTextBoxText -TextBox $WPFtextBoxSelected -Text $items
})

$WPFTextBoxAppend.Add_TextChanged({
    $WPFbuttonAppend.IsEnabled = $WPFTextBoxAppend.Text
})

Show-WPFForm -Form $Window
