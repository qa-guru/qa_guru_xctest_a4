import XCTest

final class CalculatorUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    override func tearDownWithError() throws {}
    
    func testExample() throws {
        app.launch()
        
        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
    
    func testSum() throws {
        app.launch()
        let button2 = app/*@START_MENU_TOKEN@*/.staticTexts["2"]/*[[".buttons[\"2\"].staticTexts[\"2\"]",".staticTexts[\"2\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.firstMatch
        button2.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["+"]/*[[".buttons[\"+\"].staticTexts[\"+\"]",".staticTexts[\"+\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        button2.tap()
        app.buttons["="].tap()
        XCTAssert(app.buttons["resultString"].staticTexts["4"].exists)
    }
    
    func testSub() throws {
        app.launch()
        let button7 = app.staticTexts["7"].firstMatch
        let button8 = app.staticTexts["8"].firstMatch
        button7.tap()
        app.staticTexts["-"].tap()
        button8.tap()
        app.buttons["="].tap()
        XCTAssert(app.buttons["resultString"].staticTexts["-1"].exists)
    }
    
    func testMult() throws {
        app.launch()
        let button4 = app.staticTexts["4"].firstMatch
        let button5 = app.staticTexts["5"].firstMatch
        button4.tap()
        app.staticTexts["x"].tap()
        button5.tap()
        app.buttons["="].tap()
        XCTAssert(app.buttons["resultString"].staticTexts["20"].exists)
    }
    
    func testDiv() throws {
        app.launch()
        let button8 = app.staticTexts["8"].firstMatch
        let button2 = app.staticTexts["2"].firstMatch
        button8.tap()
        app.staticTexts["÷"].tap()
        button2.tap()
        app.buttons["="].tap()
        XCTAssert(app.buttons["resultString"].staticTexts["4"].exists)
    }
    
    func testDivByZero() throws {
        app.launch()
        let button8 = app.staticTexts["8"].firstMatch
        let button0 = app.buttons["zeroButton"].firstMatch
        button8.tap()
        app.staticTexts["÷"].tap()
        button0.tap()
        app.buttons["="].tap()
        XCTAssert(app.staticTexts["На ноль делить нельзя!"].exists)
    }
    
    func testWarTime() throws {
        app.launch()
        let button2 = app.buttons["2"].staticTexts["2"].firstMatch
        let buttonDot = app.staticTexts["."].firstMatch
        let button7 = app.staticTexts["7"].firstMatch
        let button0 = app.buttons["zeroButton"].firstMatch
        button2.doubleTap()
        buttonDot.tap()
        button0.tap()
        app.staticTexts["÷"].tap()
        button7.tap()
        app.buttons["="].tap()
        let res = app.buttons["resultString"].staticTexts.firstMatch.label
        XCTAssertLessThanOrEqual(Double(res)!, 3.14, "Военное время! Значение пи превышает 3,14")
    }
}
