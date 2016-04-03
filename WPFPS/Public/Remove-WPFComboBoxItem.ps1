function Remove-WPFComboBoxItem
{
<#
	.SYNOPSIS
		Function to Remove items from a ComboBox
	
	.DESCRIPTION
		Function to Remove items from a ComboBox
	
		System.windows.controls.combobox
		https://msdn.microsoft.com/en-us/library/system.windows.controls.combobox(v=vs.110).aspx
	
	.PARAMETER ComboBox
		Specifies the ComboBox control
	
	.PARAMETER SelectedItem
		Specifies the Selected item(s)
	
	.EXAMPLE
		Remove-WPFComboBoxItem -ComboBox $Combobox1 -SelectedItem
	
		Will remove all the selected item in the ComboBox $Combobox1
		
	.NOTES
		Francois-Xavier Cat
		lazywinadmin.com
		@lazywinadm
		github.com/lazywinadmin
#>
	Param (
		[ValidateNotNull()]
		[Parameter(Mandatory = $true)]
		[System.Windows.Controls.ComboBox]$ComboBox,
		
		[switch]$SelectedItem
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
			Foreach ($item in $ComboBox.SelectedItem)
			{
				$ComboBox.Items.RemoveAt($comboBox.SelectedIndex)
				#$ComboBox.Items.Remove($comboBox.SelectedItem)
			}
		}
	}
}