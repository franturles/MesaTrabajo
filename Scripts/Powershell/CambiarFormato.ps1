 $Ubi = Get-Location
 $Lista =  Get-ChildItem -Path $Ubi -name
 $Renombre = Read-Host -Prompt "Escriba el nombre de la extension que tendra"
 foreach ($Fichero in $Lista){
 $FicheroRe = [io.path]::GetFileNameWithoutExtension("$Fichero") + ".$Renombre"
 #Rename-Item $Fichero -NewName $FicheroRe
 echo $FicheroRe
 }