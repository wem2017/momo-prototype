# SnackBar

## Compose

```kotlin
import vn.momo.kits.navigation.component.SnackBar
import vn.momo.kits.navigation.LocalNavigator

val navigator = LocalNavigator.current

navigator.showSnackBar(
    SnackBar.Custom(
        duration = 3000L,
        content = {
            Row(Modifier.fillMaxWidth().padding(Spacing.M)) {
                Text("Operation completed!")
            }
        }
    ),
    onDismiss = { }                  // called when snackbar is dismissed
)

navigator.hideSnackBar()             // programmatically dismiss
```

### SnackBar variants

```kotlin
// Custom content snackbar
SnackBar.Custom(
    content = { Text("Done!") },
    duration = 3000L,
)

// Toast-only snackbar (no custom content — uses built-in styling)
SnackBar.Toast(duration = 3000L)
```

### Screen-level via ScreenHelper

```kotlin
import vn.momo.kits.navigation.LocalScreenHelper

val screenHelper = LocalScreenHelper.current
screenHelper.showSnackBar(snackBar, onDismiss)
screenHelper.hideSnackBar()
```

## React Native

SnackBar is not available in React Native. Use **Toast** instead.

