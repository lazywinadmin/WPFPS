function Update-WPFDataGrid
{
<#
	.SYNOPSIS
		Function to refresh the content of a DataGrid control
	
	.DESCRIPTION
		Function to refresh the content of a DataGrid control
	
	.PARAMETER DataGrid
		Specifies the DataGrid control to update
	
	.NOTES
		Author: Francois-Xavier Cat
		Twitter:@LazyWinAdm
		www.lazywinadmin.com
		github.com/lazywinadmin
#>
	
	[CmdletBinding(SupportsShouldProcess = $true)]
	param
	(
		[Parameter(Mandatory = $true)]
		[System.Windows.Controls.DataGrid]$DataGrid
	)
	
	BEGIN
	{
		Add-Type –assemblyName PresentationFramework
		Add-Type –assemblyName PresentationCore
		Add-Type –assemblyName WindowsBase
	}
	PROCESS
	{
		IF ($PSCmdlet.ShouldProcess($DataGrid,"Refresh the content"))
		{
			$DataGrid.items.Refresh()
		}
	}
}