

import Foundation

public extension Array {
	
	/**
	Returns a random element from the array
	*/
	func fox_random<T>() -> T? {
		if self.count == 0 {
			return nil
		}
		let randIdx = Int.random(in: 0..<self.count)
		return self[randIdx] as? T
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
	func fox_shuffled() -> [Element] {
		var elements = self
		elements.fox_shuffle()
		return elements
	}
	
	/**
	Returns the index of the first instance of the element in the array.
	
	- Parameter object: The object to look for
	*/
	func fox_indexOf<T : Equatable>(_ object:T) -> Int? {
		for i in 0..<self.count {
			if self[i] as! T == object {
				return i
			}
		}
		return nil
	}

    /**
	Returns the indexes of all instances of the element in the array.
	
	- Parameter object: The object to look for
	*/
	func fox_indexesOf<T : Equatable>(_ object:T) -> [Int] {
		var result: [Int] = []
		for (index,obj) in enumerated() {
			if obj as! T == object {
				result.append(index)
			}
		}
		return result
	}
	
	
	/**
	Removes the objects at the given indexes
	Found here: https://stackoverflow.com/a/39975354
	
	- Parameter indexes: The indexes of the objects to be removed
	*/
	mutating func fox_remove(at indexes: [Int]) {
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
	Remove first collection element that is equal to the given object:
	Found here: https://stackoverflow.com/a/45008042
	
	- Parameter object: The object to remove
	**/
	mutating func fox_removeFirst(object: Element) {
		guard let index = firstIndex(of: object) else {return}
		remove(at: index)
	}
	
	/**
	Remove last collection element that is equal to the given object.
	
	- Parameter object: The object to remove
	**/
	mutating func fox_removeLast(object: Element) {
		guard let index = lastIndex(of: object) else {return}
		remove(at: index)
	}
	
	/**
	Remove all collection elements that are equal to the given object.
	
	- Parameters object: The object to remove
	**/
	mutating func fox_removeAllInstances(ofObject object: Element) {
		let indexes = fox_indexesOf(object)
		fox_remove(at: indexes)
	}
	
	@available(*, deprecated, renamed: "fox_removeFirst")
	mutating func remove(object: Element) {
		fox_removeFirst(object: object)
	}
}

public extension Array where Element: Hashable {
    
    /** The most common elements contained in the receiver */
     var fox_modes: [Element] {
        /* https://stackoverflow.com/a/38417197 */
        let reduced:[Element: Int] = self.reduce([Element: Int]()) {
            var counts = $0
            counts[$1] = ($0[$1] ?? 0) + 1
            return counts
        }
        guard let max:Int = reduced.values.max() else {
            return [Element]()
        }
        let modes:[Element:Int] = reduced.filter{ $0.value == max }
        return modes.map{ $0.key }.sorted(by: { return $0.hashValue > $1.hashValue })
    }
    
}

