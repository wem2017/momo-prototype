# Divider

## React Native

```tsx
import { Divider } from '@momo-kits/foundation';

<Divider />                                          // default: solid, with vertical margin
<Divider useMargin={false} />                        // no vertical margin
<Divider type="dash" />                            // dashed line (uses DashDivider internally)
<Divider type="default" />                         // solid line; default
<Divider style={{ marginVertical: 8 }} />         // custom style
```

## Compose

```kotlin
import vn.momo.kits.components.Divider

Divider()
```
