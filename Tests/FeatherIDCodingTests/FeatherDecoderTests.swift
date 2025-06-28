import FeatherIDCoding
import Testing

@Suite struct FeatherDecoderTests {

    private let decoder = FeatherDecoder()

    @Test(arguments: [
        ("0~", 0),
        ("1~", 1),
        ("9~", 9),
        ("A~", 10),
        ("KKXAd", 5_719_739_598_897_152),
        ("LVhth", 6_050_328_667_488_256),
        ("KcvxJ", 5_800_605_981_343_744),
        ("MCe8l", 6_247_984_203_300_864),
        ("IOylV", 5_176_276_851_621_888),
        ("K93Fh", 5_669_304_938_790_912),
        ("Iui03", 5_315_863_892_721_664),
        ("Iui00", 5_315_863_842_390_016),
        ("K9-Fh", 5_673_428_107_395_072),
        ("K_-Fh", 5_906_524_572_483_584),
        ("G9fTeW000~", 4_546_031_362_506_752),
        ("G9fTeW0.", 4_546_031_362_506_752),
    ])
    func decode(id: String, expected: Int64) throws {
        #expect(try decoder.decode(id: id) == expected)
    }

    @Test(arguments: ["KKXAå", "IjVNIe0"]) func decodeInvalid(id: String) throws {
        #expect(throws: (any Error).self) {
            try decoder.decode(id: id)
        }
    }
}
