Add-Type -AssemblyName PresentationCore
$imgs = @('invasion.jpg','nobunaga.jpg')
foreach ($f in $imgs) {
  $p = "C:\Users\Soichi\thesis-presentation\public\images\$f"
  try {
    $s = [System.IO.File]::OpenRead($p)
    $d = [System.Windows.Media.Imaging.BitmapDecoder]::Create($s, 'None', 'OnDemand')
    $fr = $d.Frames[0]
    Write-Output "$f : $($fr.PixelWidth)x$($fr.PixelHeight)"
    $s.Close()
  } catch {
    Write-Output "$f : ERROR $($_.Exception.Message)"
  }
}
