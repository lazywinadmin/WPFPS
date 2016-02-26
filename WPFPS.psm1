<#	
	===========================================================================
	 Created by:   	Francois-Xavier Cat
	 Organization: 	lazywinadmin.com
	 Filename:     	WPFPS.psm1
	-------------------------------------------------------------------------
	 Module Name: WPFPS
	===========================================================================
#>

function Add-WPFListBoxItem
{
<#

#>
	Param (
		[ValidateNotNull()]
		[Parameter(Mandatory = $true)]
		[System.Windows.Controls.ListBox]
		$ListBox,
		
		[ValidateNotNull()]
		[Parameter(Mandatory = $true)]
		$Items,
		
		[Switch]$Append
		
	)
	BEGIN
	{
	}
	PROCESS
	{
		IF (-not $PSBoundParameters['Append'])
		{
			# Clear ListBox
			$ListBox.items.Clear()
		}
		
		# Add Items
		FOREACH ($item in $Items)
		{
			$ListBox.Items.Add($item)
		}
	} #PROCESS
} #Add-WPFListBoxItem

function Clear-WPFListBox
{
	Param (
		[ValidateNotNull()]
		[Parameter(Mandatory = $true)]
		[System.Windows.Controls.ListBox]
		$ListBox
	)
	# Clear ListBox
	$ListBox.Items.Clear()
} #Clear-WPFListBox

function Enable-WPFButton
{
	PARAM ([System.Windows.Controls.Button]
		$Button)
	$Button.IsEnabled = $true
}

function Disable-WPFButton
{
	PARAM ([System.Windows.Controls.Button]
		$Button)
	$Button.IsEnabled = $false
}

function Get-WPFListBoxItem
{
<#

#>
	Param (
		[ValidateNotNull()]
		[Parameter(Mandatory = $true)]
		[System.Windows.Controls.ListBox]
		$ListBox,
		
		[Switch]$Selected
	)
	IF ($PSBoundParameters['SelectedValue'])
	{
		$ListBox.SelectedValue
	}
}

function Get-WPFTextBoxText
{
	PARAM (
		[System.Windows.Controls.TextBox]
		$TextBox)
	$TextBox.Text
}

function Set-WPFTextBoxText
{
	PARAM (
		[System.Windows.Controls.TextBox]
		$TextBox,
		
		[String]$Text)
	$TextBox.Text = $Text
}

Export-ModuleMember *



