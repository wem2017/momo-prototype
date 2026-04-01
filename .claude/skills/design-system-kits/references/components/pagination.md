# Pagination

## React Native

```tsx
import { Pagination, PaginationScroll } from '@momo-kits/foundation';

<Pagination
  type="default"                            // 'default'|'black_white'|'number'|'scroll'; default: 'default'
  activeIndex={currentPage}
  dataLength={10}
  style={{}}
/>

// PaginationScroll — wraps scrollable content with progress indicator
<PaginationScroll style={{}}>
  {items.map(item => <Card key={item.id} />)}
</PaginationScroll>
```

### Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `type` | `'default' \| 'black_white' \| 'number' \| 'scroll'` | `'default'` | Visual style variant |
| `activeIndex` | `number` | — | Currently active page index (0-based) |
| `dataLength` | `number` | — | Total number of pages |
| `style` | `ViewStyle` | — | Custom wrapper style |

> **Direct exports:** `PaginationDot`, `PaginationNumber`, `PaginationWhiteDot` are also exported individually for RN use.
> **PaginationScroll** wraps scrollable content with a progress indicator bar.

## Compose

```kotlin
import vn.momo.kits.components.PaginationDot
import vn.momo.kits.components.PaginationNumber
import vn.momo.kits.components.PaginationScroll
import vn.momo.kits.components.PaginationWhiteDot

PaginationDot(activeIndex = 1, dataLength = 5)      // 0-based index
PaginationNumber(activeIndex = 2, dataLength = 10) // shows "3/10"
PaginationWhiteDot(activeIndex = 0, dataLength = 3) // with dark background pill
PaginationScroll(modifier = Modifier.fillMaxWidth()) {
    // scrollable content here
}
```
