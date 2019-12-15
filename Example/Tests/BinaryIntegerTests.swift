

import XCTest

class BinaryIntegerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func testMeanWithInt() {
        
        let numbers:[Int] = [1,2,3,4,5,6,7,8,9,-1,-2,-3,-4,-5,-6,-7,-8,-9]
        let result:Int = Int.fox_mean(numbers)
        XCTAssertEqual(0, result)
    }
 
    func testMeanWithUInt() {
        
        let numbers:[UInt] = [1,2,3,4,5,6,7,8,9]
        let result:UInt = UInt.fox_mean(numbers)
        XCTAssertEqual(5, result)
    }
    
    func testMedianWithInt() {
        
        let numbers:[Int] = [1,2,3,4,5,6,7,8,9, 0, -1,-2,-3,-4,-5,-6,-7,-8,-9]
        let result:Int = Int.fox_median(numbers)
        XCTAssertEqual(0, result)
    }

    func testMedianWithUInt() {
        
        let numbers:[UInt] = [1,2,3,4,5,6,7,8,9]
        let result:UInt = UInt.fox_median(numbers)
        XCTAssertEqual(5, result)
    }

}
