import SwiftUI

// Estrutura para representar uma Tarefa
struct Task: Identifiable, Codable {
    let id: UUID
    var title: String // Alterado para var para permitir alterações
    let creationDate: Date
    var isCompleted: Bool // Alterado para var para permitir alterações

    // Inicializador padrão para decodificação
    init(id: UUID = UUID(), title: String, creationDate: Date, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.creationDate = creationDate
        self.isCompleted = isCompleted
    }
}

// Formatador de Data
let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    return formatter
}()

// Tela de Detalhes da Tarefa
struct TaskDetailView: View {
    @State private var isEditing = false
    @Binding var task: Task
    var deleteTask: () -> Void
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            if isEditing {
                TextField("Título da Tarefa", text: $task.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button(action: {
                    // Ação para salvar alterações
                    isEditing = false
                }) {
                    Text("Salvar")
                        .font(.headline)
                        .foregroundColor(.blue)
                }
                .padding()
            } else {
                Text(task.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("Data de Criação: \(task.creationDate, formatter: dateFormatter)")
                    .font(.headline)

                Text(task.isCompleted ? "Status: Concluída" : "Status: Não Concluída")
                    .font(.headline)
                    .foregroundColor(task.isCompleted ? .green : .red)

                HStack {
                    Button(action: {
                        // Ação para editar a tarefa
                        isEditing = true
                    }) {
                        Text("Editar")
                            .font(.headline)
                            .foregroundColor(.blue)
                    }
                    .padding()

                    Button(action: {
                        // Ação para deletar a tarefa
                        deleteTask()
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Deletar")
                            .font(.headline)
                            .foregroundColor(.red)
                    }
                    .padding()
                }
            }

            Spacer()
        }
        .padding()
        .navigationBarTitle("Detalhes da Tarefa", displayMode: .inline)
    }
}

#Preview {
    TaskDetailView(
        task: .constant(Task(id: UUID(), title: "Tarefa Exemplo", creationDate: Date(), isCompleted: false)),
        deleteTask: {
            print("Tarefa deletada")
        }
    )
}
