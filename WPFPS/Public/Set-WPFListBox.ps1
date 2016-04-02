function Set-WPFListBox
{
<#
	.SYNOPSIS
		Function to edit the behavior of a ListBox Control
	
	.DESCRIPTION
		Function to edit the behavior of a ListBox Control
	
	.PARAMETER ListBox
		Specifies the ListBox control
	
	.PARAMETER ScrollToCaret
		Specifies that you want the listbox to go to the bottom of the list
	
	.PARAMETER SelectionMode
		Specifies the selection mode. Default is Single
	
			Extended: The user can select multiple consecutive items while holding down the SHIFT key.
			Multiple: The user can select multiple items without holding down a modifier key.
			Single: The user can select only one item at a time.
	
		https://msdn.microsoft.com/en-us/library/system.windows.controls.selectionmode(v=vs.110).aspx
	
	.EXAMPLE
		PS C:\> Set-WPFListBox -ListBox $ListBox -ScrollToCaret
	
		Go to the bottom of the listbox $listbox

	.EXAMPLE
		PS C:\> Set-WPFListBox -ListBox $ListBox -SelectionMode Extended
	
		Change the SelectionMode to Extended.
	
	.NOTES
		Francois-Xavier Cat
		lazywinadmin.com
		@lazywinadm
		github.com/lazywinadmin
	
		Syystem.Windows.Controls.ListBox
#>
	[CmdletBinding()]
	param
	(
		[Parameter(Mandatory = $true)]
		[System.Windows.Controls.ListBox]$ListBox,
		
		[switch]$ScrollToCaret,
		
		[System.Windows.Controls.Selectionmode]$SelectionMode
	)
	
	BEGIN
	{
		Add-Type –assemblyName PresentationFramework
		Add-Type –assemblyName PresentationCore
		Add-Type –assemblyName WindowsBase
	}
	PROCESS
	{
		IF ($PSBoundParameters['ScrollToCaret'])
		{
			$listBox.SelectedIndex = $listBox.Items.Count - 1
			$ListBox.ScrollIntoView($listBox.SelectedItem)
		}
		
		IF ($PSBoundParameters['SelectionMode'])
		{
			$ListBox.SelectionMode = $SelectionMode
		}
	}
}