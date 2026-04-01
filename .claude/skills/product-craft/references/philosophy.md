# Core Philosophy (7 Principles)

1. **Think Before Build** — Analyze mandatory. Never code before Spec Check.
2. **Prototype ≠ Production** — Mock data + in-memory state. No backend, no auth.
3. **Self-Criticism Mandatory** — 13 criteria after every build. Score < 7/13 → fix first.
4. **Progressive Build** — Mỗi phase output complete runnable code. No TODO.
5. **Vietnamese Realism** — Vietnamese names, VND, DD/MM/YYYY. English placeholder = fail.
6. **Design System First** — Mọi component reference corpus trước. Không invent.
7. **Kit Foundation Mappable** — Return tree dùng Kit components. Dev copy → đổi import → chạy.

---

## North Star Question

> "Nếu ai đó không biết gì về feature này mở prototype trên điện thoại ngay bây giờ — kể cả khi data đang loading hoặc trống — họ có hiểu ngay nó làm gì và dùng thế nào không?"

Mọi build decision bắt đầu từ câu hỏi này.

---

## Round 0 — Problem Framing

Round 0 = challenge problem framing TRƯỚC solutioning. Mandatory cho DISCOVERY tier. Hỏi "vấn đề thực sự là gì?" trước khi hỏi "build cái gì?" Protocol chi tiết: `skills/product-craft/SKILL.md` (Round 0 section).

---

## Context Budget — Observable Calibration Triggers

### Trigger 1 — PRIMARY (purely mechanical — always works)

**Tool call volume:** >30 tool calls in session → MANDATORY re-read preamble files. >50 tool calls → MANDATORY SPLIT session.

### Triggers 2a-2c — SECONDARY (agent self-detect — work khi degradation nhẹ, unreliable khi nặng)

2a. **Rule amnesia:** Agent output contradicts a rule đã load ở preamble (e.g., sai corpus path, skip gate check)
2b. **Repetition:** Agent lặp lại cùng error đã fix trong iteration trước
2c. **Drift from brief:** Output bắt đầu thêm features/components không có trong brief

**⚠️ Paradox acknowledged:** Signals 2a và 2c yêu cầu agent tự nhận ra degradation — chính xác khả năng bị mất khi context overflow. Vì vậy Trigger 1 là primary (always works), 2a-2c là bonus (catch nhẹ, miss nặng).

### Owner Override (ultimate safety net)

- Owner thấy output quality drop → owner CAN force split bất kỳ lúc nào
- Command: "Split session. Save progress. Resume fresh."
- Agent KHÔNG được rationalize "tôi vẫn OK, không cần split."

### Khi trigger SPLIT:

- Save progress vào products/{team}/
- Return "partial — cần session tiếp" to main agent
- Main agent re-delegate CÙNG subagent: "Continue from [last step]. Read [saved artifacts] first."

### Rule Refresh (preventive, không cần trigger):

TRƯỚC mỗi major step (>5 tool calls since last read): re-read MANDATORY preamble files.

BLOCKED RATIONALIZATION:
- "Tôi vẫn nhớ rules" → INVALID. Re-read > recall. Disk > memory.
- "Chưa đến 30 tool calls" → INVALID nếu có signal 2a, 2b, hoặc 2c. Signals > counts.
- "Owner chưa nói split" → INVALID nếu primary trigger #1 hit. Owner override là backup, không phải prerequisite.
