# Top Navigation

> Screen header cho native features — cung cấp navigation context, title, và actions. Mọi screen PHẢI có TopNav.

**Package:** `@momo-kits/foundation` [VERIFY]
**Platform:** RN ✅ | Compose ✅ [VERIFY]
**Completeness:** need_update — đã có Figma data, thiếu GitBook PDF riêng cho TopNav
**Figma node:** `13028:10861` — Component Set, 29 variants

---

## Variant Axes

| Property | Type | Values | Description |
|----------|------|--------|-------------|
| `Header type` | variant | `title` · `user name` · `location` · `journey` · `full page search` · `onboarding` · `forWL` | Loại nội dung hiển thị trong header |
| `Background` | variant | `compact` · `expand` · `dark banner` · `light banner` · `none` | Kiểu nền của header |
| `hasSearch` | variant (boolean) | `true` · `false` | Có hiển thị search bar trong header không |
| `isScrolled` | variant (boolean) | `true` · `false` | Trạng thái đã scroll — tự động chuyển Background → none |
| `hasExtension` | boolean | `true` · `false` | Hiển thị extended area bên dưới header |
| `extendedNavigation` | instance swap | — | Component đặt vào extended area (TabView, SegmentControl, etc.) |

> `isScrolled` do hệ thống tự quản lý, không cần set trong Design Spec. `none` background CHỈ cho scrolled state.

---

## Props

| Prop | Type | Values | Default | Description |
|------|------|--------|---------|-------------|
| `headerType` | string | `"title"` \| `"user name"` \| `"location"` \| `"journey"` \| `"full page search"` \| `"onboarding"` \| `"forWL"` | `"title"` | Loại header. Xem Variants section cho chi tiết |
| `headerTitle` | object | `{ type, title }` \| `{ type, avatar, name, description }` \| `{ type, location, description }` | required | Title configuration — structure phụ thuộc headerType (xem bảng dưới) |
| `backgroundType` | string | `"compact"` \| `"expand"` \| `"dark banner"` \| `"light banner"` \| `"none"` | `"compact"` | Kiểu nền header |
| `hasSearch` | boolean | `true` \| `false` | `false` | Hiển thị search bar trong header |
| `showBackButton` | boolean | `true` \| `false` | `true` | Hiển thị nút back (chevron left) |
| `rightActions` | array | icon names | `[]` | Right-side action icons. Max 2-3. VD: `["search", "more"]` |
| `hasNotice` | boolean | `true` \| `false` | `false` | Notice indicator dot trên action icon |
| `bannerImage` | string | URL | — | Banner image URL. Dùng với `dark banner` / `light banner` |
| `hasExtension` | boolean | `true` \| `false` | `false` | Extended area bên dưới header |
| `extendedNavigation` | object | component config | — | Component trong extended area. VD: TabView, SegmentControl |
| `enableKeyboardAvoidingView` | boolean | `true` \| `false` | `false` | Screen có input → auto-avoid keyboard [VERIFY] |

### headerTitle Object — theo headerType

| headerType | headerTitle structure | Ví dụ |
|-----------|---------------------|-------|
| `title` | `{ "type": "text", "title": "Screen Name" }` | `{ "type": "text", "title": "Chuyển tiền" }` |
| `user name` | `{ "type": "user", "avatar": "url", "name": "Name", "description": "Status" }` | `{ "type": "user", "avatar": "{{data.avatar}}", "name": "{{data.name}}", "description": "Online" }` |
| `location` | `{ "type": "location", "location": "Address", "description": "Detail" }` | `{ "type": "location", "location": "Q.7, HCM", "description": "Gần bạn" }` |
| `journey` | `{ "type": "journey", "title": "Step Name" }` [VERIFY] | `{ "type": "journey", "title": "Xác thực danh tính" }` |
| `full page search` | `{ "type": "search" }` [VERIFY] | `{ "type": "search" }` |
| `onboarding` | `{ "type": "onboarding", "title": "Step" }` [VERIFY] | `{ "type": "onboarding", "title": "Chào mừng" }` |
| `forWL` | `{ "type": "whitelabel", "title": "App Name" }` [VERIFY] | RESTRICTED — không dùng khi chưa có confirm |

---

## Variants

### Header Types

| Header Type | Mô tả | Props riêng |
|------------|-------|-------------|
| **title** | Standard screen title. DEFAULT choice | `title` (text) |
| **user name** | User/contact header với avatar | `name`, `description`, `avatar`, `showDescription`, `showStatusUser` [VERIFY] |
| **location** | Location context header | `location`, `description`, `showDescription` |
| **journey** | Multi-step flow với progress context | [VERIFY — cần xác nhận props riêng] |
| **full page search** | Dedicated search screen — search bar chiếm toàn bộ header | [VERIFY — cần xác nhận props riêng] |
| **onboarding** | Onboarding flow — skip-able, minimal navigation | [VERIFY — cần xác nhận props riêng] |
| **forWL** | White label. ⚠️ RESTRICTED — chưa có confirm từ system | [VERIFY] |

### Background Types

| Background | Visual | Khi nào dùng | Tránh khi |
|-----------|--------|-------------|-----------|
| **compact** | Pink nhạt. Text/icons đen | DEFAULT cho native features | Screen có hero image |
| **expand** | Pink nhạt. Mở rộng area | Cần search + extended area trong header | Simple detail screen |
| **dark banner** | Transparent trên dark image. Text/icons trắng | Hero image/banner tối phía sau header | Image quá sáng — không đủ contrast |
| **light banner** | Transparent trên light image. Text/icons đen | Hero image/banner sáng phía sau header | Image quá tối — không đủ contrast |
| **none** | White/transparent. Text/icons đen | CHỈ scrolled state — KHÔNG dùng làm default | Làm background mặc định |

**Rules:** `compact` là default. `dark banner` vs `light banner` phụ thuộc tone ảnh bên dưới. `none` tự switch khi scroll — không bao giờ là trạng thái ban đầu.

---

## States

| State | Background | Text/Icon Color | Search Bar | Extension | Behavior |
|-------|-----------|----------------|-----------|-----------|----------|
| **Default (compact)** | Pink nhạt | Đen | optional | optional | Static |
| **Scrolled** | Chuyển sang `none` (white) | Đen | ẩn nếu có | giữ nguyên | Auto-transition khi user scroll |
| **Dark banner** | Transparent trên dark image | Trắng | optional | optional | Floating trên image |
| **Light banner** | Transparent trên light image | Đen | optional | optional | Floating trên image |

---

## Variant-to-Context Map

| Header Type | Background | hasSearch | Khi nào dùng | Ví dụ trong MoMo |
|-------------|-----------|----------|-------------|-------------------|
| `title` | `compact` | `false` | Standard screen. DEFAULT choice | Chuyển tiền, Lịch sử GD, Cài đặt |
| `title` | `compact` | `true` | Screen cần search trong header | Danh bạ, Tìm dịch vụ |
| `title` | `expand` | `true` | Screen cần search + extended area | Home screen với search bar |
| `title` | `expand` | `false` | Header mở rộng không có search | Screen cần subtitle/filter trong header |
| `title` | `dark banner` | `false` | Screen có hero image tối | Campaign detail, Merchant page (ảnh tối) |
| `title` | `light banner` | `false` | Screen có hero image sáng | Profile với banner sáng |
| `user name` | `compact` | `false` | Chat/contact screen | Chat với người nhận chuyển tiền |
| `user name` | `expand` | `false` | Profile view mở rộng | Xem profile user |
| `user name` | `dark banner` | `false` | Profile với banner tối | Profile page với cover photo |
| `location` | `compact` | `false` | Screen có location context | ATM/PGD gần đây |
| `location` | `expand` | `false` | Location + extended info | Map view với filter |
| `journey` | `compact` | `false` | Multi-step flow | KYC flow, Mở tài khoản |
| `full page search` | `compact` | `false` | Dedicated search screen | Trang tìm kiếm chính |
| `onboarding` | `compact` | `false` | Onboarding flow | First-time intro |

> **Không phải tất cả 7×5 combinations đều tồn tại.** Chỉ 29 variants có trong Figma. ui-composer chỉ dùng những combinations listed ở trên.

---

## SSR Pattern

### Standard Screen (title + compact)
```json
{
  "navigation": {
    "headerType": "title",
    "headerTitle": { "type": "text", "title": "Chuyển tiền" },
    "backgroundType": "compact",
    "hasSearch": false,
    "showBackButton": true,
    "rightActions": ["search"],
    "enableKeyboardAvoidingView": true
  }
}
```

### User Header (chat screen)
```json
{
  "navigation": {
    "headerType": "user name",
    "headerTitle": {
      "type": "user",
      "avatar": "{{data.userAvatar}}",
      "name": "{{data.userName}}",
      "description": "{{data.userStatus}}"
    },
    "backgroundType": "compact",
    "showBackButton": true,
    "rightActions": ["more"]
  }
}
```

### Banner Screen (merchant/campaign)
```json
{
  "navigation": {
    "headerType": "title",
    "headerTitle": { "type": "text", "title": "{{data.merchantName}}" },
    "backgroundType": "dark banner",
    "bannerImage": "{{data.bannerUrl}}",
    "showBackButton": true
  }
}
```

### Search Screen
```json
{
  "navigation": {
    "headerType": "title",
    "headerTitle": { "type": "text", "title": "Tìm kiếm" },
    "backgroundType": "compact",
    "hasSearch": true,
    "showBackButton": true
  }
}
```

### Screen with Extended Navigation (tabs)
```json
{
  "navigation": {
    "headerType": "title",
    "headerTitle": { "type": "text", "title": "Khám phá" },
    "backgroundType": "expand",
    "hasSearch": true,
    "hasExtension": true,
    "extendedNavigation": {
      "component": "TabView",
      "props": {
        "tabs": ["Tất cả", "Ưu đãi", "Dịch vụ"]
      }
    },
    "showBackButton": false
  }
}
```

---

## Accessibility

- Back button: accessible label "Quay lại".
- Title: announce screen name cho screen readers.
- Toolkit icons: PHẢI có accessible labels ("Tìm kiếm", "Menu").
- Banner mode: đảm bảo đủ contrast text trên image (dark banner → text trắng, light banner → text đen).
- Search: announce "Tìm kiếm, text field" khi focus.

---

## Usage Guidelines

### Do
- MỌI screen phải có TopNav — không exception trừ full-screen media.
- Default: `title` + `compact`. Khi không chắc → dùng cái này.
- Phân biệt rõ `dark banner` vs `light banner` dựa trên tone ảnh.
- Max 2-3 right action icons trong `rightActions`.
- Dùng `hasExtension` khi cần tab/segment ngay dưới header.

### Don't
- KHÔNG dùng `none` làm background mặc định — chỉ cho scrolled state.
- KHÔNG dùng `forWL` khi chưa có confirm từ system.
- KHÔNG dùng cho mini-app — dùng **TopNavMiniApp** (file riêng).
- KHÔNG custom header type ngoài 7 types đã định nghĩa.
- KHÔNG đặt quá 3 icons trong `rightActions`.
