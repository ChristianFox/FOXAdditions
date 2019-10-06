

import Foundation

extension Float {
    
    func fox_string(fractionDigits:Int) -> String {
        let formatter = NumberFormatter()
        formatter.minimumIntegerDigits = 1
        formatter.minimumFractionDigits = fractionDigits
        formatter.maximumFractionDigits = fractionDigits
        return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }

    func fox_round(toPlaces places:Int) -> Float {
        let divisor = pow(10.0, Float(places))
        return (self * divisor).rounded() / divisor
    }
    
    func fox_round(toIncrement increment:Float) -> Float {
        
        let mod = self / increment
        if mod == 0 {
            return self
        } else {
            let roundedMod = roundf(mod)
            return increment * roundedMod
        }
    }
}

