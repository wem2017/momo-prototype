# PopupPromotion

## React Native

```tsx
import { PopupPromotion } from '@momo-kits/foundation';

<PopupPromotion
  image="https://example.com/promotion.jpg"
  onIconClose={handleClose}
  onRequestClose={handleClose}
  onActionClick={handleAction}
/>
```

## Compose

```kotlin
import vn.momo.kits.components.PopupPromotion

PopupPromotion(
    source = "https://example.com/promotion.jpg",
    onClose = { handleClose() },
    onPress = { handleAction() },
)
```

## Key Differences

| Feature | React Native | Compose |
|---------|-------------|---------|
| Image source | `image` | `source` |
| Close handler | `onIconClose` | `onClose` |
| Action click | `onActionClick` | `onPress` |
| Back button / touch-outside dismiss | `onRequestClose` | Not available |
