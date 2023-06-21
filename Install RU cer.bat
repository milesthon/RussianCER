@ECHO OFF
CHCP 65001>NUL
MODE 80,10
net sess>NUL 2>&1||(powershell try{saps '%0'-Verb RunAs}catch{}&exit)

curl -# -l https://gu-st.ru/content/Other/doc/russian_trusted_root_ca.cer -o "%temp%\russian_trusted_root_ca.cer"
cls
curl -# -l https://gu-st.ru/content/Other/doc/russian_trusted_sub_ca.cer  -o "%temp%\russian_trusted_sub_ca.cer"
cls

certutil -addstore -f root "%temp%\russian_trusted_root_ca.cer" 2>nul >nul
IF ERRORLEVEL 0 ( echo russian_trusted_root_ca.cer OK ) else ( echo russian_trusted_root_ca.cer FAIL )
certutil -addstore -f root "%temp%\russian_trusted_sub_ca.cer" 2>nul >nul
IF ERRORLEVEL 0 ( echo russian_trusted_sub_ca.cer OK ) else ( echo russian_trusted_sub_ca.cer FAIL )

del "%temp%\russian_trusted_root_ca.cer"
del "%temp%\russian_trusted_sub_ca.cer"

chcp 866>NUL
pause