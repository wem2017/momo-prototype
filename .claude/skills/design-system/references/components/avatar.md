# Avatar

> User/entity representation — profile photo, initials fallback, hoặc placeholder icon. Supports grouping.

**Package:** `@momo-kits/avatar`
**Platform:** RN ✅ | Compose ❌ (build with Image + Text)
**Completeness:** need_update — thiếu Figma
**Figma node:** [VERIFY]

---

## Props

| Prop | Type | Values | Default | Description |
|------|------|--------|---------|-------------|
| `source` | object | `{ uri: string }` | — | Image source. Khi `null`/error → fallback to initials hoặc placeholder |
| `name` | string | — | — | Full name — dùng để generate initials fallback (first letter of first + last word) |
| `size` | string | `"xxs"` \| `"xs"` \| `"s"` \| `"m"` \| `"l"` \| `"xl"` \| `"xxl"` | `"m"` | Avatar size. xxs=24dp, xs=28dp, s=32dp, m=40dp, l=48dp, xl=56dp, xxl=72dp [VERIFY] |
| `shape` | string | `"circle"` \| `"square"` | `"circle"` | Avatar shape [VERIFY] |
| `badge` | element | — | — | Optional Badge overlay (e.g., online indicator, verification) [VERIFY] |
| `onPress` | function | — | — | Callback khi tap avatar. `"onPress": "navigate://Profile"` |

---

## Variants

| Variant | Display | Fallback Priority |
|---------|---------|-------------------|
| **Image** | Photo from `source.uri` | — |
| **Initials** | 1-2 letter initials from `name` on colored background | When `source` is null or fails to load |
| **Placeholder** | Generic person icon | When both `source` and `name` are absent |

### Initials Background Colors

Background color derived from `name` string hash — consistent color per user. Colors from predefined palette [VERIFY].

---

## States

| State | Appearance | Interactive |
|-------|-----------|-------------|
| **Image loaded** | Photo displayed, clipped to shape | per onPress |
| **Loading** | Placeholder/shimmer while image loads | false |
| **Error / No image** | Initials (if `name` provided) or generic icon | per onPress |

---

## Avatar Group

`AvatarGroup` renders multiple avatars overlapping horizontally.

| Prop | Type | Values | Default | Description |
|------|------|--------|---------|-------------|
| `avatars` | array | `[{ source, name }]` | required | List of avatar data |
| `max` | number | — | `3` | Maximum visible avatars. Overflow shown as `+N` circle [VERIFY] |
| `size` | string | Same as Avatar | `"s"` | Size for all avatars in group |
| `overlap` | number | dp value | `8` | Horizontal overlap between avatars [VERIFY] |

---

## Variant-to-Context Map

| Context | Khi nào dùng | Tránh khi | Ví dụ trong MoMo |
|---------|-------------|-----------|-------------------|
| **Profile display** | Show user identity in header, list, card | Decorative/non-user images | Avatar trên profile screen, chat list |
| **Group display** | Show multiple participants | >5 visible → dùng list | Nhóm chia bill, nhóm chat |
| **Placeholder** | User chưa upload ảnh | — | New user onboarding |

---

## SSR Pattern

### User Profile Row
```json
{
  "id": "user_profile",
  "type": "row",
  "children": [
    {
      "component": "Avatar",
      "props": {
        "source": { "uri": "{{data.user.avatarUrl}}" },
        "name": "{{data.user.fullName}}",
        "size": "l"
      },
      "onPress": "navigate://Profile"
    },
    {
      "component": "Text",
      "props": {
        "content": "{{data.user.fullName}}",
        "typography": "body_default_bold"
      }
    }
  ]
}
```

### Avatar Group
```json
{
  "component": "AvatarGroup",
  "props": {
    "avatars": "{{data.participants}}",
    "max": 3,
    "size": "s"
  }
}
```

---

## Accessibility

- Announce avatar as: "Avatar of [name]" hoặc "Profile photo".
- Initials fallback announce full name, not just letters.
- onPress → announce as button with label.

---

## Usage Guidelines

### Do
- Dùng cho user/entity representation.
- Always provide `name` — ensures initials fallback khi image fails.
- Consistent sizing within same list/context.
- AvatarGroup cho participant previews.

### Don't
- Không dùng cho product/brand images → dùng **Image** component.
- Không dùng square shape cho user profiles — circle là standard.
- Không dùng xxl trong lists — only for profile screens.
- Không show >5 avatars inline → dùng AvatarGroup with `max`.
