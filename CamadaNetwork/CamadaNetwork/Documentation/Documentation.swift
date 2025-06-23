//
//  Documentation.swift
//  CamadaNetwork
//
//  Created by Gabriel Mors Pulga on 23/06/25.
//


/*
         Camada única de serviço!

 1. Criando enum para tratar erros (NetworkError)

   •  Definir um enum para representar erros comuns em requisições de rede.
   •  Tratar erros como URL inválida, falha de conexão, resposta inválida e erro de decodificação.
   •  Centralizar as mensagens de erro para facilitar a depuração.
   •  Classe: NetworkError

 2. Definindo os Métodos HTTP (HTTPMethod)

   •  Criar uma enumeração que contém os métodos HTTP mais utilizados (GET, POST, PUT, DELETE).
   •  Garantir que o método HTTP seja tratado de forma segura e reutilizável.
   •  Classe: HTTPMethod

 3. Definindo uma Estrutura para Parâmetros (Parameters)

   •  Criar uma enum para aceitar parâmetros como dicionário (dictionary) ou como objeto encodable (encodable).
   •  Facilitar o envio de dados em diferentes formatos nas requisições.
   •  Classe: Parameters

 4. Criando uma estrutura para representar a Request (APIRequest)

   •  Definir uma estrutura para agrupar a URL, método HTTP, cabeçalhos e parâmetros de cada requisição.
   •  Essa estrutura representará o endpoint da API para cada requisição.
   •  Classe: APIRequest

 5. Criando o RequestBuilder para Configuração de Requisições (RequestBuilder)

   •  Separar a lógica de construção de uma requisição HTTP, como a configuração de URL, headers e corpo.
   •  Evitar a repetição de código na criação de requisições.
   •  Montar e retornar a request da requisição por completo
   •  Criar via protocolo o método para que futuramente consiga testar com Unit Test
   •  Classe: RequestBuilder

 6. Cliente HTTPClient Genérico e Realizar Tratamento de Respostas de Requisição (APIClient)

   •  Criar uma classe central que faça as requisições de rede.
   •  Gerenciar erros, decodificar dados e permitir que a mesma lógica seja utilizada para diferentes requisições.
   •  Essa classe será responsável por interagir com o servidor e lidar com as respostas.
   •  Validar o status code para identificar se a resposta foi bem-sucedida.
   •  Decodificar a resposta em JSON para os modelos Swift corretos.
   •  Garantir que o tratamento de erros de resposta e decodificação seja centralizado.
   •  Classe: APIClient

 7. Monitorando Requisições com um Logger (NetworkLogger)

   •  Criar uma classe para logar requisições e respostas HTTP.
   •  Logar informações como data e hora da requisição, URL, parâmetros e a resposta recebida.
   •  Usar logs para monitorar o funcionamento da camada de serviço e para depuração.
   •  Classe: NetworkLogger
 */

