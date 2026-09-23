@echo off
rem Abre o PokeGrid. Na primeira vez instala o necessario nesta janela; depois ela so pisca e fecha.
rem Dica: botao direito neste arquivo > Enviar para > Area de trabalho (criar atalho).
cd /d "%~dp0"
if not exist "node_modules\electron\dist\electron.exe" (
  where npm >nul 2>nul || (
    echo.
    echo O Node.js nao esta instalado. Baixe a versao LTS em https://nodejs.org
    echo Depois de instalar, feche e abra este arquivo de novo.
    echo.
    pause
    exit /b
  )
  echo Primeira vez: instalando o necessario. Isso pode levar alguns minutos...
  call npm install
)
if not exist "node_modules\electron\dist\electron.exe" (
  echo.
  echo A instalacao nao terminou. Confira a internet e abra este arquivo de novo.
  pause
  exit /b
)
rem o electron.exe e um app de janela: abre sem terminal nenhum, e esta janela fecha em seguida
start "" "node_modules\electron\dist\electron.exe" .
