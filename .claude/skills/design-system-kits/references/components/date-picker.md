# DateTimePicker / Calendar

## React Native

```tsx
import { DateTimePicker } from '@momo-kits/date-picker';

<DateTimePicker
  format="DD-MM-YYYY"               // DD-MM-YYYY, HH:mm, DD-MM-YYYY HH:mm
  minuteInterval={1}               // minute interval (1, 5, 10, 15, 30, etc.)
  onChange={(date: Date) => {}}    // called when date/time changes
  selectedValue={new Date()}       // initially selected date/time
  minDate={new Date()}             // minimum selectable date
  maxDate={new Date()}             // maximum selectable date
  arrayLabelTime={[]}              // optional labels for time columns, e.g. ["Ngày", "Tháng", "Năm"]
  style={{}}                       // optional custom styles
/>
```

## Compose

```kotlin
import vn.momo.kits.components.datetimepicker.DateTimePicker
import kotlinx.datetime.LocalDateTime

DateTimePicker(
    modifier = Modifier,                              // optional modifier
    format = "DD-MM-YYYY",                             // DD-MM-YYYY, HH:mm, DD-MM-YYYY HH:mm
    onChange = { date: LocalDateTime -> },             // called when date/time changes
    selectedValue = null,                              // initially selected date/time (LocalDateTime), defaults to now
    minDate = null,                                    // minimum selectable date (LocalDateTime), defaults to -10 years
    maxDate = null,                                    // maximum selectable date (LocalDateTime), defaults to +10 years
    minuteInterval = 1,                                // minute interval (1, 5, 10, 15, 30, etc.)
    arrayLabelTime = emptyList(),                      // optional labels for time columns, e.g. listOf("Ngày", "Tháng", "Năm")
)
```
