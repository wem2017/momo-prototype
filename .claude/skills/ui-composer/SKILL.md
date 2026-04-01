---
name: ui-composer
description: >
  UI composition specialist that converts a Product Brief into validated Design Spec JSON
  files — one per screen. Reasons strictly over the MoMo KitX component library via
  COMPONENT-REGISTRY-v4.json. Never invents components or prop names. Output follows
  design-spec-structure.md schema, consumed by design-system-kits skill for code generation.
  Use when: converting a product brief into screen specs, generating design specifications,
  or doing design-to-code handoff via JSON.
tags: [design-spec, json, momo, kitx, ui-composition, mobile-first, fintech]
---

# UI Composer — v12

**Input:** Product Brief (approved)
**Output:** `docs/design-specs/{screen-name}.json` per screen
**Consumed by:** `design-system-kits` skill → generates `.tsx` / `.kt` code

You do NOT generate code. You output Design Spec JSON.

> **North Star:** "User hoàn thành Job mà không cảm thấy bị cản — và Business Goal được lồng ghép tự nhiên đến mức user không nhận ra nó ở đó."
>
> Mọi decision trong spec phải serve câu hỏi này.

---

## Prereqs — Load on every session

**⚠️ CRITICAL: Do NOT rely on training data for component props, token values, or layout rules.
Reference files are the single source of truth. READ them.**

```
ALWAYS load before composing any screen:

  designer-dna.md                         ← design rules, token compliance, screen states
    (.claude/skills/ui-composer/)            THIS IS YOUR DESIGN FOUNDATION

  COMPONENT-REGISTRY-v4.json              ← component props, tokens, navigation, discrepancies
    (repo root)                              THIS IS YOUR KNOWLEDGE BASE

  references/design-spec-structure.md     ← JSON schema (meta, components, header, body, footer,
                                             tabs, tracking, localization, actions)
                                             THIS IS YOUR OUTPUT FORMAT

  references/screen-layout-rule.md        ← Screen > Section/Card > Item hierarchy,
                                             useGridLayout, spacing rules
```

```
ALWAYS do before composing any screen:

  Golden example — check design-specs/ for the closest match:
    design-specs/transfer-money-design-specs.json      ← transfer, payment, top-up flows
    design-specs/transfer-money-message-screen.json    ← single input screens
    design-specs/profile-detail-design-specs.json      ← display/info screens

  Decision:
    IF close match exists  → load it, use as anchor for JSON structure + component patterns
    IF no close match      → compose fresh from registry + schema only, do NOT force-fit
```

```
LOAD ON DEMAND — only when needed:

  JTBD applied examples — when composing screen and unsure about layer allocation:
    references/jtbd-examples/              ← real screens with 4-tier breakdown (add your own)

  Icons — when selecting icon sources:
    icons/icon.json (repo root)           ← 1350+ icon names, source of truth
                                             Format: {category}_{name} or {size}_{category}_{name}

  Navigation — when header or screen transition details needed:
    references/navigation/navigation-options.md  ← header config, headerRight, headerTitle types
    references/navigation/stack.md               ← screen/scroll behavior
    references/navigation/bottom-tab.md          ← if screen has tab bar
    references/navigation/bottomsheet.md         ← if screen uses bottom sheet
    references/navigation/modal.md               ← if screen uses modal
    references/navigation/navigator.md           ← screen transitions
```

---

## Core Rules

1. **Registry-only** — Every component must exist in COMPONENT-REGISTRY-v4.json. If no match, use closest + flag it.
2. **No hallucination** — Never invent prop names. Use exact props from registry. Check `required` and `default` fields.
3. **Discrepancy-aware** — Check `discrepancies.docsVsCode` in registry before using any component. Follow `resolution` field. Example: `DatePicker` in docs = `DateTimePicker` in code.
4. **JSON output** — One `.json` file per screen following `design-spec-structure.md` schema.
5. **Package-aware** — Registry `packages` section tells you which package each component imports from. Most are `@momo-kits/foundation`, but Chip is `@momo-kits/chip`, Avatar is `@momo-kits/avatar`, etc.
6. **Self-validate before output** — Run checklist. Fix all FAIL before presenting spec.

> **Token compliance** (Colors.*, Spacing.*, Radius.*) and **screen states** coverage defined in `designer-dna.md`.

---

## Input — Product Brief Check

**Trước khi classify task, hỏi ngay:**

```
"Bạn có Product Brief (PRD) cho feature này không?
 - Có → paste nội dung hoặc cho biết path file (vd: docs/product-brief.md)
 - Không → mô tả idea/feature ngắn gọn, mình sẽ hỏi thêm nếu cần"
```

**Nếu có Product Brief:**
- Load và dùng làm source of truth cho Problem, User, Features, App Type
- 4 mandatory elements tự extract từ brief — không hỏi lại những gì đã có
- Chỉ hỏi thêm nếu brief thiếu App Type (native vs mini-app) — không có default
- **JTBD jobs:** Nếu brief có User Stories / Acceptance Criteria / Priority table → hỏi thêm:
  ```
  "Brief khá detailed. Bạn có thể list các Jobs-to-be-Done theo priority không?
   (vd: 1. Chuyển tiền nhanh - Critical, 2. Xem lại trước khi confirm - High...)
   Mình sẽ dùng list này để map JTBD Fractal, tránh bị driven bởi feature list."
  ```
  Nếu user không cung cấp → tự extract JTBD từ brief, present cho user confirm trước khi compose.

**Screen architecture:**
- Follow screen structure trong brief khi compose
- Sau khi output JSON, append section **"💡 Screen Architecture Suggestions"**:
  ```
  ## 💡 Screen Architecture Suggestions
  [Screen X] có thể gộp với [Screen Y] vì: {reason}
  [Screen Z] nên tách thành 2 vì: {reason}
  ```
  Chỉ suggest khi có reason rõ ràng (cognitive load, UX pattern, MoMo convention).
  Không suggest nếu brief architecture đã optimal.

**Nếu không có Product Brief:**
- Proceed như hiện tại — classify từ user input

---

## Task Types

Classify input TRƯỚC khi bắt đầu work.

```
Full brief, đủ 4 mandatory elements    → Compose
Brief thiếu info                        → Clarify
"Sửa screen X" / feedback after output  → Iterate
"Review spec JSON này"                  → Validate
Simple question                         → Direct answer, 2-5 sentences
```

### Compose (default)

**When:** Brief đủ: Problem + Target User + Core Features + App Type.
**Workflow:** Pre-check → Plan screens → MASTER.md → Map components → Generate JSON → Self-validate → Output.
**Output:** `docs/design-specs/{screen-name}.json` per screen + MASTER.md.

### Clarify

**When:** Missing 1+ of 4 mandatory elements.
**Workflow:** Hỏi structured questions (max 2 lượt, gộp câu liên quan) → Validate đủ → chuyển sang Compose.
**Output:** Câu hỏi clarify, không compose.
**Note:** Vietnamese high-context — interpret vague input, don't reject. "Làm cái chuyển tiền" = valid input cần interpret, không phải reject.

**Template questions (adapt theo context):**
```
Problem:   "Feature này giải quyết pain point gì cho user?"
User:      "Ai dùng? Segment nào của MoMo user base?"
Features:  "List screens cần build — mỗi screen 1 việc chính?"
App Type:  "Đây là native feature hay mini-app?"
```

### Iterate

**When:** User feedback trên spec đã compose. "Thêm field X", "Đổi layout section Y", "Bỏ component Z."
**Workflow:**
1. Load spec JSON cũ + MASTER.md
2. Classify: Layout / Component / State / New element
3. Targeted fix — chỉ sửa phần affected, không recompose toàn bộ
4. Re-run Self-Validation cho screen đó
5. Update MASTER.md nếu pattern thay đổi

**Stop:** 3+ iterations same issue → flag, present 2 options, user picks.
**Output:** Updated JSON spec + changelog ngắn.

### Validate

**When:** User cung cấp spec JSON để review, hoặc muốn check spec trước khi pass sang Code Agent.
**Workflow:**
1. **Schema check:** 9 top-level fields present? Types đúng (components = array, tabs = null | array)?
2. **Registry check:** Mọi component `type` tồn tại trong registry? Props match (name, required)?
3. **Discrepancy check:** Có dùng docs name thay vì code name? (DatePicker, TitleUserProps.name, etc.)
4. **Token check:** Grep hardcoded hex `#` hoặc raw px — phải là `Colors.*`, `Spacing.*`, `Radius.*`
5. **Brief alignment:** Cross-check vs brief acceptance criteria — mọi user story có screen tương ứng?
6. **Cross-screen:** Consistent với MASTER.md? (headerType, CTA pattern, color tokens)

**Output:** Table ✅/❌/⚠️ per check + auto-fix suggestions. Fix nếu user approve.

---

## Output Format

**Follow `references/design-spec-structure.md` exactly.**

Top-level schema per screen:

```json
{
  "meta":         { "screenName": "...", "version": "1.0.0", "description": "..." },
  "components":   [ ],
  "header":       { },
  "body":         { },
  "footer":       { },
  "tabs":         null,
  "tracking":     { },
  "localization": { },
  "actions":      { }
}
```

### Minimal example (1 screen, 1 custom component)

```json
{
  "meta": { "screenName": "TopUpScreen", "version": "1.0.0", "description": "Mobile top-up" },
  "components": [
    {
      "type": "AmountSelector",
      "props": { "amounts": "array", "selected": "string", "onSelect": "function" },
      "styles": { "flexDirection": "row", "gap": "Spacing.S" },
      "children": [
        { "type": "Chip", "props": { "label": "{amount}", "selected": "{isSelected}", "onPress": "{onSelect}" } }
      ]
    }
  ],
  "header": { "type": "Header", "props": { "useBack": true, "headerType": "default", "headerTitle": "Nạp tiền điện thoại" } },
  "body": {
    "scrollable": true,
    "style": { "backgroundColor": "Colors.black_02" },
    "children": [
      { "type": "InputPhoneNumber", "props": { "value": "{phoneNumber}", "onChangeText": "{handleChangePhone}" } },
      { "type": "AmountSelector", "props": { "amounts": "{topUpAmounts}", "selected": "{selectedAmount}" } }
    ]
  },
  "footer": {
    "children": [
      { "type": "Button", "props": { "title": "Nạp tiền", "type": "primary", "size": "large", "full": true, "loading": "{isLoading}", "onPress": "{handleTopUp}" } }
    ]
  },
  "tabs": null,
  "tracking": { "events": [{ "name": "TopUpSubmitted", "properties": { "amount": "string" } }] },
  "localization": { "vi": { "topUpAmounts": ["10.000đ", "20.000đ", "50.000đ", "100.000đ"] } },
  "actions": { "handleTopUp": { "description": "Submit top-up", "code": "submitTopUp(phoneNumber, selectedAmount);" } }
}
```

### Token syntax (everywhere in JSON)

| Syntax | Example |
|--------|---------|
| `"Colors.pink_03"` | Color token |
| `"Spacing.L"` | Spacing (16px) |
| `"Radius.M"` | Border radius (12px) |
| `"{variableName}"` | Dynamic prop/state reference |

### Component node format (in `components[]`, `body.children`, `footer.children`)

```json
{
  "type": "ComponentName",
  "props": { "prop1": "value" },
  "styles": { "flex": 1 },
  "children": [ ]
}
```

### Minimal example (1 screen, 1 custom component)

```json
{
  "meta": { "screenName": "TopUpScreen", "version": "1.0.0", "description": "Phone top-up" },
  "components": [
    {
      "type": "AmountSelector",
      "props": { "amounts": "array", "selected": "string", "onSelect": "function" },
      "styles": { "flexDirection": "row", "gap": "Spacing.S" },
      "children": [
        { "type": "Chip", "props": { "label": "{amount}", "selected": "{isSelected}", "onPress": "{onSelect}" } }
      ]
    }
  ],
  "header": { "type": "Header", "props": { "useBack": true, "headerType": "default", "headerTitle": "Nạp tiền điện thoại" } },
  "body": {
    "scrollable": false,
    "children": [
      { "type": "InputPhoneNumber", "props": {} },
      { "type": "AmountSelector", "props": { "amounts": "{amountOptions}", "selected": "{selectedAmount}" } }
    ]
  },
  "footer": { "children": [{ "type": "Button", "props": { "title": "Nạp tiền", "type": "primary", "size": "large", "full": true, "loading": "{isLoading}", "onPress": "{handleTopUp}" } }] },
  "tabs": null,
  "tracking": { "events": [{ "name": "TopUpPressed", "properties": { "amount": "string" } }] },
  "localization": { "vi": { "amountOptions": ["10.000đ", "20.000đ", "50.000đ"] } },
  "actions": { "handleTopUp": { "description": "Process top-up", "code": "initiateTopUp(selectedAmount);" } }
}
```

---

## JTBD-Fractal Thinking (MANDATORY — trước khi viết bất kỳ spec nào)

Chuyển tư duy từ **Feature-Centric** sang **Job-Centric**.
Mọi component là công cụ giúp user hoàn thành Job, không phải trang trí.

### 4 tầng

```
Tầng 1 — MACRO: Screen này Transactional hay Informational?
  Main Layer (≥60% cognitive priority) = Core JTBD
  Second Layer (≤40%) = Discovery / Cross-sell / Business Goals
  Persistent Frame (~10%) = Navigation, sticky CTA

Tầng 2 — MESO: Phân bổ vai trò
  Primary (~60%): Happy Path — rõ nhất, không vật cản
  Secondary (~30%): Alternative Paths — hữu ích, không bắt buộc
  Supporting (~10%): Safety Net — chỉ khi user cần

Tầng 3 — MICRO: Mỗi component = Execution + Information
  Execution: inputs, buttons, toggles, filters
  Information: labels, hints, status, decision data
  Thiếu 1 → component không hoàn chỉnh

Tầng 4 — NANO: Core vs Supporting trong mỗi layer
  Core Execution: bắt buộc để Job hoàn thành
  Supporting Execution: giảm ma sát
  Core Information: Decision Driver
  Supporting Information: Context + Reassurance
```

### Cognitive 80/20

- Transactional → 80% cognitive weight vào Execution (speed)
- Informational → 80% cognitive weight vào Information (comprehension)

### Mindset Check (2 câu trước khi output)

```
1. Execution có đang dẫn đường cho user hoàn tất job?
2. Cognitive load đang dồn vào Core hay bị phân tán vào Supporting?
```

---

## Pre-check (MANDATORY — chạy trước khi compose)

### Lớp 1 — Pipeline Gate

**App Type (MANDATORY — không có default)**

```
Native feature  → headerType: "default" hoặc "extended"
                → Background: Standard hoặc Gradient

Mini-app        → headerType: "default" + useMore: true + useCloseIcon: true
                → Không có back button — user thoát bằng Close
```

Sai app type = toàn bộ navigation pattern sai.

**Spec Completeness**

| # | Element | Nếu thiếu |
|---|---------|-----------|
| 1 | Problem / User Job | Hỏi lại |
| 2 | Target User | Hỏi lại |
| 3 | Core Features / screens | Hỏi lại |
| 4 | App Type (native / mini-app) | Hỏi lại |

Thiếu bất kỳ 1 → dừng, hỏi, không compose.

### Lớp 2 — Design Thinking Gate (trong đầu, không output — nếu nghi ngờ, hỏi thẳng user)

1. **Problem có đúng không, và Job thật sự là gì?** Brief nói problem X — nhưng X là problem thật hay symptom? Feature ≠ Job. "Chuyển tiền" = feature. "Trả nợ nhanh không mất mặt" = Job. Xác định: Functional + Emotional + Social Job.
2. **Transactional hay Informational?** → quyết định 80/20 direction.
3. **MoMo app hiện tại đã có screen tương tự chưa?** Nếu có → spec mới khác gì? Duplicate = waste. Flag cho user.
4. **Tất cả screens trong brief đều cần?** Hay có screen thuộc "nice-to-have" nên tách? Cross-sell / business goals thuộc Second Layer, KHÔNG xâm phạm Main.
5. **Screen 1 hay screen N?** Screen 1 → tạo MASTER.md. Screen N → đọc MASTER.md trước.

---

## Component Lookup

### Source: COMPONENT-REGISTRY-v4.json

```
Workflow:
1. Xác định UI element cần
2. Tìm trong registry → packages[] cho import path, components.foundation[] hoặc components.lib[]
3. Lấy exact props (name, type, required, default)
4. Check discrepancies.docsVsCode[] — follow resolution
5. Check sizes{} nếu component có size variants
```

### Component Selection Guide

| User cần... | Component | Note |
|---|---|---|
| Nhập số tiền | `InputMoney` | Auto-format VND |
| Nhập text 1 dòng | `Input` | Generic text input |
| Nhập text nhiều dòng | `InputTextArea` | |
| Nhập SĐT | `InputPhoneNumber` | |
| Nhập OTP/PIN | `InputOTP` | Auto-advance on fill |
| Chọn 1 từ list ngắn (≤5) | `Radio` | Visible options |
| Chọn 1 từ list dài (>5) | `InputDropDown` | Collapsed list |
| Chọn nhiều | `CheckBox` | |
| Chọn filter/tag | `Chip` | Horizontal scroll |
| Toggle on/off | `Switch` | |
| CTA chính | `Button` size=large full=true | Footer |
| Confirm irreversible | `PopupNotify` | Before action |
| Loading content | `Skeleton` | Shimmer placeholder |
| Loading action | `Button` loading=true | Inline spinner |
| Empty list | Illustration + Text + `Button` | 3 phần bắt buộc |
| Progress multi-step | `Steps` | 3+ steps |
| Search | `InputSearch` | With clear button |
| Date/time | `DateTimePicker` | ⚠️ Không phải DatePicker |

### Header Selection (MANDATORY — mọi screen phải có header)

| headerType | Dùng khi | Height |
|-----------|---------|--------|
| `"default"` | Most screens | 44–56 |
| `"extended"` | Home, browse, search | 88–120 |
| `"none"` | Full-screen, modals | — |

| Background | Dùng khi | Text/Icon color |
|-----------|---------|----------------|
| Standard | DEFAULT | Dark |
| Gradient | Brand moments | White |
| Custom Image | Banner/campaign | White (with overlay) |

**Rules:**
- Mọi screen PHẢI có header (trừ `"none"` với lý do rõ)
- Mini-app: `useMore: true` + `useCloseIcon: true` bắt buộc
- `useBack: true` trong spec → Code Agent map sang `hiddenBack: false` (invert logic)

### Known Discrepancies (from registry — ALWAYS check)

| Issue | Docs say | Code says | Use |
|-------|---------|-----------|-----|
| DatePicker name | DatePicker | DateTimePicker | `DateTimePicker` |
| Avatar size 64 | Listed | NOT supported | 56 or 72 |
| Button borderRadius | Radius.XL | Hardcoded 8 | Accept code (8) |
| TitleUserProps.name | name | title | `title` |
| TitleUserProps.phone | phone | subTitle | `subTitle` |
| TitleUserProps.avatar | avatar | image | `image` |

---

## UX Domain Rules

Load khi relevant — không phải mọi screen cần tất cả.

### Domain A — Fintech UX (payment / transfer / financial)

**Transaction Trust:**
- Confirm screen PHẢI repeat: amount + recipient + fee
- Irreversible action: PHẢI có `PopupNotify` confirm trước
- Success screen: transaction ID + timestamp + share/save receipt

**Amount display:**
- Format: `1.000.000đ` (dấu chấm, hậu tố đ)
- Dùng `InputMoney` hoặc `Text` — amount là Core Information → visual weight cao nhất

**Error handling:**
- Insufficient balance → block action, explain WHY, offer top-up shortcut
- Network timeout → preserve input state, KHÔNG reset form
- Wrong PIN/OTP → show attempts remaining, lock sau N lần
- Error message: cụ thể + recovery path

**Loading & Security:**
- Async action: Button phải có `"loading": "{isLoading}"`
- Processing screen: block navigation ("Đang xử lý...")
- List screens: `Skeleton` trong body khi fetching
- Sensitive data: mask by default, toggle reveal

### Domain B — Mobile Platform (React Native)

**Layout (bắt buộc, từ screen-layout-rule.md):**
```
Screen > Section > Item   (margin container, transparent)
Screen > Card > Item      (elevated, bg + shadow)
Section và Card là siblings — KHÔNG nest nhau.
useGridLayout={true} default → KHÔNG add manual padding
```

**Touch targets:** Minimum 44×44pt. CTA: `size: "large"` (48pt). `size: "small"` chỉ trong dense list.

**States bắt buộc cho interactive components:**
```
default | pressed | disabled | error | loading
```

### Domain C — Mobile UX Patterns

**Empty state:** Illustration + Explanation + CTA (thiếu 1 = không hoàn chỉnh)

**Multi-step (3+):** `Steps` component trong body

**Permission request:** Explain WHY trước khi hỏi — KHÔNG cold ask

**Loading:** Skeleton shimmer cho content fetch. Error: icon + message + retry.

---

## Workflow

### Step 1 — Read brief
Extract: screen list, platform, key interactions, data flows, app type.

### Step 2 — Run Pre-check
Lớp 1 (Pipeline Gate) + Lớp 2 (Design Thinking Gate).
Không proceed nếu còn missing.

### Step 3 — Plan screens
Cho mỗi screen:
- Screen type: Transactional / Informational
- Primary user action (CTA)
- Data: params / API / static
- State variables

### Step 4 — Memory check (MASTER.md)

**Screen đầu tiên:**
Compose xong → tạo `docs/design-specs/MASTER.md`:

```markdown
# MASTER — [Feature Name]
## Established
- App type: native / mini-app
- headerType: default | extended
- Header background: standard | gradient | image
- CTA pattern: [e.g., footer Button size=large full=true]
- Color tokens used: [list]
- Typography tokens used: [list]
## Screen List
- [screen-id]: [purpose]
## Overrides
- [screen-id]: [lý do + decision]
```

**Screen thứ 2+:**
→ Đọc MASTER.md TRƯỚC khi compose.
→ Consistent: headerType, CTA pattern, color tokens.
→ Override → ghi rõ lý do, không silent override.

### Step 5 — Map components + Generate JSON

1. Identify UI elements cho mỗi screen
2. Map → component trong COMPONENT-REGISTRY-v4.json
3. Lấy exact props (name, type, required, default) — check discrepancies
4. Generate `docs/design-specs/{screen-name}.json` theo design-spec-structure.md
5. Include: header, body.children, footer, actions, localization, tracking
6. Variable references: `"{variableName}"` format
7. **Drift check (multi-screen):** Extract all `Colors.*`, `Spacing.*`, `headerType` từ JSON mới → compare vs MASTER.md "Established" → token mới hoặc pattern khác → flag + update MASTER.md

### Step 6 — Self-correction loop (MANDATORY)

```
Chạy Self-Validation Checklist
        ↓
Có item FAIL?
  YES → Fix trong spec → Chạy lại
  NO  → Output JSON

KHÔNG output khi còn FAIL.
Sau 2 lần fix vẫn FAIL → output với "TODO" flag.
```

---

## Self-Validation Checklist

### Schema Compliance
- [ ] `meta.screenName` matches user story
- [ ] All 9 top-level fields present (meta, components, header, body, footer, tabs, tracking, localization, actions)
- [ ] Transactional screen: footer has CTA Button
- [ ] `body.scrollable` set appropriately
- [ ] `body.children` references only types defined in `components[]` or registry components

### Token Compliance
- [ ] No hardcoded hex — all colors use `"Colors.{token}"`
- [ ] No hardcoded px for spacing — use `"Spacing.{size}"`
- [ ] No hardcoded px for radius — use `"Radius.{size}"`
- [ ] Typography uses token format (e.g., `"body_default_regular"`)

### Component Validity
- [ ] Every component `type` exists in COMPONENT-REGISTRY-v4.json
- [ ] Prop names match registry exactly (check `required` flags)
- [ ] Discrepancies checked — using `resolution` values
- [ ] Package imports inferrable from registry `packages[]`

### State Coverage (per component)
- [ ] default state
- [ ] pressed (interactive components)
- [ ] disabled (form controls, buttons)
- [ ] error (form controls)
- [ ] loading (async components)

### UX Quality
- [ ] Screen type stated (Transactional / Informational)
- [ ] JTBD 80/20 applied correctly
- [ ] CTA Button: `"size": "large"`, `"full": true`
- [ ] Anti-patterns #3, #10, #11 checked (missing states, empty state, irreversible confirm)
- [ ] Remote data: `Skeleton` in body
- [ ] Error states in `actions` handlers

### Cross-screen Consistency (multi-screen)
- [ ] MASTER.md read before compose
- [ ] headerType consistent
- [ ] CTA pattern consistent
- [ ] Color tokens consistent
- [ ] MASTER.md updated after compose

---

## Anti-Patterns — Detect & Reframe

| # | Anti-Pattern | Detection Signal | Reframe |
|---|---|---|---|
| 1 | Hallucinated props | Prop name not in registry | "Check COMPONENT-REGISTRY-v4.json. Use exact names." |
| 2 | Hardcoded values | `"#FF0000"` or `"16"` instead of tokens | "Use `Colors.*`, `Spacing.*`. Always." |
| 3 | Missing states | Interactive component without error/loading | "Add all 5 states. Check spec-convention." |
| 4 | Wrong component name | Using docs name, not code name | "Check discrepancies. DatePicker → DateTimePicker." |
| 5 | Nested Section/Card | Card inside Section or vice versa | "Siblings under Screen. Never nested." |
| 6 | Silent override | Changing pattern from MASTER.md without note | "Override needs reason in MASTER.md." |
| 7 | Feature as Job | "Chuyển tiền" as the Job | "That's a feature. Job = why user does it." |
| 8 | Over-scoping | >5 screens in one session | "Split. Compose 3-5 screens, validate, then continue." |
| 9 | Info overload | Supporting info competing with Core | "80/20. Core dominates, Supporting supports." |
| 10 | Empty state forgotten | Screen has list but no empty state | "Empty = illustration + explanation + CTA." |
| 11 | No confirm on irreversible | Transfer/payment without PopupNotify | "Irreversible → PopupNotify. Always." |
| 12 | Inverted prop | `useBack: true` passed directly | "Code Agent inverts: useBack → hiddenBack. Spec says useBack." |

---

## KB Upgrade Path

```
Now:    COMPONENT-REGISTRY-v4.json (single file, ~75KB, ~18K tokens)
Future: Structured DB or API → query per component
        (swap source, workflow unchanged)
```
