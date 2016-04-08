function Set-WPFProgressBar
{
<#
	.SYNOPSIS
		Function to change ProgressBar Control
	
	.DESCRIPTION
		Function to change ProgressBar Control
	
	.PARAMETER ProgressBar
		Specifies the ProgressBar control
	
	.PARAMETER Value
		Specifies the Percentage of progress
	
	.NOTES
		Francois-Xavier Cat
		lazywinadmin.com
		@lazywinadm
		github.com/lazywinadmin
	
		System.Windows.Controls.ProgressBar
#>
	
	[CmdletBinding()]
	param
	(
		[System.Windows.Controls.ProgressBar]$ProgressBar,
		
		[ValidateRange(0, 100)]
		$Value
	)
	
	BEGIN
	{
		Add-Type –assemblyName PresentationFramework
		Add-Type –assemblyName PresentationCore
		Add-Type –assemblyName WindowsBase
	}
	PROCESS
	{
		$ProgressBar.Value = $Value
	}
}
