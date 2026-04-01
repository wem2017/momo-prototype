# Screen Transitions — Design Guideline

## Overview

Screen transitions define how users move between screens. MoMo KitX supports multiple transition types for different navigation contexts.

---

## Transition Types

### Push (Horizontal Slide)
- **Direction**: New screen slides in from right, current slides left
- **Use for**: Forward navigation, drilling into detail
- **Back**: Reverse animation (right to left), swipe-back gesture
- **Duration**: ~300ms
- **Easing**: Ease-in-out

### Pop (Reverse Slide)
- **Direction**: Current screen slides right, previous appears from left
- **Use for**: Going back, closing detail views
- **Gesture**: Swipe from left edge (iOS), back button (Android)
- **Can pop multiple**: Pop 2+ screens at once for deep navigation

### Present (Vertical Slide — Full-screen Modal)
- **Direction**: New screen slides up from bottom
- **Use for**: Full-screen modals, compose/create flows, media viewers
- **Back**: Slide down, swipe down gesture
- **Overlay**: No background dimming (full screen replacement)

### Replace (No Animation)
- **Behavior**: Replaces current screen without animation
- **Use for**: Authentication flows, state changes (logged out → logged in)
- **Back**: No back navigation to replaced screen

### Reset (Stack Clear)
- **Behavior**: Clears entire navigation stack, sets new root
- **Use for**: Logout, deep link landing, flow completion
- **Back**: No back navigation

---

## Transition Decision Guide

| User Action | Transition | Example |
|-------------|-----------|---------|
| Tap list item | Push | Product list → Product detail |
| Tap "Back" | Pop | Detail → List |
| Tap "Create" / "Compose" | Present | Home → New post |
| Complete a flow | Pop (multiple) or Reset | Payment success → Home |
| Tab switch | None (instant) | Tab 1 → Tab 2 |
| Logout | Reset | Any → Login screen |

---

## Navigation Stack Visualization

```
Push flow:
[Home] → [List] → [Detail] → [Edit]
                                 ↑ current
Pop: removes current, reveals previous

Present flow:
[Home] ─── presents ──→ [Create]
  ↑ stays in stack           ↑ modal layer

Reset flow:
[Screen A] → [Screen B] → [Screen C]
              ↓ reset
[New Home]  (stack cleared)
```

---

## Modal vs Present vs Push

| Aspect | Push | Present | Modal Overlay |
|--------|------|---------|---------------|
| Animation | Horizontal slide | Vertical slide | Fade + scale |
| Screen coverage | Full screen | Full screen | Partial (centered) |
| Background | Replaces | Replaces | Dimmed backdrop |
| Back gesture | Swipe from left | Swipe down | Tap outside / X |
| Use for | Navigation flow | Create/compose | Confirmation/alert |

---

## Gesture Navigation

### iOS
- **Swipe from left edge**: Pop (go back)
- **Swipe down**: Dismiss presented screen

### Android
- **System back button/gesture**: Pop
- **Swipe from left/right edge**: Pop (gesture navigation)

---

## Do's & Don'ts

### Do's
- Use Push for all forward navigation within a flow
- Use Present for creation/compose flows that feel like a new context
- Use Modal overlay (PopupNotify) for decisions that require immediate response
- Support swipe-back gestures on all pushed screens

### Don'ts
- Don't use Push for modals or dialogs
- Don't use Reset unless you truly need to clear the entire stack
- Don't disable swipe-back gesture unless absolutely necessary
- Don't mix Present and Push for the same type of navigation
