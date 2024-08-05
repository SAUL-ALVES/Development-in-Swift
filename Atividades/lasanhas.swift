
let expectedMinutesInOven = 40


func remainingMinutesInOven(elapsedMinutes: Int) -> Int {
    return expectedMinutesInOven - elapsedMinutes
}


func preparationTimeInMinutes(layers: Int) -> Int {
    return layers * 2
}


func totalTimeInMinutes(layers: Int, elapsedMinutes: Int) -> Int {
    let preparationTime = preparationTimeInMinutes(layers: layers)
    return preparationTime + elapsedMinutes
}
print("Tempo esperado no forno: \(expectedMinutesInOven) minutos") // 40
print("Tempo restante no forno: \(remainingMinutesInOven(elapsedMinutes: 30)) minutos") // 10
print("Tempo de preparação: \(preparationTimeInMinutes(layers: 2)) minutos") // 4
print("Tempo total de trabalho: \(totalTimeInMinutes(layers: 3, elapsedMinutes: 20)) minutos") // 26
