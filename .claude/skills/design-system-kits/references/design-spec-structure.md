# Design Spec JSON Structure

Design specs define a full screen. This reference explains the JSON schema — what each field means and how it is structured.

For **how to translate this JSON into platform code**, see `design-spec-to-code.md`.

---

## Top-Level Schema

```json
{
  "meta":          { },   // Screen metadata (name, version, description)
  "components":    [ ],   // Custom component blueprints (reusable sub-components)
  "overlays":      { },   // Modal and BottomSheet content definitions (keyed by name)
  "header":        { },   // Header configuration (title, back, right buttons)
  "body":          { },   // Scrollable body content
  "footer":        { },   // Sticky footer content
  "tabs":          null,  // BottomTab config (null = no tabs, object = BottomTab wrapper)
  "tracking":      { },   // Analytics event definitions
  "localization":  { },   // i18n strings (vi, en)
  "actions":       { }    // Handler implementations — overlay actions use overlay+params; simple actions use code
}
```

---

## `meta`

Screen identity. `screenName` becomes the component/function name.

```json
{
  "meta": {
    "screenName": "MoneyTransferScreen",
    "version": "1.0.0",
    "description": "Human-readable purpose of this screen"
  }
}
```

| Field | Type | Purpose |
|-------|------|---------|
| `screenName` | `string` | Component name |
| `version` | `string` | Spec version |
| `description` | `string` | Human-readable summary |

---

## `components`

Array of custom component **blueprints**. Each defines a reusable sub-component referenced in `body.children` or `footer.children`.

```json
{
  "type": "SecurityBanner",
  "props": {
    "description": "string",
    "aiLabel": "string",
    "onPressMore": "function"
  },
  "styles": { "flexDirection": "row", "backgroundColor": "Colors.green_08" },
  "children": [
    { "type": "Icon", "props": { "source": "24_check_circle", "size": 24, "color": "Colors.green_03" } },
    { "type": "Text", "props": { "typography": "body_default_regular", "children": "{description}" }, "styles": { "flex": 1 } },
    { "type": "Tag", "props": { "label": "{aiLabel}", "icon": "16_sparkle", "customColor": "Colors.pink_03" } }
  ]
}
```

### Fields

| Field | Type | Purpose |
|-------|------|---------|
| `type` | `string` | Component name (PascalCase) |
| `props` | `object` | Input props — key = name, value = type hint |
| `styles` | `object` | Root container style (optional) |
| `children` | `array` | Child elements using same `{ type, props, styles, children }` structure |

### Prop Type Hints

| Spec value | Meaning |
|------------|---------|
| `"string"` | Text value |
| `"number"` | Numeric value |
| `"function"` | Callback/handler |
| `"array"` | List of items |
| `"boolean"` | True/false |

### Child Element Format

Each child uses the same consistent structure with `type`, `props`, `styles`, and optionally `children`:

```json
{ "type": "ComponentName", "props": { "prop1": "value1" }, "styles": { "flex": 1 } }
```

- **Design system components** (Icon, Text, Tag, Chip, Button, Image, etc.) come from the component library
- **`View`** and **`Pressable`** are platform primitives (RN) or layout wrappers (Compose)
- Children can be **nested** — a `View` or `Pressable` can have its own `children` array

---

## `overlays`

Defines modal and bottom sheet content components referenced by `actions`. Each key is the component name used in actions. Overlays are generated as React components (RN) or Composable functions (Compose) alongside the screen.

```json
{
  "overlays": {
    "ConfirmModal": {
      "type": "Modal",
      "barrierDismissible": true,
      "props": { "itemId": "number", "itemName": "string" },
      "content": {
        "type": "PopupNotify",
        "props": {
          "title": "Xác nhận xoá?",
          "description": "Bạn có chắc muốn xoá {itemName}?",
          "primary": { "title": "Xoá", "onPress": "{onRequestClose}" },
          "secondary": { "title": "Huỷ", "onPress": "{onRequestClose}" }
        }
      }
    },
    "FilterSheet": {
      "type": "BottomSheet",
      "options": { "title": "Lọc" },
      "surface": true,
      "barrierDismissible": true,
      "draggable": true,
      "props": { "selectedOptions": "array", "onApply": "function" },
      "body": {
        "children": [
          { "type": "Chip", "props": { "label": "Option A", "selected": "{selectedA}", "onPress": "{toggleA}" } },
          { "type": "Chip", "props": { "label": "Option B", "selected": "{selectedB}", "onPress": "{toggleB}" } }
        ]
      },
      "footer": {
        "children": [
          { "type": "Button", "props": { "title": "Áp dụng", "size": "large", "full": true, "onPress": "{onApply}" } }
        ]
      }
    }
  }
}
```

### Overlay Fields

| Field | Type | Purpose |
|-------|------|---------|
| `type` | `"Modal"` \| `"BottomSheet"` | Determines which navigator method is called |
| `props` | `object` | Props injected from the action's `params` (same type-hint syntax as `components`) |
| `barrierDismissible` | `boolean` | Allow backdrop tap to dismiss |
| `onDismiss` | `string` | Reference to a handler called on dismiss |

**Modal-only fields:**

| Field | Type | Purpose |
|-------|------|---------|
| `content` | `object` | Single component node (`{ type, props, styles, children }`) — use `PopupNotify`, `PopupPromotion`, or a custom layout |
| `modalStyle` | `object` | Custom style for the modal container |
| `useNativeModal` | `boolean` | Use native RN Modal |

**BottomSheet-only fields:**

| Field | Type | Purpose |
|-------|------|---------|
| `options.title` | `string` | Sheet header title |
| `options.header` | `string` | Custom header node reference |
| `surface` | `boolean` | Use `background.surface` color |
| `draggable` | `boolean` | Enable drag-to-dismiss |
| `footerRef` | `string` | Reference to a child in `footer.children` to use as sticky footer (alternative to inline `footer`) |
| `body` | `object` | Sheet body content (`{ children }`) |
| `footer` | `object` | Sticky footer content (`{ children }`) — maps to `footerComponent` |
| `leftOptions` | `object` | Back navigation: `{ iconLeft, onPressIconLeft }` |

---

## `header`

Configures the screen header. See `navigation-options.md` for detailed header type references.

```json
{
  "header": {
    "type": "Header",
    "props": {
      "useBack": true,
      "headerType": "extended",
      "headerTitle": {
        "type": "user",
        "data": { "title": "{name}", "subTitle": "{phone}", "image": "{avatar}" }
      },
      "headerRight": {
        "useShortcut": false,
        "useMore": false,
        "useCloseIcon": false,
        "tools": [
          {
            "title": { "vi": "Tiện ích", "en": "Tools" },
            "items": [
              { "icon": "24_help_center", "name": { "vi": "Trợ giúp", "en": "Help" }, "key": "help" }
            ]
          }
        ]
      }
    }
  }
}
```

### Props

| Prop | Type | Purpose |
|------|------|---------|
| `useBack` | `boolean` | Show back button |
| `headerType` | `string` | `"default"` / `"extended"` / `"none"` |
| `headerTitle` | `string \| object` | Simple string or typed title object |
| `headerBackground` | `string` | Background image URL |
| `useShadowHeader` | `boolean` | Shadow below header |
| `headerRight` | `object` | Right toolbar configuration |

### `headerTitle` Types

| `type` | Shows | `data` fields |
|--------|-------|---------------|
| `"user"` | Avatar + name + subtitle | `title`, `subTitle`, `image`, `dotColor`, `icons` |
| `"location"` | Location with chevron | `location`, `description` |
| `"journey"` | Start/end points | `start`, `end`, `description`, `icon` |

---

## `body`

Screen body content. References components defined in `components` array.

```json
{
  "body": {
    "scrollable": true,
    "style": { "flex": 1, "backgroundColor": "Colors.black_02" },
    "children": [
      { "type": "SecurityBanner", "props": { "description": "{securityText}" } },
      { "type": "TransferCard", "props": { "amount": "{transferAmount}" } }
    ]
  }
}
```

| Field | Type | Purpose |
|-------|------|---------|
| `scrollable` | `boolean` | Whether body scrolls |
| `style` | `object` | Body container style |
| `children` | `array` | Ordered list of components to render |

Each child references either:
- A **custom component** from `components[]` (matched by `type`)
- A **design system component** (Button, Text, etc.) used directly

---

## `footer`

Sticky footer at the bottom of the screen.

```json
{
  "footer": {
    "style": { "padding": "Spacing.M", "backgroundColor": "Colors.black_01" },
    "children": [
      {
        "type": "Button",
        "props": { "title": "{text}", "type": "disabled", "size": "large", "full": true }
      }
    ]
  }
}
```

| Field | Type | Purpose |
|-------|------|---------|
| `style` | `object` | Footer container style (**note: skip padding/margin/backgroundColor in code — Screen/Navigation footer already provides spacing and shadow**) |
| `children` | `array` | Components inside footer |

---

## `tabs`

Optional BottomTab configuration. When `null`, the screen is a standalone screen. When an object, a `{ScreenName}Tab` wrapper component is generated using `BottomTab`.

```json
{
  "tabs": {
    "indexActive": 0,
    "floatingButton": {
      "icon": "ic_scan",
      "label": "Quét mọi QR",
      "screen": "ScanScreen"
    },
    "items": [
      {
        "name": "MoneyTransfer",
        "label": "Chuyển tiền",
        "icon": "ic_transfer"
      },
      {
        "name": "Profile",
        "label": "Tôi",
        "icon": "ic_profile",
        "screen": "ProfileScreen"
      }
    ]
  }
}
```

| Field | Type | Purpose |
|-------|------|---------|
| `null` | — | No tabs — screen is standalone |
| `object` | `TabsConfig` | Defines BottomTab tabs — generates a `{ScreenName}Tab` wrapper |

### TabsConfig Fields

| Field | Type | Purpose |
|-------|------|---------|
| `indexActive` | `number` | Index into `items` array — that tab renders the screen from this spec |
| `floatingButton` | `object \| {}` | Center floating button config. `{}` = no floating button |
| `items` | `TabItem[]` | Regular tab items (excludes floating button) |

### FloatingButton Fields

| Field | Type | Purpose |
|-------|------|---------|
| `icon` | `string` | Floating button icon source |
| `label` | `string` | Button label text or `{variable}` reference |
| `screen` | `string` | Component name to navigate to on press |

### TabItem Fields

| Field | Type | Purpose |
|-------|------|---------|
| `name` | `string` | Tab route identifier |
| `label` | `string` | Tab bar label text or `{variable}` reference |
| `icon` | `string` | Tab icon source |
| `screen` | `string` | Component name for non-active tabs |
| `badgeLabel` | `string` | Optional badge: `""` = dot, `"3"` = count |

- The tab at `items[indexActive]` maps to the screen from this spec's `header`/`body`/`footer`
- Other tabs reference external screen components by `screen` name (placeholder screens are generated if they don't exist)
- The `initialRouteName` defaults to `items[indexActive].name`
- When `floatingButton` is not empty (`{}`), it becomes the BottomTab's `floatingButton` prop (centered FAB)

---

## `tracking`

Analytics event definitions. Each event has a name, description, and typed properties.

```json
{
  "tracking": {
    "events": [
      {
        "name": "TransferAmountChanged",
        "description": "User changed the transfer amount",
        "properties": { "amount": "string", "timestamp": "string" }
      }
    ]
  }
}
```

---

## `localization`

i18n strings keyed by locale code. `vi` is the default for Vietnamese apps.

```json
{
  "localization": {
    "vi": { "recipientName": "Anh Dũng Hồng", "quickMessageList": ["msg1", "msg2"] },
    "en": { "recipientName": "Anh Dũng Hồng", "quickMessageList": ["msg1", "msg2"] }
  }
}
```

Use as default state values, placeholder text, and display strings.

---

## `actions`

Handler implementations. Three action shapes are supported — use the one that matches the intent:

- **Overlay actions** (`overlay` + `params`) — show a modal or bottom sheet defined in `overlays`.
- **Navigation actions** (`navigate` + `params`) — screen transitions.
- **Simple actions** (`code`) — state updates or other logic.

```json
{
  "actions": {
    "handleChangeAmount": {
      "description": "Updates the transfer amount state",
      "code": "setTransferAmount(value);"
    },
    "handlePressGreetingCard": {
      "description": "Push GreetingCardPickerScreen onto the stack",
      "navigate": "push",
      "params": { "screen": "GreetingCardPickerScreen" }
    },
    "handlePressConfirm": {
      "description": "Show confirmation dialog",
      "overlay": "ConfirmModal",
      "params": { "itemId": "{currentItemId}", "itemName": "{currentItemName}" }
    },
    "handlePressFilter": {
      "description": "Show filter bottom sheet",
      "overlay": "FilterSheet",
      "params": { "selectedOptions": "{selectedOptions}", "onApply": "handleApplyFilter" }
    }
  }
}
```

### Overlay Action

References an overlay defined in `overlays`. Props from `params` are spread into the overlay content component.

| Field | Type | Purpose |
|-------|------|---------|
| `overlay` | `string` | Key of an entry in `overlays` |
| `params` | `object` | Props passed to the overlay content — values use `{variable}` syntax or handler name strings |
| `description` | `string` | Human-readable intent |

### Navigation Action

| Field | Type | Purpose |
|-------|------|---------|
| `navigate` | `string` | Navigator method: `push`, `present`, `pop`, `popToTop`, `replace`, `reset` |
| `params` | `object` | Params for the navigator call (e.g. `screen`) |
| `description` | `string` | Human-readable intent |

| `navigate` value | Navigator method | Result |
|-----------------|-----------------|--------|
| `"push"` | `navigator.push(...)` | Horizontal slide to new screen |
| `"present"` | `navigator.present(...)` | Full-screen modal (vertical slide) |
| `"pop"` | `navigator.pop()` | Dismiss overlay or go back |
| `"popToTop"` | `navigator.popToTop()` | Dismiss all overlays / pop to root |
| `"replace"` | `navigator.replace(...)` | Replace current screen |
| `"reset"` | `navigator.reset(...)` | Reset navigation stack |

### Simple Action

| Field | Type | Purpose |
|-------|------|---------|
| `code` | `string` | Raw code body for the handler |
| `description` | `string` | Human-readable intent |

### Cross-File References

Use `{ref: "ScreenName"}` to import definitions from another spec file (e.g., shared i18n strings or common component definitions):

```json
{
  "localization": {
    "{ref: "CommonStrings"}"
  }
}
```

This avoids duplicating shared definitions across specs.

---

## Token Syntax (applies everywhere)

Design token strings reference design system values. **Never hardcode raw values.**

| Spec string | Meaning |
|-------------|---------|
| `"Colors.pink_03"` | Color token |
| `"Spacing.L"` | Spacing token (16) |
| `"Radius.M"` | Border radius token (12) |

## Variable Reference Syntax (applies everywhere)

Values wrapped in `{...}` are dynamic references to props, state, or data:

| Spec value | Meaning |
|------------|---------|
| `"{amount}"` | Prop or state variable |
| `"{onPress}"` | Callback prop |
| `"{quickMessages[0]}"` | Array element access |
| `"{greetingCardImage}"` | Data variable |
