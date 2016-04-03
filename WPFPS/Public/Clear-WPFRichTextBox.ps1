function Clear-WPFRichTextBox
{
<#
	.SYNOPSIS
		This function will clear the content of a richtextbox control
	
	.DESCRIPTION
		A detailed description of the Clear-WFRichTextBox function.
	
	.PARAMETER RichTextBox
		A description of the RichTextBox parameter.
	
	.EXAMPLE
		Clear-WPFRichTextBox -RichTextBox $RichTextBox
	
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
		[System.Windows.Controls.RichTextBox]$RichTextBox
	)
	
	BEGIN
	{
		Add-Type –assemblyName PresentationFramework
		Add-Type –assemblyName PresentationCore
		Add-Type –assemblyName WindowsBase
	}
	PROCESS
	{
		IF ($PSCmdlet.ShouldProcess($RichTextBox, "Clear the Richtextbox control"))
		{
			#Clear the RichTextBox
			$RichTextBox.Document.Blocks.Clear()
		}
	}
}