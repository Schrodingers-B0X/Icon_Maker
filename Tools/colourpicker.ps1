Add-Type -AssemblyName System.Windows.Forms
$colorDialog = New-Object Windows.Forms.ColorDialog
$colorDialog.AllowFullOpen = $true
$colorDialog.FullOpen = $true
$colorDialog.ShowDialog() | Out-Null
$color = $colorDialog.Color
$rgba = "#{0:X2}{1:X2}{2:X2}" -f $color.R, $color.G, $color.B
$rgba