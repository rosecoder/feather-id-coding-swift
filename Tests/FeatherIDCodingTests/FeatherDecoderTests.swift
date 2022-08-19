import XCTest
import FeatherIDCoding

final class FeatherDecoderTests: XCTestCase {

    private let decoder = FeatherDecoder()

    func testDecode() throws {
        XCTAssertEqual(try decoder.decode(id: "0~"), 0)
        XCTAssertEqual(try decoder.decode(id: "1~"), 1)
        XCTAssertEqual(try decoder.decode(id: "9~"), 9)
        XCTAssertEqual(try decoder.decode(id: "A~"), 10)
        XCTAssertEqual(try decoder.decode(id: "KKXAd"), 5719739598897152)
        XCTAssertEqual(try decoder.decode(id: "LVhth"), 6050328667488256)
        XCTAssertEqual(try decoder.decode(id: "KcvxJ"), 5800605981343744)
        XCTAssertEqual(try decoder.decode(id: "MCe8l"), 6247984203300864)
        XCTAssertEqual(try decoder.decode(id: "IOylV"), 5176276851621888)
        XCTAssertEqual(try decoder.decode(id: "K93Fh"), 5669304938790912)
        XCTAssertEqual(try decoder.decode(id: "Iui03"), 5315863892721664)
        XCTAssertEqual(try decoder.decode(id: "Iui00"), 5315863842390016)
        XCTAssertEqual(try decoder.decode(id: "K9-Fh"), 5673428107395072)
        XCTAssertEqual(try decoder.decode(id: "K_-Fh"), 5906524572483584)
        XCTAssertEqual(try decoder.decode(id: "G9fTeW000~"), 4546031362506752)
        XCTAssertEqual(try decoder.decode(id: "G9fTeW0."), 4546031362506752)
    }

    func testDecodeInvalidCharacter() {
        XCTAssertThrowsError(try decoder.decode(id: "KKXAå"))
    }
}
