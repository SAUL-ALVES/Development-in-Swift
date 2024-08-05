import Foundation


func dailyRateFrom(hourlyRate: Int) -> Double {
    return Double(hourlyRate) * 8.0
}


func monthlyRateFrom(hourlyRate: Int, withDiscount discount: Double) -> Int {
    let dailyRate = dailyRateFrom(hourlyRate: hourlyRate)
    let monthlyRate = dailyRate * 22.0
    let discountedRate = monthlyRate * (1.0 - discount / 100.0)
    return Int(round(discountedRate))
}


func workdaysIn(budget: Double, hourlyRate: Int, withDiscount discount: Double) -> Int {
    let dailyRate = dailyRateFrom(hourlyRate: hourlyRate)
    let discountedDailyRate = dailyRate * (1.0 - discount / 100.0)
    let workdays = budget / discountedDailyRate
    return Int(floor(workdays))
}


print("A taxa diária para uma taxa horária de 60 é: \(dailyRateFrom(hourlyRate: 60))") // 480.0
print("A taxa mensal para uma taxa horária de 77 com 10.5% de desconto é: \(monthlyRateFrom(hourlyRate: 77, withDiscount: 10.5))") // 12129
print("O número de dias úteis para um orçamento de 20000, uma taxa horária de 80 e um desconto de 11% é: \(workdaysIn(budget: 20000, hourlyRate: 80, withDiscount: 11.0))") // 35
