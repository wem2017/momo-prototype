# QMD Guide — Semantic Search Engine

> QMD là search engine chính để tìm component specs, color tokens, typography, icons trong corpus MoMo Design System. Mọi subagent dùng QMD trước khi Read trực tiếp.

---

## Lookup Workflow

```
search (biết tên, ~30ms) → vector_search (không chính xác, ~2s) → deep_search (cross-ref, ~10s) → get/multi_get (load files)
```

1. **`search`** — Keyword/exact match. Dùng khi biết tên component/file. Nhanh nhất.
2. **`vector_search`** — Meaning-based search. Dùng khi mô tả tính năng, không biết tên chính xác.
3. **`deep_search`** — Auto-expand query, tìm sâu. Dùng khi cần cross-reference nhiều nguồn.
4. **`get` / `multi_get`** — Load file cụ thể by path hoặc docid. Dùng sau khi search tìm ra path.

**Fallback:** Nếu QMD không available → Glob/Read trực tiếp từ corpus.

---

## Collections

| Collection | Docs | Content |
|-----------|------|---------|
| momo-prototype-kit | 138 | MoMo Design System components, tokens |

**Luôn dùng** `momo-prototype-kit` collection cho mọi prototype-related search.

---

## Rules (MANDATORY)

1. **KHÔNG chạy `deep_search` song song** — gây crash QMD server. Chạy tuần tự.
2. **Corpus path:** `00-corpus/momo-design-system/` — KHÔNG PHẢI `corpus/`. Dùng sai path = silent fallback to defaults.
3. **Chỉ load files cần dùng** — KHÔNG load toàn bộ corpus. QMD search trả results có giới hạn.
4. **minScore: 0.5** — Filter low-confidence results.
5. **File paths trong results là relative** — cần prefix với collection base path.

---

## Search Priority Rules

Single-folder corpus (post-consolidation 2026-03-31). No fallback layer needed.

1. **PRIMARY:** `components/{component}.md` — consolidated specs (Figma CSS + UX + Kit API)

Khi component KHÔNG có trong `components/` → flag corpus gap, KHÔNG substitute.

---

## Corpus Folder Reference

| Folder | Content | Khi nào search |
|---|---|---|
| `components/` | 58 files — specs + UX + Kit API | Mọi component lookup |
| `components/kit-api-reference.md` | 40 components import paths + key props | Khi cần import path nhanh |
| `tokens/` | colors, typography, spacing, radius, theme, icons | Khi cần token values |
| `navigation/` | 8 files — Stack, Modal, BottomSheet, Tabs, Navigator API | Khi build navigation patterns |
| `layout/` | layout-overview + reference-baseline | Khi cần grid/spacing rules + useGridLayout |
| `getting-started/` | Setup, conventions, onboarding | Khi cần project setup context |
| `code-convention.md` | File headers, AI markers, 500-line limit | Khi generate new files |

## Additional Search Examples

```
# Tìm Kit API import path:
search("kit-api-reference", collection="momo-prototype-kit")

# Tìm navigation pattern:
search("bottomsheet", collection="momo-prototype-kit")

# Tìm layout rules:
search("useGridLayout", collection="momo-prototype-kit")

# Tìm color tokens:
get("tokens/colors.md", collection="momo-prototype-kit")

# Tìm typography tokens:
get("tokens/typography.md", collection="momo-prototype-kit")
```

---

## Subagent QMD Usage

| Subagent      | QMD Usage                                           | Frequency |
|--------------|-----------------------------------------------------|-----------|
| product-craft | Search PRDs cũ, research docs, competitive context  | As needed |
| design-studio | Lookup component specs, verify component exists      | Every run |
| code-forge   | Load specs for build, verify token names             | Every run |
| code-polish  | Cross-check compliance against corpus                | Every run |

---

## Icon Naming Rules

- Icon names PHẢI lấy từ `tokens/icons.md` (462 icons, 20 categories)
- Format: `category_name` (e.g., `arrow_arrow-back`, `basic_home`)
- KHÔNG dùng kebab-case từ icons.md cũ (`basic-home`)
- KHÔNG dùng Lucide icons
- KHÔNG normalize tên — dùng chính xác như trong icon.json

---

## Common Searches

```
# Tìm component spec
search("BottomSheet", collection="momo-prototype-kit")

# Tìm color tokens
search("color tokens", collection="momo-prototype-kit")

# Tìm component theo tính năng
vector_search("bottom navigation tab bar", collection="momo-prototype-kit")

# Load specific file
get("components/bottom-sheet.md", collection="momo-prototype-kit")

# Load nhiều files
multi_get("components/button*.md", collection="momo-prototype-kit")
```
