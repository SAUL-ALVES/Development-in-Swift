**1ª Questão**

- Escreva um programa que imprima todos os números pares entre 1 e 100, incluindo-os se for o caso.

```swift

for numero in 1...100 {
   if numero % 2 == 0 {
      print(numero)
}
}
```

**2ª Questão** 

- Faça um programa que leia 6 valores. Estes valores serão somente negativos ou positivos (desconsidere os valores nulos). A seguir, mostre a quantidade de valores positivos digitados.

```swift
func countPositiveValues(values: [Int]) -> Int {
    var positiveCount = 0
    
    for value in values {
        if value > 0 {
            positiveCount += 1
        }
    }
    
    return positiveCount
}

let inputValues = [1, 3, 4, -6, -2, -7]
let positiveValuesCount = countPositiveValues(values: inputValues)

print("3 valores positivos")
```

**3ª Questão** 

- Escreva um programa que leia 2 valores X e Y e que imprima todos os valores entre eles cujo resto da divisão dele por 5 for igual a 2 ou igual a 3.

```swift
func readInt() -> Int {
    if let input = readLine(), let number = Int(input) {
        return number
    } else {
        fatalError("Entrada inválida")
    }
}
let X = readInt()
let Y = readInt()

let inicio = min(X, Y)
let fim = max(X, Y)

for num in (inicio + 1)..<fim {
    
    if num % 5 == 2 || num % 5 == 3 {
        print(num)
    }
}
```

**4ª Questão** 

- Sua tarefa é fazer um algoritmo que dado um número inteiro **N**, tenha como resposta a quantidade total de números dessa sequência e logo abaixo a sequência completa.

```swift
import Foundation

func readInts() -> [Int] {
    var result: [Int] = []
    while let input = readLine() {
        if let number = Int(input) {
            result.append(number)
        }
    }
    return result
}

func calcularQuantidadeTotal(N: Int) -> Int {
    var total = 0
    for i in 0...N {
        total += i
    }
    return total
}

func gerarSequencia(N: Int) -> [Int] {
    var sequencia: [Int] = []
    for i in 0...N {
        for _ in 0...i {
            sequencia.append(i)
        }
    }
    return sequencia
}

func main() {
    let casos = readInts()
    var caso = 1
    
    for N in casos {
        let quantidadeTotal = calcularQuantidadeTotal(N: N)
        let sequencia = gerarSequencia(N: N)
        
        // Imprimindo conforme o formato especificado
        print("Caso \(caso): \(quantidadeTotal) numeros")
        print(sequencia.map { String($0) }.joined(separator: " "))
        print()
        
        caso += 1
    }
}

main()

```