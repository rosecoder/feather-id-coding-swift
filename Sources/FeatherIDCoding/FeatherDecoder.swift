public struct FeatherDecoder {

    public init() {}

    public enum DecodingError: Error {
        case unexpectedCharacter(Character)
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
            result = result * 64 + Int64(index)
        }
        return result
    }
}
