# DatePicker

> Calendar-based date selection — single date, date range, or multiple dates. Month grid (RN) or format-driven (Compose).

**Package:** `@momo-kits/date-picker` (RN) / built-in (Compose)
**Platform:** RN ✅ | Compose ✅
**Completeness:** need_update — thiếu Figma
**Figma node:** [VERIFY]

---

## Variant Axes

| Axis | Options | Default |
|------|---------|---------|
| **Mode** | `single` · `range` · `multiple` | `single` |
| **Platform** | RN (calendar grid) · Compose (format-driven DD-MM-YYYY) | per platform |

---

## Props

| Prop | Type | Values | Default | Description |
|------|------|--------|---------|-------------|
| `mode` | string | `"single"` \| `"range"` \| `"multiple"` | `"single"` | Selection mode |
| `value` | varies | Date (single), `{ start, end }` (range), `[Date]` (multiple) | — | Current selected value |
| `minDate` | date | — | — | Earliest selectable date. Dates before → disabled |
| `maxDate` | date | — | — | Latest selectable date. Dates after → disabled |
| `format` | string | date format pattern | `"DD-MM-YYYY"` | Display format (Compose) [VERIFY] |
| `showTimePicker` | boolean | `true` \| `false` | `false` | Include time selection (Compose: HH:mm) [VERIFY] |
| `onChange` | function | — | — | Callback khi date selected. `"onChange": "setState://selectedDate"` |

---

## Day Cell States

| State | Background | Text Color | Description |
|-------|-----------|-----------|-------------|
| **Default** | Transparent | `Colors.black_17` | Normal selectable date |
| **Today** | Transparent | `Colors.pink_03` | Current date highlight |
| **Selected** | `Colors.pink_03` circle | `Colors.white` | User-chosen date |
| **Disabled** | Transparent | `Colors.black_08` | Outside min/max range |
| **Range start** | `Colors.pink_03` (left-rounded) | `Colors.white` | First date in range |
| **Range end** | `Colors.pink_03` (right-rounded) | `Colors.white` | Last date in range |
| **In range** | `Colors.pink_09` (light pink) | `Colors.pink_03` | Dates between start/end |
| **Other month** | Transparent | `Colors.black_08` | Adjacent month dates |

---

## Variant-to-Context Map

| Mode | Khi nào dùng | Tránh khi | Ví dụ trong MoMo |
|------|-------------|-----------|-------------------|
| **single** | Pick one specific date | Date range needed | Chọn ngày sinh, ngày hẹn |
| **range** | Select start + end date | Single date needed | Lọc lịch sử giao dịch, đặt phòng |
| **multiple** | Select multiple individual dates | Continuous range → dùng range mode | Chọn nhiều ngày nghỉ |

---

## SSR Pattern

### Single Date Selection
```json
{
  "component": "DatePicker",
  "props": {
    "mode": "single",
    "value": "{{state.selectedDate}}",
    "minDate": "{{data.today}}",
    "maxDate": "{{data.maxBookingDate}}"
  },
  "onChange": "setState://selectedDate"
}
```

### Date Range Filter
```json
{
  "component": "DatePicker",
  "props": {
    "mode": "range",
    "value": {
      "start": "{{state.startDate}}",
      "end": "{{state.endDate}}"
    },
    "minDate": "{{data.earliestTransaction}}"
  },
  "onChange": "setState://dateRange"
}
```

---

## Accessibility

- Each day cell announces full date: "26 tháng 3 năm 2026".
- Selected dates announce selected state.
- Disabled dates: announced as disabled, not focusable/tappable.
- Navigation arrows: "Tháng trước", "Tháng sau".
- Range mode: announce context "Ngày bắt đầu: 20 tháng 3. Ngày kết thúc: 26 tháng 3."
- Today distinguishable: "Hôm nay, 20 tháng 3 năm 2026".

---

## Usage Guidelines

### Do
- Dùng cho date selection trong forms, booking, scheduling.
- Highlight today cho reference point.
- Disable dates outside valid range.
- Show selected date in text field bên ngoài calendar cho confirmation.
- Range mode cho check-in/check-out, date filters.

### Don't
- Không dùng cho time-only selection → dùng dedicated time picker.
- Không allow selection of disabled dates.
- Không show quá nhiều months — month-by-month navigation.
- Không hide current month/year — user cần context.
- Không dùng cho relative dates ("7 ngày gần nhất") → dùng **Chip** preset options.
