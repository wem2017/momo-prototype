# Carousel

## React Native

```tsx
import { Carousel } from '@momo-kits/carousel';

<Carousel
  data={items}
  renderItem={({ item, index }) => <Card>...</Card>}
  autoplay={false}                                   // auto-advances slides; default: false
  autoplayDelay={1000}                               // delay before autoplay starts (ms); default: 1000
  autoplayInterval={3000}                            // interval between slides (ms); default: 3000
  loop={false}                                       // infinite loop; default: false
  loopClonesPerSide={3}                              // clone count per side for loop; default: 3
  snapToInterval={300}                               // snap width; default: itemWidth
  enableSnap={true}                                  // enable snap-to-item; default: true
  firstItem={0}                                      // initial slide index; default: 0
  scrollEnabled={true}                               // allow user scroll; default: true
  disableIntervalMomentum={Platform.OS === 'android'} // default: true on Android
  activeSlideOffset={20}                             // active slide detection threshold; default: 20
  inactiveSlideOpacity={1}                           // opacity of inactive slides; default: 1
  inactiveSlideScale={1}                             // scale of inactive slides; default: 1
  apparitionDelay={0}                                // delay before carousel appears (ms); default: 0
  itemWidth={300}                                    // fixed item width; default: auto-calculated
  visibleItem={1}                                    // number of visible items; default: 1
  full={false}                                       // use full container width; default: false
  slideStyle={{}}                                    // style applied to each slide item
  style={{}}                                         // container style
  contentContainerStyle={{}}                        // content container style
  onSnapToItem={(index) => {}}                       // called when snapping to an item
  onScrollIndexChanged={(index) => {}}               // called when visible index changes
  onScroll={(event) => {}}                           // raw scroll event
  onMomentumScrollEnd={(event) => {}}               // called after momentum scroll ends
  onTouchStart={(event) => {}}                       // touch start event
  onTouchEnd={(event) => {}}                         // touch end event
  onLayout={(event) => {}}                           // layout event
  keyExtractor={(item, index) => `${item.id}`}       // key extractor
  getItemLayout={(data, index) => ({ length: 300, offset: 300 * index, index })}
/>
```

Package: `@momo-kits/carousel`

## Compose

```kotlin
import vn.momo.kits.components.Carousel

Carousel(
    itemCount = items.size,
    modifier = Modifier,
    loop = false,                         // infinite loop; default: false
    autoplay = false,                     // auto-advance slides; default: false
    autoplayInterval = 3000L,             // ms between slides
    enableSnap = true,                    // default: true
    scrollEnabled = true,                 // default: true
    inactiveSlideOpacity = 1f,            // default: 1f
    inactiveSlideScale = 1f,             // default: 1f
    onSnapToItem = { index -> },
    onScrollIndexChanged = { index -> },
) { index ->
    Card(items[index])
}
```

## Key Differences

| Feature | React Native | Compose |
|---------|-------------|---------|
| Data source | `data` + `renderItem` | `itemCount` + `content` slot |
| Loop | `loop` | `loop` (virtual page ×1000) |
| Pagination | `Pagination` prop | Manual via `onScrollIndexChanged` |
