//
//  ViewController.swift
//  CamadaNetwork
//
//  Created by Gabriel Mors on 18/06/25.
//

import UIKit

// MARK: - O que é uma Requisição?

// Imagina que o seu app precisa buscar dados da internet, como os preços de produtos ou uma lista de filmes. Para fazer isso, o app precisa se comunicar com um servidor, que é como um “local” onde essas informações estão armazenadas. A forma de conseguir essas informações é através de uma requisição.

// Uma requisição é basicamente uma mensagem que seu app envia para um servidor. O servidor, por sua vez, processa essa mensagem e responde com os dados que seu app pediu. É como fazer um pedido de comida online: você faz o pedido, o restaurante (servidor) prepara a comida (dados) e te entrega (resposta).

// TODA REQUISIÇÃO É: ASSÍNCRONA!!!!

// MARK: - O que é uma Camada de Serviço?

// Quando você faz uma requisição diretamente do código de uma view ou controller, o código pode ficar bagunçado e difícil de manter. Para resolver isso, a gente separa a lógica de requisição em uma parte isolada, que chamamos de camada de serviço.

// A camada de serviço tem a responsabilidade de:

//  •  Fazer as requisições ao servidor.
//  •  Processar os dados recebidos.
//  •  Devolver os dados de forma organizada para a camada de UI (a parte visual do app).

//  Imagina a camada de serviço como uma espécie de intermediário: ela cuida da comunicação com o servidor, sem que a tela do app precise se preocupar com isso. Isso deixa o código mais organizado, fácil de entender e de manter.

// MARK: - Por que usar uma camada de Serviço?

//  1.  Organização: Você separa a lógica de rede do resto do código.
//  2.  Reuso: Pode usar a mesma camada de serviço em diferentes partes do app.
//  3.  Manutenção: Facilita a manutenção, pois qualquer alteração nas requisições afeta só a camada de serviço.

// MARK: - Já entendemos oque é uma request, mas o que é uma URL?

// A URL (Uniform Resource Locator) é o endereço que usamos para acessar algo na web. É como o endereço de uma casa, mas na internet. Quando fazemos uma requisição, o app precisa saber onde enviar o pedido, e a URL é esse “onde”.

// Uma URL é composta de várias partes:

// Exemplo: https://app.santander.com/produtos?categoria=eletronicos

//  https: É o protocolo que define como a requisição será feita (pode ser HTTP ou HTTPS, que é a versão segura).
//  •  api.exemplo.com: É o domínio, que indica para qual servidor estamos enviando a requisição.
//  •  /produtos: É o caminho (ou endpoint) dentro do servidor. Esse caminho indica qual recurso queremos acessar (neste caso, produtos).
//  •  ?categoria=eletronicos: São os parâmetros que enviamos junto com a requisição (no caso, estamos filtrando produtos pela categoria “eletrônicos”).

//  Pense que você está no app do Magazine Luiza e você acessa a aba produtos. Nesse aba você vai verificar todos os produtos presentes, contudo, você começa a fazer filtros para mostrar apenas algo que você deseja, como nesse exemplo da url, apenas produtos que são "eletronicos"

// https:app.magazineLuiza.com/produtos -> Lista completa de produtos
// https://app.santander.com/produtos?categoria=eletronicos -> Lista completa de produtos ELETRONICOS

// MARK: - O que é a BaseURL?

// Em muitos aplicativos, a maioria das requisições vai para o mesmo servidor, mudando apenas o endpoint. Por exemplo, se o servidor da sua aplicação é https://api.exemplo.com, todas as requisições vão começar por essa mesma URL base. Isso é chamado de baseURL.

// Usar uma baseURL evita repetição e facilita a manutenção do código. Imagine que você está desenvolvendo um app com várias requisições, como:

//  •  https://api.exemplo.com/produtos
//  •  https://api.exemplo.com/usuarios
//  •  https://api.exemplo.com/pedidos

let baseURL = "https://api.exemplo.com/"
let endpoint = "produtos"
let url = URL(string: baseURL + endpoint) // URL Completa com o endpoint..


// MARK: - O que é a HTTPMethod?

//O HTTPMethod define a intenção da requisição, ou seja, o que vc quer fazer com os dados

//* GET: É utilizado para solicitar recursos do servidor. Por exemplo, ao fazer uma requisição GET para uma API de previsão do tempo, você estaria solicitando as informações da previsão atual.

//* POST: É utilizado para enviar dados para o servidor. Por exemplo, ao criar um novo usuário em um aplicativo, você pode enviar uma requisição POST com os dados do usuário para a API.

//* PUT: É utilizado para atualizar um recurso existente no servidor. Por exemplo, ao editar as informações de um usuário em um aplicativo, você pode enviar uma requisição PUT com as novas informações do usuário para a API.

//* DELETE: É utilizado para remover um recurso do servidor. Por exemplo, ao excluir um post em uma rede social, você pode enviar uma requisição DELETE para a API correspondente.

//Exemplo de uso:
//var request = URLRequest(url: URL(string: "https://api.exemplo.com/produtos")!)
//request.httpMethod = "GET"

// MARK: - O que são Headers?

// Os headers são informações que vc enviar junto com a requisição. Eles podem ser usados para passar dados de autenticação, indicar o formato dos dados (JSON, XML, etc...)

//Authorization: usado para enviar um token de acesso
//Content-Type: informa o tipo de dado que estamos enviar

//Exemplo de uso:

//var request = URLRequest(url: URL(string: "https://api.exemplo.com/produtos")!)
//request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//request.setValue("Bearer 'token aqui'", forHTTPHeaderField: "Authorization")


// MARK: - O que são Parâmetros?

//1. Query Parameters
// Onde aparece: Na URL, depois do símbolo '?', separados por '&' para múltiplos parâmetros
//Normalmente usados para filtrar ou modificar o comportamento da resposta, geralmente em requisições GET

// Exemplo:
let urlComQueryParameters = "https://api.exemplo.com/produtos?categoria=eletronicos&preco_min=100"
// Neste Exemplo 'categoria=eletronicos' e 'preco_min=100' são os query parameters usados para filtrar os produtos categoria (eletronicos) e pelo preço minimo de 100


//2. Body Parameters
// - O corpo da requisição (Body), geralmente em formato JSON
// - Usamos principalmente em requisições POST, PUT, PATCH para enviar os dados ou modificar os dados no servidor

// Exemplo:
let urlParaPOST = "https://api.exemplo.com/produtos"
let bodyParameters = """
{
    "nome": "iPhone",
    "preco": 1000.0,
    "categoria": "eletronicos"
}    
"""

//3. Path Parameters (Ou URL Parameters)

// - Usamos para identificar um recurso especifico
// - Geralmente usamos em requisições GET, PUT e DELETE,

let urlComPathParameters = "https://api.exemplo.com/filmes/123"
//Neste exemplo, '123' é o path parameters que identifica um produto especifico com o ID 123


let urlParaPut = "https://api.exemplo.com/produtos/123"
let bodyParametersParaPut = """
{
    "preco": 120.0
}    
"""

// O path parameters '123' identifica o produto que será atualizado, e o body parameters 'preco' especifica a nova informação que será atualizada.


// MARK: - Tratamento de resposta (Response)

//Com o Status Code, você consegue ver rapidamente se sua requisição deu ruim, ou deu bom. E se deu ruim, mostra o Status Code do problema que ocorreu.

//* 200 OK: Isso significa que a solicitação foi bem-sucedida e a página ou recurso foi carregado corretamente. É um status code positivo que indica que tudo está funcionando como esperado.

//* 301 Moved Permanently: Esse status code indica que a página solicitada foi permanentemente movida para um novo local. O navegador móvel será automaticamente redirecionado para o novo endereço.

//*  302 Found / 307 Temporary Redirect: Esses status codes indicam que a página solicitada foi temporariamente movida para um novo local. Assim como no caso anterior, o navegador móvel será redirecionado para o novo endereço.

//* 400 Bad Request: Esse status code indica que a solicitação feita pelo dispositivo móvel é inválida ou malformada. Pode acontecer quando o aplicativo ou navegador envia informações incorretas ou ausentes.

//* 401 Unauthorized: Esse status code indica que a solicitação requer autenticação. O dispositivo móvel não possui as credenciais adequadas para acessar o recurso solicitado.

//* 403 Forbidden: Esse status code indica que o servidor entende a solicitação, mas está se recusando a conceder acesso ao recurso. Isso pode acontecer quando você não tem permissão para acessar determinada página ou diretório.

//* 404  Not Found: Esse status code é um dos mais conhecidos. Ele indica que a página ou recurso solicitado não foi encontrado no servidor. É exibida uma mensagêm de "Página não encontrada" no dispositivo móvel.

//* 500 Internal Server Error: Esse status code indica um erro interno do servidor. Algo deu errado no servidor ao processar a solicitação, e a página não pôde ser exibida corretamente.



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchListUser()
    }

    func fetchListUser() {
        Service.fetchListUser { result in
            switch result {
            case .success(let user):
                print(user)
            case .failure(let error):
                print("Error: \(error)")
                print(error.statusCode ?? 0)
            }
        }
    }
    
}

