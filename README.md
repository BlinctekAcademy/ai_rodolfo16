# Desafio 4 - Inteligência Artificial

# Desafio inteligência artificial

📌 Esse desafio tem o intuito de avaliar suas habilidades de pensar em alternativas para resolver problemas e te dar mais XP para resolução de desafios reais.

# 📜 Descrição

A brincadeira com inteligência artificial foi longe demais, e uma máquina (que se chama Rodolfo16) tomou consciência, e está planejando o extermínio da raça humana (bem no estilo Exterminador do Futuro).

Como ainda não foi inventada a viagem no tempo (e provavelmente não será, pois senão alguém do futuro já teria voltado para nos avisar sobre o perigo da Rodolfo16), precisamos encontrar uma forma de parar a Rodolfo16 antes que seja tarde demais.

Felizmente, o responsável por implementar a IA da Rodolfo16 (o super cientista Lucas Mendes), deixou um código de backup que faz com o que toda a IA seja reiniciada. Porém, infelizmente, o Lucas está incomunicável, e não temos ideia da senha que tem que ser inserida para que o código de reset seja executado.

Hoje pela manhã, pouco antes da Rodolfo16 desativar toda a internet do mundo, recebemos uma transmissão do Lucas explicando o funcionamento do código de reset, e falando que iria encaminhar o programa decodificador (mas ele nunca chegou).

O desafio consiste em decodificar as mensagens geradas pelo código de backup, para então reiniciar a Rodolfo16. 

# 🗝 O que queremos ver

- Esperamos que você rode sua função com as mensagens encriptadas, e que seu algoritmo seja capaz de decifrar o que está escrito.
- Esperamos também que você consiga aplicar a regra na mensagem depois de decifrá-la, e que encontre a senha necessária.
- Por fim, esperamos que você consiga encriptar novamente a senha, para que ela seja aceita pela Rodolfo16.
- Esperamos, acima de tudo, que seja capaz de salvar o mundo, XD

# 📚 Detalhes

📌 O desafio deverá ser resolvido em **Dar**t. Não será permitido utilizar bibliotecas externas, mas poderá ser utilizado qualquer função já disponível no **Dart**.

- Você tem até o dia **13/05/2022 às 13:00** para disponibilizar sua solução no **GitHub.**
- Cada grupo deverá criar uma **Branch** para seu projeto, e a apresentação será realizada com o código do repositório.

[BlinctekAcademy/ai_rodolfo16](https://github.com/BlinctekAcademy/ai_rodolfo16)

# Código de Backup

O código de backup criado pelo Lucas consiste basicamente em uma mensagem gerada de tempo em tempo, que é mostrada como uma array de bytes (código binário), na qual cada byte (conjunto de 8 bits) representa um caracter da tabela ASCII (que pode ser vista abaixo):

[Código ASCII - Tabela ASCII Completa](https://marquesfernandes.com/desenvolvimento/codigo-ascii-tabela-ascii-completa/)

O trabalho inicial é decodificar essa mensagem, e “printar” na tela como uma String, para que possa ser lida por nós.

Caso o print da mensagem esteja correto, uma nova mensagem decodificada é mostrada, e é necessário decodificar essa mensagem, e "printar" a String com a operação necessária para gerar a senha.

Após "printar" a operação, o algoritmo deve realizar a operação proposta, e "printar" o resultado da mesma.

O algoritmo deve seguir o seguinte padrão:

*void decoder(String bytes)*

onde bytes é uma String que representa um array de bytes (ex: 00000001)

# 🥉 Cenário 1

O cenário 1 é **obrigatório**, pois dependemos dele para parar a Rodolfo16.

Neste cenário, seu algoritmo deve decodificar a String passada, e fazer um print da mensagem lida.

**Ex:**

bytes = '010010000110010101101100011011000110111100100001’

O algoritmo deve transformar cada byte da String acima em um caracter ASCII, e formar a String decodificada que, nesse caso, é **Hello!**.

# 🥈 Cenário 2

O cenário 2 é **obrigatório**, e deve achar o resultado da operação lida (nessa cenário, sempre que a palavra codificada começar com um número, o algoritmo deve entender que é uma operação) e fazer um print tanto da equação proposta, quanto do seu resultado.

**Ex:**

bytes = ‘00110001001100000010101000110010’

O algoritmo deve transformar cada byte da String acima em um caracter ASCII, e formar a String decodificada que, nesse caso, é **10*2**.

Além disso, como a mensagem começa com um número (1), o algoritmo deve fazer a operação mostrada, e fazer um print do resultado, que esse caso seria **20**.

# 🥇 Cenário 3

O cenário 3 **não é** **obrigatório**, e é um incremento ****do cenário 2.

Nesse cenário, seu algoritmo deve continuar identificado que a mensagem é uma operação, e também deve fazer um print da mensagem decodificada e do resultado, contudo, nesse cenário, as operações são um pouco mais complexas.

**Ex:**

bytes = ‘00110001001101010010101100110001001100000010111100110010’

Nesse cenário, o algoritmo deve printar a mensagem, que é **15+10/2**, e o resultado, que é **20**.

A dificuldade maior desse cenário é que agora teremos mais de uma operação (nesse caso uma adição e uma divisão), e temos que tomar cuidado com a ordem na execução (nesse caso, primeira a divisão e depois a adição).

# 🏆 Cenário 4

O cenário 3 **não é** **obrigatório**, e é um incremento ****do cenário 3.

Nesse cenário, seu algoritmo deve continuar decodificando a mensagem e mostrando o resultado da operação, e deve também printar o resultado da operação em um array de bytes.

**Ex:**

bytes = ‘00110001001101010010101100110001001100000010111100110010’

Nesse cenário, o algoritmo deve printar a mensagem, que é **15+10/2**, e o resultado, que é **20**.

Além disso, o algoritmo tem que printar o resultado 20 no array de bytes, que seria **0011001000110000**.