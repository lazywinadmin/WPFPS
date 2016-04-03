function Remove-WPFDataGridRow
{
<#
	.SYNOPSIS
		This function remove a row to a DataGrid
	
	.DESCRIPTION
		This function remove a row to a DataGrid
	
	.PARAMETER DataGridView
		Specifies the DataGridView Control to use
	
	.PARAMETER SelectedItems
        Specifies that the selectedItems will be removed
	
	.EXAMPLE
		Remove-WFDataGridRow -DataGrid $datagrid1 -selectedItems
	
		Remove all selected items
	
	.NOTES
		Francois-Xavier Cat
		www.lazywinadmin.com
		@lazywinadm
		github.com/lazywinadmin
#>
	
	[CmdletBinding()]
	param
	(
		[Parameter(Mandatory = $true)]
		[ValidateNotNull()]
		[System.Windows.Controls.DataGrid]$DataGrid,
		
		[switch]$SelectedItems
	)
	
	BEGIN
	{
		Add-Type –assemblyName PresentationFramework
		Add-Type –assemblyName PresentationCore
		Add-Type –assemblyName WindowsBase
	}
	PROCESS
	{
        IF($PSBoundParameters['SelectedItems'])
        {
		    while ($dataGrid.SelectedItems.count -gt 0)
            {
                $dataGrid.ItemsSource.Table.Rows.RemoveAt($dataGrid.SelectedIndex)
            }
        }
	}
}