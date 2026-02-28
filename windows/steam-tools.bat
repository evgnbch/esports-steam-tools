@echo off
title ESPORTS STEAM TOOLS - UNIVERSAL
call "%~dp0steam-update-core.bat" interactive
exit /b %errorlevel%
