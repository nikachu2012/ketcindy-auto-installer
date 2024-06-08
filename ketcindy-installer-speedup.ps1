mkdir $env:TEMP/AUTOKETCINDYINSTALL
cd $env:TEMP/AUTOKETCINDYINSTALL

$path_Cinderella = "https://beta.cinderella.de/Cinderella-3.0b.2080-64bit.exe"
$path_kettex = "https://github.com/ketpic/kettex/releases/download/v0.20230320/KeTTeX-windows-20230320.zip"
$path_R = "https://cran.r-project.org/bin/windows/base/old/4.3.1/R-4.3.1-win.exe"
$path_sumatra = "https://www.sumatrapdfreader.org/dl/rel/3.4.6/SumatraPDF-3.4.6-64-install.exe"
$path_maxima = "https://jaist.dl.sourceforge.net/project/maxima/Maxima-Windows/5.47.0-Windows/maxima-5.47.0-win64.exe"
$path_ketcindy = "https://github.com/ketpic/ketcindy/archive/refs/tags/4.4.44.zip"

echo "Downloading Cinderella..."
Start-BitsTransfer -Source  $path_Cinderella -Destination "$env:TEMP/AUTOKETCINDYINSTALL/Cinderella-3.0b.2080-64bit.exe"
echo "Installing Cinderella..."
.\Cinderella-3.0b.2080-64bit.exe -q

echo "Downloading KeTTeX..."
Start-BitsTransfer -Source  $path_kettex -Destination "$env:TEMP/AUTOKETCINDYINSTALL/kettex.zip"
echo "Unzipping KeTTeX..."
Expand-Archive .\kettex.zip c:\kettex-installer
echo "Installing KeTTeX..."
Start-Process -FilePath "C:\kettex-installer\kettexinst.cmd"

echo "Downloading R..."
Start-BitsTransfer -Source  $path_R -Destination "$env:TEMP/AUTOKETCINDYINSTALL/R-4.3.1-win.exe"
echo "Installing R..."
.\R-4.3.1-win.exe /silent

echo "Downloading SumatraPDF..."
Start-BitsTransfer -Source  $path_sumatra -Destination "$env:TEMP/AUTOKETCINDYINSTALL/SumatraPDF-3.4.6-64-install.exe"
echo "Installing SumatraPDF..."
.\SumatraPDF-3.4.6-64-install.exe -s -d "C:\Program Files\SumatraPDF"

echo "Downloading Maxima..."
Start-BitsTransfer -Source  $path_maxima -Destination "$env:TEMP/AUTOKETCINDYINSTALL/maxima-5.47.0-win64.exe"
echo "Installing Maxima..."
.\maxima-5.47.0-win64.exe /S

echo "Downloading KeTCindy..."
Invoke-WebRequest -UseBasicParsing -Uri $path_ketcindy -OutFile "$env:TEMP/AUTOKETCINDYINSTALL/ketcindydl.zip"

echo "Unzipping KeTCindy..."
Expand-Archive ./ketcindydl.zip c:/ketcindydl

echo "Installing KeTCindy..."
ren C:\ketcindydl\ketcindy-4.4.44 ketcindy4.4.44

echo "Opening ketcindysettings.cdy..."
start C:\ketcindydl\ketcindy4.4.44\doc\ketcindysettings.cdy

