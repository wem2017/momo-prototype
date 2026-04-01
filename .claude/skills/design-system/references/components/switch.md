# Switch

> Toggle control cho binary on/off settings — state thay đổi ngay khi tap, không cần confirm.

**Package:** `@momo-kits/foundation`
**Platform:** RN ✅ | Compose ✅
**Completeness:** need_update — thiếu Figma
**Figma node:** [VERIFY]

---

## Props

| Prop | Type | Values | Default | Description |
|------|------|--------|---------|-------------|
| `value` | boolean | `true` \| `false` | `false` | Current on/off state |
| `disabled` | boolean | `true` \| `false` | `false` | Non-interactive state |
| `label` | string | — | — | Title label alongside switch [VERIFY] |
| `onChange` | function | — | — | Callback khi toggle. `"onChange": "setState://settingName"` |

---

## States

| State | Track Color | Thumb Color | Opacity | Interactive |
|-------|-----------|-----------|---------|-------------|
| **Off** | `Colors.black_04` | `Colors.white` | 1 | true |
| **On** | `Colors.pink_03` | `Colors.white` | 1 | true |
| **Disabled Off** | `Colors.black_04` | `Colors.white` | reduced | false |
| **Disabled On** | `Colors.pink_03` | `Colors.white` | reduced | false |

Thumb slides smoothly between left (off) → right (on) with animation.

---

## Variant-to-Context Map

| Context | Khi nào dùng | Tránh khi | Ví dụ trong MoMo |
|---------|-------------|-----------|-------------------|
| **Setting toggle** | Binary on/off setting có effect ngay | Cần submit → dùng CheckBox | Bật/tắt thông báo, bật/tắt sinh trắc học |
| **Feature enable** | Enable/disable feature | Chọn giữa 2 options khác nhau → dùng Radio | Bật Dark mode, bật Face ID |
| **Preference** | User preference có effect ngay | — | Ẩn số dư, hiển thị gợi ý |

---

## SSR Pattern

### Settings List
```json
{
  "id": "settings_section",
  "type": "section",
  "forEach": "{{data.settings}}",
  "render": {
    "id": "setting_row",
    "type": "row",
    "children": [
      {
        "component": "Text",
        "props": {
          "content": "{{item.label}}",
          "typography": "body_default_regular"
        }
      },
      {
        "component": "Switch",
        "props": {
          "value": "{{item.enabled}}",
          "label": "{{item.label}}"
        },
        "onChange": "setState://setting_{{item.key}}"
      }
    ]
  }
}
```

---

## Accessibility

- Screen readers announce: title label, current state (on/off), role (switch/toggle).
- Tapping toggles state và announce new state.
- Entire row (label + switch) tappable.

---

## Usage Guidelines

### Do
- Dùng cho instant settings — effect ngay khi toggle.
- Provide title label mô tả what switch controls.
- Đặt trong settings screens / preference panels.

### Don't
- Không dùng cho form selections cần submit → dùng **CheckBox**.
- Không dùng cho chọn giữa 2 distinct options → dùng **Radio** / segmented control.
- Không group switches mutual-exclusive → đó là Radio behavior.
