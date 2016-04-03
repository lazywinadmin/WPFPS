function Import-WPFDataGrid
{
	<#
	.SYNOPSIS
		Function to load multiple items into a DataGrid control.

	.DESCRIPTION
		Function to load multiple items into a DataGrid control.
        The object that you are passing to the Item parameter will be converted to a Datatable object

	.PARAMETER  DataGrid
		Specifies the DataGrid Control

	.PARAMETER  Item
		Specifies the object(s) you wish to load into the ComboBox's items collection.
	
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