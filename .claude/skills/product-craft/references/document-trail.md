# Document Trail (MANDATORY)

Mỗi step PHẢI lưu artifact. Không có gì chỉ nằm trong conversation.

| Artifact | File | Owner |
|----------|------|-------|
| Product Brief | `products/{team}/product-brief.md` | product-craft |
| Design Specs | `products/{team}/{screen-name}-design-specs.json` | design-studio (single owner) |
| Decision Log | `products/{team}/decision-log.md` | all (append-only) |
| Spec Analysis | `products/{team}/spec-analysis.md` | product-craft (Mode C) |
| Prototype Code | `prototype-kits/src/{ScreenName}.tsx` | code-forge |

Mọi AskUserQuestion response, Gate decision, Premise check, Scope lock → append `decision-log.md`.

---

## Decision-Log Entry Template

```markdown
## Entry: {date} — {subagent} — {decision}
**Context:** {Situation — what was happening when decision was needed}
**Options considered:** {Alternatives evaluated}
**Decision:** {What was chosen}
**WHY:** {Reasoning — critical field, không được bỏ trống}
**Trade-offs accepted:** {What was given up by choosing this option}
```

WHY là mandatory field. Entry không có WHY = incomplete. Mọi subagent PHẢI fill WHY khi append decision-log.
