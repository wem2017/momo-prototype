# Colors Reference

Both platforms share identical color token names and values.

## Import

| Platform | Import |
|----------|--------|
| React Native | `import { Colors } from '@momo-kits/foundation'` |
| Compose | `import vn.momo.kits.const.Colors` |

Usage is identical: `Colors.pink_03`, `Colors.black_17`, etc.

---

## Grayscale (black_01 – black_20)

| Token | Hex | Notes |
|-------|-----|-------|
| `black_01` | #FFFFFF | White |
| `black_02` | #F9F9F9 | |
| `black_03` | #F0F0F0 | Border disable |
| `black_04` | #E8E8E8 | Border default |
| `black_05` | #E5E5E5 | |
| `black_06` | #D8D8D8 | |
| `black_07` | #CCCCCC | |
| `black_08` | #C6C6C6 | Text disable |
| `black_09` | #B9B9B9 | |
| `black_10` | #A0A0A0 | |
| `black_11` | #878787 | |
| `black_12` | #727272 | Text hint |
| `black_13` | #646464 | |
| `black_14` | #565656 | |
| `black_15` | #484848 | Text secondary |
| `black_16` | #404040 | |
| `black_17` | #303233 | Text default |
| `black_18` | #242424 | |
| `black_19` | #18191A | |
| `black_20` | #000000 | Black |

---

## Brand Color Families

Each family has 11 tint levels: **01** (darkest) → **11** (lightest). Levels 07–11 are suitable for backgrounds and containers.

### pink — Brand / primary

| Token | Hex | Token | Hex |
|-------|-----|-------|-----|
| `pink_01` | #BC2678 | `pink_07` | #F7ACD5 |
| `pink_02` | #D42A87 | `pink_08` | #FBD5EA |
| `pink_03` | #EB2F96 | `pink_09` | #FDEAF4 |
| `pink_04` | #ED43A0 | `pink_10` | #FEF4FA |
| `pink_05` | #EF59AB | `pink_11` | #FEF8FC |
| `pink_06` | #F382C0 | | |

Special: `pink_MoMo_Branding` = #A50064

### violet — Accents, special features

| Token | Hex | Token | Hex |
|-------|-----|-------|-----|
| `violet_01` | #7822C0 | `violet_07` | #D5AAF9 |
| `violet_02` | #8726D8 | `violet_08` | #EAD4FC |
| `violet_03` | #962AF0 | `violet_09` | #F4E9FD |
| `violet_04` | #A03FF1 | `violet_10` | #FAF4FE |
| `violet_05` | #AB55F3 | `violet_11` | #FCF8FE |
| `violet_06` | #C07FF6 | `violet_11_stroke` | #DFE1E5 |

### indigo — Accents

| Token | Hex | Token | Hex |
|-------|-----|-------|-----|
| `indigo_01` | #3E3CCC | `indigo_07` | #B8B7FF |
| `indigo_02` | #4644E6 | `indigo_08` | #DCDBFF |
| `indigo_03` | #4E4BFF | `indigo_09` | #EDEDFF |
| `indigo_04` | #5F5DFF | `indigo_10` | #F6F6FF |
| `indigo_05` | #716FFF | `indigo_11` | #F9F9FF |
| `indigo_06` | #9593FF | | |

### blue — Interactive

| Token | Hex | Token | Hex |
|-------|-----|-------|-----|
| `blue_01` | #0062CC | `blue_07` | #99CAFF |
| `blue_02` | #006EE6 | `blue_08` | #CCE4FF |
| `blue_03` | #007AFF | `blue_09` | #E5F1FF |
| `blue_04` | #1987FF | `blue_10` | #F2F8FF |
| `blue_05` | #3395FF | `blue_11` | #F7FBFF |
| `blue_06` | #66AFFF | | |

### mint — Highlight

| Token | Hex | Token | Hex |
|-------|-----|-------|-----|
| `mint_01` | #0F9B9B | `mint_07` | #A1E7E7 |
| `mint_02` | #11AFAF | `mint_08` | #D0F3F3 |
| `mint_03` | #13C2C2 | `mint_09` | #E7F8F8 |
| `mint_04` | #2AC8C8 | `mint_10` | #F3FCFC |
| `mint_05` | #42CECE | `mint_11` | #F8FDFD |
| `mint_06` | #71DADA | | |

### green — Success

| Token | Hex | Token | Hex |
|-------|-----|-------|-----|
| `green_01` | #2A9F47 | `green_07` | #AEE9BD |
| `green_02` | #2FB350 | `green_08` | #D6F4DE |
| `green_03` | #34C759 | `green_09` | #EAF9EE |
| `green_04` | #48CC69 | `green_10` | #F5FCF6 |
| `green_05` | #5DD27A | `green_11` | #F9FDFA |
| `green_06` | #85DD9B | | |

### lime — Accents

| Token | Hex | Token | Hex |
|-------|-----|-------|-----|
| `lime_01` | #80AE0E | `lime_07` | #D9F0A0 |
| `lime_02` | #90C30F | `lime_08` | #ECF7CF |
| `lime_03` | #A0D911 | `lime_09` | #F5FBE7 |
| `lime_04` | #A9DC28 | `lime_10` | #FAFDF3 |
| `lime_05` | #B3E141 | `lime_11` | #FCFEF8 |
| `lime_06` | #C6E870 | | |

### yellow — Accents

| Token | Hex | Token | Hex |
|-------|-----|-------|-----|
| `yellow_01` | #CCA300 | `yellow_07` | #FFEB99 |
| `yellow_02` | #E6B800 | `yellow_08` | #FFF5CC |
| `yellow_03` | #FFCC00 | `yellow_09` | #FFF9E5 |
| `yellow_04` | #FFD119 | `yellow_10` | #FFFCF2 |
| `yellow_05` | #FFD633 | `yellow_11` | #FFFDF7 |
| `yellow_06` | #FFE066 | | |

### gold — Gold accents

| Token | Hex | Token | Hex |
|-------|-----|-------|-----|
| `gold_01` | #C87012 | `gold_07` | #FDD1A2 |
| `gold_02` | #E17E14 | `gold_08` | #FEE8D0 |
| `gold_03` | #FA8C16 | `gold_09` | #FEF3E7 |
| `gold_04` | #FA972D | `gold_10` | #FFF9F3 |
| `gold_05` | #FBA345 | `gold_11` | #FEFBF8 |
| `gold_06` | #FCBA73 | | |

### orange — Warning

| Token | Hex | Token | Hex |
|-------|-----|-------|-----|
| `orange_01` | #C84316 | `orange_07` | #FDBBA4 |
| `orange_02` | #E14C19 | `orange_08` | #FEDDD2 |
| `orange_03` | #FA541C | `orange_09` | #FEEDE8 |
| `orange_04` | #FA6532 | `orange_10` | #FFF6F3 |
| `orange_05` | #FB7649 | `orange_11` | #FEFAF8 |
| `orange_06` | #FC9877 | | |

### red — Error / danger

| Token | Hex | Token | Hex |
|-------|-----|-------|-----|
| `red_01` | #C41B24 | `red_07` | #FBA7AB |
| `red_02` | #DD1F29 | `red_08` | #FDD3D5 |
| `red_03` | #F5222D | `red_09` | #FEE8EA |
| `red_04` | #F63842 | `red_10` | #FEF4F4 |
| `red_05` | #F74E57 | `red_11` | #FEF8F8 |
| `red_06` | #F97A81 | | |

### Quick Usage

- Brand: `Colors.pink_03`
- Interactive links/buttons: `Colors.blue_03`
- Error/danger: `Colors.red_03`
- Success: `Colors.green_03`
- Warning: `Colors.orange_03`
- Highlight: `Colors.mint_03`

---

## Rule

**Never hardcode hex values.** Always use `Colors.*` tokens for consistency across themes and platforms.
