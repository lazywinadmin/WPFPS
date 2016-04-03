function Get-WPFListBoxItem
{
<#
	.SYNOPSIS
		Function to retrieve items from a ListBox Control
	
	.DESCRIPTION
		Function to retrieve items from a ListBox Control
	
	.PARAMETER ListBox
		Specifies the ListBox control
	
	.PARAMETER Selected
		Retrieve only the selected items
	
	.PARAMETER All
		Retrieve All items
	
	.EXAMPLE
		PS C:\> Get-WPFListBoxItem -ListBox $ListBox1 -Selected
	
		Retrieve the selected Item(s)
	
	.EXAMPLE
		PS C:\> Get-WPFListBoxItem -ListBox $ListBox1
	
		Retrieve all the items
	
	.NOTES
		Francois-Xavier Cat
		lazywinadmin.com
		@lazywinadm
		github.com/lazywinadmin
#>
	
	[CmdletBinding(DefaultParameterSetName = 'All')]
	param
	(
		[Parameter(Mandatory = $true)]
		[ValidateNotNull()]
		[System.Windows.Controls.ListBox]
		$ListBox,
		
		[Parameter(ParameterSetName = 'Selected',
				   Mandatory = $false)]
		[Switch]$Selected,
		
		[Parameter(ParameterSetName = 'All')]
		$All
	)
	begin
	{
		Add-Type –assemblyName PresentationFramework
		Add-Type –assemblyName PresentationCore
		Add-Type –assemblyName WindowsBase
	}
	process
	{
		IF ($PSBoundParameters['Selected'])
		{
			$ListBox.SelectedItems
		}
		
		IF ($PSBoundParameters['All'])
		{
			$ListBox.Items
		}
	}
}