# Progress Info

> Linear progress bar with optional label, used to display completion status, upload progress, or goal tracking.

**Package:** `@momo-kits/progress-info`
**Platform support:** RN ✅ | Compose ❌ (use LinearProgressIndicator)

---

## Anatomy

```
    Title Label (optional)
    ┌──────────────────────────────────────┐
    │████████████░░░░░░░░░░░░░░░░░░░░░░░░░│  ← Track with fill
    └──────────────────────────────────────┘
```

| Part        | Description                                        | Required |
|-------------|-----------------------------------------------------|----------|
| Track       | Full-width background bar                           | Yes      |
| Fill        | Colored portion representing progress               | Yes      |
| Title       | Text label above the bar describing what is tracked | No       |

---

## Visual Specs

### Track

| Property      | Token / Value                |
|---------------|------------------------------|
| Background    | `Colors.black_04`            |
| Height        | 4-8 dp                       |
| Corner radius | `Radius.XS`                 |
| Width         | Full width of parent         |

### Fill

| Property      | Token / Value                              |
|---------------|--------------------------------------------|
| Color         | `Colors.pink_03` (default, themeable)      |
| Height        | Same as track height                        |
| Corner radius | `Radius.XS`                               |
| Min width     | 0 dp (at 0% progress)                     |
| Max width     | Full track width (at 100% progress)        |

### Title

| Property      | Token / Value                |
|---------------|------------------------------|
| Typography    | `body_default_regular`       |
| Color         | Default text color           |
| Position      | Above the progress bar       |
| Spacing below | `Spacing.XS` (4) to track   |

---

## Progress Value

| Property     | Value                                    |
|--------------|------------------------------------------|
| Range        | 0.0 (empty) to 1.0 (full)               |
| Direction    | Left-to-right fill                        |

---

## Animation

| Property       | Value                                         |
|----------------|-----------------------------------------------|
| Fill animation | Smooth animated transition when value changes |
| Direction      | Left-to-right                                 |

- When the progress value updates, the fill bar should animate smoothly to its new width.
- The animation should feel responsive but not jarring.

---

## States

| State            | Appearance                                       |
|------------------|--------------------------------------------------|
| **Empty (0.0)**  | Track only, no fill visible                      |
| **In progress**  | Partial fill proportional to value               |
| **Complete (1.0)**| Fill covers entire track                        |

---

## Accessibility

- Announce the progress value as a percentage to screen readers (e.g., "Progress: 65%").
- If a title label is present, associate it with the progress bar for context (e.g., "Upload progress: 65%").
- Progress updates should be announced when they change significantly (not on every frame).

---

## Usage Guidelines

### Do's

- Use for upload or download progress indicators.
- Use for goal completion tracking (e.g., savings goals, profile completeness).
- Use for step completion within a process.
- Provide a title label for context when the progress meaning is not obvious from surrounding content.
- Use animated transitions when the progress value changes.

### Don'ts

- Don't use for indeterminate loading states — use a Loader or Skeleton component instead.
- Don't use values outside the 0.0-1.0 range.
- Don't use a progress bar for tiny increments that won't be visually perceptible — consider a numeric display instead.
- Don't use multiple fill colors within a single progress bar — keep it simple.
- Don't place progress bars where they might be confused with dividers — include a title or surrounding context.
