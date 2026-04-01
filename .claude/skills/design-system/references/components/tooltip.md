# Tooltip

> Contextual help popup attached to a trigger element, used for feature discovery, field help, and first-time guidance.

**Package:** `@momo-kits/animated-tooltip`
**Platform support:** RN ✅ (AnimatedTooltip) | Compose ✅

---

## Anatomy

```
              ┌──────────────────────────┐
              │  Title (optional)        │
              │  Description text here   │
              │           [Action Button]│
              └────────────┬─────────────┘
                           ▼
                    (arrow pointer)
                   ┌──────────┐
                   │ Trigger  │
                   └──────────┘
```

| Part          | Description                                          | Required |
|---------------|------------------------------------------------------|----------|
| Container     | Rounded rectangle holding tooltip content            | Yes      |
| Title         | Bold heading line within the tooltip                 | No       |
| Description   | Explanatory text                                     | Yes      |
| Action button | Optional text button for a follow-up action          | No       |
| Arrow         | Triangular pointer connecting tooltip to trigger     | Yes      |

---

## Placement

The tooltip can be positioned relative to the trigger element:

| Placement  | Arrow direction         |
|------------|-------------------------|
| **TOP**    | Arrow points down       |
| **BOTTOM** | Arrow points up         |
| **LEFT**   | Arrow points right      |
| **RIGHT**  | Arrow points left       |

### Alignment

Within each placement, the tooltip can be aligned along the trigger:

| Alignment  | Description                                  |
|------------|----------------------------------------------|
| **START**  | Tooltip aligns to the start edge of trigger  |
| **CENTER** | Tooltip is centered on the trigger           |
| **END**    | Tooltip aligns to the end edge of trigger    |

---

## Visual Specs

### Dark Theme (Default)

| Property         | Token / Value              |
|------------------|----------------------------|
| Background       | `Colors.black_17`          |
| Title color      | `Colors.white`             |
| Description color| `Colors.white`             |
| Title typography | `body_default_semibold`    |
| Desc. typography | `body_s_regular`           |
| Corner radius    | `Radius.S`                 |
| Padding          | `Spacing.M` (12) all sides |
| Max width        | 240 dp                     |

### Light Theme

| Property         | Token / Value                          |
|------------------|----------------------------------------|
| Background       | `Colors.surface` (theme surface color) |
| Title color      | Default text color                     |
| Description color| Default text color                     |
| All other specs  | Same as dark theme                     |

### Arrow

| Property  | Value                                          |
|-----------|------------------------------------------------|
| Size      | 8 dp triangle                                  |
| Color     | Matches container background                   |
| Position  | Points toward the trigger element center       |

---

## Animation

| Property   | Value                |
|------------|----------------------|
| Enter      | Fade in              |
| Exit       | Fade out             |

---

## Interaction

| Trigger action      | Behavior                          |
|----------------------|-----------------------------------|
| Tap trigger          | Show, hide, or toggle tooltip     |
| Tap outside tooltip  | Dismiss tooltip                   |
| Tap action button    | Execute action and dismiss        |

The tooltip visibility is managed via state: **show**, **hide**, or **toggle**.

---

## Accessibility

- Tooltip content must be announced to screen readers when displayed.
- Tooltip must be dismissible by tapping outside — do not trap focus.
- If the tooltip contains an action button, that button must be reachable by assistive technology.
- On screen readers, the trigger element should indicate that additional information is available.

---

## Usage Guidelines

### Do's

- Use for feature discovery and onboarding highlights.
- Use to provide brief explanations for form fields or icons.
- Use for first-time user guidance to draw attention to new features.
- Keep description text short and scannable (1-2 sentences).
- Position the tooltip so it does not overflow the screen bounds.

### Don'ts

- Don't use for error messages — use the Input component's error state instead.
- Don't use for lengthy or complex content — use a Modal or BottomSheet instead.
- Don't display multiple tooltips simultaneously.
- Don't rely on tooltip content for critical information that the user must see — tooltips are supplementary.
- Don't use tooltips for menus or interactive lists — use a Popover or BottomSheet instead.
