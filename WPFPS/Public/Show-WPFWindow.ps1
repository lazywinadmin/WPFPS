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