# Design Spec JSON Structure

Design specs define a full screen. This reference explains the JSON schema — what each field means and how it is structured.

For **how to translate this JSON into platform code**, see `design-spec-to-code.md`.

---

## Top-Level Schema

```json
{
  "meta":          { },   // Screen metadata (name, version, description)
  "components":    [ ],   // Custom component blueprints (reusable sub-components)
  "header":        { },   // Header configuration (title, back, right buttons)
  "body":          { },   // Scrollable body content
  "footer":        { },   // Sticky footer content
  "tabs":          null,  // BottomTab config (null = no tabs, array = BottomTab wrapper)
  "tracking":      { },   // Analytics event definitions
  "localization":  { },   // i18n strings (vi, en)
  "actions":       { }    // Handler implementations (description + code)
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

Optional BottomTab configuration. When `null`, the screen is a standalone screen. When an array, a `{ScreenName}Tab` wrapper component is generated using `BottomTab`.

```json
{
  "tabs": [
    {
      "name": "MoneyTransfer",
      "label": { "vi": "Chuyển tiền", "en": "Transfer" },
      "icon": "ic_transfer",
      "isActive": true
    },
    {
      "name": "Profile",
      "label": { "vi": "Tôi", "en": "Me" },
      "icon": "ic_profile",
      "screen": "ProfileScreen",
      "isActive": false
    }
  ]
}
```

| Field | Type | Purpose |
|-------|------|---------|
| `null` | — | No tabs — screen is standalone |
| `array` | `TabItem[]` | Defines BottomTab tabs — generates a `{ScreenName}Tab` wrapper |

### TabItem Fields

| Field | Type | Purpose |
|-------|------|---------|
| `name` | `string` | Tab route identifier |
| `label` | `{ vi, en }` | Localized tab bar label |
| `icon` | `string` | Tab icon source |
| `isActive` | `boolean` | `true` = this tab renders the screen defined in this spec |
| `screen` | `string` | Component name for other tabs (when `isActive` is `false`) |
| `badgeLabel` | `string` | Optional badge: `""` = dot, `"3"` = count |

- The tab where `isActive: true` maps to the screen from this spec's `header`/`body`/`footer`
- Other tabs reference external screen components by `screen` name (placeholder screens are generated if they don't exist)
- The `initialRouteName` defaults to the tab with `isActive: true`

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

Handler implementations. Each has a description and a code snippet.

```json
{
  "actions": {
    "handleChangeAmount": {
      "description": "Updates the transfer amount value",
      "code": "setTransferAmount(value);"
    },
    "handlePressGreetingCard": {
      "description": "Opens the greeting card picker modal",
      "code": "navigation.navigate('GreetingCardPicker');"
    }
  }
}
```

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
