@echo off
setlocal

echo Stopping PHP application...

REM Remove the PHP application directory
rmdir /s /q "C:\inetpub\wwwroot\my-php-app"

echo PHP application stopped and cleaned up.

endlocal

