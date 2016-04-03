function Disable-WPFButton
{
<#
	.SYNOPSIS
		Function to disable a Button control
	
	.DESCRIPTION
		Function to disable a Button control
	
	.PARAMETER Button
		Specifies the Button Control
	
	.EXAMPLE
		PS C:\> Disable-WPFButton -Button $Button1
	
	.NOTES
		Francois-Xavier Cat
		lazywinadmin.com
		@lazywinadm
		github.com/lazywinadmin
#>
	PARAM ([System.Windows.Controls.Button]
		$Button)
	$Button.IsEnabled = $false
}