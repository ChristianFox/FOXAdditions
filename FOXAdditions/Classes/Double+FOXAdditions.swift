
import Foundation

extension Double {
    
    func fox_string(fractionDigits:Int) -> String {
        let formatter = NumberFormatter()
        formatter.minimumIntegerDigits = 1
        formatter.minimumFractionDigits = fractionDigits
        formatter.maximumFractionDigits = fractionDigits
        return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }

    func fox_round(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    
    func fox_round(toIncrement increment:Double) -> Double {
        
        let mod = self / increment
        if mod == 0 {
            return self
        } else {
            let roundedMod = Darwin.round(mod)
            return increment * roundedMod
        }
    }
}

