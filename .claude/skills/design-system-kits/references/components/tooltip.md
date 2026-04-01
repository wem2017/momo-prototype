# Tooltip

## React Native

```tsx
import { Tooltip } from '@momo-kits/animated-tooltip';
import type { TooltipRef, TooltipButton } from '@momo-kits/tooltip';

const tooltipRef = useRef<TooltipRef>(null);

<Tooltip
  ref={tooltipRef}
  placement="top"                      // 'top' | 'bottom' | 'left' | 'right' (default: 'top')
  align="center"                      // 'start' | 'center' | 'end' (default: 'center')
  title="Title"
  description="Helpful hint"
  buttons={[
    { title: 'Action', onPress: () => {} },
  ]}
  onVisibleChange={(visible) => {}}
  onPressClose={() => {}}
  accessibilityLabel="info_tooltip"
  containerStyle={{}}
>
  <Button title="Info" type="text" />
</Tooltip>

// Ref methods
tooltipRef.current?.show();
tooltipRef.current?.hide();
```

Package: `@momo-kits/animated-tooltip`

### Types

```tsx
type TooltipButton = {
  title?: string;
  icon?: string;
  onPress?: () => void;
};

type TooltipRef = {
  show: () => void;
  hide: () => void;
};
```

## Compose

```kotlin
import vn.momo.kits.components.Tooltip
import vn.momo.kits.components.TooltipButton
import vn.momo.kits.components.rememberTooltipState

val state = rememberTooltipState()

Tooltip(
    state = state,
    title = "Title",                    // optional tooltip title
    description = "Helpful hint",       // tooltip description text
    buttons = listOf(                  // optional action buttons
        TooltipButton(title = "Action", onPress = { })
    ),
    placement = TooltipPlacement.TOP, // TOP | BOTTOM | LEFT | RIGHT (default: TOP)
    align = TooltipAlign.CENTER,       // START | CENTER | END (default: CENTER)
    onVisibleChange = { visible -> }, // visibility change callback
    onPressClose = {},                // close button pressed callback
    modifier = Modifier,
) {
    Button(
        title = "Show tooltip",
        onClick = { state.show() },
        size = Size.SMALL,
    )
}

// State methods
state.show()
state.hide()
state.toggle()
```

### Types

```kotlin
enum class TooltipPlacement { TOP, BOTTOM, LEFT, RIGHT }
enum class TooltipAlign { START, CENTER, END }
data class TooltipButton(
    val title: String? = null,
    val icon: String? = null,
    val onPress: (() -> Unit)? = null,
)
```
