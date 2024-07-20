@echo off
setlocal

echo Deploying PHP application...

REM Ensure the destination directory exists
if not exist "C:\inetpub\wwwroot\my-php-app" mkdir "C:\inetpub\wwwroot\my-php-app"

REM Copy the PHP application to the web server directory
xcopy /s /e /y "C:\Users\reina\Documents\SIT\Year2\Tri3\ICT2216 Secure Software Development\Labs\jenkins-php-selenium-test\src" "C:\inetpub\wwwroot\my-php-app"

echo Deployment complete.
echo 'Visit http://localhost/my-php-app to see your PHP application in action.'

endlocal


