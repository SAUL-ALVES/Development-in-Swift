import SwiftUI

struct AddTaskView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var tasks: [Task]
    
    @State private var title: String = ""
    @State private var description: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Detalhes da Tarefa")) {
                    TextField("Título", text: $title)
                    TextField("Descrição", text: $description)
                }
                
                Button(action: saveTask) {
                    Text("Adicionar Tarefa")
                        .foregroundColor(.blue)
                }
                .disabled(title.isEmpty || description.isEmpty) // Desativa o botão se os campos estiverem vazios
            }
            .navigationTitle("Nova Tarefa")
            .navigationBarItems(trailing: Button("Cancelar") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
    
    private func saveTask() {
        let newTask = Task(
            title: title,
            description: description,
            creationDate: Date(),
            isCompleted: false
        )
        tasks.append(newTask)
        // Salvar a tarefa no JSON
        do {
            try JSONService().save(tasks) // Salva a lista atualizada de tarefas
        } catch {
            print("Erro ao salvar tarefas: \(error)")
        }
        presentationMode.wrappedValue.dismiss()
    }
}

