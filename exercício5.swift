import Foundation

func maiorFatia(diametroA: String, fatiasA: String, diametroB: String, fatiasB: String) -> String {

    let diametroADouble = Double(diametroA)
    let fatiasAInt = Int(fatiasA)
    let diametroBDouble = Double(diametroB)
    let fatiasBInt = Int(fatiasB)
    
    let areaFatiaA = tamanhoFatia(diametro: diametroADouble, fatias: fatiasAInt)
    let areaFatiaB = tamanhoFatia(diametro: diametroBDouble, fatias: fatiasBInt)
    
    
    if let areaA = areaFatiaA, let areaB = areaFatiaB {
        if areaA > areaB {
            return "Fatia A é maior"
        } else if areaB > areaA {
            return "Fatia B é maior"
        } else {
            return "Nenhuma fatia é maior"
        }
    } else if areaFatiaA != nil {
        return "Fatia A é maior"
    } else if areaFatiaB != nil {
        return "Fatia B é maior"
    } else {
        return "Nenhuma fatia é maior"
    }
}
