$_file = Get-Item -LiteralPath $args[0]
$_date = [DateTime]::ParseExact($(ffprobe -v error -show_entries format_tags=date -of default=noprint_wrappers=1:nokey=1 $_file), 'yyyyMMdd', $null)
$_file.LastWriteTime = $_date