# Navigation Options — Design Guideline

## Overview

Navigation options configure screen headers — title types, right action buttons, background styles, and back behavior. These options are set dynamically per screen and control the header appearance and behavior.

---

## Header Title Types

### Default Title
- **Content**: Plain text string
- **Typography**: `headline_s_bold`
- **Color**: `theme.colors.text.default`
- **Alignment**: Center-aligned within the header
- **Max length**: ~20 characters (truncate with ellipsis)

### User Title
Shows a user profile in the header with avatar, name, subtitle, and optional verification icons.

```
┌──────────────────────────────────────────────┐
│  [←]   [Avatar] John Doe [✓]      [🔍] [⋯]  │
│                 Online                        │
└──────────────────────────────────────────────┘
```

| Part             | Description                                    |
|------------------|------------------------------------------------|
| Avatar           | User profile image (circular, 32px)            |
| Title            | User name, `headline_s_bold`                   |
| Subtitle         | Status text (e.g., "Online"), `caption_default_regular` |
| Status Dot       | Colored dot indicator on avatar                |
| Verification Icons | Badge icons after the name                   |
| Loading Skeleton | Placeholder skeleton while loading             |

### Location Title
Shows a location with dropdown chevron for location picker.

```
┌──────────────────────────────────────────────┐
│  [←]   Ho Chi Minh City [▼]       [🔍] [⋯]  │
│         Current location                      │
└──────────────────────────────────────────────┘
```

| Part        | Description                                         |
|-------------|-----------------------------------------------------|
| Location    | Location name, `headline_s_bold`                     |
| Description | Context text, `caption_default_regular`              |
| Chevron     | Dropdown indicator, tappable to open location picker |

### Journey Title
Shows start and end points with directional indicator.

```
┌──────────────────────────────────────────────┐
│  [←]   District 1 → District 7    [🔍] [⋯]  │
│         12 km                                 │
└──────────────────────────────────────────────┘
```

| Part        | Description                                          |
|-------------|------------------------------------------------------|
| Start       | Origin text, `headline_s_bold`                        |
| Direction   | Arrow icon between start and end                      |
| End         | Destination text, `headline_s_bold`                   |
| Description | Distance or context, `caption_default_regular`        |

---

## Header Right Actions

### Toolkit (Default)

Standard header right configuration with help center, close/home button, and optional tool menu items.

```
┌──────────────────────────────────────────────┐
│  [←]   Screen Title          [📌] [?] [🏠]   │
└──────────────────────────────────────────────┘
```

| Part           | Description                                        |
|----------------|----------------------------------------------------|
| Help Button    | Opens help center (always present)                  |
| Home/Close     | Navigate home or close screen (always present)      |
| Shortcut Pin   | Pin/unpin to shortcuts (optional)                   |
| Tool Items     | Additional action icons (optional)                  |

**Tool menu behavior:**
| Tool Count | Display                                           |
|------------|---------------------------------------------------|
| 0 tools    | Shows only help + close                            |
| 1 tool     | Shows single tool icon directly in header          |
| 2+ tools   | Shows `⋯` more button that opens a menu            |

**Tool Item Spec:**

| Property    | Description                                         |
|-------------|-----------------------------------------------------|
| Icon        | 24px icon name                                       |
| Name        | Bilingual label `{ vi: '...', en: '...' }`          |
| Key         | Unique identifier                                    |
| Badge       | Optional badge indicator                             |

### OnBoarding

Simple text button for onboarding flows (e.g., "Skip" / "Bỏ qua").

```
┌──────────────────────────────────────────────┐
│  [←]   Welcome                       [Skip]  │
└──────────────────────────────────────────────┘
```

- **Typography**: `action_default_bold`
- **Color**: `theme.colors.interactive.default`
- **Touch target**: Minimum 44pt

---

## Header Background

### Standard
- **Color**: `theme.colors.background.surface`
- **Bottom border**: 1px `theme.colors.border.default`

### Gradient
- **Color**: Custom gradient color (e.g., `#AF1F68`)
- **Tint**: White icons and text on dark gradient backgrounds
- **Override**: Replaces theme-based background

### Custom Image
- **Image**: Background image URL
- **Overlay**: Semi-transparent overlay for text readability
- **Tint**: White icons and text

### Shadow
- **Shadow**: Subtle bottom shadow for elevation effect
- **Use when**: Header needs visual separation without a border line

---

## Animated Header

Collapses from extended to default height on scroll.

| Property        | Description                                     |
|-----------------|-------------------------------------------------|
| Expanded height | 88–120                                           |
| Collapsed height| 44–56                                            |
| Tint color      | Icon/text color (often white for custom backgrounds) |
| Title           | Title shown in collapsed state                   |
| Custom component| Optional component for expanded state            |

---

## Search Header

Integrates InputSearch into an extended header.

```
┌──────────────────────────────────────────────┐
│  [←]   Screen Title              [🔍] [⋯]    │
│  ┌────────────────────────────────────────┐  │
│  │  🔍  Search...                         │  │
│  └────────────────────────────────────────┘  │
└──────────────────────────────────────────────┘
```

- **Header type**: Must be `extended`
- **Search bar**: Full-width InputSearch below the title area
- **Animation**: Search expands on focus, collapses on cancel
- **Filter button**: Optional action buttons alongside search

---

## Back Navigation

### Standard Back
- **Icon**: Chevron left, 24px
- **Touch target**: 44x44pt
- **Action**: Navigate back in the stack

### Hidden Back
- Hide the back button entirely (e.g., for root screens)

### Custom Back Handler
- Intercept the back action for custom logic
- Example: show unsaved changes confirmation

### Prevent Back (Confirmation Dialog)
- Show a PopupNotify confirmation before allowing back navigation
- Use for screens with unsaved changes or destructive navigation

---

## Usage Guidelines

| Screen Type        | Title Type | Header Right  | Background    |
|--------------------|-----------|---------------|---------------|
| Standard detail    | Default   | Toolkit       | Standard      |
| Chat/messaging     | User      | Toolkit       | Standard      |
| Maps/location      | Location  | Toolkit       | Standard      |
| Ride/delivery      | Journey   | Toolkit       | Standard      |
| Onboarding flow    | Default   | OnBoarding    | Gradient      |
| Search screen      | Default   | Toolkit       | Extended+Search |
| Hero/marketing     | Default   | Toolkit       | Custom Image  |

---

## Do's & Don'ts

### Do's
- Use the appropriate title type for the screen context (User for profiles, Location for maps)
- Provide bilingual labels `{ vi, en }` for all tool menu items
- Use `preventBack` for screens with unsaved form data
- Keep tool menu items to 3 or fewer per group

### Don'ts
- Don't put more than 3 action icons in the header right area
- Don't mix OnBoarding and Toolkit header right styles
- Don't use custom gradient backgrounds without adjusting tint color for contrast
- Don't hide the back button on non-root screens without providing an alternative navigation path
