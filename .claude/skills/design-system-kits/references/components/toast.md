# Toast

## React Native

```tsx
import { ApplicationContext } from '@momo-kits/foundation';

const {navigator} = useContext(ApplicationContext);

navigator?.maxApi?.showToast({
                title: 'Saved successfully',
                type: 'success',                // 'success'|'warning'|'network'|'default'
                undoTitle: "Back",
                onUndoPress: () => {
                  Alert.alert('Show toast');
                },
              });
```


## Compose

Toast uses the **MaxApi bridge** — no standalone Composable:

```kotlin
import vn.momo.kits.navigation.LocalMaxApi

val maxApi = LocalMaxApi.current
    
maxApi?.showToast(
    params = mapOf(
        "title" to "Saved successfully",
        "type" to "success",
        "undoTitle" to "Undo",
    ),
    callback = { result -> },
)
```

> `LocalMaxApi` is `null` outside a properly set up navigation tree. For inline banner notifications use **SnackBar** (`snackbar.md`).

## Key Differences

| Feature | React Native | Compose |
|---------|-------------|---------|
| API | `navigator.maxApi` | `LocalMaxApi.current` |
| Inline composable | Not available | Not available |
| Navigation dependency | Required | Required |
