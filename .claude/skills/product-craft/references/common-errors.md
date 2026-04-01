# Common Errors — Spec, Cultural, and Technical

## Part 1: Spec Quality Errors

### Vague Requirements
**Signal:** "Làm cho đẹp", "Cải thiện UX", "Giống app X"
**Fix:** Ask specifically: "Đẹp theo tiêu chí nào? Bạn muốn giống phần nào của app X?"
**Default:** Apply MoMo brand standards if no answer.

### Over-Scoped Spec
**Signal:** 8+ features listed, "và thêm cả...", "full app"
**Fix:** "Prototype nên tập trung 3-5 core features. Bạn chọn 3 quan trọng nhất?"
**Rule:** Max 5 core features per prototype. Rest goes to iteration or separate prototype.

### Database-First Thinking
**Signal:** "Cần schema trước", "Backend API endpoints", "Kiến trúc database"
**Fix:** "Prototype = UI first. Tôi sẽ mock data. Bạn mô tả user thấy gì trên màn hình?"

### Missing User Context
**Signal:** No mention of who uses the feature, why, or when
**Fix:** "Ai dùng feature này? Trong tình huống nào? Mục đích chính là gì?"

### Conflicting Requirements
**Signal:** "Đơn giản nhưng đầy đủ tính năng", "Nhanh nhưng phải perfect"
**Fix:** "Hai mục tiêu này xung đột. Bạn ưu tiên cái nào cho prototype này?"

---

## Part 2: Vietnamese Cultural Patterns

### High-Context Communication
**Pattern:** "Làm cái app đó" (that app), "Cái hôm trước nói ấy" (that thing we discussed)
**Handle:** Interpret from context, don't reject. Ask 1 clarifying question max.
**Anti-pattern:** Responding "Requirement không rõ ràng, vui lòng cung cấp spec đầy đủ" — too formal.

### Implicit Context
**Pattern:** User assumes you know MoMo product context without explaining
**Handle:** Use MoMo domain knowledge to fill gaps.

### Vague Quantifiers
**Pattern:** "Nhiều" (many), "một số" (some), "vài cái" (a few)
**Handle:** Pick a concrete number. "Nhiều transactions" → mock 8-10 items.

### Indirect Feedback
**Pattern:** "Được rồi nhưng mà..." (OK but...), "Cũng được" (it's fine, implying it's not)
**Handle:** Treat "nhưng mà" as primary feedback. "Cũng được" means rework needed.

### Over-scoping via Enthusiasm
**Pattern:** "Hay quá, thêm luôn cái này, cái kia, cái nọ nữa đi"
**Handle:** "Tôi note lại. Để hoàn thành prototype hiện tại trước, rồi iterate thêm features?"

---

## Part 3: Technical Pitfalls

### Over-Engineering
**Signal:** Adding state management library, creating component library, setting up routing
**Fix:** useState is enough. Single file. Simulated routing via state.

### Vietnamese Text Rendering
**Signal:** Diacritics not displaying, text truncation cutting Vietnamese words
**Fixes:**
- Always use `font-family: system-ui` (supports Vietnamese)
- Use `break-words` not `truncate` for Vietnamese text
- Test with long Vietnamese names: "Nguyễn Thị Phương Thảo"

### Mobile Layout Breaks
**Signal:** Content overflows in IPhoneBezel 390x844, bottom nav covers content, scroll issues
**Fixes:**
- Always test in IPhoneBezel frame (yarn web) first
- Bottom nav: use `pb-[56px]` on content area
- Use `overflow-y-auto` on scrollable containers
- `min-h-screen` on wrapper, `h-full` on content sections

### Unrealistic Mock Data
**Signal:** "User 1", "$100", "01/01/2000", English names
**Fixes:**
- Vietnamese names (Nguyễn, Trần, Lê, etc.)
- VND amounts: realistic ranges (50,000đ — 10,000,000đ)
- Recent dates (within last 30 days)
- Vietnamese phone format: 09xx-xxx-xxx

### Missing States
**Signal:** Only happy path rendered, no empty/loading/error states
**Fixes:**
```tsx
// Empty state
{items.length === 0 && (
  <View style={{ alignItems: 'center', justifyContent: 'center', paddingVertical: 64 }}>
    <Icon source="file_file" size={48} color={Colors.black_06} />
    <Text typography="body_default_regular" style={{ color: Colors.black_06 }}>Chưa có dữ liệu</Text>
  </View>
)}

// Loading state
{isLoading && (
  <View style={{ gap: Spacing.M }}>
    {[1,2,3].map(i => (
      <Skeleton key={i} style={{ height: 64, borderRadius: 8 }} />
    ))}
  </View>
)}
```
