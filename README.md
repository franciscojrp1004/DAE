# 🎓 Projeto DAE - Engenharia Informática
Este repositório tem o projeto que desenvolvemos (uma equipa de 4 pessoas) para uma das cadeiras da licenciatura de Engenharia Informática. 
Basicamente, o objetivo foi montar uma solução full-stack a sério. Separamos bem as águas entre o Backend e o Frontend e usamos o **Docker** para garantir que a infraestrutura (bases de dados, serviços, etc.) corre de forma igual na máquina de qualquer pessoa sem dar dores de cabeça. Ah, e ainda integramos Inteligência Artificial no projeto a correr localmente com o **LLaMA 3**.
---
## ⚙️ Como executar o Backend

Para ligar a infraestrutura toda e a base de dados, só precisas de abrir o terminal na pasta do `backend` e correr:

```bash
docker compose down
docker compose up --build -d 
```

🧠 Arrancar com a IA (LLaMA)

⚠️ Atenção: Se é a primeira vez que estás a correr isto na tua máquina, tens de transferir e inicializar o modelo de IA. Basta correres este comando:

```bash
docker exec -it projetodae-ollama-1 ollama run llama3
```

---

## 💻 Como executar o Frontend

Como o projeto utiliza o Vite para compilação de assets em tempo real, precisarás de abrir um novo terminal (mantendo o do backend aberto) também na pasta raiz do projeto, e executar:

```bash
npm install
npm run dev
```

---

## 📧 Testar os Emails (Modo Dev)

Para não mandarmos spam sem querer para emails verdadeiros enquanto estamos a programar, o sistema interceta tudo. Podes ver os emails que a app gera abrindo o MailHog no teu browser em:
🔗 http://localhost:8025

---

## 🔐 Credenciais de Acesso (Dados de Teste)

Sempre que a base de dados arranca limpa, o sistema cria logo 3 utilizadores com permissões diferentes para não termos de os estar sempre a criar à mão. Podes usar estas credenciais para entrar:

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
