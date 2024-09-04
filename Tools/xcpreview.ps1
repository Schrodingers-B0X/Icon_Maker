Add-Type -AssemblyName System.Windows.Forms

# Get the directory of the currently running script
$scriptDirectory = Split-Path -Parent $MyInvocation.MyCommand.Path

# Define paths to your images using relative paths
$imagePath1 = Join-Path $scriptDirectory "..\Icon-Presets\preview.jpg"
$imagePath2 = Join-Path $scriptDirectory "..\Icon-Presets\previewvod.jpg"

# Create a form to display images side by side
$Form = New-Object System.Windows.Forms.Form
$Form.Text = "Preview"
$Form.Width = 1280
$Form.Height = 530
$Form.StartPosition = "CenterScreen"
$Form.FormBorderStyle = "FixedDialog"
$Form.MaximizeBox = $false
$Form.TopMost = $true

# Add picture boxes for the images
$PictureBox1 = New-Object System.Windows.Forms.PictureBox
$PictureBox1.Width = 615
$PictureBox1.Height = 349
$PictureBox1.Left = 10
$PictureBox1.Top = 10
$PictureBox1.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::Zoom
$PictureBox1.Image = [System.Drawing.Image]::FromFile($imagePath1)

$PictureBox2 = New-Object System.Windows.Forms.PictureBox
$PictureBox2.Width = 615
$PictureBox2.Height = 349
$PictureBox2.Left = 635
$PictureBox2.Top = 10
$PictureBox2.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::Zoom
$PictureBox2.Image = [System.Drawing.Image]::FromFile($imagePath2)

# Add labels for images
$Label1 = New-Object System.Windows.Forms.Label
$Label1.Text = "Main Screen"
$Label1.Width = $PictureBox1.Width
$Label1.TextAlign = "TopCenter"
$Label1.Left = $PictureBox1.Left
$Label1.Top = $PictureBox1.Bottom + 10

$Label2 = New-Object System.Windows.Forms.Label
$Label2.Text = "VOD/TV Screens"
$Label2.Width = $PictureBox2.Width
$Label2.TextAlign = "TopCenter"
$Label2.Left = $PictureBox2.Left
$Label2.Top = $PictureBox2.Bottom + 10

$Form.Controls.Add($PictureBox1)
$Form.Controls.Add($PictureBox2)
$Form.Controls.Add($Label1)
$Form.Controls.Add($Label2)

# Add label for "Continue?"
$LabelContinue = New-Object System.Windows.Forms.Label
$LabelContinue.Text = "Continue?"
$LabelContinue.Width = $Form.Width
$LabelContinue.TextAlign = "TopCenter"
$LabelContinue.Top = $Label2.Bottom + 20
$Form.Controls.Add($LabelContinue)

# Add buttons "OK" and "CHANGE"
$ButtonOK = New-Object System.Windows.Forms.Button
$ButtonOK.Width = 100
$ButtonOK.Height = 30
$ButtonOK.Left = (640 - $ButtonOK.Width - 5)
$ButtonOK.Top = $LabelContinue.Bottom + 10
$ButtonOK.Text = "OK"
$ButtonOK.Add_Click({
    $Form.Tag = "OK"
    $Form.Close()
})
$Form.Controls.Add($ButtonOK)

$ButtonChange = New-Object System.Windows.Forms.Button
$ButtonChange.Width = 100
$ButtonChange.Height = 30
$ButtonChange.Left = $ButtonOK.Right + 10
$ButtonChange.Top = $LabelContinue.Bottom + 10
$ButtonChange.Text = "CHANGE"
$ButtonChange.Add_Click({
    $Form.Tag = "CHANGE"
    $Form.Close()
})
$Form.Controls.Add($ButtonChange)
# Show the form
# Show the form
$result = $Form.ShowDialog()

# Check the result and output it
if ($Form.Tag -eq "OK") {
    # Output YES
    Write-Output "OK"
} else {
    # Output NO
    Write-Output "CHANGE"
}