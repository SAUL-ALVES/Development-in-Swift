import SwiftUI

// Tela Principal
struct Tela_Inicial: View {
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "pencil.and.list.clipboard")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.black)
                    .padding(.bottom, 65)
                
                Text("Bem-vindo a Lista de Tarefas")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                    .multilineTextAlignment(.center)

                NavigationLink(destination: TaskListView()) {
                    Text("Ver Lista de Tarefas")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                        .multilineTextAlignment(.center)
                }

                NavigationLink(destination: CompletedTasksView()) {
                    Text("Tarefas Completadas")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                        .multilineTextAlignment(.center)
                }
                .padding()
            }
            .navigationBarTitle("Página Principal", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Tela_Inicial()
    }
}
