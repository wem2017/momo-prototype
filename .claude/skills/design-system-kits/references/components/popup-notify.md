# PopupNotify (Dialog)

## React Native

```tsx
import { PopupNotify } from '@momo-kits/foundation';

<PopupNotify
  title="Delete Item?"                 // dialog title (default: 'Title')
  description="This action cannot be undone."  // description text or ReactNode
  image={imageSource}                 // optional image/illustration URL
  error=""                           // optional error code text
  primary={{
    title: 'Delete',
    onPress: handleDelete,
  }}
  secondary={{
    title: 'Cancel',
    onPress: handleCancel,
  }}
  buttonDirection="row"               // 'row'|'column'|'auto' (default: 'row')
  onIconClose={handleClose}          // X button pressed callback
  onRequestClose={handleClose}       // back button or tap-outside callback
/>
```

## Compose

```kotlin
import vn.momo.kits.components.PopupNotify
import vn.momo.kits.components.PopupNotifyProps
import vn.momo.kits.components.PopupAction
import vn.momo.kits.components.PopupActionDirection

// Show via navigator.showModal:
val navigator = LocalNavigator.current

navigator.showModal(content = {
    PopupNotify(
        props = PopupNotifyProps(
            title = "Confirm Action",              // dialog title (default: "Title")
            description = "Are you sure you want to proceed?",  // description text
            image = "",                           // optional image URL
            error = "",                          // optional error code text
            primary = PopupAction(
                title = "Confirm",
                onPress = { handleConfirm() },
            ),
            secondary = PopupAction(
                title = "Cancel",
                onPress = { navigator.pop() },
            ),
            buttonDirection = PopupActionDirection.ROW, // ROW, COLUMN, AUTO (default: ROW)
            onIconClose = { navigator.pop() },         // X button pressed callback (required)
            isShowCloseIcon = true,                    // show/hide X button (default: true)
        )
    )
})
```

## Key Differences

| Feature | React Native | Compose |
|---------|-------------|---------|
| Rendering | `<PopupNotify>` as JSX | `navigator.showModal { PopupNotify(...) }` |
| Props | Direct props | Wrapped in `PopupNotifyProps` |
| Actions | JS objects `{ title, onPress }` | `PopupAction(title, onPress?)` |
| Dismiss | `onRequestClose` / `onIconClose` | `navigator.pop()` via `onIconClose` |
| Close icon visibility | Always shown when `onIconClose` is set | Via `isShowCloseIcon` param |
