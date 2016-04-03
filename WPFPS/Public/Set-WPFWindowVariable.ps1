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