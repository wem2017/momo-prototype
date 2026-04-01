# Swipe

## React Native

```tsx
import { Swipe } from '@momo-kits/swipe';

const swipeRef = useRef<SwipeableRef>(null);

<Swipe
  ref={swipeRef}
  rightActions={[
    { label: 'Delete', icon: '24_navigation_close', backgroundColor: Colors.red_03, onPress: onDelete },
    { label: 'Archive', icon: '24_navigation_close', backgroundColor: Colors.blue_03, onPress: onArchive },
  ]}
>
  <ListItem />
</Swipe>

// Ref methods
swipeRef.current?.openLeft();
swipeRef.current?.openRight();
swipeRef.current?.close();
```

Package: `@momo-kits/swipe`

## Compose

```kotlin
import vn.momo.kits.components.Swipe
import vn.momo.kits.components.SwipeAction

Swipe(
    height = 56.dp,
    itemRadius = 0.dp,
    leftActions = listOf(SwipeAction(label = "Delete", icon = "24_navigation_close", onPress = { })),
    rightActions = listOf(SwipeAction(label = "Archive", icon = "24_navigation_close", onPress = { })),
    onSwipeableOpen = { },
    onSwipeableClose = { },
    onSwipeableLeftOpen = { },
    onSwipeableRightOpen = { },
) {
    ListItem()
}
```

## Key Differences

| Feature | React Native | Compose |
|---------|-------------|---------|
| Row height | `style.height` | `height` param (default 56dp) |
| Action limit | — | Max 3 per side |
| Animation | Native driver | `Animatable` + `tween(200)` |
| Gesture | Built-in swipeable | `detectHorizontalDragGestures` |
