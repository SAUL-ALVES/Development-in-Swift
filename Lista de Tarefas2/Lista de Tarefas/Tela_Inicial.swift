import SwiftUI

// Tela Principal
struct Tela_Inicial: View {
    var body: some View {
        NavigationView {
            VStack {
                // Adicionando uma imagem com um ícone de lista
                Image(systemName: "pencil.and.list.clipboard")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.purple)
                    .padding(.top, 50)
                
                // Título principal
                Text("Bem-vindo a Lista de Tarefas")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .padding(.bottom, 10)
                    .multilineTextAlignment(.center)
                
                // Descrição centralizada abaixo do título
                Text("Organize suas tarefas de forma organizada e eficiente")
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .padding()
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.horizontal, 20)
                
                Spacer()
                
                // Botão para ver a lista de tarefas
                NavigationLink(destination: TaskListView()) {
                    Text("Ver Lista de Tarefas")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
                .padding(.bottom, 10)
                
                // Botão para ver tarefas completadas
                NavigationLink(destination: CompletedTasksView()) {
                    Text("Tarefas Completadas")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
                .padding(.bottom, 150)
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
