import Foundation

class JSONService {
    private let fileName: String = "tasks.json"

    private func getFileURL() -> URL? {
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }
        return documentDirectory.appendingPathComponent(fileName)
    }

    func save(_ tasks: [Task]) throws {
        guard let fileURL = getFileURL() else { return }

        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        let jsonData = try encoder.encode(tasks)
        try jsonData.write(to: fileURL)
    }

    func load() throws -> [Task]? {
        guard let fileURL = getFileURL() else { return nil }

        if FileManager.default.fileExists(atPath: fileURL.path) {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let jsonData = try Data(contentsOf: fileURL)
            return try decoder.decode([Task].self, from: jsonData)
        } else {
            return nil
        }
    }

    func delete() throws {
        guard let fileURL = getFileURL() else { return }
        try FileManager.default.removeItem(at: fileURL)
    }
}
