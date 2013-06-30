
echo Deleting binary folder
rmdir /s /q ..\bin

echo Restore NuGet packages
"%WINDIR%\Microsoft.NET\Framework\v4.0.30319\MSBUILD.exe" RestorePackages.targets

echo Updating language resources from transifex
call TRANSIFEX_Update_Translation_Files.bat

echo Writing version information to VersionInfo.cs (will be used for AssemblyVersion information)...
"%WINDIR%\Microsoft.NET\Framework\v4.0.30319\MSBUILD.exe" UpdateVersion.targets

echo Rebuilding Server
call MSBUILD_Rebuild_Release_Server.bat

echo Rebuilding Client
call MSBUILD_Rebuild_Release_Client.bat

echo Rebuilding ServiceMonitor
call MSBUILD_Rebuild_Release_ServiceMonitor.bat

echo Rebuilding Setup
call MSBUILD_Rebuild_Release_Setup.bat
