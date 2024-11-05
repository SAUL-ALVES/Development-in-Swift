import Foundation

class JSONService {
    private let fileName: String = "tasks.json"

    // Retorna a URL do arquivo JSON no diretório de documentos
    private func getFileURL() -> URL? {
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }
        return documentDirectory.appendingPathComponent(fileName)
    }

    // Salva a lista de tarefas no arquivo JSON
    func save(_ tasks: [Task]) throws {
        guard let fileURL = getFileURL() else {
            throw NSError(domain: "JSONServiceError", code: 1, userInfo: [NSLocalizedDescriptionKey: "Não foi possível obter o URL do arquivo."])
        }

        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        let jsonData = try encoder.encode(tasks)
        try jsonData.write(to: fileURL, options: .atomic) // Usar opções atômicas para garantir a integridade do arquivo
    }

    // Carrega a lista de tarefas do arquivo JSON
    func load() throws -> [Task]? {
        guard let fileURL = getFileURL() else {
            throw NSError(domain: "JSONServiceError", code: 2, userInfo: [NSLocalizedDescriptionKey: "Não foi possível obter o URL do arquivo."])
        }

        if FileManager.default.fileExists(atPath: fileURL.path) {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let jsonData = try Data(contentsOf: fileURL)
            return try decoder.decode([Task].self, from: jsonData)
        } else {
            return nil
        }
    }

    // Deleta o arquivo JSON
    func delete() throws {
        guard let fileURL = getFileURL() else {
            throw NSError(domain: "JSONServiceError", code: 3, userInfo: [NSLocalizedDescriptionKey: "Não foi possível obter o URL do arquivo."])
        }
        if FileManager.default.fileExists(atPath: fileURL.path) {
            try FileManager.default.removeItem(at: fileURL)
        }
    }
}
