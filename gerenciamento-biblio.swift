import Foundation

enum Categoria {
    case livro
    case revista
    case jornal
}

protocol ItemBiblioteca {
    var titulo: String { get }
    var categoria: Categoria { get }
    var disponivel: Bool { get set }
    
    func descricao() -> String
}

class Item: ItemBiblioteca {
    var titulo: String
    var categoria: Categoria
    var disponivel: Bool
    
    init(titulo: String, categoria: Categoria, disponivel: Bool = true) {
        self.titulo = titulo
        self.categoria = categoria
        self.disponivel = disponivel
    }
    
    func descricao() -> String {
        return "\(titulo) - \(categoria) - \(disponivel ? "Disponível" : "Indisponível")"
    }
}

class Livro: Item {
    var autor: String
    
    init(titulo: String, autor: String, disponivel: Bool = true) {
        self.autor = autor
        super.init(titulo: titulo, categoria: .livro, disponivel: disponivel)
    }
    
    override func descricao() -> String {
        return "\(super.descricao()) - Autor: \(autor)"
    }
}

class Revista: Item {
    var edicao: Int
    
    init(titulo: String, edicao: Int, disponivel: Bool = true) {
        self.edicao = edicao
        super.init(titulo: titulo, categoria: .revista, disponivel: disponivel)
    }
    
    override func descricao() -> String {
        return "\(super.descricao()) - Edição: \(edicao)"
    }
}

let itensDaBiblioteca: [Item] = [
    Livro(titulo: "1984", autor: "George Orwell"),
    Livro(titulo: "O Senhor dos Anéis", autor: "J.R.R. Tolkien"),
    Revista(titulo: "Revista Ciência Hoje", edicao: 123),
    Revista(titulo: "Revista Tecnologia", edicao: 456),
    Livro(titulo: "Swift Programming", autor: "Apple Inc.")
]

let itensDisponiveis = itensDaBiblioteca.filter { $0.disponivel }
print("Itens disponíveis:")
itensDisponiveis.forEach { item in
    print(item.descricao())
}

let titulosDosItens = itensDaBiblioteca.map { $0.titulo }
print("\nTítulos dos itens:")
titulosDosItens.forEach { titulo in
    print(titulo)
}

let contagemPorCategoria = itensDaBiblioteca.reduce(into: [Categoria: Int]()) { contagem, item in
    contagem[item.categoria, default: 0] += 1
}

print("\nContagem por categoria:")
for (categoria, contagem) in contagemPorCategoria {
    print("\(categoria): \(contagem)")
}

extension Item {
    func emprestar() {
        if disponivel {
            disponivel = false
            print("\(titulo) foi emprestado.")
        } else {
            print("\(titulo) já está emprestado.")
        }
    }
}

func emprestarItem(titulo: String) {
    if let item = itensDaBiblioteca.first(where: { $0.titulo == titulo }) {
        item.emprestar()
    } else {
        print("Item com o título \(titulo) não encontrado.")
    }
}

print("\nEmprestando itens:")
emprestarItem(titulo: "1984")
emprestarItem(titulo: "Revista Ciência Hoje")

print("\nEstado atual dos itens:")
itensDaBiblioteca.forEach { item in
    print(item.descricao())
}
