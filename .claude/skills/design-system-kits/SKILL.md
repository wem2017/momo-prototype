---
name: design-system-kits
description: ALWAYS invoke this skill FIRST for any UI development task in this codebase without exception. This skill MUST be consulted before writing ANY UI code, component, screen, layout, or visual element. Use when building any interface with React
  Native, Compose Multiplatform.

---

## Prereqs
- Read [references/code-convention.md](references/code-convention.md) before generating code
- When generating from a design spec JSON, **always load both**:
  1. [references/design-spec-structure.md](references/design-spec-structure.md) — JSON schema (what each field means)
  2. [references/design-spec-to-code.md](references/design-spec-to-code.md) — spec-to-code mapping (how to translate to RN or Compose)

## React Native — First-Time Project Setup

When creating a **new** React Native prototype project (no existing Expo project in the working directory):

1. **Clone the template**:
   ```bash
   git clone https://github.com/wem2017/prototype-kits.git prototype-kits
   cd prototype-kits
   rm -rf .git && git init
   ```
   This template includes: Expo 54, React Native 0.81.5, all `@momo-kits/*` dependencies, localization, IPhoneBezel web preview, and path aliases (`@/*`, `@components`, `@assets`, `@configs`).

2. **Install dependencies**:
   ```bash
   yarn install
   ```

3. **Generated screens go in `src/`** — all new screen files must be placed under `src/` (e.g., `src/HomeScreen.tsx`, `src/ProfileScreen.tsx`).

4. **Register screens in `App.tsx`** — update the `screen` prop in `NavigationContainer` to point to the entry screen, and use navigation to push to other screens.

## Workflow — Before Generating Code

**MANDATORY**: Before writing ANY code, always perform these checks:

### Step 1: Confirm Codebase Status
Run `git status` and `git diff --stat` to check:
- Are there uncommitted changes?
- Which files have been modified?
- Is the working tree clean?

Present the status summary to the user.

### Step 2: Ask User — Fresh or Update?
Ask the user explicitly:
> **Do you want to:**
> 1. **Fresh coding** — Create new screen(s) from scratch
> 2. **Update existing code** — Modify existing screen(s)/component(s)

Wait for the user's answer before proceeding.

### Step 3: Ask User — Fresh or Update?
Ask the user explicitly:
> **Do you want to:**
> 1. **Fresh coding** — Create new screen(s) from scratch
> 2. **Update existing code** — Modify existing screen(s)/component(s)

Wait for the user's answer before proceeding.

### Step 4: Ask User — Preview Method
Ask the user explicitly:
> **How would you like to preview the output?**
> 1. **Expo app (QR code)** — Scan QR code with Expo Go app on your phone *(Recommended)*
> 2. **Web browser** — Run `yarn web` to preview in a browser window
> 3. **Claude macOS app** — View directly in the Claude macOS app canvas

- If the user chooses **Expo app**:
  1. After generating the code, run `yarn start` in the prototype-kits project directory
  2. The Metro bundler will output a QR code in the terminal (look for the "Scan QR code" section)
  3. Instruct the user to scan the QR code with the **Expo Go** app on their iOS or Android device (must be on the same network)
  4. The app will hot-reload automatically as code changes are saved
- If the user chooses **Web browser**:
  1. After generating the code, run `yarn web` in the prototype-kits project directory
  2. This renders the app inside an iPhone bezel frame (390x844) in the browser
  3. Note: Some native features (camera, push notifications) are not available in web preview
- If the user chooses **Claude macOS app**:
  1. The preview is displayed directly in the Claude macOS app canvas after generation
  2. No additional steps required

Wait for the user's answer before proceeding.

### Step 5: Generate Code
- **Fresh**: Create new `.tsx` files under `src/` following the template pattern (see `src/Welcome.tsx` in the prototype-kits template as reference)
- **Update**: Read the target file(s) first, then apply modifications

## How to Use

1. **Identify platform**: `.tsx`/`.ts` = React Native, `.kt` = Compose
2. **Run the workflow** (Step 1–5 above) — confirm git status, ask fresh/update, ask preview method, then generate
3. **If input is a design spec JSON** → load `references/design-spec-structure.md` for full schema mapping
4. **Find component** in catalog tables below
5. **Load reference file** for exact API
6. **Generate code** with correct imports and design tokens — all screens in `src/`
7. **Provide preview instructions** based on the user's chosen preview method (QR code + scan instructions, web command, or direct canvas)

## References

### React Native Template
| File | Load when... |
|------|-------------|
| `references/react-native-template.md` | Setting up new RN prototype project, need screen template pattern, web preview setup |

### Design Tokens & Styles
| File | Load when... |
|------|-------------|
| `references/tokens/colors.md` | Color hex values |
| `references/tokens/theme.md` | Light/dark theme |
| `references/tokens/typography.md` | Typography scale |
| `references/tokens/spacing-radius.md` | Spacing/radius values |

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
| `references/components/popup-promotion.md` | PopupPromotion | ✅ | ✅ |
| `references/components/toast.md` | Toast | ✅ | ✅ |
| `references/components/snackbar.md` | SnackBar | ✅ | ✅ |
| `references/components/skeleton.md` | Skeleton | ✅ | ✅ |
| `references/components/loader.md` | Loader | ✅ | ✅ |
| `references/components/tooltip.md` | Tooltip | ✅ | ✅ |
| `references/components/avatar.md` | Avatar | ✅ | ✅ |
| `references/components/carousel.md` | Carousel | ✅ | ✅ |
| `references/components/tab-view.md` | TabView | ✅ | ✅ |
| `references/components/divider.md` | Divider | ✅ | ✅ |
| `references/components/pagination.md` | Pagination | ✅ | ✅ |
| `references/components/progress-info.md` | ProgressInfo | ✅ | ✅ |
| `references/components/rating.md` | Rating | ✅ | ✅ |
| `references/components/slider.md` | Slider | ✅ | ✅ |
| `references/components/stepper.md` | Stepper | ✅ | ✅ |
| `references/components/steps.md` | Steps | ✅ | ✅ |
| `references/components/collapse.md` | Collapse | ✅ | ✅ |
| `references/components/swipe.md` | Swipe | ✅ | ✅ |
| `references/components/suggest-action.md` | SuggestAction | ✅ | ✅ |
| `references/components/uploader.md` | Uploader | ✅ | ✅ |
| `references/components/date-picker.md` | DatePicker | ✅ | ✅ |
| `references/components/information.md` | Information | ✅ | ✅ |

### Design Spec
| File | Load when... |
|------|-------------|
| `references/design-spec-structure.md` | **Understanding the JSON schema** (what each field means) |
| `references/design-spec-to-code.md` | **Mapping spec → code** (how to translate to RN or Compose) |

### Screen Layout
| File | Load when... |
|------|-------------|
| `references/screen-layout-rule.md` | Screen layout rules, `useGridLayout`, Section/Card/Item spacing, grid system |

### Navigation
| File | Load when...                                   |
|------|------------------------------------------------|
| `references/navigation/setup.md` | App root setup, Container, NavigationContainer |
| `references/navigation/stack.md` | Screen config, header                          |
| `references/navigation/navigation-options.md` | Header title, background, right buttons, **header spec → code mapping** |
| `references/navigation/navigator.md` | Compose Navigator API                          |
| `references/navigation/bottom-tab.md` | Bottom tabs                                    |
| `references/navigation/modal.md` | Modal                                          |
| `references/navigation/bottomsheet.md` | Bottom sheet                                   |

## Important Rules

1. **Always use design tokens** — Never hardcode colors/spacing/fonts
2. **RN**: Use `Screen > Section|Card > Item` — Section and Card are **siblings** (same level), never nested
3. **Design spec JSON** — When generating code from a design spec, **always load both** `references/design-spec-structure.md` (schema) and `references/design-spec-to-code.md` (platform mapping). For the `header` field, also load `references/navigation/navigation-options.md`. **Priority: use existing components from the catalog tables above** — only create custom sub-components when no existing component can fulfill the requirement.
4. **Overlays** — Modal and bottom sheet content is defined in `overlays`, not inline in `actions`. Actions reference overlays by name using `overlay` + `params`. Never write `navigator.showModal`/`navigator.showBottomSheet` code inline in the `code` field — use the declarative overlay action shape instead.
