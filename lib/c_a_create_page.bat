@echo off

:: Verifica si se proporcionó un argumento
if "%1"=="" (
    echo Debes proporcionar un nombre de carpeta.
    pause
    exit /b
)

:: Crea la carpeta principal
md "%1"

:: Crea los archivos dentro de la carpeta
cd "%1"
type nul > "%1_controller.dart"
type nul > "%1_presenter.dart"
type nul > "%1_view.dart"
cd ..

echo ¡Carpetas y archivos creados correctamente!