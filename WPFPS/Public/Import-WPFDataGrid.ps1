function Import-WPFDataGrid
{
	<#
	.SYNOPSIS
		This functions helps you load items into a DataGrid.

	.DESCRIPTION
		Use this function to dynamically load items into the DataGrid control.

	.PARAMETER  DataGrid
		The ComboBox control you want to add items to.

	.PARAMETER  Item
		The object or objects you wish to load into the ComboBox's items collection.
	
	.PARAMETER  DataMember
		Sets the name of the list or table in the data source for which the DataGrid is displaying data.
	
	.EXAMPLE
		Import-WFDataGrid -DataGrid $DataGrid1 -Item (Get-Process)
	
	.NOTES

		
	#>
	
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