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

function Clear-WPFRichTextBox
{
<#
	.SYNOPSIS
		This function will clear the content of a richtextbox control
	
	.DESCRIPTION
		A detailed description of the Clear-WFRichTextBox function.
	
	.PARAMETER RichTextBox
		A description of the RichTextBox parameter.
	
	.EXAMPLE
		Clear-WPFRichTextBox -RichTextBox $RichTextBox
	
	.NOTES
		Francois-Xavier Cat
		@lazywinadm
		www.lazywinadmin.com
		github.com/lazywinadmin
#>
	
	[CmdletBinding(SupportsShouldProcess = $true)]
	param
	(
		[Parameter(Mandatory = $true)]
		[ValidateNotNull()]
		[System.Windows.Controls.RichTextBox]$RichTextBox
	)
	
	BEGIN
	{
		Add-Type -AssemblyName System.Windows.Forms
	}
	PROCESS
	{
		IF ($PSCmdlet.ShouldProcess($RichTextBox, "Clear the Richtextbox control"))
		{
			#Clear the RichTextBox
			$RichTextBox.Document.Blocks.Clear()
		}
	}
}


# GUI
$Xaml = @"
<Window x:Class="WpfApplication5.MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        xmlns:local="clr-namespace:WpfApplication5"
        mc:Ignorable="d"
        Title="WPFPS - RichTextBox" Height="219.467" Width="367.93">
    <Grid>
        <RichTextBox x:Name="richTextBox" HorizontalAlignment="Left" Height="142" Margin="9,35,0,0" VerticalAlignment="Top" Width="341" RenderTransformOrigin="0.099,-0.237">
            <FlowDocument>
                <Paragraph>
                    <Run Text="RichTextBox"/>
                </Paragraph>
            </FlowDocument>
        </RichTextBox>
        <Button x:Name="button" Content="Clear" HorizontalAlignment="Left" Margin="275,10,0,0" VerticalAlignment="Top" Width="75"/>

    </Grid>
</Window>
"@       

# PREPARE 
# Remove unnecessary pieces from xml
$Xaml = $xaml -replace 'mc:Ignorable="d"' -replace "x:N",'N' -replace '^<Win.*','<Window'

# Read the XAML
$Reader= New-Object -TypeName System.Xml.XmlNodeReader -ArgumentList ([xml]$xaml)

$Global:Window=[Windows.Markup.XamlReader]::Load( $reader )

# Find the Controls in the Window
([xml]$xaml).SelectNodes("//*[@Name]")

# Generate Variables for each Controls
Set-WPFWindowVariable -Window $Window -XAML $Xaml -Prefix WPF

# Find the Variable of this environment
Get-Variable WPF*



# GET TO WORK

$WPFbutton.Add_Click({

Clear-WPFRichTextBox -RichTextBox $WPFrichTextBox
})



# Show the Window
Show-WPFWindow -Window $Window
