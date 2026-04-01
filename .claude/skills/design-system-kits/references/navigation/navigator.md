# Navigator API

The `Navigator` class handles all screen transitions. Obtained from `ApplicationContext` (RN) or `LocalNavigator` (Compose).

## React Native

Access via `ApplicationContext`:

```tsx
import { ApplicationContext } from '@momo-kits/foundation';

const { navigator } = useContext(ApplicationContext);
```

### push (horizontal slide)

```tsx
navigator.push({ screen: DetailScreen, itemId: 123 });
// With options:
navigator.push({
  screen: DetailScreen,
  options: { headerTitle: 'Detail' },
  itemId: 123,
});
```

### pop

```tsx
navigator.pop();       // pop 1 screen
navigator.pop(2);      // pop 2 screens
```

### popToTop

```tsx
navigator.popToTop();  // pop all screens to root
```

### present (vertical slide — full-screen modal)

```tsx
navigator.present({ screen: FullScreenModal });
```

### replace (replace current screen)

```tsx
navigator.replace({ screen: NewScreen, options: { headerTitle: 'New' } });
```

### reset (reset navigation stack)

```tsx
navigator.reset({ screen: HomeScreen });
```

### showModal (overlay dialog)

```tsx
navigator.showModal(
  {
    screen: PopupContent,
    barrierDismissible: true,
    onDismiss: () => {},
    modalStyle: { backgroundColor: 'transparent' },
  },
  (error) => console.log(error), // optional onError
);
```

See `modal.md` for `ModalParams` details.

### showBottomSheet

```tsx
navigator.showBottomSheet(
  {
    screen: SheetContent,
    options: { title: 'Sheet Title' },
    surface: true,
    draggable: true,
  },
  (error) => console.log(error), // optional onError
);
```

See `bottomsheet.md` for `BottomSheetParams` details.

### navigate (bottom tab only)

```tsx
navigator.navigate('Home');  // switch to tab by route name
```

### setDismissData / setCurrentContext

```tsx
navigator.setDismissData(data);           // store data for dismiss callback
navigator.setCurrentContext({             // set app context for kit features
  code: 'mini_app_code',
  name: { vi: 'Tên', en: 'Name' },
  description: { vi: 'Mô tả', en: 'Description' },
  icon: 'ic_app',
});
```

### Type Reference

```tsx
type ScreenParams = {
  screen: React.ComponentType<NavigationScreenProps>;  // required — component, not string
  options?: NavigationOptions;
  [key: string]: any;  // additional params passed as props
};
```

### Navigator vs Navigation

| Class | Scope | Access | Methods |
|-------|-------|--------|---------|
| `Navigator` | Global | `ApplicationContext.navigator` | `push`, `pop`, `present`, `replace`, `reset`, `showModal`, `showBottomSheet`, `popToTop`, `navigate` |
| `Navigation` | Per-screen | Injected as `navigation` prop | `setOptions(NavigationOptions)` |

---

## Compose

```kotlin
import vn.momo.kits.navigation.LocalNavigator

val navigator = LocalNavigator.current
```

### Push (horizontal slide)

```kotlin
navigator.push(
    content = { DetailScreen(item) },
    options = NavigationOptions(
        headerTitle = HeaderTitle.Default("Detail"),
        backgroundColor = Colors.black_02,
    )
)
```

### Pop

```kotlin
navigator.pop()                  // pop 1 screen
navigator.pop(count = 2)        // pop 2 screens
```

### Present (vertical slide — full-screen modal)

```kotlin
navigator.present(content = { FullScreenModal() })
```

### Replace (replace current screen)

```kotlin
navigator.replace(content = { NewScreen() })
```

### Reset (reset navigation stack)

```kotlin
navigator.reset(content = { HomeScreen() })
```

### Modal, BottomSheet, SnackBar

See dedicated reference files:
- `modal.md` — `navigator.showModal()`
- `bottomsheet.md` — `navigator.showBottomSheet()`
- `snackbar.md` (in components) — `navigator.showSnackBar()`
