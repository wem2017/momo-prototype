# TopNavMiniApp

> Header cho mini-app — pill combo với "more" + "quit" buttons bắt buộc. Khác hoàn toàn TopNav native.

**Package:** `@momo-kits/foundation` [VERIFY]
**Platform:** RN ✅ | Compose ❌ [VERIFY]
**Completeness:** need_update — thiếu Figma (không tìm thấy trong library), thiếu Dev Zip reference riêng
**Figma node:** không tìm thấy trong `ZP6qAaBcmkB8j2XmR2uXCv` — có thể ở file khác [VERIFY]

---

## Props

| Prop | Type | Values | Default | Description |
|------|------|--------|---------|-------------|
| `title` | string | — | required | Mini-app name |
| `showMoreButton` | boolean | `true` \| `false` | `true` | "More" button trong pill. BẮT BUỘC [VERIFY] |
| `showQuitButton` | boolean | `true` \| `false` | `true` | "Quit" (X) button trong pill. BẮT BUỘC [VERIFY] |
| `rightPillActions` | array | — | `["more", "quit"]` | Pill combo actions [VERIFY] |
| `onMorePress` | function | — | — | Callback khi tap More |
| `onQuitPress` | function | — | — | Callback khi tap Quit (X). `"onQuitPress": "action://closeMiniApp"` |
| `onBackPress` | function | — | — | Callback khi tap Back (nếu có) |

> **CRITICAL:** Mini-app TopNav PHẢI có pill combo (more + quit). Đây là platform requirement — không thể remove.

---

## States

| State | Title Color | Pill Style | Behavior |
|-------|------------|-----------|----------|
| **Default** | `Colors.black_17` | Outlined pill | Static |
| **Scrolled** | `Colors.black_17` | Outlined pill | Shadow/border appear |

> Mini-app TopNav đơn giản hơn native TopNav — ít background variations.

---

## Variant-to-Context Map

| Context | Khi nào dùng | Tránh khi | Ví dụ trong MoMo |
|---------|-------------|-----------|-------------------|
| **Third-party mini-app** | App bên thứ 3 chạy trong MoMo container | Native MoMo feature → dùng **TopNav** | Game, dịch vụ partner (Grab, Tiki trong MoMo) |
| **Internal mini-app** | Feature MoMo build dưới dạng mini-app | Full native screen → dùng **TopNav** | Campaign pages, event pages |

> **Phân biệt:** Nếu là native MoMo feature → dùng **TopNav** (compact). Nếu là mini-app → dùng **TopNavMiniApp**. Chọn sai = toàn bộ navigation pattern sai.

---

## SSR Pattern

### Mini-app Screen
```json
{
  "navigation": {
    "headerType": "miniapp",
    "headerTitle": { "type": "text", "title": "{{data.miniAppName}}" },
    "rightPill": ["more", "quit"]
  },
  "layout": [
    {
      "id": "miniapp_content",
      "type": "section",
      "children": []
    }
  ],
  "actions": {
    "quit": { "type": "action", "handler": "closeMiniApp" },
    "more": { "type": "action", "handler": "openMiniAppMenu" }
  }
}
```

---

## Accessibility

- Quit button: accessible label "Đóng mini-app" hoặc "Thoát".
- More button: accessible label "Tùy chọn" hoặc "Menu".
- Title: announce mini-app name.

---

## Usage Guidelines

### Do
- LUÔN có pill combo (more + quit) — platform requirement.
- Title hiển thị tên mini-app rõ ràng.
- Quit button close mini-app hoàn toàn, return về MoMo.

### Don't
- KHÔNG remove quit button — user phải luôn có exit path.
- KHÔNG dùng cho native MoMo features — dùng **TopNav**.
- KHÔNG custom pill layout — giữ nguyên more + quit order.
