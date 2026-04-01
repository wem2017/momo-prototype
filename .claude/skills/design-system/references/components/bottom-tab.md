# BottomTabBar

> Fixed bottom navigation bar cho app-level navigation giữa top-level screens. 3–5 tabs + optional FAB.

**Package:** `@momo-kits/foundation`
**Platform:** RN ✅ | Compose ❌ (dùng BottomNavigation Material3)
**Completeness:** need_update — Figma node ID unresolved
**Figma node:** [VERIFY]

---

## Variant Axes

| Property | Type | Values | Description |
|----------|------|--------|-------------|
| type | variant | default · special | Default = standard tabs. Special = center FAB elevated |
| itemCount | variant | 2 · 3 · 4 · 5 | Số tabs. Special type chỉ support 3 hoặc 5 [VERIFY] |

---

## Props

| Prop | Type | Values | Default | Description |
|------|------|--------|---------|-------------|
| `type` | string | `"default"` \| `"special"` | `"default"` | Tab bar type |
| `tabs` | array | Tab objects (2-5) | required | Tab configuration. Mỗi tab: `{ icon, label, screen, badge }` |
| `activeTab` | number | index (0-based) | `0` | Currently active tab index |
| `itemCount` | number | `2` \| `3` \| `4` \| `5` | — | Số tabs [VERIFY] |
| `onTabPress` | function | — | — | Callback khi tap tab. `"onTabPress": "navigate://TabScreen"` |

### Tab Object

| Property | Type | Values | Description |
|----------|------|--------|-------------|
| `icon` | string | icon name | Tab icon |
| `label` | string | — | Tab text. 1 word max (2 short words). Nouns, not verbs |
| `screen` | string | screen name | Navigation target |
| `badge` | string | `"hidden"` \| `"smallDotBadge"` \| `"largeDotBadge"` \| `"numericBadge"` \| `"textBadge"` | Badge type per tab |
| `badgeValue` | string/number | — | Badge content. Number hoặc text ("Mới"). "99+" for overflow |
| `isFAB` | boolean | `true` \| `false` | Center tab là FAB (chỉ dùng với type=special) |

---

## Variants

| Type | Description | Tab Count | Center Tab |
|------|-----------|-----------|------------|
| **default** | Standard evenly distributed tabs | 2-5 | Normal |
| **special** | Center tab elevated (FAB-style) cho primary action | 3 hoặc 5 only | Circular, elevated, `Colors.pink_03` background |

---

## States

### Tab States

| State | Icon Color | Label Color | Indicator |
|-------|-----------|------------|-----------|
| **Active** | `Colors.pink_03` | `Colors.pink_03` | 2px bar, `Colors.pink_03` |
| **Inactive** | `Colors.black_12` | `Colors.black_12` | Hidden |

- Active indicator: horizontal slide animation khi switch tabs.
- Chỉ 1 tab active tại mỗi thời điểm.

### Badge Types

| Badge | Color | Text | Use Case |
|-------|-------|------|----------|
| `hidden` | — | — | No badge |
| `smallDotBadge` | `Colors.red_03` | — | Unread/new indicator nhỏ |
| `largeDotBadge` | `Colors.red_03` | — | Unread indicator lớn hơn |
| `numericBadge` | `Colors.red_03` | `Colors.white`, count | Notification count. "99+" overflow |
| `textBadge` | `Colors.red_03` | `Colors.white`, text | Short text ("Mới") |

---

## Variant-to-Context Map

| Type + Count | Khi nào dùng | Tránh khi | Ví dụ trong MoMo |
|-------------|-------------|-----------|-------------------|
| **Default, 5 tabs** | App chính MoMo với đầy đủ navigation | — | Home / Khám phá / [+] / Chat / Cá nhân |
| **Special, 5 tabs** | App chính với primary action (tạo mới, scan) | Primary action không cần prominence | Home / Search / [FAB Scan] / Chat / Profile |
| **Default, 3 tabs** | Feature đơn giản, ít destinations | Cần >3 top-level sections | Sub-feature với 3 sections |
| **Default, 4 tabs** | Balanced navigation | — | App có 4 main sections rõ ràng |

### Tab Count Rules

| Count | Recommendation |
|-------|---------------|
| 2 | Không recommended — dùng segmented control hoặc toggle |
| 3 | Ideal — clean layout |
| 4 | Good — balanced |
| 5 | Maximum — keep labels very short |
| 6+ | KHÔNG ĐƯỢC — dùng navigation pattern khác |

---

## SSR Pattern

### Main App Shell
```json
{
  "navigation": {
    "headerType": "default",
    "headerTitle": { "type": "text", "title": "Trang chủ" },
    "backgroundType": "compact",
    "bottomTab": {
      "type": "special",
      "activeTab": 0,
      "tabs": [
        { "icon": "home", "label": "Trang chủ", "screen": "Home", "badge": "hidden" },
        { "icon": "search", "label": "Khám phá", "screen": "Explore", "badge": "hidden" },
        { "icon": "scan", "label": "Quét mã", "screen": "Scan", "isFAB": true },
        { "icon": "chat", "label": "Chat", "screen": "Chat", "badge": "numericBadge", "badgeValue": 3 },
        { "icon": "user", "label": "Cá nhân", "screen": "Profile", "badge": "smallDotBadge" }
      ]
    }
  }
}
```

### Simple 3-tab Navigation
```json
{
  "navigation": {
    "bottomTab": {
      "type": "default",
      "activeTab": 0,
      "tabs": [
        { "icon": "list", "label": "Danh sách", "screen": "List", "badge": "hidden" },
        { "icon": "chart", "label": "Thống kê", "screen": "Stats", "badge": "hidden" },
        { "icon": "settings", "label": "Cài đặt", "screen": "Settings", "badge": "hidden" }
      ]
    }
  }
}
```

---

## Composition with Other Components

| Component | Behavior |
|-----------|----------|
| **Toast** | Appears above BottomTabBar khi cả 2 visible |
| **TopNav** | TopNav top + BottomTabBar bottom = standard screen shell |
| **Popup** | Overlay full screen bao gồm BottomTabBar |
| **Badge** | Dùng built-in badge system — KHÔNG stack external Badge component lên |

---

## Accessibility

- Mỗi tab phải có accessible label: icon label + state ("Trang chủ, tab đang chọn").
- Badge count announce: "Chat, 3 thông báo mới".
- FAB: accessible label mô tả action ("Quét mã QR").
- Tab switch announce: "Đã chuyển sang Chat".
- Không hide tab bar khi scroll — luôn accessible.

---

## Usage Guidelines

### Do
- Dùng cho primary app-level navigation (3–5 destinations).
- Keep labels 1 word (max 2 short words). Nouns, not verbs.
- Show badges CHỈ cho actionable unread notifications.
- Maintain scroll position per tab khi switching.
- All icons cùng style (outline HOẶC filled — không mix).

### Don't
- Không dùng >5 tabs.
- Không abbreviate labels ("LS.GD" → "Lịch sử").
- Không mix icon styles across tabs.
- Không dùng cho secondary/nested navigation — dùng back navigation.
- Không hide tab bar on scroll.
- Không đặt destructive actions trong tab bar.
