#--------------------------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------------------------
# HASH DADDY
#--------------------------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------------------------

param(
	[string]$hash = "Hash not Selected"
)

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$fileBrowser = New-Object System.Windows.Forms.OpenFileDialog -Property @{
		Multiselect = $false
}

[void]$fileBrowser.ShowDialog()

$form = New-Object System.Windows.Forms.Form
$form.Text = 'Compare Hash'
$form.Size = New-Object System.Drawing.Size(300,200)
$form.StartPosition = 'CenterScreen'

$OkButton = New-Object System.Windows.Forms.Button
$OkButton.Location = New-Object System.Drawing.Point(75,120)
$OkButton.Size = New-Object System.Drawing.Size(75,23)
$OkButton.Text = 'Ok'
$OkButton.DialogResult = [System.Windows.Forms.DialogResult]::Ok
$form.AcceptButton = $OkButton
$form.Controls.Add($OkButton)

$CancelButton = New-Object System.Windows.Forms.Button
$CancelButton.Location = New-Object System.Drawing.Point(150,120)
$CancelButton.Size = New-Object System.Drawing.Size(75,23)
$CancelButton.Text = 'Cancel'
$CancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$form.CancelButton = $CancelButton
$form.Controls.Add($CancelButton)

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,20)
$label.Size = New-Object System.Drawing.Size(280,20)
$label.Text = 'Select the Algorithm'
$form.Controls.Add($label)

$listBox = New-Object System.Windows.Forms.ListBox
$listBox.Location = New-Object System.Drawing.Point(10,40)
$listBox.Size = New-Object System.Drawing.Size(260,20)
$listBox.Height = 80

[void] $listBox.Items.Add('SHA1')
[void] $listBox.Items.Add('SHA256')
[void] $listBox.Items.Add('SHA384')
[void] $listBox.Items.Add('SHA512')
[void] $listBox.Items.Add('MD5')
[void] $listBox.Items.Add('MACTripleDES')
[void] $listBox.Items.Add('RIPEMD160')
$form.Controls.Add($listBox)
$form.Topmost = $true

$result = $form.ShowDialog()
if ($result -eq [System.Windows.Forms.DialogResult]::Ok) {
	$x = $listBox.SelectedItem
}

$file = $fileBrowser.FileName;
if($fileBrowser.FileName -like "*/*") {
	$getFileHashCall = Get-FileHash ($file) -Algorithm $x
} else {
	Write-Host "Cancelled by User" -ForegroundColor DarkMagenta
}
Write-Host "`nComparing $file using $x . . .`n" -ForegroundColor DarkBlue
Write-Host $getFileHashCall.hash -ForegroundColor Gray
Write-Host $hash "`n" -ForegroundColor DarkGray
if ($getFileHashCall.hash -ne $hash) {
	Write-Host "The hash values DO NOT MATCH" -ForegroundColor DarkRed
} else {
	Write-Host "The hash values MATCH" -ForegroundColor DarkGreen
}

#--------------------------------------------------------------------------------------------------------------
# NOTE: In order to properly run, Powershell Script must be Digitally Self-Signed,
#--------------------------------------------------------------------------------------------------------------
# Follow Tutorial for Generating Self-Signed Certificates: https://adamtheautomator.com/how-to-sign-powershell-script/
#--------------------------------------------------------------------------------------------------------------

# SIGNATURE BLOCK WILL BE APPENDED BELOW AFTER SELF-SIGNING. . . 
