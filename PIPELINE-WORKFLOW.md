# AI Feature Pipeline Workflow

## 🚀 Complete Pipeline Flow

```
Raw Feature Brief
        ↓
┌─────────────────────────────────────────────────────────────┐
│                    Stage 1: PO Agent                        │
│                   (po-orchestrator)                         │
│                                                             │
│  Phase A: product-craft skill                              │
│  ├─ Input: Raw feature brief                               │
│  └─ Output: Product Brief (validated)                      │
│                    ↓                                        │
│  Phase B: product-craft skill (parallel sub-agents)       │
│  ├─ Input: Product Brief                                   │
│  └─ Output: PRD + User Stories + Task Graph                │
│                                                             │
│  📁 Artifacts saved to:                                    │
│  pipeline-output/{runId}/stage-1-po/                       │
│  ├─ product-brief.json                                     │
│  ├─ prd.json                                               │
│  ├─ user-stories.json                                      │
│  ├─ task-graph.json                                        │
│  └─ logs.txt                                               │
└─────────────────────────────────────────────────────────────┘
        ↓ Notification
┌─────────────────────────────────────────────────────────────┐
│                   Stage 2: Design Agent                     │
│                  (design-specialist)                        │
│                                                             │
│  Process: ui-composer skill                                │
│  ├─ Input: Product Brief from Stage 1                      │
│  └─ Output: Design Spec JSON (one per screen)              │
│                                                             │
│  📁 Artifacts saved to:                                    │
│  pipeline-output/{runId}/stage-2-design/                   │
│  ├─ design-specs/                                          │
│  │   ├─ screen-1.json                                      │
│  │   ├─ screen-2.json                                      │
│  │   └─ screen-N.json                                      │
│  └─ logs.txt                                               │
└─────────────────────────────────────────────────────────────┘
        ↓ Notification
┌─────────────────────────────────────────────────────────────┐
│                 Stage 3: Developer Agent                    │
│                   (dev-engineer)                           │
│                                                             │
│  Process: design-system-kits skill                         │
│  ├─ Input: Design Spec JSON from Stage 2                   │
│  └─ Output: React Native code + live preview               │
│                                                             │
│  📁 Artifacts saved to:                                    │
│  pipeline-output/{runId}/stage-3-dev/                      │
│  ├─ components/        # Generated React Native components │
│  ├─ screens/          # Screen components (.tsx files)     │
│  ├─ navigation/       # Navigation flow code               │
│  ├─ preview/          # Live preview assets                │
│  └─ logs.txt                                               │
└─────────────────────────────────────────────────────────────┘
        ↓
    Final Deliverable to User
    ├─ Production-ready React Native code
    ├─ Live preview
    └─ Complete navigation flow
```

## 📋 Stage Details

### Stage 1: PO Agent (po-orchestrator)
- **Skills Used**: `product-craft`
- **Two-Phase Process**:
  - **Phase A**: Validate raw brief → structured Product Brief
  - **Phase B**: Product Brief → PRD, User Stories, Task Graph (parallel sub-agents)
- **Agent Type**: AgentResult<POOutput>
- **Parallel Execution**: Sub-agents within Phase B run via Promise.all()

### Stage 2: Design Agent (design-specialist)  
- **Skills Used**: `ui-composer`
- **Process**: Analyze Product Brief → Generate Design Spec JSON per screen
- **MoMo KitX Integration**: Uses COMPONENT-REGISTRY-v4.json for component validation
- **Agent Type**: AgentResult<DesignOutput>

### Stage 3: Developer Agent (dev-engineer)
- **Skills Used**: `design-system-kits`  
- **Process**: Design Spec JSON → React Native .tsx files + live preview
- **Tech Stack**: React Native (Expo) + MoMo KitX design system
- **Agent Type**: AgentResult<DevOutput>

## 🏗️ Architecture Patterns

### Agent Result Contract
```typescript
AgentResult<T> = {
  status: 'success' | 'error',
  data: T,
  runId: string,
  stage: 'po' | 'design' | 'dev',
  duration: number,
  logs: string[],
  error?: string
}
```

### Sub-Agent Pattern
```typescript
// Pure async functions within each stage
async function subAgentName(input: T): Promise<U>

// Parallel execution within stage
const [a, b, c] = await Promise.all([
  subA(input), 
  subB(input), 
  subC(input)
])
```

### File Output Pattern
```typescript
import { writeOutput } from '../../shared/file-io'
await writeOutput(runId, stage, 'filename.json', data)
// Writes to: pipeline-output/{runId}/{stage}/filename.json
```

## 🚀 Command Usage

```bash
# Full 3-stage pipeline
npm run pipeline "Build a user login screen"

# Individual stages
npm run po "Build a user login screen"      # Stage 1 only
npm run design "path/to/prd.json"           # Stage 2 only  
npm run dev "path/to/design-spec.json"      # Stage 3 only
```

## 📂 Output Structure
```
pipeline-output/
├── run-2026-04-01-120000/    # Each run has unique ID
│   ├── stage-1-po/           # PO Agent outputs
│   ├── stage-2-design/       # Design Agent outputs  
│   └── stage-3-dev/          # Developer Agent outputs
└── latest/                   # Symlink to most recent run
```

This pipeline transforms a simple feature brief into production-ready code with full traceability and artifact preservation at each stage.