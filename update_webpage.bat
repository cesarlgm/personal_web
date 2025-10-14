
@echo off
setlocal

set msg=%1
if %msg%=="" set msg=Auto-commit from VS Code



REM Stage all changes
git add -A



REM Commit and push
git commit -m %msg%

git pull origin
git push origin

endlocal