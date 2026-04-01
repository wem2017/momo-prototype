# Icon

## Purpose
Hiển thị biểu tượng (icon) dạng vector nhằm hỗ trợ nội dung, biểu thị hành động, trạng thái hoặc điều hướng trong UI. Icon giúp người dùng nhận diện nhanh chức năng mà không thay thế hoàn toàn text.

## Variants & States
- Variants: inline, default, standard, featured, hero
- States: default, active, disabled, error, success
- Sizes:
  - inline (16)
  - default (20)
  - standard (24)
  - featured (32)
  - hero (48)

## Usage Context
- Use when: cần bổ trợ text, biểu thị action, hiển thị trạng thái, điều hướng
- Don't use when: thay thế hoàn toàn text, hoặc dùng icon như illustration phức tạp
- Typical placement: trong Button, ListItem, Input, TopNavigation, inline với Text

## Dependencies
- Tokens: Colors.*, spacing.S
- Related components: Button, Text, Input, ListItem, TopNavigation

## Variant-to-Context Map

| Variant | Khi nào dùng | Ví dụ trong MoMo |
|---------|-------------|-------------------|
| inline | Icon đi kèm text nhỏ | Icon trước label trong transaction note |
| default | Icon nhỏ trong component | Icon search trong input |
| standard | Icon chính trong UI | Icon tab bar, top navigation |
| featured | Icon cần nổi bật hơn | Icon trong card feature |
| hero | Icon lớn, mang tính minh hoạ | Empty state “Chưa có giao dịch” |

## Composition Recipes

### Recipe 1: Icon + Text
- Components: Icon + Text
- Layout: Icon bên trái text, align center theo trục dọc
- When: label có icon hỗ trợ (list, button, metadata)

### Recipe 2: Icon Button
- Components: Button + Icon
- Layout: Icon center trong button container
- When: action đơn giản (back, close, more)

### Recipe 3: Icon trong ListItem
- Components: Icon + Text + Icon(trailing)
- Layout: Icon trái → text → icon phải
- When: list điều hướng (cài đặt, dịch vụ)

### Recipe 4: Icon trong Input
- Components: Input + Icon(leading/trailing)
- Layout: Icon nằm trong input field
- When: search, clear, validation

## Spatial Description

### Inline:
[text] [icon16]

- Gap: spacing.S (8)
- Align baseline text


### Icon Button:
┌──────────────┐
│    [icon]    │
└──────────────┘
- Touch target ≥ 44x44
- Icon center

### List Item:
┌────────────────────────────┐
│ [icon24] gap12 [text]  [>] │
└────────────────────────────┘
- Icon trái cố định 24
- Gap: 12

### Navigation:
┌────────────────────────────┐
│        [icon24]            │
└────────────────────────────┘
- Size cố định 24
- Center trong container