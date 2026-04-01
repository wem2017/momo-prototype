# Spacing & Radius Reference

## Spacing

| Token | Value | RN Type | Compose Type |
|-------|-------|---------|-------------|
| `Spacing.XXS` | 2 | number | Dp |
| `Spacing.XS` | 4 | number | Dp |
| `Spacing.S` | 8 | number | Dp |
| `Spacing.M` | 12 | number | Dp |
| `Spacing.L` | 16 | number | Dp |
| `Spacing.XL` | 24 | number | Dp |
| `Spacing.XXL` | 32 | number | Dp |
| `Spacing.Size3XL` | 48 | number | Dp |
| `Spacing.Size4XL` | 56 | number | Dp |
| `Spacing.Size5XL` | 64 | number | Dp |

### Import

| Platform | Import |
|----------|--------|
| React Native | `import { Spacing } from '@momo-kits/foundation'` |
| Compose | `import vn.momo.kits.const.Spacing` |

> **Note:** Compose `Spacing.L`, `Spacing.M`, `Spacing.S` are already `Dp` values — do NOT call `.dp` on them.

---

## Radius

| Token | Value | Use for |
|-------|-------|---------|
| `Radius.XXS` | 2 | Subtle rounding |
| `Radius.XS` | 4 | Small elements |
| `Radius.S` | 8 | Cards, inputs |
| `Radius.M` | 12 | Medium containers |
| `Radius.L` | 16 | Modals, sheets |
| `Radius.XL` | 24 | Pills, chips |

### Import

| Platform | Import |
|----------|--------|
| React Native | `import { Radius } from '@momo-kits/foundation'` |
| Compose | `import vn.momo.kits.const.Radius` |
