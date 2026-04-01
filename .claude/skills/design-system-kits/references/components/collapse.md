# Collapse

## React Native

```tsx
import { Collapse } from '@momo-kits/collapse';

<Collapse
  title="More details"                             // header text; required
  expandDefault={false}                            // initial expanded state; default: false
  onPress={(isExpanded) => {}}                     // called on header press with current state
  description="Optional subtitle text"             // shown below title
  image="https://..."                              // optional icon/image left of title
  imageSize={24}                                   // 24|32|40; default: 24
  subTitle="Optional sub label"                    // shown right of title (replaced by tagProps)
  tagProps={{ label: 'Tag', type: 'info' }}        // shown right of title (replaces subTitle)
  titleSize="medium"                               // 'small'|'medium'|'large'; default: 'medium'
  showBorder={false}                               // show border between header and content
  useBackgroundCollapseButton={false}              // use filled icon button instead of plain icon
  headerAlign="flex-start"                         // 'flex-start'|'flex-end'|'center'; default: 'flex-start'
  scrollEnabled={false}                            // make content scrollable; default: false
  scrollContentMaxHeight={240}                     // max height when scrollEnabled; default: 240
  nestedScrollEnabled={false}                      // enable nested scrolling; default: false
  disabledAnimated={false}                         // disable expand/collapse animation; default: false
  backgroundColor="#FFFFFF"                        // custom background color
  titleColor="#000000"                              // custom title text color
  accessibilityLabel="Collapse section"           // custom accessibility label
>
  <Text typography="body_default_regular">Hidden content</Text>
</Collapse>
```

Package: `@momo-kits/collapse`

### Ref

```tsx
import { Collapse, CollapseHandle } from '@momo-kits/collapse';
import { useRef } from 'react';

const collapseRef = useRef<CollapseHandle>(null);

<Collapse ref={collapseRef} title="Section" expandDefault={false}>
  ...
</Collapse>;

// Programmatic control
collapseRef.current?.setExpanded(true); // expand
collapseRef.current?.setExpanded(false); // collapse
const isExpanded = collapseRef.current?.expanded; // read state
```

## Compose

```kotlin
import vn.momo.kits.components.Collapse
import vn.momo.kits.components.CollapseTitleSize
import vn.momo.kits.components.TagColor

Collapse(
    title = "More details",
    modifier = Modifier,
    description = "Optional subtitle",
    image = "https://...",
    imageSize = 24,
    subTitle = "Right label",
    tagLabel = "Tag",
    tagColor = TagColor.Default,
    showBorder = false,
    expandDefault = false,
    titleSize = CollapseTitleSize.Medium,  // Small | Medium | Large
    useBackgroundCollapseButton = false,
    backgroundColor = null,
    titleColor = null,
    onPress = { isExpanded -> },
    accessibilityId = "Collapse/section",
) {
    Text("Hidden content")
}
```

## Key Differences

| Feature | React Native | Compose |
|---------|-------------|---------|
| Expand state | Via `ref` | Internal state (no ref) |
| Content | Children | `content` slot |
| Title size | `string` | `CollapseTitleSize` enum |
| Programmatic control | `ref?.setExpanded()` | Not available |
