# Steps

> Step progress indicator — numbered circles + connecting lines for multi-step flows. Shows current position.

**Package:** `@momo-kits/step`
**Platform:** RN ✅ | Compose ❌ (build with Row)
**Completeness:** need_update — thiếu Figma
**Figma node:** [VERIFY]

---

## Props

| Prop | Type | Values | Default | Description |
|------|------|--------|---------|-------------|
| `steps` | array | `[{ label }]` | required | List of step definitions |
| `current` | number | 0-based index | `0` | Current active step index |
| `showLabels` | boolean | `true` \| `false` | `true` | Show text labels below circles [VERIFY] |

### Step Object

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `label` | string | yes | Step description text (e.g., "Chi tiết", "Thanh toán", "Xác nhận") |

---

## States (per step)

| State | Circle Background | Circle Content | Label Color | Connecting Line |
|-------|------------------|---------------|------------|----------------|
| **Completed** | `Colors.pink_03` | White check icon (✓) | `Colors.black_17` | `Colors.pink_03` (to next completed/current) |
| **Current** | `Colors.pink_03` | White step number | `Colors.black_17` | `Colors.black_04` (to next upcoming) |
| **Upcoming** | `Colors.black_04` | `Colors.black_17` step number | `Colors.black_08` | `Colors.black_04` |

Steps evenly distributed across full width. Labels centered below circles.

---

## Variant-to-Context Map

| Context | Khi nào dùng | Tránh khi | Ví dụ trong MoMo |
|---------|-------------|-----------|-------------------|
| **Checkout flow** | Multi-step purchase/payment | Single page form | Thanh toán: Chi tiết → Xác nhận → Hoàn thành |
| **Registration** | Step-by-step onboarding | Simple 1-page signup | eKYC: Thông tin → CMND → Selfie → Hoàn thành |
| **Wizard** | Complex form broken into sections | ≤2 steps → just use buttons | Đăng ký dịch vụ mới |

---

## SSR Pattern

### Checkout Steps
```json
{
  "component": "Steps",
  "props": {
    "steps": [
      { "label": "Chi tiết" },
      { "label": "Thanh toán" },
      { "label": "Xác nhận" }
    ],
    "current": "{{state.currentStep}}"
  }
}
```

---

## Accessibility

- Each step announces: label + number + state ("Bước 1, Chi tiết, hoàn thành").
- Current step clearly identified: "Bước 2, Thanh toán, bước hiện tại".
- Overall progress context: "Bước 2 trong 4".
- Not rely solely on color — check icon (completed) + number (current/upcoming) provide distinction.

---

## Usage Guidelines

### Do
- Dùng cho linear multi-step flows (checkout, registration, onboarding).
- Keep labels short — 1-2 words.
- Limit 3-5 steps for readability.
- Show completed check icon → user confidence.

### Don't
- Không dùng cho tab navigation → dùng **TabView**.
- Không dùng cho percentage progress → dùng **ProgressInfo**.
- Không allow tap upcoming steps to skip ahead (unless flow supports non-linear).
- Không >5 steps — break flow into sections or simplify.
- Không dùng cho page indicators → dùng **Pagination**.
