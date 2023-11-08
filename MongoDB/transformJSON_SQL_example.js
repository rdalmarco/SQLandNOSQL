#Inicializa variável para receber os valores selecionados
let insertValues = [];

#Seleciona os documentos da collection (find), itera sobre lees (forEach) e passa os mesmos como param de uma função genérica JS (function(doc))
db.getCollection('SAUDEWEB_TBLISESP').find().forEach(function(doc) {
  #Insere os valores das colunas desejadas do documento na lista insertValues  
  insertValues.push(`(${doc.LESEQUEN}, '${doc.CHAVEORIGEM}')`);
});

#Ao fim do loop for insere todos os valores da lista em uma variável passando junto o comando SQL a ser montado
#${insertValues.join(', ')}; = Busca os valores do insertValues e faz um join para cada registro seperando por ','
let insertCommand = `INSERT INTO sua_tabela (LESEQUEN, CHAVEORIGEM) VALUES ${insertValues.join(', ')};`;

#Printa no console o comando final
print(insertCommand);
