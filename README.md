# 🎓 Projeto DAE - Engenharia Informática

Este repositório contém um projeto desenvolvido em equipa (4 elementos) no âmbito de uma Unidade Curricular da licenciatura em Engenharia Informática. 

O foco deste trabalho foi a construção de uma solução *full-stack* robusta, onde aplicámos os nossos conhecimentos na separação de responsabilidades entre o Backend e o Frontend. Para garantir que o ambiente de desenvolvimento fosse consistente e fácil de replicar, toda a infraestrutura da aplicação (incluindo base de dados e serviços adicionais) foi desenhada com recurso a contentores Docker. O projeto conta ainda com integração de Inteligência Artificial através do LLaMA 3.

---

## ⚙️ Como executar o Backend

Para arrancar com a infraestrutura, compilar o projeto e fazer o *deploy* da aplicação, abre o terminal na pasta do teu backend e corre os seguintes comandos:

```bash
docker compose down
docker compose up -d   
./mvnw clean package
docker compose cp target/academics.war webserver:/opt/jboss/wildfly/standalone/deployments
```

> ⚠️ **Nota Importante (Apenas na 1ª execução):**
> Se é a primeira vez que estás a correr o ambiente na tua máquina, é necessário inicializar o modelo local de Inteligência Artificial. Para isso, corre o comando abaixo:
> ```bash
> docker exec -it projetodae-ollama-1 ollama run llama3
> 
```

---

## 💻 Como executar o Frontend

Para iniciar a interface de utilizador, abre um novo terminal na pasta do frontend, instala as dependências necessárias e arranca o servidor de desenvolvimento:

```bash
npm install
npm run dev
```

---

## 📧 Testar Emails

O sistema está configurado para intercetar o envio de emails durante o desenvolvimento (para evitar envios reais acidentais). 

Para acederes à caixa de entrada virtual e verificares todos os emails gerados pela aplicação, basta abrires o teu navegador e acederes ao seguinte endereço:

🔗 **[http://localhost:8025](http://localhost:8025)**
