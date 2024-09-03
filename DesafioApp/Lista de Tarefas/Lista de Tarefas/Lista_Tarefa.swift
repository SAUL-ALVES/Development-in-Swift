import SwiftUI

// Tela com a Lista de Tarefas
struct TaskListView: View {
    @State private var tasks: [Task] = [
        Task(title: "Comprar leite", creationDate: Date(), isCompleted: false),
        Task(title: "Lavar o carro", creationDate: Date(), isCompleted: true),
    ]

    var body: some View {
        NavigationView {
            List($tasks) { $task in
                NavigationLink(destination: TaskDetailView(task: $task, deleteTask: {
                    if let index = tasks.firstIndex(where: { $0.id == task.id }) {
                        tasks.remove(at: index)
                    }
                })) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(task.title)
                                .font(.headline)

                            Text("Data de Criação: \(task.creationDate, formatter: dateFormatter)")
                                .font(.subheadline)
                        }
                        Spacer()
                        Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(task.isCompleted ? .green : .red)
                    }
                }
            }
            .navigationBarTitle("Lista de Tarefas")
        }
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}
