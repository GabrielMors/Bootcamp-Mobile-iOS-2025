//
//  main.swift
//  JSON-Codable-Decodable-Encodable
//
//  Created by Gabriel Mors on 06/06/25.
//

import Foundation

// MARK: JSON
//

// Exemplo Objeto

"""
{
    "nome": "Gabriel Mors"
    "idade": 30
    "professor" true
    "cursos": ["iOS", "Swift", "SwiftUI"]
    "endereco": {
    "cidade": "Maringa"
    "estado": "PR"
  }
}
"""

struct Professor {
    var nome: String
    var idade: Int
    var professor: Bool
    var cursos: [String]
    var endereco: Endereco
}

struct Endereco {
    var cidade: String
    var estado: String
}




//{
//    "pessoa": {
//        "nome": "Wellinton"
//        "Idade": 34
//    }
//}




// Exemplo Lista



//[
//    {
//    "nome": "Gabriel"
//    },
//    {
//    "nome": "Gabriel"
//    },
//    {
//    "nome": "Gabriel"
//    },
//    {
//    "nome": "Gabriel"
//    },
//    {
//    "nome": "Gabriel"
//    },
//    {
//    "nome": "Gabriel"
//    },
//]


struct Veiculo {
    var id: Int
    var marca: String
    var modelo: String
    var ano: Int
    var acessorios: [Acessorios]
}


struct Acessorios {
    var nome: String
    var preco: Double
    var configuracaoAcessorio: ConfiguracaoAcessorio
}

struct ConfiguracaoAcessorio {
    var tipo: String
    var dataCriacao: String
}

// Objeto com valores


let veiculo = Veiculo(
    id: 101,
    marca: "Toytota",
    modelo: "Corola",
    ano: 2022,
    acessorios: [
        Acessorios(
            nome: "Teto solar",
            preco: 5000.00,
            configuracaoAcessorio: ConfiguracaoAcessorio(
                tipo: "Luxo",
                dataCriacao: "2021-02-10")
        ),
        Acessorios(
            nome: "Multimidia",
            preco: 5000.00,
            configuracaoAcessorio: ConfiguracaoAcessorio(
                tipo: "Luxo",
                dataCriacao: "2021-02-10")
        ),
    ]

)


//MARK: Decodable

// Decodable é um protocolo que permite que voce converta dados em JSON em um Objeto Swift. É o processo de decodificação.

struct House: Decodable {
    var address: String
    var numeroOfRooms: Int
    var hasGarden: Bool
}


let jsonString = """

{
    "address": "Avenida 2343 Bairro",
    "numeroOfRooms": 2324556,
    "hasGarden": false
}
    
"""

if let jsonData = jsonString.data(using: .utf8) {// utf8 é uma forma de codificar texto.
//    é uma codificação de caracteres que converte uma string para um Data (bytes)
    
    do {
        let house = try JSONDecoder().decode(House.self, from: jsonData)
//        print("DECODIFICAÇÃO: COM SUCESSO")
//        print(house.address)
//        print(house.numeroOfRooms)
//        print(house.hasGarden)
    } catch {
        // Ele tentar (try) decodificar, se caso não conseguir, ele cai no caso do catch
        print("Erro ao decodificar o JSON: \(error.localizedDescription)")
    }
}

//MARK: try?
// try? é uma forma mais simples de executar algo que poder dar erro, sem precisar do do-catch
func dividir(_ a: Int, _ b: Int) throws -> Int {
    if b == 0 {
        throw NSError(domain: "Erro Qualquer", code: 1)
    }
    return a / b
}

let resultado = try? dividir(10, 0)
//print(resultado)// nil (Erro tratado silenciosamente)



struct Animal: Decodable {
    var species: String
    var age: Int
    var habitatType: String
    var isDangerous: Bool
    
    enum CodingKeys: String, CodingKey {
        case species
        case age
        case habitatType = "habitat_type"
        case isDangerous = "is_dangerous"
    }
}

let jsonStringAnimal = """
{
    "species": "tigre",
    "age": 1,
    "habitat_type": "Floresta",
    "is_dangerous": true
}    
"""


if let jsonData = jsonStringAnimal.data(using: .utf8) {
    do {
        let animal = try JSONDecoder().decode(Animal.self, from: jsonData)
//        print("ANIMAL DECODIFICADO")
//        print(animal.species)
//        print(animal.age)
//        print(animal.habitatType)
//        print(animal.isDangerous)
    } catch {
        print("Error ao decodificar o JSON: \(error.localizedDescription)")
    }
}

//MARK: Encodable

struct Dog: Encodable {
    
    var name: String
    var age: Int
    var breed: String
    var isVaccinated: Bool
    
    enum CodingKeys: String, CodingKey {
        case name
        case age
        case breed
        case isVaccinated = "is_vaccinated"
    }
}

let myDog = Dog(name: "Zeus", age: 2, breed: "Golden", isVaccinated: true)

do {
   let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted // Facilitar na leitura
    let jsonData = try encoder.encode(myDog)
    if let jsonString = String(data: jsonData, encoding: .utf8) {
        print(jsonString)
    }
} catch {
    print("Erro ao codificar o JSON: \(error.localizedDescription)")
}


//MARK: Codable
// O Codable ele uma junção de Decodable + Encodable


//MARK: Desafio

//MARK: 1 - Faça um decodable desse JSON.

let jsonStringAuthor = """
{
    "title": "Inception",
    "director": "Christopher Nolan",
    "releaseYear": 2010
}
"""

struct Author: Decodable {
    var title: String
    var director: String
    var releaseYear: Int
}

if let jsonData = jsonStringAuthor.data(using: .utf8) {
    do {
        let author = try JSONDecoder().decode(Author.self, from: jsonData)
        print("Author decodificado com sucesso")
        print(author)
    } catch {
        print("Erro ao decodificar o JSON: \(error.localizedDescription)")
    }
}



//MARK: 2- Faça o Encodable desse modelo


struct Student: Encodable {
    var name: String
    var age: Int
    var grades: [Int]
}


let gabriel = Student(name: "Gabriel Mors", age: 22, grades: [10, 11, 12])


do {
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted// Facilitar a leitura
    let jsonData = try encoder.encode(gabriel)
    print(jsonData)
    if let jsonString = String(data: jsonData, encoding: .utf8) {
        print(jsonString)
    }
} catch {
    print("Error ao decodificar o JSON: \(error.localizedDescription)")
}

//MARK: 3 - Faça o Decode funcionar

// OBS: Você recebeu um JSON de uma API que contém detalhes sobre um veículo. O JSON tem 10 campos, mas você precisa extrair e usar apenas 4 deles: model, make, year, e color. Durante a decodificação, você encontrará alguns erros intencionais que precisam ser corrigidos.

struct Vehicle: Decodable {
    var model: String
    var make: String
    var year: String
    var color: String
}

let jsonStringVehicle = """
{
    "model": "Explorer",
    "make": "Ford",
    "year": "2020",
    "color": "Blue",
    "engine": "3.5L V6",
    "seats": 7,
    "type": "SUV",
    "milage": "12000",
    "price": "35000",
    "airConditioned": true
}
"""

if let jsonVehicle = jsonStringVehicle.data(using: .utf8) {
    do {
        let decoder = JSONDecoder()
        let vehicle = try decoder.decode(Vehicle.self, from: jsonVehicle)
        print(vehicle)
    } catch {
        print("Erro ao decodificar o Vehicle \(error)")
    }
}


//MARK: - Exercício 4

// Realize o decodable do seguinte json

struct MovieData: Codable {
    var movie: [Movie]
}

struct Movie: Codable {
    var title: String?
    var year: String
    var genre: String
}

let jsonStringMovie = """
{
  "movie": [
      {"title": "Harry Potter", "year": "2010", "genre": "Ação"},
      {"title": null, "year": "1999", "genre": "Ficção científica"}
  ]
}
"""

if let jsonData = jsonStringMovie.data(using: .utf8) {
    do {
        let movie = try JSONDecoder().decode(MovieData.self, from: jsonData)
        print("Movie Decodificado com sucesso")
        print(movie.movie)
    } catch {
        print("Erro ao decodificar o Vehicle \(error)")
    }
}

//MARK: - Exercício 5

// Realize o decodable e o encodable do seguinte json
// OBS: Esse json não parece estar correto...corrija ele


struct Course: Codable {
  var courseName: String
  var instructors: [Instructor]
  var price: String
}

struct Instructor: Codable {
  var firstName: String
  var lastName: String
}


let jsonStringCourse = """
{
  "courseName": "Swift Advanced",
  "instructors": [
    {
      "firstName": "Gabriel",
      "lastName": "Mors"
    },
    {
      "firstName": "Joel",
      "lastName": "Lacerda"
    }
  ],
  "price": "Free"
}
"""

