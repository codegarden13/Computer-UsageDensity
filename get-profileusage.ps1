$computername = read-host "Enter Computer name here" 

function get-profiles ($computername) {
    $profilepath = "\\" + $computername + "\C$\Users"
    $erg = @()
    $profiles = Get-ChildItem $profilepath | ? {
        Test-path ($profilepath + "\" + $_ + "\NTUSER.DAT")
        
        
    } | Select-Object -ExpandProperty Name
    
    
    # get the last writetime of ntuser.dat makes no sense, cumulative updates will change that in all profiles
    foreach ($profile in $profiles) {
    
        $largeprofile = Get-ChildItem ($profilepath + "\" + $profile)  -Recurse -Force -ErrorAction SilentlyContinue | Measure-Object -Sum length | Select -ExpandProperty Sum
        
        $largeprofile = [math]::Round(($largeprofile / 1MB), 2) 
        if ($largeprofile -lt 20) { Continue }
        $object = New-Object -TypeName PSObject

        $lastchange = Get-Item ($profilepath + "\" + $profile) | Foreach { ($_.LastWriteTime|Get-Date -f "yyyy-MM-dd") }
        $creation = Get-Item ($profilepath + "\" + $profile) | Foreach { $_.creationtime|Get-Date -f "yyyy-MM-dd" }

        $object | Add-Member -MemberType NoteProperty -Name Name -Value $profile
        $object | Add-Member -MemberType NoteProperty -Name "Size(MB)" -Value $largeprofile
        $object | Add-Member -MemberType NoteProperty -Name "Used" -Value $lastchange
        $object | Add-Member -MemberType NoteProperty -Name "created" -Value $creation
         
        $erg += $object
    }

    $erg=$erg| where-object {($_.Used)-like "2020*" -and $_.name -ne "wsinstall.fromuc"}
    return $erg
}
    
Function Get-DateRange
{   [CmdletBinding()]
Param (
        [datetime]$Start = (Get-Date),
        [datetime]$End = (Get-Date)
    )

    $erg=0
ForEach ($Num in (0..((New-TimeSpan -Start $Start -End $End).Days)))
    {   $Start.AddDays($Num)
    $erg+=1
    }

    $erg
}

$Profiles=get-profiles $computername

$Profiles|ft -auto
$users=$Profiles.count
$firstdate=($profiles|sort Used|select -first 1).Used
$Lastdate=($profiles|sort used|select -last 1).Used

$dr=(Get-DateRange $Lastdate $firstdate).count  

$usage = $dr/$users
write-host "usage Index is" $usage. $users "users" shared $computername over $dr days from $firstdate to $lastdate