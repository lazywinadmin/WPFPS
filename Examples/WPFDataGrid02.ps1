# FUNCTIONS
Function Set-WPFFormVariable
{
	[CmdletBinding()]
	PARAM (
		[parameter(Mandatory)]
		[alias("Window")]
		$Form,
		
		[parameter(Mandatory)]
		[XML]$XAML,
		
		$Prefix="WPF")
	
	BEGIN
	{
		$GUI = $XAML.SelectNodes("//*[@Name]")
	}
	PROCESS
	{
		IF ($PSBoundParameters['Prefix'])
		{
			Foreach ($item in $GUI)
			{
				Set-Variable -Name "$Prefix$($item.Name)" -Value $Form.FindName($item.Name) -Scope global
			}
		}
		ELSE
		{
			Foreach ($item in $GUI)
			{
				Set-Variable -Name "($item.Name)" -Value $Form.FindName($item.Name) -Scope global
			}
		}
	} #Process
}

function Show-WPFForm
{
	PARAM (
	[Alias("Window")]	
	$Form)
	$Form.ShowDialog() | out-null
}

function Import-WPFDataGrid
{
	<#
	.SYNOPSIS
		This functions helps you load items into a DataGrid.

	.DESCRIPTION
		Use this function to dynamically load items into the DataGrid control.

        The object passed to the the Item parameter will be converted to a DataTable Object

        The object added into the DataGrid will be a DataView

	.PARAMETER  DataGrid
		The ComboBox control you want to add items to.

	.PARAMETER  Item
		The object or objects you wish to load into the ComboBox's items collection.
	
	.PARAMETER  DataMember
		Sets the name of the list or table in the data source for which the DataGrid is displaying data.
	
	.EXAMPLE
		Import-WFDataGrid -DataGrid $DataGrid1 -Item (Get-Process)
	
	.NOTES
        Francois-Xavier Cat
		www.lazywinadmin.com
		@lazywinadm
		github.com/lazywinadmin
		
	#>
	
	Param (
		[ValidateNotNull()]
		[Parameter(Mandatory = $true)]
		[System.Windows.Controls.DataGrid]$DataGrid,
		
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
        if ($item -isnot [System.Data.DataTable])
        {
		    $Item = $Item |Out-DataTable
        }

        $DataTableView = New-Object System.Data.DataView -ArgumentList $Item
        $DataGrid.ItemsSource = $DataTableView
	}
}

function Add-WPFDataGridRow
{
<#
	.SYNOPSIS
		This function add a row to a DataGrid
	
	.DESCRIPTION
		This function add a row to a DataGrid

        By default it will add an empty row (if -values is not specified)
	
	.PARAMETER DataGrid
		Specifies the DataGridView Control to use
	
	.PARAMETER Values
		Specities the values to add
	
	.EXAMPLE
		Add-WFDataGridRow -DataGrid $datagrid1
	
		Add an empty row
	
	.EXAMPLE
		Add-WFDataGridRow -DataGrid $datagrid1 -Values "Francois-Xavier","Cat","fxcat"
	
		Add a row with the values specified.

	.EXAMPLE
		Add-WFDataGridRow -DataGrid $datagrid1 -Object (Get-Process|select name,id.path)
	
		Add an object to the Datagrid. The column must exist
	
	.NOTES
		Francois-Xavier Cat
		www.lazywinadmin.com
		@lazywinadm
		github.com/lazywinadmin
#>
	
	[CmdletBinding(DefaultParameterSetName = 'EmptyRow')]
	param
	(
		[Parameter(Mandatory = $true)]
		[ValidateNotNull()]
		[System.Windows.Controls.DataGrid]$DataGrid,
		
		[Parameter(ParameterSetName = 'Row')]
		[Array]$Values,

        [Parameter(ParameterSetName = 'Object')]
        $Object
	)
	
	BEGIN
	{
		Add-Type –assemblyName PresentationFramework
		Add-Type –assemblyName PresentationCore
		Add-Type –assemblyName WindowsBase
	}
	PROCESS
	{
		IF ($PSCmdlet.ParameterSetName -eq 'EmptyRow')
		{
            $Row = $DataGrid.ItemsSource.Table.NewRow()
			$DataGrid.ItemsSource.Table.Rows.add()
		}
		ELSEIF ($PSCmdlet.ParameterSetName -eq 'Row')
		{
			$Row = $DataGrid.ItemsSource.Table.NewRow()
            $Row.ItemArray = $Values
            $DataGrid.ItemsSource.Table.Rows.add($row)
		}
        ELSEIF ($PSCmdlet.ParameterSetName -eq 'Object')
		{
            Foreach ($i in $Object)
            {
                $Row = $DataGrid.ItemsSource.Table.NewRow()
                $RowProps = ($row|gm -MemberType Properties).name

                ($i|gm -MemberType Properties).name|%{
                    if ($RowProps -contains $_)
                    {
                        $row.$_ = $i.$_
                    }
                }
                $DataGrid.ItemsSource.Table.Rows.add($row)
            }
        }
	}
}

function Remove-WPFDataGridRow
{
<#
	.SYNOPSIS
		This function remove a row to a DataGrid
	
	.DESCRIPTION
		This function remove a row to a DataGrid
	
	.PARAMETER DataGridView
		Specifies the DataGridView Control to use
	
	.PARAMETER SelectedItems
        Specifies that the selectedItems will be removed
	
	.EXAMPLE
		Remove-WFDataGridRow -DataGrid $datagridview1 -selectedItems
	
		Remove all selected items
	
	.NOTES
		Francois-Xavier Cat
		www.lazywinadmin.com
		@lazywinadm
		github.com/lazywinadmin
#>
	
	[CmdletBinding()]
	param
	(
		[Parameter(Mandatory = $true)]
		[ValidateNotNull()]
		[System.Windows.Controls.DataGrid]$DataGrid,
		
		[switch]$SelectedItems
	)
	
	BEGIN
	{
		Add-Type –assemblyName PresentationFramework
		Add-Type –assemblyName PresentationCore
		Add-Type –assemblyName WindowsBase
	}
	PROCESS
	{
        IF($PSBoundParameters['SelectedItems'])
        {
		    while ($dataGrid.SelectedItems.count -gt 0)
            {
                $dataGrid.ItemsSource.Table.Rows.RemoveAt($dataGrid.SelectedIndex)
            }
        }
	}
}

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

function Out-DataTable 
{
<# 
.SYNOPSIS 
Creates a DataTable for an object 
.DESCRIPTION 
Creates a DataTable based on an objects properties. 
.INPUTS 
Object 
    Any object can be piped to Out-DataTable 
.OUTPUTS 
   System.Data.DataTable 
.EXAMPLE 
$dt = Get-psdrive| Out-DataTable 
This example creates a DataTable from the properties of Get-psdrive and assigns output to $dt variable 
.NOTES 
Adapted from script by Marc van Orsouw see link 
Version History 
v1.0  - Chad Miller - Initial Release 
v1.1  - Chad Miller - Fixed Issue with Properties 
v1.2  - Chad Miller - Added setting column datatype by property as suggested by emp0 
v1.3  - Chad Miller - Corrected issue with setting datatype on empty properties 
v1.4  - Chad Miller - Corrected issue with DBNull 
v1.5  - Chad Miller - Updated example 
v1.6  - Chad Miller - Added column datatype logic with default to string 
v1.7 - Chad Miller - Fixed issue with IsArray 
.LINK 
http://thepowershellguy.com/blogs/posh/archive/2007/01/21/powershell-gui-scripblock-monitor-script.aspx 
#> 
    [CmdletBinding()] 
    param([Parameter(Position=0, Mandatory=$true, ValueFromPipeline = $true)] [PSObject[]]$InputObject) 
 
    Begin 
    { 
    function Get-Type 
{ 
    param($type) 
 
$types = @( 
'System.Boolean', 
'System.Byte[]', 
'System.Byte', 
'System.Char', 
'System.Datetime', 
'System.Decimal', 
'System.Double', 
'System.Guid', 
'System.Int16', 
'System.Int32', 
'System.Int64', 
'System.Single', 
'System.UInt16', 
'System.UInt32', 
'System.UInt64') 
 
    if ( $types -contains $type ) { 
        Write-Output "$type" 
    } 
    else { 
        Write-Output 'System.String' 
         
    } 
} #Get-Type 

        $dt = new-object Data.datatable   
        $First = $true  
    } 
    Process 
    { 
        foreach ($object in $InputObject) 
        { 
            $DR = $DT.NewRow()   
            foreach($property in $object.PsObject.get_properties()) 
            {   
                if ($first) 
                {   
                    $Col =  new-object Data.DataColumn   
                    $Col.ColumnName = $property.Name.ToString()   
                    if ($property.value) 
                    { 
                        if ($property.value -isnot [System.DBNull]) { 
                            $Col.DataType = [System.Type]::GetType("$(Get-Type $property.TypeNameOfValue)") 
                         } 
                    } 
                    $DT.Columns.Add($Col) 
                }   
                if ($property.Gettype().IsArray) { 
                    $DR.Item($property.Name) =$property.value | ConvertTo-XML -AS String -NoTypeInformation -Depth 1 
                }   
               else { 
                    $DR.Item($property.Name) = $property.value 
                } 
            }   
            $DT.Rows.Add($DR)   
            $First = $false 
        } 
    }  
      
    End 
    { 
        Write-Output @(,($dt)) 
    } 
 
}


# GUI
$Xaml = @"
<Window x:Class="WpfApplication6.MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        xmlns:local="clr-namespace:WpfApplication6"
        mc:Ignorable="d"
        Title="WPFPS - DataGrid" Height="350" Width="525">
    <Grid>
        <DataGrid x:Name="dataGrid" HorizontalAlignment="Left" Margin="10,85,0,0" VerticalAlignment="Top" Height="224" Width="497"/>
        <Button x:Name="buttonLoadDataGrid" Content="Load Services" HorizontalAlignment="Left" Margin="10,10,0,0" VerticalAlignment="Top" Width="136"/>
        <Button x:Name="buttonClearDataGrid" Content="Clear All" HorizontalAlignment="Left" Margin="151,35,0,0" VerticalAlignment="Top" Width="136"/>
        <Button x:Name="buttonRemoveSelected" Content="Remove Selected" HorizontalAlignment="Left" Margin="10,35,0,0" VerticalAlignment="Top" Width="136"/>
        <Button x:Name="buttonAddRow" Content="Add Row" HorizontalAlignment="Left" Margin="10,60,0,0" VerticalAlignment="Top" Width="136"/>
        <Button x:Name="buttonFilter" Content="Filter" HorizontalAlignment="Left" Margin="151,10,0,0" VerticalAlignment="Top" Width="136"/>

    </Grid>
</Window>

"@       

# PREPARE 
# Remove unnecessary pieces from xml
$Xaml = $xaml -replace 'mc:Ignorable="d"' -replace "x:N",'N' -replace '^<Win.*','<Window'

# Read the XAML
$Reader= New-Object -TypeName System.Xml.XmlNodeReader -ArgumentList ([xml]$xaml)

$Global:Window=[Windows.Markup.XamlReader]::Load( $reader )

# Find and Generate Variables for each Controls
Set-WPFFormVariable -Form $Window -XAML $Xaml -Prefix WPF

# Find the Variable of this environment
#Get-Variable WPF*


<# 
    WORK AREA
#>

# Load the Process
$WPFbuttonLoadDataGrid.Add_Click({
Import-WPFDataGrid -DataGrid $WPFdataGrid -Item (Get-Process|Select Name,ID,Path)
})


# Add a new row
$WPFbuttonAddRow.Add_Click({
    # Add a line
    $Array = @("SomeFakeProcess","0000","wow")
    Add-WPFDataGridRow -DataGrid $WPFdataGrid -Values $Array
    
    # Add another line
    #Add-WPFDataGridRow -DataGrid $WPFdataGrid -Values 

    # Empty rows
    Add-WPFDataGridRow -DataGrid $WPFdataGrid
    Add-WPFDataGridRow -DataGrid $WPFdataGrid
    Add-WPFDataGridRow -DataGrid $WPFdataGrid

    # Add a PowerShell Object
    Add-WPFDataGridRow -DataGrid $WPFdataGrid -PS (Get-Process -name Chrome |select name, id, path)
})

# Clear the DataGrid
$WPFbuttonClearDataGrid.Add_click({Clear-WPFDataGrid -DataGrid $WPFdatagrid})

# Remove the selected row(s)
$WPFbuttonRemoveSelected.Add_Click({

<#
    while ($WPFdataGrid.SelectedItems.count -gt 0)
    {
        $WPFdataGrid.ItemsSource.Table.Rows.RemoveAt($WPFdataGrid.SelectedIndex)
    }
    #>

    Remove-WPFDataGridRow -DataGrid $WPFdataGrid -SelectedItems
    
})



<# 
    SHOW The FORM
#>

# Show the Window
Show-WPFForm -Form $Window


<# 
    CLEANUP
#>
# Examples:
#  Closing Events
#  $Window.Add_Closing({"Closing Form"})
#  $Window.Add_Closed({"GoodBye"})