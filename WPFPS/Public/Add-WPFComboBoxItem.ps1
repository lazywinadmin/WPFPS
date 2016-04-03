function Add-WPFComboBoxItem
{
<#
	.SYNOPSIS
		Function to add items from a ComboBox
	
	.DESCRIPTION
		Function to add items from a ComboBox
	
		System.windows.controls.combobox
		https://msdn.microsoft.com/en-us/library/system.windows.controls.combobox(v=vs.110).aspx
	
	.PARAMETER ComboBox
		Specifies the ComboBox control
	
	.PARAMETER Item
		Specifies the item to add
	
	.EXAMPLE
		Add-WPFComboBoxItem -ComboBox $Combobox1 -item (Get-Service).ServiceName
		
	.NOTES
		Francois-Xavier Cat
		lazywinadmin.com
		@lazywinadm
		github.com/lazywinadmin
#>
	Param (
		[ValidateNotNull()]
		[Parameter(Mandatory = $true)]
		[System.Windows.Controls.ComboBox]
		$ComboBox,
		
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
		
		# Add Items
		FOREACH ($i in $Item)
		{
			#$ComboBox.Items.Add($i)
			$ComboBox.Items.Add($i) | Out-Null
		}
	}
}