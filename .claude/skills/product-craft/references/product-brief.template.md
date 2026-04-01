q# Product Brief Template

## Mục đích
File trung gian tạo SAU quá trình clarify với Owner. Tổng hợp toàn bộ câu trả lời thành "contract" rõ ràng trước khi build. Lưu tại `products/{team}/product-brief.md`.

> **RULE: Tất cả sections là REQUIRED.** Nếu section không áp dụng → ghi "N/A — [lý do]". KHÔNG ĐƯỢC bỏ section. Gate verify: section có content → check theo template. Section ghi "N/A — lý do" → PASS. Section thiếu hoàn toàn → FAIL.

---

## Template

```markdown
# Product Brief — [Tên sản phẩm/Feature]

> Owner: [Tên người yêu cầu]
> Ngày tạo: [YYYY-MM-DD]
> Status: Draft / Confirmed

---

## 1. Sản phẩm là gì? (← Context + Problem overview)
[Mô tả ngắn 1-2 câu: sản phẩm/feature này là gì, giải quyết vấn đề gì]

## 2. Làm cho ai?
- **Target user:** [end-user MoMo / merchant / internal staff / investor...]
- **Persona:** [Mô tả ngắn: tuổi, hành vi, context sử dụng]
- **Đã quen sản phẩm tương tự chưa?** [Có/Không — nếu có, sản phẩm nào?]

## 3. Tại sao phải làm?
- **Problem statement:** [Vấn đề cụ thể đang giải quyết]
- **Business context:** [Tại sao bây giờ? Có deadline, áp lực stakeholder, hay cơ hội thị trường?]
- **Mức độ nghiêm trọng:** [Critical / Important / Nice-to-have]

## 4. Success Criteria
- [ ] [Tiêu chí 1 — đo lường được]
- [ ] [Tiêu chí 2]
- [ ] [Tiêu chí 3]

## 5. Core Features
| # | Feature | User Flow | Priority |
|---|---------|-----------|----------|
| 1 | [Tên feature] | [Bắt đầu → kết thúc] | Must-have |
| 2 | | | Should-have |
| 3 | | | Nice-to-have |

**Giới hạn:** Tối đa 3 core features cho prototype. Nếu >3, Owner chọn ưu tiên.

## 6. Prototype Purpose
- **Demo cho ai?** [CEO / PM team / User research / Investor...]
- **Cần demo điều gì?** [Concept? Flow? UI? Technical feasibility?]
- **Kỳ vọng output:** [Clickable prototype / Visual mockup / Interactive demo]

## 7. Constraints
- **Deadline:** [Ngày cụ thể hoặc "không gấp"]
- **App type:** [Native feature / Mini-app] — quyết định TopNav pattern
- **Platform:** [Mobile IPhoneBezel 390x844]
- **Ngôn ngữ UI:** [Vietnamese / English / Bilingual]

## 8. References
- **Visual references:** [Screenshot / App tham khảo / Figma link — hoặc "Không có"]
- **PRD / Spec:** [Link hoặc "Không có"]
- **Existing code/components:** [Có component nào dùng lại? — hoặc "Không có"]

## 9. Ghi chú & Assumptions
[Những giả định skill đã tự fill, Owner cần confirm]
- [ ] [Assumption 1]
- [ ] [Assumption 2]

---

> **Owner confirm:** [ ] Đã review và đồng ý với brief trên

---

## MODIFY SECTIONS (Chỉ fill khi Mode D — Modify)

> Sections 10-12 chỉ áp dụng khi thay đổi trên feature/màn hình đã có.
> Khi Mode D: sections 1-3 viết ngắn gọn (context), section 5 = component cần thay đổi (không phải full feature list), sections 10-12 là phần chính.

## 10. Current State (Hiện trạng)
- **Feature/Màn hình:** [Tên feature hoặc screen đang có]
- **Component cần thay đổi:** [Tên hoặc mô tả vùng cụ thể — ví dụ: "Block chọn nhà mạng", "Header section", "Price selector"]
- **Trạng thái hiện tại:** [Component hiện tại hoạt động như thế nào — mô tả ngắn]
- **Design spec JSON hiện tại:** [Có / Không — nếu có, path hoặc reference]

## 11. Change Scope (Phạm vi thay đổi)
- **Thay đổi gì:** [Mô tả cụ thể: thêm field, đổi layout, thêm logic, bỏ element...]
- **Tại sao:** [Business/UX rationale — vấn đề user đang gặp hoặc yêu cầu business]
- **Impact assessment:**
  - [ ] Chỉ component này — không ảnh hưởng component khác
  - [ ] Có dependency — ảnh hưởng đến: [liệt kê components liên quan]
- **Approach:** [Replace component / Update component / Add new component alongside existing]

## 12. Expected Outcome
- **User experience sau khi sửa:** [User sẽ thấy/làm gì khác so với hiện tại]
- **Acceptance criteria:**
  - [ ] [Tiêu chí 1 — kiểm chứng được]
  - [ ] [Tiêu chí 2]
- **Không thay đổi:** [Liệt kê rõ phần nào giữ nguyên — giúp design không sửa nhầm]
```

---

## Khi nào tạo Product Brief

| Trigger | Hành động |
|---------|-----------|
| Mode B (Clarify) | Sau khi Owner trả lời đủ 4 mandatory elements + Reference Discovery → tạo Product Brief → confirm → chạy Premise Check + Scope Options → chuyển design-studio |
| Mode B1 (Discovery Brief Handler) | Extract từ discovery brief → tạo Product Brief → confirm → Premise Check |
| Mode C (Spec Analyzer) | Output: Completeness matrix, KHÔNG tạo Product Brief |
| Mode D (Modify) | Owner muốn sửa feature có sẵn → hỏi 3 Modify inputs → tạo Product Brief (sections 1-9 ngắn gọn + sections 10-12 chi tiết) → confirm → Premise Check (adapt cho Modify) |

## Câu hỏi clarify bổ sung (ngoài 4 mandatory elements)

Gộp vào lượt hỏi clarify, KHÔNG tạo round-trip riêng:

1. **Success criteria:** "Prototype này thành công khi nào? Có tiêu chí đo lường không?"
2. **Business context:** "Tại sao cần làm bây giờ? Có event, deadline, hay áp lực nào?"
3. **Constraints:** "Có giới hạn nào về tech, design, hay scope không?"
4. **Stakeholder expectation:** "Người xem demo kỳ vọng thấy gì? Concept hay interactive flow?"

**Nguyên tắc:** Đảm bảo Owner trả lời rõ ràng, critical thinking. Nếu câu trả lời mơ hồ → hỏi lại cụ thể hơn, KHÔNG giả định.
