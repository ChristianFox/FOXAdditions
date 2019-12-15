
import Foundation

public extension BinaryFloatingPoint {
    
    /** The mean average from the array of `numbers` */
    static func fox_mean<T:BinaryFloatingPoint>(_ numbers:[T]) -> T {
        numbers.reduce(0,{$0+$1}) / T(numbers.count)
    }

    /** The median average from the array of `numbers` */
    static func fox_median<T:BinaryFloatingPoint>(_ numbers:[T]) -> T {
        let sorted:[T] = numbers.sorted()
        if sorted.count % 2 == 0 {
            let midIdx:Int = sorted.count / 2
            let num1:T = sorted[midIdx - 1]
            let num2:T = sorted[midIdx]
            return (num1 + num2) / 2.0
        } else {
            let midIdx:Int = sorted.count / 2
            return sorted[midIdx]
        }
    }
    
    /** Create a String from the receiver limiting it to the given number of `franctionDigits` */
    func fox_string(fractionDigits:Int) -> String? {
        let formatter = NumberFormatter()
        formatter.minimumIntegerDigits = 1
        formatter.minimumFractionDigits = fractionDigits
        formatter.maximumFractionDigits = fractionDigits
        return formatter.string(from: NSNumber(value: Double(self)))
    }

    /** Returns a new value from the receiver rounded to the number of `places` */
    func fox_round<T:BinaryFloatingPoint>(toPlaces places:Int) -> T {
        let divisor:Double = pow(10.0, Double(places))
        return T((Double(self) * divisor).rounded() / divisor)
    }
    
    /** Returns a new value from the receiver rounded to the given `increment` */
    func fox_round<T:BinaryFloatingPoint>(toIncrement increment:T) -> T {
        
        let mod = T(self) / increment
        if mod == 0 {
            return T(self)
        } else {
            let roundedMod = Darwin.round(mod)
            return increment * roundedMod
        }
    }

}
