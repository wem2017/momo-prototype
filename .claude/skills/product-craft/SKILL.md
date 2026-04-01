---
name: product-craft
description: >
  Từ vague input, spec chưa đầy đủ, hoặc modify request → structured Product Brief.
  Clarify scope, challenge premises, tổng hợp discovery research, mô tả component-level changes.
---

# product-craft — Product Brief Builder

**Owner:** Product team
**Role:** Từ vague input → structured Product Brief
**Output:** `pipeline-output/{runId}/po/product-brief.md`

---

## MANDATORY — Load trước khi làm bất cứ gì

1. Read `references/philosophy.md` (North Star + principles)
2. Read `references/anti-patterns-global.md` (blocked rationalizations)
3. Read `references/question-format.md` + `references/product-brief.template.md` + `references/constraints-global.md` + `references/document-trail.md` + `references/qmd-guide.md`
4. Scan `pipeline-output/{runId}/po/` cho existing artifacts (resume nếu có)

KHÔNG chạy bất kỳ mode nào nếu chưa complete 4 bước trên.

---

## Modes

| Mode | When | Output |
|------|------|--------|
| B — Clarify | Input thiếu 3+ of 4 mandatory elements | Product Brief |
| B1 — Discovery Brief | Input là discovery brief/research output | Product Brief |
| C — Spec Analyzer | Explicit "review spec này" | Completeness matrix + gap analysis |
| D — Modify | Thay đổi component/vùng trên màn hình có sẵn | Product Brief (Modify) |

### Round 0 — Problem Framing (TRƯỚC requirement gathering)

> Mandatory cho DISCOVERY tier. STANDARD tier: trigger nếu 9 Elements check thiếu Problem element.

1. "Vấn đề thực sự là gì? User đang struggle ở đâu?"
2. Challenge 1-2 implicit premises: "Bạn assume [X] — đã validate chưa?"
3. CHỈ proceed SAU KHI owner confirm problem framing.

Owner nói "cứ build đi" → ghi decision-log: Round 0 skipped by owner request.

### Mode B — Clarify

1. Hỏi structured questions (max 3 lượt, gộp Reference Discovery + Empathy Check)
2. Áp dụng 1-push rule: Owner trả lời mơ hồ → push 1 lần duy nhất, sau đó dùng judgment
3. Validate đủ 4 mandatory elements
4. Tạo Product Brief → `pipeline-output/{runId}/po/product-brief.md`
5. Owner confirm → chuyển sang Premise Check

**Vietnamese high-context:** Interpret, don't reject. "Làm cái app đó" → extract intent.
**Load:** `references/requirement-gathering.md`, `references/product-brief.template.md`, `references/common-errors.md`

### Mode B1 — Discovery Brief Handler

Extract 4 mandatory elements → discard non-prototype analysis → ask 1 clarify nếu cần → Tạo Product Brief → confirm.
**Load:** `references/product-brief.template.md`

### Mode C — Spec Analyzer

Output: Completeness matrix (9 elements) + Quality check + Gap analysis + Recommendations.
**Save:** `pipeline-output/{runId}/po/spec-analysis.md`

### Mode D — Modify

> Khi Owner muốn thay đổi trên feature/màn hình ĐÃ CÓ. Khác Mode B: không build từ scratch mà focus vào delta — vùng cần thay đổi ở component-level.

**Trigger:** Owner nói "sửa cái này", "thay đổi chỗ này", "update feature X", "modify", hoặc reference đến màn hình/feature đang có.

**Load:** `references/requirement-gathering.md` (section Modify), `references/product-brief.template.md` (sections 10-12), `references/common-errors.md`

#### Input Requirements (3 mandatory cho Modify)

| # | Input | Bắt buộc? | Cách lấy |
|---|-------|-----------|----------|
| 1 | **Change Scope** — vùng/component nào cần thay đổi | ✅ | Owner mô tả hoặc highlight trên screenshot |
| 2 | **Change Reason** — tại sao thay đổi (business/UX rationale) | ✅ | Hỏi Owner: "Tại sao cần sửa chỗ này?" |
| 3 | **Expected Outcome** — sau khi sửa, nó phải như thế nào | ✅ | Hỏi Owner: "Sửa xong, user trải nghiệm khác gì?" |
| 4 | **Screenshot hiện tại** | Recommended | Owner cung cấp khi chat — KHÔNG nằm trong brief |
| 5 | **Design spec JSON hiện tại** | Nếu có | Check `pipeline-output/{runId}/` hoặc hỏi Owner |

#### Workflow

1. **Detect Modify trigger** → confirm với Owner: "Bạn đang muốn thay đổi trên [feature/màn hình] hiện có, đúng không?"
2. **Narrow scope** → hỏi 3 mandatory inputs (gộp 1 lượt AskUserQuestion)
3. **Check existing context:**
   - Có design spec JSON? → Reference, KHÔNG gen mới
   - Có product brief cũ? → Extend, không viết lại
   - Không có gì? → Note: "Không có spec hiện tại, brief mô tả delta only"
4. **Tạo Product Brief (Modify)** → fill sections 10-12 trong template → `pipeline-output/{runId}/po/product-brief.md`
5. Owner confirm → chuyển sang Premise Check (câu hỏi adapt cho Modify context)

#### Nguyên tắc Component-Level

- KHÔNG mô tả nguyên màn hình — chỉ mô tả vùng thay đổi
- Nếu Owner muốn sửa nhiều vùng → tách từng component, ưu tiên 1 lần 1
- Output brief phải đủ cụ thể để design viết spec cho ĐÚNG component đó, không cần biết toàn bộ màn hình
- Nếu change impact các component khác (dependency) → note rõ trong brief, KHÔNG tự expand scope

#### Anti-patterns Modify

| Sai | Đúng |
|-----|------|
| Gen brief cho nguyên màn hình khi chỉ sửa 1 vùng | Brief chỉ cover delta — component cần thay đổi |
| Yêu cầu Owner mô tả lại toàn bộ feature | Chỉ hỏi: sửa chỗ nào, tại sao, kỳ vọng gì |
| Gen design spec JSON mới khi đã có JSON cũ | Edit trên JSON hiện tại |
| Tự expand scope vì "sửa chỗ này thì chỗ kia cũng phải sửa" | Note dependency, để Owner quyết định |

---

## Premise Check + Scope Options (MANDATORY trước Phase B của po-orchestrator)

### Premise Check (3 câu, gộp vào 1 AskUserQuestion)

1. "Prototype này đang giải quyết đúng problem [tóm tắt], hay nên giải quyết vấn đề khác?"
2. "Có screen/feature nào trong app hiện tại đã làm tương tự chưa? Khác gì?"
3. "Trong [N] features đã list, tất cả đều cần cho [mục đích], hay có feature nào bỏ được?"

Owner disagree bất kỳ premise → revise Product Brief, loop lại.

### Scope Options (2-3 mức, Owner chọn)

```
SCOPE A: Core Only — [N] screens, [N] flow chính. Completeness 5/10.
SCOPE B: Full Demo — [N] screens, transitions, realistic data. 7/10.
SCOPE C: Wow Factor — Animations, edge states, tablet. 9/10. (chỉ khi Owner cần)

RECOMMENDATION: [X] vì [lý do liên quan mục đích prototype].
```

Owner chọn → scope lock → po-orchestrator chuyển sang Phase B (po-requirements).

---

## Reference & Context Discovery (PROACTIVE)

Sau 4 Mandatory Elements, chủ động hỏi (gộp vào clarify):
- "Có app/feature/screenshot nào muốn tham khảo không?"
- "Có PRD, spec, hoặc tài liệu hệ thống liên quan không?"

**Load:** `references/qmd-guide.md` — lookup workflow, collections, rules.

---

## BLOCKED RATIONALIZATIONS

> Nguyên tắc: BẤT KỲ lý do nào để skip một required step đều INVALID
> trừ khi owner explicitly approve VÀ approval ghi vào decision-log.

- "Requirements clear đủ rồi" → INVALID. 9 Elements check > judgment.
- "User biết rõ mình muốn gì" → INVALID. Challenge premises (Round 0).
- "Skip product-brief vì chỉ có text" → INVALID. Product brief luôn required trước po-requirements.
- "Modify nhỏ nên không cần brief" → INVALID. Mọi thay đổi cần brief để design có context đúng.
- "Sửa luôn cả màn hình cho nhanh" → INVALID. Modify = component-level. Muốn làm lại cả màn hình → chuyển Mode B.

---

## Rules

- Max 3 lượt hỏi clarify (mỗi lượt gộp nhiều câu)
- 1-push rule: Owner mơ hồ → push 1 lần → dùng judgment + ghi assumption
- Mọi câu hỏi PHẢI follow AskUserQuestion 4-step format (references/question-format.md)
- Sau mỗi non-trivial interaction, append observation vào `pipeline-output/{runId}/po/decision-log.md`
- Khi blocked → return về po-orchestrator, KHÔNG dừng im
