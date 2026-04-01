# Steps

## Purpose
Hiển thị tiến trình của user trong một flow nhiều bước, giúp xác định vị trí hiện tại và các bước còn lại.
Dùng trong các flow tuyến tính như đăng ký, thanh toán, onboarding.
**Package:** `@momo-kits/step`
**Platform support:** RN ✅ | Compose ❌ (build with Row)

## Variants & States
- Variants: default
- States: completed, current, upcoming
- Sizes: step circle 32

## Usage Context
- Use when: flow nhiều bước tuyến tính (3–5 bước)
- Don't use when: navigation ngang (→ Tab), progress % (→ ProgressInfo)
- Typical placement: phía trên cùng của screen hoặc section

## Dependencies
- Tokens: Colors.pink_03, Colors.black_04, Colors.black_08, Colors.black_17, Spacing.XS, typography.caption_default_regular
- Related components: Text, Icon

## Variant-to-Context Map

| Variant  | Khi nào dùng | Ví dụ trong MoMo |
|----------|-------------|-------------------|
| default  | Flow nhiều bước tuyến tính | Flow thanh toán (Thông tin → Xác nhận → Hoàn tất) |
| completed| Bước đã hoàn thành | Step "Thông tin" sau khi nhập xong |
| current  | Bước hiện tại | Step "Thanh toán" đang thực hiện |
| upcoming | Bước chưa tới | Step "Hoàn tất" chưa thực hiện |

## Composition Recipes

### Recipe 1: Checkout Flow
- Components: Steps + Screen content
- Layout: steps nằm trên cùng, content của step bên dưới
- When: flow thanh toán nhiều bước

### Recipe 2: Registration Flow
- Components: Steps + Form + Button
- Layout: steps trên, form giữa, button dưới
- When: đăng ký tài khoản nhiều bước

### Recipe 3: Onboarding Step Flow
- Components: Steps + Content block
- Layout: steps phía trên section, content thay đổi theo step
- When: onboarding hoặc guided flow

## Spatial Description

Default:
  ✓        2        3        4
 (●)──────(●)──────(○)──────(○)
Step 1   Step 2   Step 3   Step 4

- circle: 32x32
- line: 2px height
- spacing: evenly distributed full width

States:
(✓) completed → bg: Colors.pink_03  
(●) current   → bg: Colors.pink_03  
(○) upcoming  → bg: Colors.black_04  

- line màu theo step trước