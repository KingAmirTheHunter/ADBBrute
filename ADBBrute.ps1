$Range = @((550,1700), (180,800), (600,800), (900,800), (180,1100), (600,1100), (900,1100), (200,1500), (600,1500), (900,1500))


foreach ($int in 0000..9999){
$str = $int.ToString()
    if ($str.length -eq 1){
        $str = "000" + $str 
    }
        if ($str.length -eq 2){
        $str = "00" + $str 
    }
        if ($str.length -eq 3){
        $str = "0" + $str 
    }
    if ($str.length -ge 4){

        $str = $str.Insert(1,'-')
        $str = $str.Insert(3,'-')
        $str = $str.Insert(5,'-')
    
        $str = $str -split '-'
        $Counter = 1
        for($i=0; $i -le 3; $i++){
            $Num = [int]::Parse($str[$i])
            #Start-Sleep -Milliseconds 200

            $Command = $Range["$Num"] 
            $Command = $Command.Toint32($Null) -join ' '
            
            
            Write-Host "$Num" -NoNewline
            if("$Counter"%4 -eq 0){
                Write-Host " Tested..."
		
            }

            adb.exe shell input tap "$Command"
            ++$Counter
	    [System.GC]::Collect()

        }
    }
}
