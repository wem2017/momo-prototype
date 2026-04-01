# Spacing

## Purpose
Thiết lập khoảng cách (padding, margin, gap) nhất quán giữa các phần tử UI nhằm đảm bảo layout rõ ràng, dễ đọc và có thể scale ổn định theo grid system.

Spacing là foundation giúp:
- Tổ chức layout theo cấp Screen → Section/Card → Item → Element
- Đảm bảo consistency giữa các màn
- Hỗ trợ responsive thông qua grid + span


## Variants & States

### Variants
- margin (outer spacing)
- padding (inner spacing)
- gap (between elements)
- textSpacing (text-only spacing)

### States
- default
- dense (compact layout)
- expanded (hero / highlight)

### Sizes 
- XXS = 2
- XS = 4
- S = 8
- M = 12
- L = 16
- XL = 24
- XXL = 32
- 3XL+ (RN only)

### Data Contract
Required:
- spacing token (không dùng px custom)
- layout level (Screen / Card / Item)

Optional:
- density mode (dense / default)

Format:
- spacing.{size}
- hoặc alias: padding / gap / margin

### Hierarchy
Primary:
- Screen margin (16)
- Section gap (24)

Secondary:
- Card padding (16)
- Item gap (12)

Tertiary:
- Text spacing (4–8)


## Usage Context

### Use when
- Tạo khoảng cách giữa các component / element
- Xây dựng layout theo grid (Screen / Card)
- Điều chỉnh density (compact vs spacious)

### Don't use when
- Căn chỉnh layout bằng pixel custom (→ phải dùng token)
- Dùng spacing để “fix UI lệch” (→ sai root cause)

### Typical placement
- Screen level: margin
- Section/Card level: gap + padding
- Item level: padding + gap
- Element level: textSpacing


## Dependencies

### Tokens
- spacing.XXS → spacing.5XL
- margin / padding / gap / paddingZero

### Related components
- Grid (12 columns)
- Section
- Card
- ListItem
- Text
- Button
- Input


## Variant-to-Context Map
| Variant | Khi nào dùng | Ví dụ trong MoMo |
|--------|-------------|------------------|
| margin | Khoảng cách ngoài screen | Padding trái/phải Home |
| padding | Khoảng cách trong container | Card padding |
| gap | Khoảng cách giữa elements | List item spacing |
| textSpacing | Khoảng cách giữa text | Title + description |

## Layout Rules 

### 1. Screen level
- Margin: 12–16
- Grid: 12 columns
- Gutter: 12
→ Section Item sẽ dùng span (12 / 6 / 4 / 3)

### 2. Section level
- Không có padding
- Dùng gap giữa các item
- Gap = spacing.M (12)

### 3. Card level
- Padding: 16
- Gap: 8–12
- Grid: sub-grid (gutter 8)

### 4. Item level
- Padding:
  - default: 8–12
  - zero (edge case): paddingZero
- Gap giữa element: 8

### 5. Text level
- textSpacing:
  - null / small / medium
- chỉ áp dụng cho text gần nhau


## Composition Recipes

### Recipe 1: Screen Layout
Components: Screen + Section + Card
Layout:
- Screen margin: 16 (Spacing.L)
- Gap giữa section: 24 (Spacing.XL)
When: mọi màn chính

### Recipe 2: Card Content
Components: Card + Text + Button
Layout:
- Padding: 16 (Spacing.L)
- Gap nội dung: 8–12 (S–M)
When: hiển thị thông tin nhóm

### Recipe 3: List Item
Components: ListItem + Icon + Text
Layout:
- Padding horizontal: 16
- Padding vertical: 12
- Gap giữa item: 12
When: transaction list, contact list

### Recipe 4: Form Layout
Components: Input + Label
Layout:
- Label → Input gap: 4
- Field → field gap: 16
When: form nhập liệu


## Interaction Rules
On layout render:
- spacing được apply theo cấp layout (Screen/Card/Item)

On responsive:
- spacing giữ nguyên, chỉ thay đổi span

On density change:
- giảm gap (M → S)
- giữ padding container

On dynamic content:
- spacing co giãn theo content (auto layout)


## Special Rules

### Grid-based spacing
- spacing phải align với column grid
- item width theo span:
  - 12 → full
  - 6 → half
  - 4 → 1/3
  - 3 → 1/4

### Section vs Card
| Level | Spacing |
|------|--------|
| Section | gap only |
| Card | padding + gap |

### Exception cases
- Full-bleed (carousel, banner)
  → ignore margin
- Flexible layout (toast, overlay)
  → spacing linh hoạt
- Title component
  → không dùng textSpacing rule


## Spatial Description

### Screen
| margin 16 |
┌────────────────────────────┐
│ Section                    │
│ gap 24                     │
│ ┌─────────────────────── ┐ │
│ │ Card                   │ │
│ │ padding 16             │ │
│ │ gap 12                 │ │
│ └───────────────────────-┘ │
└────────────────────────────┘

### Card
┌─────────────────────────────────────┐ 
| padding 16                          │ 
│ Title (headline_s_bold)             │ 
│ gap 8                               │  
│ Description (body_default_regular)  │ 
| gap 12                              │  
| Button                              │ 
| padding 16                          │  
└─────────────────────────────────────┘

### List Item
┌────────────────────────────┐
│ padding 12                 │
│ [icon] gap 12 [text]       │
│ gap giữa item: 12          │
└────────────────────────────┘


## Do / Don’t

### Do
- Luôn dùng token (Spacing.M, L…)
- Follow cấp layout (Screen → Card → Item)
- Giữ consistency theo grid

### Don’t
- Không dùng px custom
- Không mix spacing giữa các cấp
- Không dùng spacing để fix layout sai