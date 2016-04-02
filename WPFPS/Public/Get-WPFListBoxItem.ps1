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