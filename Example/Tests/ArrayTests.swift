

import XCTest
import FOXAdditions

class ArrayTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testModes() {
    
        let numbers:[Double] = [1,4,5,8,2,5,3,7,5,4,5,5,8,8,8, 8.000]
        let modes:[Double] = numbers.fox_modes
        XCTAssertEqual([5.0, 8], modes)
    }

}
