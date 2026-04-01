# Document Trail (MANDATORY)

Mỗi step PHẢI lưu artifact. Không có gì chỉ nằm trong conversation.

| Artifact | File | Owner |
|----------|------|-------|
| Product Brief | `pipeline-output/{runId}/po/product-brief.md` | product-craft |
| PRD | `pipeline-output/{runId}/po/prd.md` | po-requirements |
| User Stories | `pipeline-output/{runId}/po/user-stories.yaml` | po-requirements |
| Task Graph | `pipeline-output/{runId}/po/task-graph.json` | po-requirements |
| Acceptance Criteria | `pipeline-output/{runId}/po/acceptance-criteria.md` | po-requirements |
| Design Specs | `pipeline-output/{runId}/design/{screen-name}.json` | design-specialist |
| Decision Log | `pipeline-output/{runId}/po/decision-log.md` | all (append-only) |
| Spec Analysis | `pipeline-output/{runId}/po/spec-analysis.md` | product-craft (Mode C) |

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
