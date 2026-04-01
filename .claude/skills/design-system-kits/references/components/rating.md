# Rating

## React Native

```tsx
import { Rating } from '@momo-kits/rating';

<Rating
  numOfStars={5}                    // total number of stars (required)
  rating={4.5}                      // current rating value (required), supports half stars
  onRatingChange={(rating) => setRating(rating)}  // called with new rating on change (required)
  size="large"                      // 'small' (16px) | 'medium' (20px) | 'large' (24px)
  style={{}}                        // optional custom styles
/>
```

Package: `@momo-kits/rating`

## Compose

```kotlin
import vn.momo.kits.components.Rating
import vn.momo.kits.components.RatingSize

Rating(
    numOfStars = 5,
    rating = 4.5f,               // supports half stars
    onRatingChange = { newRating -> },  // omit for read-only
    size = RatingSize.LARGE,    // SMALL | MEDIUM | LARGE
)
```

## Key Differences

| Feature | React Native | Compose |
|---------|-------------|---------|
| Half stars | Yes | Yes |
| Size | `string` | `RatingSize` enum |
| Interactive | `onRatingChange` required | Optional |
