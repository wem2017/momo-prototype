# BottomSheet

> Slides up from bottom — reveals additional content/actions while maintaining parent screen context. Overlay container.

**Package:** `@momo-kits/foundation`
**Platform:** RN ✅ | Compose ✅
**Completeness:** need_update — thiếu Figma
**Figma node:** [VERIFY]

---

## Variant Axes

| Axis | Options | Default |
|------|---------|---------|
| **Type** | `standard` · `surface` | `standard` |

---

## Props

| Prop | Type | Values | Default | Description |
|------|------|--------|---------|-------------|
| `type` | string | `"standard"` \| `"surface"` | `"standard"` | Standard: with handle + backdrop. Surface: no handle, integrated feel [VERIFY] |
| `visible` | boolean | `true` \| `false` | `false` | Controlled visibility |
| `barrierDismissible` | boolean | `true` \| `false` | `true` | Tap backdrop to dismiss |
| `showHandle` | boolean | `true` \| `false` | `true` | Show drag handle indicator [VERIFY] |
| `children` | element | — | required | Sheet content — any components. Scrollable if exceeds height |
| `onDismiss` | function | — | — | Callback khi dismissed. `"onDismiss": "action://closeSheet"` |

---

## Variants

| Type | Handle | Backdrop | Use Case |
|------|--------|---------|----------|
| **standard** | Visible (36x4, `Colors.black_06`) | `Colors.black_20` at 40% opacity | Action lists, selections, additional info |
| **surface** | Hidden | None or minimal | Integrated content that feels part of screen |

---

## States

| State | Appearance |
|-------|-----------|
| **Hidden** | Not rendered |
| **Opening** | Slide up from bottom (300ms ease-out), backdrop fade in |
| **Visible** | Sheet visible, content scrollable if needed. Max 90% screen height |
| **Closing** | Slide down (250ms ease-in), backdrop fade out |

Dismiss triggers: swipe down on handle/content, tap backdrop (if barrierDismissible), system back button, programmatic.

---

## Variant-to-Context Map

| Context | Khi nào dùng | Tránh khi | Ví dụ trong MoMo |
|---------|-------------|-----------|-------------------|
| **Action list** | Secondary actions cho list item | Primary actions → show visible | Share, Export, Report options |
| **Selection** | Choose from <10 options | >10 options → full screen with search | Chọn ngân hàng, chọn lý do |
| **Filter/Sort** | Filter or sort options | Complex multi-field filter → new screen | Lọc giao dịch, sắp xếp |
| **Information** | Additional details without leaving context | Critical decisions → dùng PopupNotify | Chi tiết giao dịch, thông tin thêm |

---

## SSR Pattern

### Action List BottomSheet
```json
{
  "component": "BottomSheet",
  "props": {
    "visible": "{{state.showActions}}",
    "barrierDismissible": true
  },
  "children": [
    {
      "component": "Text",
      "props": {
        "content": "Chia sẻ",
        "typography": "body_default_regular"
      },
      "onPress": "action://share"
    },
    {
      "component": "Divider",
      "props": {}
    },
    {
      "component": "Text",
      "props": {
        "content": "Báo cáo",
        "typography": "body_default_regular"
      },
      "onPress": "action://report"
    }
  ],
  "onDismiss": "setState://showActions=false"
}
```

### Selection BottomSheet
```json
{
  "component": "BottomSheet",
  "props": {
    "visible": "{{state.showBankPicker}}"
  },
  "children": [
    {
      "component": "Text",
      "props": {
        "content": "Chọn ngân hàng",
        "typography": "headline_s_bold"
      }
    },
    {
      "id": "bank_options",
      "type": "section",
      "forEach": "{{data.banks}}",
      "render": {
        "component": "Radio",
        "props": {
          "value": "{{item.id}}",
          "groupValue": "{{state.selectedBank}}",
          "label": "{{item.name}}"
        },
        "onChange": "setState://selectedBank={{item.id}}"
      }
    },
    {
      "component": "Button",
      "props": {
        "variant": "primary",
        "label": "Xác nhận"
      },
      "onPress": "action://confirmBank"
    }
  ],
  "onDismiss": "setState://showBankPicker=false"
}
```

---

## Accessibility

- Focus trap khi sheet open — cannot interact with content behind.
- Handle: accessible label "Kéo xuống để đóng".
- Content announces on open.
- Back button / ESC dismisses.
- All interactive elements meet 44dp touch target.

---

## Usage Guidelines

### Do
- Dùng cho secondary actions, filter/sort, selections (<10 items).
- Show handle cho swipe-to-dismiss affordance.
- Allow backdrop tap to dismiss cho non-critical sheets.
- Keep content concise and scannable.

### Don't
- Không nest bottom sheets trong bottom sheets.
- Không dùng cho lengthy forms → navigate to new screen.
- Không disable swipe-to-dismiss unless data loss possible.
- Không >90% screen height.
- Không dùng cho critical confirmations → dùng **PopupNotify**.
- Không dùng cho persistent content — sheet is dismissible.
