# hospitalmoinhosdevento

Projeto para o hospital Moinhos de Vento.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

- Para desenvolvimento desse projeto, foi ultizado Flutter com a plataforma Intellij Idea (Caso desejado, podera utilizar o VisualStudioCode).

- Instalando o Flutter no Windows
A instalação no Windows normalmente é bem rápida, pois necessitamos apenas do Git instalado e do próprio SDK do Flutter (que já tem o SDK do Dart embutido).

Para instalar e configurar o Flutter no Windows, veja os passos a seguir:

1 - O Flutter depende do Git para funcionar. Então, é necessário que o Git esteja instalado na máquina antes de instalarmos o Flutter. Para isso, basta baixar o cliente do Git para Windows da sua página oficial. A instalação é no estilo Avançar> Avançar> Concluir. Quando o download for concluído, basta clicar no instalador do Git para que o processo de instalação seja iniciado.

2 - Baixe o arquivo zip da última versão do Flutter. Esse arquivo pode ser encontrado na página oficial do Flutter, dentro da seção “Get the Flutter SDK”. O nome do arquivo normalmente é flutter_windows_x.x.x-stable.zip, no qual as letras “x” são os números da versão mais atual disponível.

3 - Extraia o arquivo zip com o Flutter SDK para uma pasta onde não sejam necessários privilégios de administrador. A documentação do Flutter recomenda que o SDK seja extraído para C:\flutter.

4 - Para utilizar Flutter CLI (interface de linha de comandos) diretamente em qualquer linha de comando, os seguintes passos são necessários:

Vá em Painel de Controle > Contas de usuário > Alterar as variáveis do meu ambiente.

Na seção de variáveis de ambiente de usuário, procure a variável chamada “Path”.

Adicione à variável “Path” o caminho para a pasta C:/flutter/bin. Não se esqueça de separar a nova entrada das entradas pré-existentes com um ponto e vírgula (;).

Reinicie o Windows.

Abra uma instância do git bash ou cmd e digite o comando Flutter. O help do Flutter deve ser exibido.

5 - E por último, mas não menos importante, execute em uma linha de comando do Windows o comando flutter doctor, para que ele dê o diagnóstico completo e informe se a instalação foi realizada corretamente. Caso ainda haja pendências, ele dirá quais são e como resolvê-las.


- Instalação do Intellij Idea

Para instalação do Intellij Idea, é necessário baixar o instalador da página oficial, independentemente da plataforma que esteja utilizando. Você pode baixar a última versão do Intellij Idea em sua página oficial.

Após baixar a versão, o processo de instalação dependerá de cada plataforma.

O processo de instalação do Intellij no Windows é bem simples e segue o padrão Avançar > Avançar > Concluir. Ao final deste processo, ele será instalado normalmente e estará funcional.

- Configurando plugin do Flutter no Intellij Idea
  Agora que possuímos todo o ambiente necessário para criar aplicativos com Flutter configurado e funcional, precisamos instalar os plugins do Flutter e Dart no Intellij Idea, pois é através deste plugin que conseguiremos criar aplicativos Flutter. Para instalar e configurar estes plugins, siga os seguintes passos:

1 - Abra o Intellij Idea. 
2 - Na aba do lado esquerdo chamada "Plugins", selecione a aba superior "Marketplace". Pesquise primeiro "Dart" e instale. Depois repita o processo pesquisando por "Flutter" e instalando a extensão do Flutter.
3 - Feche o Intellij Idea para atualizar os plugins;


- Clonando o projeto

Na raiz do projeto Ex.: https://github.com/jessicapcruz/hospital-moinhosdevento
Clique no botão code e copie a url https.

No terminal execute o comando git clone https://github.com/jessicapcruz/hospital-moinhosdevento.git
(Na pasta desejada)

Abra o projeto no Intellij ou VisualStudio.

Caso Intellij
Abra a pasta do projeto e verifique se o projeto foi reconhecido como um projeto Dart/Flutter e se é possível pressionar o botão de play na parte superior da tela. Caso seja possível, o Flutter vai rodar o seu aplicativo no emulador Android.

- Executando o projeto
- Baixe as dependencias no projeto, indo até o arquivo pubspec.yaml e clicando em Pub Get. 
Selecione um emulador ou navegador e execute. 

- Configurando um emulador no Android Studio

Para criar um emulador no Android Studio, siga os seguintes passos:

1 – Ao iniciar o Android Studio, clique em “Configure” e selecione a opção AVD Mananger.

2 - Abra o ADV Manager e selecione o botão “+ create virtual device”. Na próxima tela que abrir, avançaremos selecionando o modelo de smartphone Pixel 2. Após a seleção do Pixel 2, pressione o botão avançar novamente.

3 - Selecione uma imagem android para o emulador. Caso você não tenha baixado nenhuma ainda, pode escolher alguma e pressionar o botão de “Download”. 
Após selecionar a imagem do Android R aperte em avançar e depois em finish.

4 - Caso o emulador não fique disponivel no Intellij, no Android Studio na pagina AVD, clique na configuração (icone seta para baixo) do seu emulador e selecione a opção wipe data.
