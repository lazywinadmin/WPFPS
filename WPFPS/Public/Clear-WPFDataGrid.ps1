function Clear-WPFDataGrid
{
<#
	.SYNOPSIS
		This function will clear the content of a DataGrid control
	
	.DESCRIPTION
		This function will clear the content of a DataGrid control
	
	.PARAMETER RichTextBox
		A description of the DataGrid parameter.
	
	.EXAMPLE
		Clear-WPFDataGrid -DataGrid $DataGrid
	
	.NOTES
		Francois-Xavier Cat
		@lazywinadm
		www.lazywinadmin.com
		github.com/lazywinadmin
#>
	
	[CmdletBinding(SupportsShouldProcess = $true)]
	param
	(
		[Parameter(Mandatory = $true)]
		[ValidateNotNull()]
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
		IF ($PSCmdlet.ShouldProcess($DataGrid, "Clear the Richtextbox control"))
		{
			#Clear the RichTextBox
			$DataGrid.ItemsSource = $null
		}
	}
}