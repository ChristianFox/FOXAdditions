
import XCTest
import FOXAdditions

class BinaryFloatingPointTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    //------------------------------------
    // MARK: Mean
    //------------------------------------
    func testMeanWithDoubles() {
    
        let numbers:[Double] = [2.0, 2.0, 4.0, 4.0]
        let result:Double = Double.fox_mean(numbers)
        XCTAssertEqual(3.0, result)
    }

    func testMeanWithFloats() {
    
        let numbers:[Float] = [10.0, 20.0, 30.0, 40.0]
        let result:Float = Float.fox_mean(numbers)
        XCTAssertEqual(25.0, result)
    }

    //------------------------------------
    // MARK: Median
    //------------------------------------
    func testMedianWithDoubles1() {
        
        let numbers:[Double] = [2.0, 2.0, 4.0, 4.0]
        let result:Double = Double.fox_median(numbers)
        XCTAssertEqual(3.0, result)
    }

    func testMedianWithDoubles2() {
        
        let numbers:[Double] = [2.0, 2.0, 3.2, 4.0, 4.0]
        let result:Double = Double.fox_median(numbers)
        XCTAssertEqual(3.2, result)
    }

    func testMedianWithFloats1() {
        
        let numbers:[Float] = [2.0, 2.0, 4.0, 4.0]
        let result:Float = Float.fox_median(numbers)
        XCTAssertEqual(3.0, result)
    }

    func testMedianWithFloats2() {
        
        let numbers:[Float] = [2.0, 2.0, 3.2, 4.0, 4.0]
        let result:Float = Float.fox_median(numbers)
        XCTAssertEqual(3.2, result)
    }

    //------------------------------------
    // MARK: String
    //------------------------------------
    func testString1() {
        
        let num:Double = 1.2345
        let str:String? = num.fox_string(fractionDigits:2)
        XCTAssertEqual("1.23", str)
    }
    
    func testString2() {
        
        let num:Double = 9.126123
        let str:String? = num.fox_string(fractionDigits:2)
        XCTAssertEqual("9.13", str)
    }

    func testString3() {
        
        let num:Double = 9.9999999999
        let str:String? = num.fox_string(fractionDigits:4)
        XCTAssertEqual("10.0000", str)
    }
    
    //------------------------------------
    // MARK: Round
    //------------------------------------
    func testRoundToPlaces1() {
        
        let num:Double = 9.9999999999
        let result:Double = num.fox_round(toPlaces: 3)
        XCTAssertEqual(10.0, result)
    }

    func testRoundToPlaces2() {
        
        let num:Double = 5.38466
        let result:Double = num.fox_round(toPlaces: 3)
        XCTAssertEqual(5.385, result)
    }

    func testRoundToIncrement1() {
        
        let num:Double = 1.23467
        let result:Double = num.fox_round(toIncrement: 0.25)
        XCTAssertEqual(1.25, result)
    }

    func testRoundToIncrement2() {
        
        let num:Double = 1.5010011
        let result:Double = num.fox_round(toIncrement: 0.002)
        XCTAssertEqual(1.502, result)
    }

    
}
