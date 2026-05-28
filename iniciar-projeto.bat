@echo off
chcp 65001 >nul
echo =========================================
echo Iniciando o Projeto DAE
echo =========================================

echo.
echo [1/4] A parar contentores antigos...
cd backend
call docker compose down

echo.
echo [2/4] A iniciar os contentores base...
call docker compose up -d

echo.
echo [3/4] A compilar e a fazer deploy do Backend (isto pode demorar um pouco)...
call .\mvnw clean package
call docker compose cp target/academics.war webserver:/opt/jboss/wildfly/standalone/deployments

echo.
echo [4/4] A iniciar o Frontend numa nova janela...
cd ..\frontend
start cmd /k "npm install && npm run dev"

echo.
echo =========================================
echo PROJETO INICIADO COM SUCESSO!
echo =========================================
echo O Backend esta a correr e o Frontend abriu numa nova janela.
echo.
echo Links uteis:
echo Servidor de Emails: http://localhost:8025
echo.
echo IMPORTANTE: Se for a PRIMEIRA VEZ que corres o projeto, 
echo precisas de inicializar o modelo de IA copiando e colando 
echo este comando num terminal:
echo docker exec -it projetodae-ollama-1 ollama run llama3
echo =========================================
pause
