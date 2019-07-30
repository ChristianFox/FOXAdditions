

import Foundation

public extension Array {
    
    func fox_random<T>() -> T? {
        if self.count == 0 {
            return nil
        }
        let randIdx = Int.random(in: 0..<self.count)
        return self[randIdx] as? T
    }
    
    func fox_indexOf<T : Equatable>(x:T) -> Int? {
        for i in 0..<self.count {
            if self[i] as! T == x {
                return i
            }
        }
        return nil
    }
    
    func fox_indexesOf<T : Equatable>(object:T) -> [Int] {
        var result: [Int] = []
        for (index,obj) in enumerated() {
            if obj as! T == object {
                result.append(index)
            }
        }
        return result
    }

    /**
     * Shuffles the elements in the Array in-place using the
     * [Fisher-Yates shuffle](https://en.wikipedia.org/wiki/Fisher%E2%80%93Yates_shuffle).
     */
    mutating func fox_shuffle() {
        guard self.count >= 1 else { return }
        
        for i in (1..<self.count).reversed() {
            let j = (0...i).fox_randomElement!
            self.swapAt(j, i)
        }
    }
    
    /**
     * Returns a new Array with the elements in random order.
     */
    var fox_shuffled : [Element] {
        var elements = self
        elements.fox_shuffle()
        return elements
    }

    /*
     https://stackoverflow.com/a/39975354
     */
    mutating func remove(at indexes: [Int]) {
        var lastIndex: Int? = nil
        for index in indexes.sorted(by: >) {
            guard lastIndex != index else {
                continue
            }
            remove(at: index)
            lastIndex = index
        }
    }

}

extension Array where Element: Equatable {
    
    /**
     Remove first collection element that is equal to the given `object`:
     Found here: https://stackoverflow.com/a/45008042
     **/
    mutating func remove(object: Element) {
        guard let index = index(of: object) else {return}
        remove(at: index)
    }
    
}

