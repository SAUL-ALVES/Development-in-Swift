---

**Nessa aula, foram resolvidas algumas questões do HackerRank**

1. **Questão:**

Dado um vetor de números encontre a soma de seus elementos. Na primeira linha contém a quantidade “***n***” que é um número inteiro, dizendo o tamanho do vetor e depois dizer de fato o que ele quer que calcule.

**Ex:**

Input:

6 valores = 1, 2, 3, 4, 10, 11

Output:

31

**Agora a resolução na prática:**

```swift
func simpleArraySum(ar: [Int]) -> Int {

var resposta: Int = 0
for numero in ar {
resposta += numero

}

return = resposta

}
```

---

2. **Questão:**
- **Escada**

Construir uma escada de tamanho n = 6, então ela irá imprimir seis linhas. E que seja tudo alinhado à direita utiliando o inteiro 6.

```swift
func staircase (n: Int) -> Void {

for degrau in l...n {

let espacos = n - degrau 
let hashtags = degrau

let linha String(repeating:" ", count: espacos) + String(repeating"#", count: hashtags)

print(linha)

}

}
```