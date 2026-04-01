# Uploader

> File/image upload interface — trigger area + thumbnails + progress. Single or multi-file upload.

**Package:** `@momo-kits/uploader`
**Platform:** RN ✅ | Compose ❌ (use platform file picker)
**Completeness:** need_update — thiếu Figma
**Figma node:** [VERIFY]

---

## Props

| Prop | Type | Values | Default | Description |
|------|------|--------|---------|-------------|
| `files` | array | `[{ uri, name, status }]` | `[]` | Current uploaded files list |
| `maxFiles` | number | — | `5` | Maximum files allowed. Trigger hidden khi reached |
| `acceptTypes` | string | MIME pattern | `"image/*"` | Allowed file types (e.g., `"image/*"`, `"application/pdf"`) [VERIFY] |
| `maxFileSize` | number | bytes | — | Maximum size per file [VERIFY] |
| `thumbnailSize` | number | dp | `80` | Preview thumbnail dimensions (square) [VERIFY] |
| `disabled` | boolean | `true` \| `false` | `false` | Non-interactive state |
| `onAdd` | function | — | — | Callback khi file selected. `"onAdd": "action://uploadFile"` |
| `onRemove` | function | — | — | Callback khi remove file. `"onRemove": "action://removeFile={{item.id}}"` |

### File Object

| Field | Type | Description |
|-------|------|-------------|
| `uri` | string | File URI for thumbnail preview |
| `name` | string | File name |
| `status` | string | `"uploading"` \| `"complete"` \| `"error"` |
| `progress` | number | Upload progress 0-100 (when status=uploading) [VERIFY] |

---

## States

| State | Appearance | Interactive |
|-------|-----------|-------------|
| **Empty** | Only trigger area visible (dashed border + add icon) | true |
| **Uploading** | Thumbnail with semi-transparent overlay + progress indicator | partial |
| **Complete** | Thumbnail with image preview + remove (X) button | true |
| **Error** | Thumbnail border `Colors.red_03`, error icon overlay | true (retry) |
| **Max reached** | Trigger area hidden, only thumbnails visible | remove only |
| **Disabled** | Trigger border + icon `Colors.black_08`, non-interactive | false |

---

## Variant-to-Context Map

| Context | Khi nào dùng | Tránh khi | Ví dụ trong MoMo |
|---------|-------------|-----------|-------------------|
| **Photo upload** | Attach photos to forms/reviews | Camera capture → dùng Camera | Upload CMND/CCCD, ảnh review merchant |
| **Document upload** | Attach PDF/docs | Structured data entry → dùng Input | Upload hợp đồng, biên lai |
| **Profile photo** | Single image selection | Multi-photo → set maxFiles=1 | Thay đổi ảnh đại diện |

---

## SSR Pattern

### ID Photo Upload
```json
{
  "id": "id_upload",
  "type": "section",
  "children": [
    {
      "component": "Text",
      "props": {
        "content": "Tải ảnh CMND/CCCD",
        "typography": "body_default_bold"
      }
    },
    {
      "component": "Uploader",
      "props": {
        "files": "{{state.idPhotos}}",
        "maxFiles": 2,
        "acceptTypes": "image/*"
      },
      "onAdd": "action://uploadIdPhoto",
      "onRemove": "action://removeIdPhoto"
    }
  ]
}
```

---

## Accessibility

- Trigger: accessible label "Thêm ảnh" hoặc "Tải tệp lên".
- Each thumbnail: announce file name + status + remove action.
- Remove button: "Xóa ảnh 1".
- Upload progress announced as live region: "Đang tải, 50%".
- Error state communicated: "Tải lên thất bại cho ảnh 2".
- All interactive elements meet 44dp touch target.

---

## Usage Guidelines

### Do
- Dùng cho document/photo uploads trong forms.
- Show clear progress during upload.
- Allow easy removal with X button.
- Set appropriate file type + size restrictions — communicate limits to user.
- Thumbnail preview cho uploaded images.

### Don't
- Không dùng cho camera capture → dùng dedicated Camera component.
- Không allow unlimited uploads — always set reasonable maxFiles.
- Không silently reject oversized/wrong-type files → show error message.
- Không hide trigger until maxFiles reached.
- Không dùng tiny thumbnails — user cần verify uploaded content.
