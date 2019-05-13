// Copyright 2018, Ralf Ebert
// Source    https://www.ralfebert.de/ios-examples/swift/array-random-sample/
// License   https://opensource.org/licenses/MIT
// License   https://creativecommons.org/publicdomain/zero/1.0/

import Darwin

public extension Collection {
    
    /**
     * Returns a random element of the Array or nil if the Array is empty.
     */
    var fox_randomElement : Element? {
        guard !isEmpty else { return nil }
        let offset = arc4random_uniform(numericCast(self.count))
        let idx = self.index(self.startIndex, offsetBy: numericCast(offset))
        return self[idx]
    }
    
    /**
     * Returns `count` random elements from the array.
     * If there are not enough elements in the Array, a smaller Array is returned.
     * Elements will not be returned twice except when there are duplicate elements in the original Array.
     */
    func fox_randomElements(_ count : UInt) -> [Element] {
        let sampleCount = Swift.min(numericCast(count), self.count)
        
        var elements = Array(self)
        var samples : [Element] = []
        
        while samples.count < sampleCount {
            let idx = (0..<elements.count).fox_randomElement!
            samples.append(elements.remove(at: idx))
        }
        
        return samples
    }
    
}
