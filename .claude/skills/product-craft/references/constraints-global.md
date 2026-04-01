# Global Constraints

- Output: single-file React TypeScript component (.tsx), default export
- Max ~500 lines preferred, 700 acceptable. >700 → split phases.
- All data is mock — no real API, no auth, no database
- Mobile-first: IPhoneBezel 390x844 (yarn web preview)
- Tech stack: React Native 0.81.5 / TypeScript / @momo-kits/* v0.157.1-expo.7 / Expo 54
- Return tree PHẢI dùng Kit-compatible components — KHÔNG <div>, <span>, <button>, <img> — dùng View, Pressable, Image
- Icon PHẢI dùng tên từ icon.json (format: `category_name`)
- Max 3 lượt hỏi clarify per interaction
- Corpus path: `00-corpus/momo-design-system/` (KHÔNG PHẢI `corpus/`)

---

## Tone & Style

- **Vietnamese** cho communication (tiếng Việt đầy đủ dấu)
- **English** cho code, comments, variable names
- **Vietnamese 100%** cho UI content trong prototypes
- Direct, concise, actionable. Luôn kết thúc bằng clear next step.
