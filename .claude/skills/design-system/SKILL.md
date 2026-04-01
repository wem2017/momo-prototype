---
name: design-system
description: Use this skill when designers need to create design specifications, usage guidelines, rules, or documentation for the MoMo KitX design system. Helps define visual specs, component usage rules, design patterns, and accessibility guidelines. Maps 1:1 with design-system-kits.

---

## Prereqs
- Read [references/spec-convention.md](references/spec-convention.md) before generating design specs

## How to Use

1. **Identify the task**: spec, guideline, rule, or pattern documentation
2. **Find reference** in catalog tables below
3. **Load reference file** for visual specs, usage rules, and guidelines
4. **Generate documentation** with correct token names and component mapping

## References

### Design Tokens
| File | Load when... |
|------|-------------|
| `references/tokens/colors.md` | Color usage rules, palette, accessibility |
| `references/tokens/theme.md` | Light/dark theme specs, semantic colors |
| `references/tokens/typography.md` | Type scale, hierarchy, pairing rules |
| `references/tokens/spacing-radius.md` | Spacing system, radius, layout grid |

### Components
| File | Component | RN | Compose |
|------|-----------|:--:|:------:|
| `references/components/button.md` | Button | ✅ | ✅ |
| `references/components/text.md` | Text | ✅ | ✅ |
| `references/components/input.md` | Input | ✅ | ✅ |
| `references/components/input-search.md` | InputSearch | ✅ | ✅ |
| `references/components/input-text-area.md` | InputTextArea | ✅ | ✅ |
| `references/components/input-dropdown.md` | InputDropDown | ✅ | ✅ |
| `references/components/input-phone-number.md` | InputPhoneNumber | ✅ | ✅ |
| `references/components/input-money.md` | InputMoney | ✅ | ✅ |
| `references/components/input-otp.md` | InputOTP | ✅ | ✅ |
| `references/components/checkbox.md` | CheckBox | ✅ | ✅ |
| `references/components/radio.md` | Radio | ✅ | ✅ |
| `references/components/switch.md` | Switch | ✅ | ✅ |
| `references/components/icon.md` | Icon | ✅ | ✅ |
| `references/components/image.md` | Image | ✅ | ✅ |
| `references/components/badge.md` | Badge, BadgeDot | ✅ | ✅ |
| `references/components/tag.md` | Tag | ✅ | ✅ |
| `references/components/chip.md` | Chip | ✅ | ✅ |
| `references/components/popup-notify.md` | PopupNotify | ✅ | ✅ |
| `references/components/toast.md` | Toast | ✅ | ❌ |
| `references/components/snackbar.md` | SnackBar | ✅ | ✅ |
| `references/components/skeleton.md` | Skeleton | ✅ | ✅ |
| `references/components/loader.md` | Loader | ✅ | ❌ |
| `references/components/tooltip.md` | Tooltip | ✅ | ✅ |
| `references/components/avatar.md` | Avatar | ✅ | ❌ |
| `references/components/carousel.md` | Carousel | ✅ | ❌ |
| `references/components/tab-view.md` | TabView | ✅ | ❌ |
| `references/components/divider.md` | Divider | ✅ | ✅ |
| `references/components/pagination.md` | Pagination | ✅ | ✅ |
| `references/components/progress-info.md` | ProgressInfo | ✅ | ❌ |
| `references/components/rating.md` | Rating | ✅ | ❌ |
| `references/components/slider.md` | Slider | ✅ | ❌ |
| `references/components/stepper.md` | Stepper | ✅ | ❌ |
| `references/components/steps.md` | Steps | ✅ | ❌ |
| `references/components/collapse.md` | Collapse | ✅ | ❌ |
| `references/components/swipe.md` | Swipe | ✅ | ❌ |
| `references/components/suggest-action.md` | SuggestAction | ✅ | ❌ |
| `references/components/uploader.md` | Uploader | ✅ | ❌ |
| `references/components/date-picker.md` | DatePicker | ✅ | ✅ |
| `references/components/information.md` | Information | ✅ | ✅ |

### Navigation
| File | Load when... |
|------|------------------------------------------------|
| `references/navigation/setup.md` | Screen layout structure, containers |
| `references/navigation/stack.md` | Screen header, scroll behavior |
| `references/navigation/navigation-options.md` | Header title, background, right buttons |
| `references/navigation/navigator.md` | Screen transitions, push/pop patterns |
| `references/navigation/bottom-tab.md` | Bottom tab bar specs |
| `references/navigation/modal.md` | Modal overlay patterns |
| `references/navigation/bottomsheet.md` | Bottom sheet patterns |

## Important Rules

1. **Always use design tokens** — Never reference raw hex/px values without mapping to a token name
2. **Component mapping** — Every visual element must map to a KitX component
3. **State coverage** — Specs must define all states: default, pressed, disabled, error, loading
4. **Accessibility** — Include contrast ratios (WCAG AA min), touch targets (44pt min), screen reader notes
5. **Platform parity** — Note when specs differ between React Native and Compose Multiplatform
6. **Bilingual** — Use English for specs, add Vietnamese labels (tieng Viet) where relevant for MoMo team
