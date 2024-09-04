import SwiftUI

struct TaskListView: View {
    @State private var tasks: [Task] = []
    @State private var showingAddTaskView = false
    private let jsonService = JSONService()

    var body: some View {
        NavigationView {
            List {
                ForEach($tasks) { $task in
                    NavigationLink(destination: TaskDetailView(task: $task, deleteTask: {
                        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
                            tasks.remove(at: index)
                            saveTasks() // Salva após a deleção
                        }
                    })) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(task.title)
                                    .font(.headline)
                                Text(task.description) // Adicionado para mostrar descrição
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                Text("Data de Criação: \(task.creationDate, formatter: dateFormatter)")
                                    .font(.subheadline)
                            }
                            Spacer()
                            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                                .foregroundColor(task.isCompleted ? .green : .red)
                        }
                    }
                }
            }
            .navigationBarTitle("Lista de Tarefas")
            .navigationBarItems(trailing: Button(action: {
                showingAddTaskView = true
            }) {
                Image(systemName: "plus")
                    .imageScale(.large)
            })
            .onAppear(perform: loadTasks) // Carrega as tarefas ao aparecer
            .sheet(isPresented: $showingAddTaskView) {
                AddTaskView(tasks: $tasks)
            }
        }
    }

    private func loadTasks() {
        do {
            if let loadedTasks = try jsonService.load() {
                tasks = loadedTasks
            }
        } catch {
            print("Erro ao carregar tarefas: \(error)")
        }
    }

    private func saveTasks() {
        do {
            try jsonService.save(tasks)
        } catch {
            print("Erro ao salvar tarefas: \(error)")
        }
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}
