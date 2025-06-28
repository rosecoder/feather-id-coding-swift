import FeatherIDCoding
import Testing

@Suite struct FeatherEncoderTests {

    private let encoder = FeatherEncoder()

    @Test(arguments: [
        (0, "0~"),
        (1, "1~"),
        (9, "9~"),
        (10, "A~"),
        (5_719_739_598_897_152, "KKXAd"),
        (6_050_328_667_488_256, "LVhth"),
        (5_800_605_981_343_744, "KcvxJ"),
        (6_247_984_203_300_864, "MCe8l"),
        (5_176_276_851_621_888, "IOylV"),
        (5_669_304_938_790_912, "K93Fh"),
        (5_315_863_892_721_664, "Iui03"),
        (5_315_863_842_390_016, "Iui00"),
        (5_673_428_107_395_072, "K9-Fh"),
        (5_906_524_572_483_584, "K_-Fh"),
        (4_546_031_362_506_752, "G9fTeW0."),
    ]) func encode(id: Int64, expected: String) throws {
        #expect(try encoder.encode(id: id) == expected)
    }

    @Test func encodeInvalidNegative() throws {
        #expect(throws: (any Error).self) {
            try encoder.encode(id: Int64(-1))
        }
    }
}
