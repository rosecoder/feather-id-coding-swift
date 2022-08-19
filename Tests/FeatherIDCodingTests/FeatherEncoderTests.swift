import XCTest
import FeatherIDCoding

final class FeatherEncoderTests: XCTestCase {

    private let encoder = FeatherEncoder()

    func testEncode() throws {
        XCTAssertEqual(try encoder.encode(id: 0), "0~")
        XCTAssertEqual(try encoder.encode(id: 1), "1~")
        XCTAssertEqual(try encoder.encode(id: 9), "9~")
        XCTAssertEqual(try encoder.encode(id: 10), "A~")
        XCTAssertEqual(try encoder.encode(id: 5719739598897152), "KKXAd")
        XCTAssertEqual(try encoder.encode(id: 6050328667488256), "LVhth")
        XCTAssertEqual(try encoder.encode(id: 5800605981343744), "KcvxJ")
        XCTAssertEqual(try encoder.encode(id: 6247984203300864), "MCe8l")
        XCTAssertEqual(try encoder.encode(id: 5176276851621888), "IOylV")
        XCTAssertEqual(try encoder.encode(id: 5669304938790912), "K93Fh")
        XCTAssertEqual(try encoder.encode(id: 5315863892721664), "Iui03")
        XCTAssertEqual(try encoder.encode(id: 5315863842390016), "Iui00")
        XCTAssertEqual(try encoder.encode(id: 5673428107395072), "K9-Fh")
        XCTAssertEqual(try encoder.encode(id: 5906524572483584), "K_-Fh")
        XCTAssertEqual(try encoder.encode(id: 4546031362506752), "G9fTeW0.")
    }

    func testEncodeInvalidNegative() {
        XCTAssertThrowsError(try encoder.encode(id: -1))
    }
}
