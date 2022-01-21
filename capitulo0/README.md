# Capítulo 0

Antes do livro começar as autoras pedem para você tentar resolver o problema das [99 garrafas](https://esolangs.org/wiki/99_bottles_of_beer). Nessa pasta está minha tentativa de resolver esse problema. No arquivo *lib/bottles.rb* fica o código feito, e no *test/bottles_test.rb* ficam os testes para ver se está tudo ok.

Para executar os arquivos é só usar o comando `ruby nomedoarquivo.rb`.

# Capitulo 3 - Desenterrando Conceitos

Nesse capítulo é apresentado um novo requisito, onde é preciso mudar onde tem '6 bottles' para 'six-pack'. O código atual (shameless green) não segue o princípio de Open/Closed, já que seria necessário mudar a implementação do código atual para poder adicionar o código do novo requisito.

Para seguir o princípio citado acima, é necessário refatorar o código. Uma das dicas desse capítulo é começar a refatoração a partir dos code smells mais óbvios e fáceis de consertar. No código atual, o code smell é o da duplicação. Para eliminar o mesmo é usado o conceito de Flocking Rules, onde é seguido os seguintes passos:
- Identificar as coisas mais parecidas
- Achar a menor diferença entre elas
- Fazer a mudança mais simples para remover essa diferença
  
Essas alterações podem ser seguidas através desses 4 passos (e executando os testes ao final de cada um deles):
- escrever o código (a fim de encontrar algum erro de sintaxe)
- executar o código (para verificar que o código funciona sem estourar nenhuma exceção)
- usar o resultado do código (para assegurar que está retornando o valor esperado)
- excluir código não usado

Outra dica muito legal é para nomear os conceitos. No caso do código, uma diferença é que no caso 2 é usado 'bottle', e no else é usado 'bottles'. A dica para capturar esse conceito e nomear o método é que o nome dado deve ser um nível de abstração mais alto que a coisa em si (mas apenas um, para não ficar ambíguo). Para ajudar é útil listar todos os valores que aquela coisa pode assumir e achar um nome em comum para todas elas.

No exemplo do livro foram listados, além de bottle, six-pack (que é o novo requisito), carafe (para vinho), small boxes (para suco) e cans (para drinks). O que tudo isso tem em comum? São containers. BAM, achou o nome para o método.

# Capítulo 5 - Separando Responsabilidades

Após remover o code smell da duplicação o código ainda não é aberto para o novo requisito, sendo necessário ir para o próximo code smell. Analisando o código atual é póssível perceber a grande dependência dos métodos (container, quantity, etc) apenas com o parâmetro number, e que dentro da classe Bottle atual, number tem dois propósitos diferentes. Para o método verse, number é relativo ao número do verso que está sendo cantado, já para os métodos citados acima, number corresponde ao número de bottles.

O fato de todos os métodos dependerem da primitiva number indica o code smell de primitive obssession, que é quando é usado uma classe primitiva (como string, hash ou nesse caso, integer) para representar um conceito do seu domínio, que no caso é o número de bottles. A cura para esse code smell é a extração de classe.

Para nomear essa nova classe, há uma inversão a dica dada para nomear métodos. Enquanto métodos devem ser nomeados pelo o que eles significam, classes devem ser nomeadas pelo o que elas são. Aqui, essa nova classe busca representar o conceito de número de bottles, logo o nome será BottleNumber. 

Para começar a extração é necessário copiar todos os métodos obsessivos que estão funcionando para a nova classe, e depois seguir os 4 passos descritos no capítulo 3. Só é seguro editar os métodos quando eles estiverem completamente integrados e funcionais na classe Bottle. Depois disso, é necessário excluir os parâmetros dos métodos e criar uma variável number global para a classe BottleNumber, já que o ponto de resolver esse code smell é criar um objeto que saiba o valor primitivo e seu respectivo comportamento.

Para continuar o padrão de fazer mudanças no código uma linha por vez, é necessário usar o padrão descrito anteriormente de adicionar um valor padrão para o parâmetro do método que vai ser alterado. Nesse capítulo, esses foram os passos (executando os testes ao final de cada um deles):
- Renomear o nome do parâmetro para algo diferente do nome global
- Atribuir o valor nil para esse parâmetro
- Remover o argumento que estava sendo enviado para o método
- Remover o parâmetro no método em si

Ao terminar essas alterações, a extração da classe foi finalizada. Agora, cada classe tem responsabilidades mais definidas, porém, a classe BottleNumber é criada várias e várias vezes dentro da classe Number. 