function Import-WPFDataGrid
{
	<#
	.SYNOPSIS
		This functions helps you load items into a DataGrid.

	.DESCRIPTION
		Use this function to dynamically load items into the DataGrid control.

        The object passed to the the Item parameter will be converted to a DataTable Object

        The object added into the DataGrid will be a DataView

	.PARAMETER  DataGrid
		The ComboBox control you want to add items to.

	.PARAMETER  Item
		The object or objects you wish to load into the ComboBox's items collection.
	
	.PARAMETER  DataMember
		Sets the name of the list or table in the data source for which the DataGrid is displaying data.
	
	.EXAMPLE
		Import-WFDataGrid -DataGrid $DataGrid1 -Item (Get-Process)
	
	.NOTES
        Francois-Xavier Cat
		www.lazywinadmin.com
		@lazywinadm
		github.com/lazywinadmin
		
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
        if ($item -isnot [System.Data.DataTable])
        {
		    $Item = $Item |Out-DataTable
        }

        $DataTableView = New-Object System.Data.DataView -ArgumentList $Item
        $DataGrid.ItemsSource = $DataTableView
	}
}