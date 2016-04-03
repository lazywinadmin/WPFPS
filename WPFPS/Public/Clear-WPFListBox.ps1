function Clear-WPFListBox
{
<#
	.SYNOPSIS
		function to clear the content of a Listbox
	
	.DESCRIPTION
		function to clear the content of a Listbox
	
	.PARAMETER ListBox
		Specifies the ListBox control to clear
	
	.EXAMPLE
		PS C:\> Clear-WPFListBox -ListBox $ListBox01
	
	.NOTES
		Francois-Xavier Cat
		lazywinadmin.com
		@lazywinadm
		github.com/lazywinadmin
#>
	Param (
		[ValidateNotNull()]
		[Parameter(Mandatory = $true)]
		[System.Windows.Controls.ListBox]
		$ListBox
	)
	# Clear ListBox
	$ListBox.Items.Clear()
}