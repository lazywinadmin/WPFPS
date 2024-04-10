function Clear-WPFRichTextBox
{
<#
	.SYNOPSIS
		This function will clear the content of a richtextbox control
	
	.DESCRIPTION
		This function will clear the content of a richtextbox control
	
	.PARAMETER RichTextBox
		Specifies the RichTextBox control
	
	.EXAMPLE
		Clear-WPFRichTextBox -RichTextBox $RichTextBox1
	
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
		Add-Type -assemblyName PresentationFramework
		Add-Type -assemblyName PresentationCore
		Add-Type -assemblyName WindowsBase
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