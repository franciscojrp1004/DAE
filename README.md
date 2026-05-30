# 🎓 Projeto DAE - Engenharia Informática

Este repositório contém um projeto desenvolvido em equipa (4 elementos) no âmbito da licenciatura em Engenharia Informática. O foco principal foi desenhar e implementar uma arquitetura full-stack robusta e escalável. 
Aplicámos uma forte separação de responsabilidades (Separation of Concerns) entre o Backend e o Frontend, e recorremos ao **Docker** para contentorizar toda a infraestrutura (bases de dados, serviços móveis, etc.). Isto garante que o ambiente de desenvolvimento seja perfeitamente isolado e replicável em qualquer máquina. Destaca-se ainda a integração de um modelo de Inteligência Artificial (LLaMA 3) a correr localmente no ecossistema.
---
## ⚙️ Como executar o Backend

Para inicializar toda a infraestrutura e a base de dados, abre o terminal na pasta do backend e executa:

```bash
docker compose down
docker compose up --build -d 
```

🧠 Arrancar com a IA (LLaMA)

⚠️ **Atenção:** Se é a primeira vez que executas o ambiente nesta máquina, é necessário transferir e inicializar o modelo de IA. Basta correres este comando:

```bash
docker exec -it projetodae-ollama-1 ollama run llama3
```

---

## 💻 Como executar o Frontend

Como o projeto utiliza o Vite para a compilação de assets em tempo real, precisarás de abrir um novo terminal (mantendo o do backend em execução) na pasta raiz do frontend e executar:

```bash
npm install
npm run dev
```

---

## 📧 Testar os Emails (Modo Dev)

Para garantir a segurança e evitar o envio acidental de emails em ambiente de desenvolvimento, o sistema interceta todas as comunicações. Podes visualizar os emails gerados pela aplicação acedendo à interface do MailHog no teu browser:
🔗 http://localhost:8025

---

## 🔐 Credenciais de Acesso (Dados de Teste)

Sempre que a base de dados é inicializada, o sistema cria automaticamente três utilizadores com diferentes níveis de permissão (RBAC) para facilitar os testes. Podes utilizar as seguintes credenciais:

Admin (Acesso Total)

```bash
Username: admin
Password: admin123
```

Gestor

```bash
Username: manager
Password: manager123
```

Utilizador Normal (Contributor)
```bash
Username: contributor
Password: contrib123
```
