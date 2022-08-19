# FeatherIDCoding

Lightweight encoding and decoding for numberized ids to shorter url-allowed string.

## Usage

```
import FeatherIDCoding

const a = FeatherEncoder().encode(id: 5719739598897152)
// a is "KKXAd"

const b = FeatherDecoder().decode(id: "KKXAd")
// b is 5719739598897152
```
