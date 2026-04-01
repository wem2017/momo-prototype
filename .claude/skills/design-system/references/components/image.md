# Image

## Description

An image display component for rendering photos, illustrations, and banners with built-in loading state support. Image handles URL-based loading, displays a skeleton or placeholder while content is being fetched, and supports aspect ratio control to maintain proper proportions.

**Package:** `@momo-kits/foundation`
**Platform support:** RN ✅ | Compose ✅

---

## Features

| Feature            | Description                                                  |
|--------------------|--------------------------------------------------------------|
| **URL loading**    | Loads images from remote URLs with automatic caching         |
| **Aspect ratio**   | Maintains image proportions via configurable aspect ratio    |
| **Loading state**  | Displays a skeleton or placeholder while the image loads     |
| **Error fallback** | Shows a fallback placeholder if the image fails to load      |

---

## Loading States

| State       | Visual                                                       |
|-------------|--------------------------------------------------------------|
| **Loading** | Skeleton placeholder (animated shimmer) matching the image dimensions |
| **Loaded**  | Full image displayed, skeleton fades out                     |
| **Error**   | Static fallback placeholder (generic image icon or custom)   |

- The skeleton placeholder should match the expected dimensions of the final image to prevent layout shifts
- Transition from skeleton to loaded image should use a subtle fade-in

---

## Sizing

- Image dimensions are constrained by the parent container
- Aspect ratio can be explicitly set to maintain proportions regardless of container size
- Common aspect ratios: 1:1 (square), 16:9 (banner), 4:3 (photo), 3:2 (landscape)
- When only width or height is provided, the other dimension is calculated from the aspect ratio
- If no aspect ratio is specified, the image uses its natural dimensions constrained by the parent

---

## Layout

- Images fill their container by default (resize mode: cover)
- Other resize modes: contain (fit within bounds), stretch (fill exactly), center (no scaling)
- Corner radius can be applied for rounded images (use `Radius.*` tokens)
- For circular images (e.g., avatars), apply a radius equal to half the width/height
- Images should not overflow their container — clip content at the container bounds

---

## Accessibility

- **Alt text required:** Always provide descriptive alt text that conveys the content or purpose of the image
- **Decorative images:** If an image is purely decorative and adds no informational value, mark it as decorative so screen readers skip it
- **Loading announcement:** Screen readers should not announce the loading state repeatedly — announce once when the image finishes loading if it is meaningful content
- **Error state:** If the image fails to load, the fallback should convey that the content is unavailable

---

## Do's and Don'ts

### Do's
- Always provide alt text that describes the image content or purpose
- Set an explicit aspect ratio to prevent layout shifts during loading
- Use the skeleton loading state for all remotely loaded images
- Optimize image URLs for the target display size (avoid loading oversized assets)
- Use appropriate resize mode based on context (cover for banners, contain for logos)
- Apply `Radius.*` tokens for rounded corners

### Don'ts
- Don't use Image for vector icons — use the Icon component instead
- Don't leave alt text empty for meaningful images
- Don't load full-resolution images when a thumbnail would suffice
- Don't allow images to cause layout shifts by omitting dimensions or aspect ratio
- Don't use stretch resize mode for photos — it distorts the content
- Don't hard-code pixel dimensions when the layout should be responsive to the container
