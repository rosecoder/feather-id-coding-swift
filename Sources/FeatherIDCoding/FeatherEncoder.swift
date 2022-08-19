public struct FeatherEncoder {

    public init() {}

    public enum EncodingError: Error {
        case invalidRange
    }

    public func encode(id number: Int64) throws -> String {
        guard number >= 0 else {
            throw EncodingError.invalidRange
        }

        var residual = number
        var result = ""
        while (true) {
            let rixit = residual % 64
            result.insert(rixits[Int(rixit)], at: result.startIndex)
            residual = Int64((Double(residual) / 64).rounded(.down))

            if residual == 0 {
                break
            }
        }
        if result.hasSuffix("0000") {
            result.removeSubrange(result.index(result.endIndex, offsetBy: -4)..<result.endIndex)
        } else if result.hasSuffix("00") {
            result.replaceSubrange(result.index(result.endIndex, offsetBy: -2)..<result.endIndex, with: [doubleZerosChar])
        } else {
            result.append(noQuadrupleZerosChar)
        }
        return result
    }
}
