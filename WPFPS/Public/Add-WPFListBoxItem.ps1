function Add-WPFListBoxItem
{
<#
	.SYNOPSIS
		Function to add items from a Listbox
	
	.DESCRIPTION
		Function to add items from a Listbox.
	
		System.windows.controls.listbox	
		https://msdn.microsoft.com/en-us/library/system.windows.controls.listbox(v=vs.110).aspx
	
	.PARAMETER ListBox
		Specifies the Listbox control
	
	.PARAMETER Items
		Specifies the items to add in the Listbox
	
	.PARAMETER Append
		Specifies that the Listbox
		
	.NOTES
		Francois-Xavier Cat
		lazywinadmin.com
		@lazywinadm
		github.com/lazywinadmin
#>
	Param (
		[ValidateNotNull()]
		[Parameter(Mandatory = $true)]
		[System.Windows.Controls.ListBox]
		$ListBox,
		
		[ValidateNotNull()]
		[Parameter(Mandatory = $true)]
		$Item #,
		
		#[Switch]$Append=$true
		
	)
	BEGIN
	{
		Add-Type –assemblyName PresentationFramework
		Add-Type –assemblyName PresentationCore
		Add-Type –assemblyName WindowsBase
	}
	PROCESS
	{
		<#
		IF (-not $PSBoundParameters['Append'])
		{
			# Clear ListBox
			$ListBox.items.Clear()
		}
		#>
		
		# Add Items
		FOREACH ($i in $Item)
		{
			$ListBox.Items.Add($i)
		}
	}
}