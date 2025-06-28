public struct FeatherDecoder {

    public init() {}

    public enum DecodingError: Error {
        case unexpectedCharacter(Character)
        case overflow
    }

    public func decode(id: String) throws -> Int64 {
        var id = id
        switch id.last {
        case noQuadrupleZerosChar:
            id.removeLast()
        case doubleZerosChar:
            id.replaceSubrange(id.index(id.endIndex, offsetBy: -1)..<id.endIndex, with: "00")
        default:
            id += "0000"
        }

        var result: Int64 = 0
        for character in id {
            guard let index = rixits.firstIndex(of: character) else {
                throw DecodingError.unexpectedCharacter(character)
            }
            let newResult = result.multipliedReportingOverflow(by: 64)
            guard !newResult.overflow else {
                throw DecodingError.overflow
            }
            let finalResult = newResult.partialValue.addingReportingOverflow(Int64(index))
            guard !finalResult.overflow else {
                throw DecodingError.overflow
            }
            result = finalResult.partialValue
        }
        return result
    }
}
