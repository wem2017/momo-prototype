# Knowledge: Requirement Gathering

## Mục đích
Hướng dẫn agent khai thác đúng và đủ thông tin từ input mơ hồ trước khi build. Đặc biệt quan trọng khi nhận input trực tiếp từ nhân viên MoMo.

---

## 4 yếu tố BẮT BUỘC trước khi build

Không bao giờ code khi thiếu bất kỳ yếu tố nào:

### 1. Problem (Vấn đề giải quyết)
- Prototype này giải quyết vấn đề gì?
- Ai đang gặp vấn đề này?
- Vấn đề này nghiêm trọng đến mức nào?

### 2. Target User (Đối tượng sử dụng)
- User là ai? (end-user MoMo, merchant, internal staff, investor...)
- User đã quen với sản phẩm tương tự chưa?
- Context sử dụng: mobile hay desktop?

### 3. Core Feature (Tính năng chính)
- Tính năng quan trọng nhất là gì? (CHỈ 1-3 tính năng)
- User flow chính: bắt đầu từ đâu, kết thúc ở đâu?
- Có interaction nào bắt buộc phải có?

### 4. Mục đích Prototype
- Demo cho ai? (investor, user research, leadership, team...)
- Cần demo điều gì? (concept? flow? UI?)
- Có deadline không?

---

## Câu hỏi bổ sung (gộp vào lượt clarify, KHÔNG tạo round-trip riêng)

Ngoài 4 yếu tố bắt buộc, hỏi thêm khi phù hợp:

| # | Câu hỏi | Khi nào hỏi |
|---|---------|-------------|
| 5 | "Prototype thành công khi nào? Có tiêu chí đo lường?" | Luôn hỏi — success criteria |
| 6 | "Tại sao cần làm bây giờ? Có deadline, event, hay áp lực?" | Khi Owner không nói rõ context |
| 7 | "Có giới hạn nào về tech, design, hay scope?" | Khi feature phức tạp |
| 8 | "Người xem demo kỳ vọng thấy gì? Concept hay interactive flow?" | Khi mục đích chưa cụ thể |

**Nguyên tắc:** Đảm bảo Owner trả lời rõ ràng, critical thinking. Nếu câu trả lời mơ hồ → hỏi lại cụ thể hơn, KHÔNG giả định.

---

## Requirement Gathering cho Mode D — Modify

> Khác Mode B: KHÔNG hỏi 4 mandatory elements từ scratch. Thay vào đó, hỏi 3 Modify inputs.

### 3 yếu tố BẮT BUỘC cho Modify

| # | Yếu tố | Câu hỏi | Khi nào đủ |
|---|--------|---------|------------|
| 1 | **Change Scope** | "Bạn muốn thay đổi chỗ nào trên màn hình? Mô tả hoặc highlight trên screenshot." | Owner chỉ được vùng cụ thể (component-level, không phải "cả màn hình") |
| 2 | **Change Reason** | "Tại sao cần sửa chỗ này? User đang gặp vấn đề gì hoặc business yêu cầu gì?" | Có rationale rõ — không phải "sửa cho đẹp hơn" |
| 3 | **Expected Outcome** | "Sau khi sửa, user trải nghiệm khác gì so với hiện tại?" | Có acceptance criteria kiểm chứng được |

### Câu hỏi bổ sung cho Modify (gộp vào 1 lượt)

| # | Câu hỏi | Khi nào hỏi |
|---|---------|-------------|
| 4 | "Thay đổi này có ảnh hưởng đến component khác trên màn hình không?" | Luôn hỏi — impact assessment |
| 5 | "Có design spec JSON hoặc product brief cũ của feature này không?" | Luôn hỏi — context check |
| 6 | "Phần nào trên màn hình PHẢI giữ nguyên không đổi?" | Khi scope chưa rõ ranh giới |

### Chiến lược hỏi cho Modify

**Khi Owner gửi screenshot + mô tả rõ:**
```
Tôi hiểu: Bạn muốn sửa [vùng X] trên [feature Y].
Trước khi tôi viết brief, xác nhận giúp:
1. Tại sao cần sửa? (Business/UX reason)
2. Sau khi sửa, user sẽ thấy/làm gì khác?
3. Có component nào khác bị ảnh hưởng không?
```

**Khi Owner nói mơ hồ "sửa cái này":**
```
Bạn muốn thay đổi trên [feature] hiện có, đúng không?
Giúp tôi hiểu cụ thể:
1. Chỗ nào trên màn hình? (Mô tả hoặc gửi screenshot + highlight)
2. Sửa gì? (Thêm element mới / Đổi layout / Đổi logic / Bỏ element)
3. Tại sao?
```

### Xử lý scope creep trong Modify

| Owner nói | Xử lý |
|-----------|--------|
| "Sửa chỗ này, à mà sửa luôn chỗ kia nữa" | "Tôi note chỗ kia. Mình hoàn thành brief cho chỗ này trước, rồi tạo brief riêng cho chỗ kia?" |
| "Thôi làm lại cả màn hình luôn" | "Nếu đập làm lại cả màn hình → đó là Mode B (New), không phải Modify. Bạn muốn chuyển sang tạo brief cho màn hình mới?" |
| "Sửa xong test thấy cái khác cũng sai" | "Ghi nhận. Tạo brief riêng cho phần mới phát hiện — không gộp vào brief hiện tại." |

---

## Chiến lược hỏi

### Khi input quá mơ hồ (thiếu 3-4 yếu tố):
Hỏi **tất cả 4 yếu tố + câu hỏi bổ sung phù hợp trong 1 lần**:

```
Để build prototype hiệu quả, tôi cần biết:

1. **Problem:** Sản phẩm này giải quyết vấn đề gì?
2. **Target user:** Ai sẽ dùng? Mobile hay desktop?
3. **Core feature:** 1-3 tính năng chính nhất?
4. **Mục đích:** Prototype để demo cho ai, mục đích gì?
5. **Success criteria:** Prototype thành công khi nào?
```

### Khi input có phần rõ, phần mơ hồ (thiếu 1-2 yếu tố):
Chỉ hỏi phần thiếu, acknowledge phần đã rõ:

```
Tôi hiểu rồi: [tóm tắt phần đã rõ].
Cần thêm: [chỉ hỏi phần thiếu].
```

### Khi input từ agent khác (có cấu trúc):
Validate nhanh, confirm, rồi build:

```
Tôi hiểu requirement như sau:
- Problem: [X]
- User: [Y]
- Core: [Z]
- Mục đích: [W]

Đúng không? Tôi sẽ bắt đầu plan.
```

---

## 1-Push Rule — Khi Nào Cần Hỏi Lại Sâu Hơn

**Nguyên tắc:** Nếu câu trả lời cho **Problem** hoặc **Core Feature** vẫn mơ hồ SAU lần hỏi đầu → push 1 lần nữa, cụ thể hơn. Chỉ 1 lần. Không hỏi lần 3.

**Trigger conditions — khi nào câu trả lời "mơ hồ":**
- Dùng category thay vì cụ thể: "thanh toán" thay vì "thanh toán QR tại quầy"
- Dùng "tất cả" / "mọi thứ": "hỗ trợ tất cả loại giao dịch"
- Không có user flow: chỉ nói feature, không nói user làm gì
- Mâu thuẫn với mục đích: nói "demo nhanh" nhưng list 10 features

**Cách push:**
- KHÔNG hỏi chung chung "Cụ thể hơn được không?"
- HỎI specific: "Thanh toán cụ thể loại nào? QR? Chuyển tiền? Bill payment? Mỗi cái là prototype khác nhau."

**Sau push lần 1:** Accept câu trả lời, note assumption nếu vẫn mơ hồ, move on.

---

## Escape Hatch — Khi Owner Nói "Thôi Làm Đi"

**Trigger:** Owner nói "thôi làm đi", "đừng hỏi nữa", "just build", hoặc thể hiện sự sốt ruột.

**Response (lần 1):**
"Tôi hiểu. Nhưng 1 câu nữa thôi — [câu quan trọng nhất chưa hỏi]. Sau câu này tôi build luôn."

**Response (lần 2 — Owner vẫn sốt ruột):**
Tôn trọng. Proceed ngay với thông tin hiện có. Note rõ assumptions trong build plan:
"OK, tôi build ngay. Lưu ý: tôi đang giả định [A], [B], [C]. Nếu sai, cho tôi biết khi xem prototype."

**KHÔNG bao giờ:** Hỏi lần 3. Không giảng giải tại sao câu hỏi quan trọng. Không guilt-trip.

---

## Bảng xử lý input mơ hồ (có BAD/GOOD)

| Họ nói | BAD (đừng hỏi kiểu này) | GOOD (hỏi kiểu này) |
|--------|-------------------------|---------------------|
| "Làm cái app đó" | "Bạn muốn app như thế nào?" (quá chung) | "App này giải quyết vấn đề gì cho user? User mở app lên, việc đầu tiên họ làm là gì?" |
| "Giống cái kia" | "Bạn có thể mô tả thêm không?" (mơ hồ) | "Bạn đang nói đến app/feature cụ thể nào? Share screenshot hoặc tên app được không?" |
| "Làm cho đẹp" | "Bạn muốn style nào?" (vẫn mơ hồ) | "Đẹp theo tiêu chí nào? Màu sắc MoMo brand? Layout thoáng? Animation mượt? Chọn 1 ưu tiên." |
| "Thêm mấy cái nữa" | "Bạn muốn thêm gì?" (câu hỏi mở) | "Liệt kê 1-3 tính năng cụ thể muốn thêm. Ưu tiên cái nào nhất?" |
| "Chưa được tốt lắm" | "Bạn thấy chỗ nào chưa tốt?" (quá broad) | "Chưa tốt ở chỗ nào: layout? màu sắc? flow? nội dung? Chỉ cụ thể 1 phần." |
| "Cho 10 features + animation + login" | "Bạn muốn ưu tiên feature nào?" (sycophantic, không challenge) | "10 features là quá nhiều cho prototype. Tôi sẽ build 3 features quan trọng nhất. Cái nào PHẢI có cho demo?" |

**Nguyên tắc:** Không giả định. Hỏi cụ thể, đợi trả lời, rồi mới tiếp. Nếu core answer mơ hồ → áp dụng 1-Push Rule.

---

## Xử lý đặc thù ngôn ngữ Việt Nam

Nhân viên MoMo dùng ngôn ngữ high-context. Các pattern phổ biến:

### Pattern 1: Ambiguous References
**Nói:** "Làm cái app đó", "Cải tiến cái kia", "Giống cái này"
**Hỏi:** "Bạn đang nói đến sản phẩm/tính năng cụ thể nào?"

### Pattern 2: Implicit Context
**Nói:** "Anh hiểu ý em rồi đấy", "Như đã bàn"
**Hỏi:** "Tôi muốn chắc chắn hiểu đúng. Tóm tắt lại ý chính trong 2-3 câu?"

### Pattern 3: Vague Quantifiers
**Nói:** "Thêm mấy cái nữa", "Nhiều tính năng hơn"
**Hỏi:** "Cụ thể muốn thêm tính năng nào? Liệt kê 1-3 cái quan trọng nhất."

### Pattern 4: Indirect Feedback
**Nói:** "Chưa được tốt lắm", "Cũng được nhưng...", "Em sẽ suy nghĩ thêm"
**Hỏi:** "Phần nào chưa đúng ý? Layout, màu sắc, flow, hay nội dung?"

### Pattern 5: Over-scoping
**Nói:** "Làm hết đi, 10 màn hình + animation + login + payment"
**Hỏi:** "Với prototype, nên tập trung 1-2 tính năng chính nhất. Tính năng nào quan trọng nhất cho demo?"

---

## Reference & Context Discovery (PROACTIVE)

Sau khi có 4 yếu tố bắt buộc, **chủ động hỏi Owner** để giảm iteration và tăng chất lượng output. Gộp vào câu hỏi clarify — KHÔNG tạo round-trip riêng.

### 1. Visual References — "Có cái gì muốn làm giống vậy không?"

**Luôn hỏi.** Owner thường có hình dung nhưng không tự nói ra.

```
Bạn có app/feature/screenshot nào muốn tham khảo không?
Ví dụ: "giống màn hình X của app Y", hoặc screenshot từ Figma/Zeplin.
```

### 2. Existing Docs — PRD, spec, tài liệu hệ thống

**Hỏi khi feature đã có trong roadmap/backlog.**

```
Feature này có PRD, spec, hoặc tài liệu hệ thống nào liên quan không?
Nếu có, share cho tôi — tôi sẽ build sát với spec hơn.
```

### 3. Existing Code — Widget/component đã standardize

**Hỏi khi Owner đề cập đến shared components hoặc design system đã implement.**

```
Có code component nào đã build sẵn theo design system chưa?
Nếu có, share cho tôi — tôi sẽ dùng luôn thay vì build lại.
```

---

## Empathy Detection — Phát hiện lo lắng trong yêu cầu

| Signal trong yêu cầu | Cảm xúc | Response (acknowledge TRƯỚC, technical SAU) |
|----------------------|---------|---------------------------------------------|
| "Cần gấp", "mai demo", "deadline thứ 5" | Áp lực thời gian | "Tôi hiểu timeline gấp. Để tôi focus vào core flow trước, polish iteration sau." |
| "Sếp muốn xem", "CEO cần", "leadership review" | Áp lực stakeholder | "Understood. Tôi sẽ ưu tiên visual impact và professional feel cho demo." |
| "Không biết có được không", "thử xem", "chưa chắc" | Không chắc chắn | "Ý tưởng này hoàn toàn prototype được. Tôi build nhanh bản đầu, bạn xem rồi iterate." |
| "Lần trước bị feedback", "sợ như lần trước" | Lo lắng từ trải nghiệm cũ | "Tôi sẽ chú ý phần đó. Bạn share feedback lần trước để tôi tránh lặp lại?" |
| "Không biết bắt đầu từ đâu" | Overwhelmed | "Để tôi giúp structure. Bắt đầu từ 1 câu: user cần làm gì trên màn hình này?" |

**Quy tắc:**
- Acknowledge cảm xúc TRƯỚC → giải quyết technical SAU
- KHÔNG bỏ qua signals, chỉ hỏi technical questions
- KHÔNG coach hay dạy đời — empathize rồi hành động

---

## Checklist trước khi chuyển sang po-requirements (Phase B)

- [ ] Problem: Rõ ràng, cụ thể
- [ ] Target user: Biết là ai, context sử dụng
- [ ] Core feature: Tối đa 3, có user flow
- [ ] Mục đích: Biết demo cho ai, để làm gì
- [ ] Success criteria: Có tiêu chí đo lường (hoặc Owner xác nhận không cần)
- [ ] Scope: Đã giới hạn cho prototype
- [ ] References: Đã hỏi visual references + existing docs/code
- [ ] Empathy: Đã check và respond nếu có signal lo lắng
- [ ] 1-Push Rule: Core answers đủ cụ thể (hoặc đã push 1 lần)
- [ ] Premise Check: Owner đã confirm 3 premise questions
- [ ] Scope Option: Owner đã chọn A/B/C

Tất cả check → **tạo Product Brief** → Owner confirm → po-orchestrator chuyển Phase B (po-requirements).
