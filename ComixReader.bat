@echo off
setlocal enabledelayedexpansion
set /a k+=1
echo ^<body^>>Comix.html
set /a k+=1
echo ^<div style="text-align: center; width: 100%%% %; height: 100%%% %; display: inline-block;"^>>>Comix.html
for %%a in (*.webp *.png *.jpg *.jpeg *.svg) do (
    set /a i+=1
    set /a j=i+1
    set /a k+=1
    echo ^<a id="!i!"^>>>Comix.html
    set /a k+=1
    echo ^<a href="#!j!"^>>>Comix.html
    set /a k+=1
    echo ^<img src="%%a" style="max-height: 100%%% %; max-width: 100%%% %;"^>>>Comix.html
    set /a k+=1
    echo ^</a^>>>Comix.html
    set /a k+=1
    echo ^</a^>>>Comix.html
)
set /a k=k-3
for /f "tokens=1 delims=    " %%a in (Comix.html) do (
    set /a l+=1
    if !l!==!k! (
        echo ^<a href="#1"^>>>temp.txt
    ) else echo %%a>>temp.txt
)
del Comix.html
ren temp.txt Comix.html
echo ^</div^>>>Comix.html
echo ^</body^>>>Comix.html
start Comix.html
exit