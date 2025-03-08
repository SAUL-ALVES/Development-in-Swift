# Development in Swift
 Repositório para as práticas que exerço no curso da linguagem Swift (Apple), para dispositivos iOS.

 #Sobre o projeto de temporizador


 ## **Temporizador de Memes com SwiftUI**

**Equipe:**

- Saul
- Lupércio
- Diego
- Luiz Henrique
- Kauyves

---

### O **projeto** contém os seguintes arquivos principais de código:

1. **TimerApp.swift**: Arquivo principal que configura o aplicativo.
2. **TimerModel.swift**: Modelo que gerencia a lógica do temporizador.
3. **TimerView.swift**: Interface do usuário, que exibe o temporizador e interações com o usuário.
4. **SoundManager.swift**: Gerencia a reprodução dos áudios de memes.
5. **Audios**: Pasta contendo arquivos de áudio que são usados como sons de alarme.

---

### **Temporizador de Memes com SwiftUI**

- **Descrição**: Um aplicativo de temporizador divertido que permite definir um intervalo de tempo, ao término do qual um som de meme aleatório é reproduzido. O usuário pode definir horas, minutos e segundos para o temporizador e escolher entre diferentes áudios disponíveis.

---

### **Funcionalidades**:

1. **Definição de Tempo**:
    - O usuário pode escolher horas, minutos e segundos para definir o temporizador. Essa funcionalidade é gerenciada pelos `Pickers` no **TimerView**.
2. **Iniciar, Parar e Redefinir o Temporizador**:
    - O temporizador pode ser iniciado, parado e redefinido por meio dos botões disponíveis na interface.
    - A contagem regressiva é atualizada a cada segundo e exibida em um formato HH:MM:SS.
3. **Animação Visual do Temporizador**:
    - Um círculo com animação de contagem regressiva é desenhado na tela, mudando de cor conforme o tempo restante:
        - **Azul**: tempo restante é mais da metade.
        - **Laranja**: tempo restante é menos da metade.
        - **Vermelho**: menos de 10 segundos.
4. **Reprodução de Som Aleatório ao Término do Tempo**:
    - Quando o tempo termina, o aplicativo reproduz um som aleatório escolhido da pasta de áudios, utilizando a classe `SoundManager`.

---

### **Estrutura do Código**:

1. **TimerApp.swift**:
    - Configura o ponto de entrada do aplicativo, inicializando a tela principal com **TimerView**.
2. **TimerModel.swift**:
    - Gerencia a lógica do temporizador.
    - Contém:
        - Propriedades de tempo total e restante.
        - Métodos para definir, iniciar e parar o temporizador.
        - Função para formatar o tempo restante no formato `HH:MM:SS`.
        - Integração com o **SoundManager** para tocar um som aleatório ao final do temporizador.
3. **TimerView.swift**:
    - Interface principal do usuário.
    - Contém:
        - Seleção de horas, minutos e segundos.
        - Botões para "Definir Tempo", "Iniciar" e "Parar".
        - Exibição de uma animação de círculo de contagem regressiva.
        - Animação nos botões para uma experiência mais responsiva.
4. **SoundManager.swift**:
    - Responsável pela reprodução dos áudios.
    - Funções:
        - **loadSoundNames**: carrega os arquivos de áudio da pasta `Audios`.
        - **playSound**: toca um áudio específico.
        - **getRandomSoundName**: seleciona um áudio aleatório para ser reproduzido.
        - **playDefaultSound**: reproduz um som padrão caso o áudio especificado não seja encontrado.

---

### **Tecnologias**:

- **Desenvolvimento**: SwiftUI para uma interface moderna e responsiva.
- **Reprodução de Áudio**: Utilização da biblioteca AVFoundation para tocar sons de memes ao término do temporizador.
