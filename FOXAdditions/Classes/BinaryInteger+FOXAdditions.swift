
import Foundation

public extension BinaryInteger {
    
    /** The mean average from the array of `numbers`. Result will be a integer rounded rather than a floating point number */
    static func fox_mean<T:BinaryInteger>(_ numbers:[T]) -> T {
        return T(roundf(Float(numbers.reduce(0,{$0+$1})) / Float(numbers.count)))
    }

    /** The median average from the array of `numbers`. Result will be a integer rounded rather than a floating point number */
    static func fox_median<T:BinaryInteger>(_ numbers:[T]) -> T {
        let sorted:[T] = numbers.sorted()
        if sorted.count % 2 == 0 {
            let midIdx:Int = sorted.count / 2
            let num1:T = sorted[midIdx - 1]
            let num2:T = sorted[midIdx]
            return T(roundf(Float(num1 + num2) / 2.0))
        } else {
            let midIdx:Int = sorted.count / 2
            return sorted[midIdx]
        }
    }

}
