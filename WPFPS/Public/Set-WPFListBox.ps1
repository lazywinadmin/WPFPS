function Set-WPFListBox
{
	PARAM (
		[parameter(Mandatory)]
		[System.Windows.Controls.ListBox]
		$ListBox,
		
		[switch]$ScrollToCaret)
	
	IF ($PSBoundParameters['ScrollToCaret'])
	{
		#$ListBox.SelectedIndex = -1
		$listBox.SelectedIndex = $listBox.Items.Count - 1
		$ListBox.ScrollIntoView($listBox.SelectedItem)
	}
}