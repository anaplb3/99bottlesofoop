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