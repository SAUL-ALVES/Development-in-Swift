struct Paciente {
    var nome: String
    var idade: Int
    var endereco: String
    var telefone: String
}

struct Medico {
    var nome: String
    var especialidade: String
    var crm: String
}

class Consulta {
    var paciente: Paciente
    var medico: Medico
    var data: String
    var horario: String
    var concluida: Bool

    init(paciente: Paciente, medico: Medico, data: String, horario: String) {
        self.paciente = paciente
        self.medico = medico
        self.data = data
        self.horario = horario
        self.concluida = false
    }

    func concluirConsulta() {
        self.concluida = true
    }

    func detalhesConsulta() -> String {
        return """
        Consulta:
        Paciente: \(paciente.nome)
        Médico: \(medico.nome) - \(medico.especialidade)
        Data: \(data)
        Horário: \(horario)
        Concluída: \(concluida ? "Sim" : "Não")
        """
    }
}

class GerenciadorDeConsultas {
    var consultas: [Consulta] = []

    func adicionarConsulta(_ consulta: Consulta) {
        consultas.append(consulta)
    }

    func listarConsultas() {
        for consulta in consultas {
            print(consulta.detalhesConsulta())
            print("-------------")
        }
    }

    func consultasPorPaciente(nomePaciente: String) -> [Consulta] {
        return consultas.filter { $0.paciente.nome == nomePaciente }
    }

    func contarConsultasPorMedico(nomeMedico: String) -> Int {
        return consultas.filter { $0.medico.nome == nomeMedico }.count
    }
}


let paciente1 = Paciente(nome: "Ana Silva", idade: 30, endereco: "Rua das Flores, 123", telefone: "555-1234")
let medico1 = Medico(nome: "Dr. Carlos Souza", especialidade: "Cardiologia", crm: "12345-SP")
let consulta1 = Consulta(paciente: paciente1, medico: medico1, data: "01/07/2024", horario: "14:00")

let paciente2 = Paciente(nome: "Carlos Pereira", idade: 45, endereco: "Avenida Central, 456", telefone: "555-5678")
let medico2 = Medico(nome: "Dr. Ana Lima", especialidade: "Dermatologia", crm: "67890-SP")
let consulta2 = Consulta(paciente: paciente2, medico: medico2, data: "25/07/2024", horario: "15:00")
let consulta3 = Consulta(paciente: paciente1, medico: medico2, data: "26/07/2024", horario: "16:00")

let gerenciador = GerenciadorDeConsultas()
gerenciador.adicionarConsulta(consulta1)
gerenciador.adicionarConsulta(consulta2)
gerenciador.adicionarConsulta(consulta3)

gerenciador.listarConsultas()

consulta1.concluirConsulta()
gerenciador.listarConsultas()

let consultasDoPaciente1 = gerenciador.consultasPorPaciente(nomePaciente: "Ana Silva")
print("Consultas da paciente Ana Silva:")
for consulta in consultasDoPaciente1 {
    print(consulta.detalhesConsulta())
    print("-------------")
}

let numeroDeConsultasMedico2 = gerenciador.contarConsultasPorMedico(nomeMedico: "Dr. Ana Lima")
print("Número de consultas com Dr. Ana Lima: \(numeroDeConsultasMedico2)")
