function Remove-WPFListBoxItem
{
<#
	.SYNOPSIS
		Function to remove items from a Listbox
	
	.DESCRIPTION
		Function to remove items from a Listbox
	
		System.windows.controls.listbox	
		https://msdn.microsoft.com/en-us/library/system.windows.controls.listbox(v=vs.110).aspx
	
	.PARAMETER ListBox
		Specifies the Listbox control
	
	.PARAMETER SelectedItem
		Specifies that all the selected items will be remove from the Listbox
	
	.NOTES
		Francois-Xavier Cat
		lazywinadmin.com
		@lazywinadm
		github.com/lazywinadmin
#>
	
	[CmdletBinding(SupportsShouldProcess = $true)]
	param
	(
		[Parameter(Mandatory = $true)]
		[ValidateNotNull()]
		[System.Windows.Controls.ListBox]$ListBox,
		
		[Switch]$SelectedItem
	)
	
	BEGIN
	{
		Add-Type –assemblyName PresentationFramework
		Add-Type –assemblyName PresentationCore
		Add-Type –assemblyName WindowsBase
	}
	PROCESS
	{
		IF ($PSBoundParameters['SelectedItem'])
		{
			while ($ListBox.SelectedItems.count -gt 0)
			{
				$ListBox.Items.RemoveAt($ListBox.SelectedIndex)
			}
		}
	}
}