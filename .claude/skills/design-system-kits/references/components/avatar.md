# Avatar

## React Native

```tsx
import { Avatar } from '@momo-kits/avatar';

<Avatar
  size={48}                                        // 24|32|40|48|56|72  (default: 32)
  image="https://..."                              // image URL; falls back to initials or icon
  name="John Doe"                                  // shows initials when no image
  rounded={true}                                   // circular shape; default: true
  showIconMomo={false}                             // shows MoMo logo badge (top-right)
  showIconSupport={false}                          // shows support icon badge (bottom-right)
  iconSupport="https://..."                        // custom support icon URL; defaults to built-in
  accessibilityLabel="Avatar of John"             // for automated testing
/>
```

## Compose

```kotlin
import vn.momo.kits.components.Avatar
import vn.momo.kits.components.AvatarSize

Avatar(
    modifier = Modifier,
    size = AvatarSize.SIZE_48,     // SIZE_24 | SIZE_32 | SIZE_40 | SIZE_48 | SIZE_56 | SIZE_72
    rounded = true,
    name = "John Doe",             // initials fallback
    image = "https://...",        // image URL fallback
    showIconMomo = false,
    showIconSupport = false,
    accessibilityLabel = "Avatar of John",
)
```

**Fallback priority:** `image` → `name` (initials) → default person icon. Badge icons only shown when `rounded=true`.

## Key Differences

| Feature | React Native | Compose |
|---------|-------------|---------|
| Size | `number` (px) | `AvatarSize` enum |
| Badge icons | Always shown | Only when `rounded=true` |
