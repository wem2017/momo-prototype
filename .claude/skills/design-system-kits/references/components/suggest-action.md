# SuggestAction

## React Native

```tsx
import { SuggestAction } from '@momo-kits/suggest-action';

const suggestRef = useRef<SuggestActionRef>(null);

<SuggestAction
  ref={suggestRef}
  message="Don't forget to complete your profile!"  // message text (required, default: 'Message')
  buttonTitle="Complete"                           // button text (required, default: 'Button')
  boldMessage="complete your profile"              // portion of message to bold-highlight
  image="https://..."                             // optional image
  onPressButton={() => {}}                       // button pressed callback
  onClose={() => {}}                             // close icon or dismissed callback
  bottom={72}                                    // bottom offset in pixels (default: 72)
/>

// Ref methods
suggestRef.current?.show();
```

Package: `@momo-kits/suggest-action`

## Compose

```kotlin
import vn.momo.kits.components.SuggestAction

SuggestAction(
    message = "Don't forget to complete your profile!",
    buttonTitle = "Complete",
    boldMessage = "complete your profile",   // case-insensitive bold substring
    image = "https://...",
    visible = true,
    onClose = { },
    onPressButton = { },
    modifier = Modifier,
)
```

> Wrap in a state: `visible` controls show/hide with `AnimatedVisibility`.

## Key Differences

| Feature | React Native | Compose |
|---------|-------------|---------|
| Visibility | `ref?.show()` | `visible` state param |
| Animation | Built-in | `AnimatedVisibility` |
| Close button | Always shown | Always shown |
| Image size | Fixed | 32dp |
