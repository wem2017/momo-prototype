# Top Navigation

## Purpose
Top Navigation là thành phần điều hướng chính nằm ở đầu màn hình, dùng để xác định ngữ cảnh hiện tại của screen, hỗ trợ điều hướng cơ bản và cung cấp entry point cho các action quan trọng như Back, Close, Help Center, Shortcut và Search. Component này là bắt buộc trên mọi màn hình trong mini-app và không được tự ý remove hoặc thay thế bằng custom header. 

## Variants & States
- Variants:
  - Header type:
    - title
    - user name
    - location
    - journey
    - full page search
    - onboarding
    - forWL
  - Background:
    - compact
    - expand
    - light banner
    - dark banner
    - white
    - none
  - Search:
    - hasSearch = false
    - hasSearch = true
  - Background visibility:
    - showBackground = true
    - showBackground = false
- States:
  - default
  - scrolled
  - search_active
- Sizes:
  - fixed height: 80px
  - horizontal padding: 16px
  - icon size: 24px
  - status bar: theo OS/device, không thuộc nội dung chính của component 

## Usage Context
TopNav / Title
Dùng cho màn hình có nội dung rõ ràng, task-based
Title thể hiện tên screen / chức năng chính
User không cần biết “đang thao tác với ai”

Use when:

Flow có cấu trúc rõ: “Chuyển tiền”, “Thanh toán”, “Cài đặt”
Nội dung phía dưới là form / list / service
Không có context cá nhân cụ thể

Examples:

Chuyển tiền
Thanh toán hóa đơn
Lịch sử giao dịch

TopNav / Username
Dùng cho màn hình có context theo người dùng cụ thể
Header đóng vai trò anchor identity (biết đang tương tác với ai)

Use when:

Flow 1–1 (P2P): chuyển tiền, chat, gửi quà
Nội dung phụ thuộc vào 1 user cụ thể
Cần tăng trust / tránh nhầm người

Examples:

Chuyển tiền cho A
Chat với B
Gửi lì xì cho C

TopNav / Location
Dùng khi context phụ thuộc vào vị trí / địa điểm
Header giúp user hiểu đang xem dữ liệu ở đâu

Use when:

Nội dung thay đổi theo địa lý / khu vực
Cần cho user biết & có thể switch location
Thường đi kèm list dịch vụ / khám phá

Examples:

Ưu đãi gần bạn
Ăn uống tại Quận 1
Dịch vụ quanh đây

TopNav / Journey
Dùng khi có 2 điểm rõ ràng: điểm đi → điểm đến (A → B)
Header thể hiện quan hệ di chuyển / giao dịch giữa 2 location

Use when:

Flow có bản chất di chuyển / vận chuyển / chuyển đổi giữa 2 nơi
Cần giúp user hiểu nhanh route đang chọn
Thường đi kèm chọn ngày, phương tiện, vé, slot

Examples:

TP.HCM → Hà Nội (đặt vé máy bay)
Bến xe A → Bến xe B (vé xe khách)
Ga A → Ga B (tàu hoả)

TopNav / Search Entry Point
Dùng khi search không phải action chính của màn
Chỉ cần gợi ý user tìm kiếm
Tap vào sẽ mở màn search riêng

Examples:

Home (search dịch vụ)
Danh sách dịch vụ (có ô search nhỏ phía trên)
TopNav / Full Page Search
Dùng cho màn search chuyên biệt
Search là primary task
Có focus input, keyboard, result list

Examples:

Tìm dịch vụ
Tìm người nhận
Tìm giao dịch

Rule nhanh (4 type)
Title → Default - Không có context đặc biệt → dùng tên màn hình
Username → Có 1 người cụ thể → hiển thị người đó
Location → Có 1 địa điểm → hiển thị location
Journey → Có 2 địa điểm (A → B) → hiển thị route
Search Entry Point → Chỉ là điểm vào search → tap vào navigate sang màn search riêng
Full Page Search → Là màn search chính → TopNav dành riêng cho search (focus nhập liệu + kết quả)

TopNav Background Types
Compact (default)
BG tiêu chuẩn, dùng cho đa số màn
Không có element đặc biệt gắn vào TopNav

Use when:

Screen đơn giản, content bắt đầu ngay dưới TopNav
Không cần highlight / không có overlap UI
Expand
BG TopNav mở rộng xuống dưới
Dùng khi có element dính liền TopNav và nằm trên cùng BG

Use when:

Có block gắn với header: balance, quick action, filter, tab
Muốn tạo cảm giác 1 khối liền mạch (header + content)
Banner
BG dùng cho promotion / campaign
Thường có màu, illustration, visual mạnh

Use when:

Màn có campaign (Tết, sale, feature mới)
Cần thu hút attention ngay từ header
None
Không dùng BG của TopNav
Header follow theo BG custom của màn

Use when:

Màn có thiết kế riêng (custom hero, image, gradient)
TopNav cần “blend” vào background
White (on scroll)
Trạng thái khi scroll
Tất cả variant khác → scroll sẽ chuyển về BG trắng

Use when:

Tăng readability khi content scroll lên
Đảm bảo consistency & contrast cho icon/text
Rule nhanh
Default → Compact
Có element dính header → Expand
Có campaign → Banner
Custom BG → None
Scroll → luôn về White

## Dependencies
- Tokens:
  - Spacing.L = 16 cho horizontal padding
  - Colors.black_01 cho trạng thái scrolled / white background
  - Colors.black_17 cho text/icon trên nền sáng
  - headline_s_bold cho title
  - body_l_semibold cho user name
  - body_default_semibold cho location
  - caption_default_semibold cho journey
- Related components:
  - Icon
  - BottomSheet
  - Search Page
  - Banner / Hero image
  - TabView / Filter (nếu có Extension Area)
  - StatusBar
- Related flows:
  - Help Center Bottom Sheet
  - Dedicated Search Page
  - Child page navigation
  - Home mini-app landing behavior

## Variant-to-Context Map

| Variant | Khi nào dùng | Ví dụ trong MoMo |
|---------|-------------|-------------------|
| Header type=title, Background=compact | Child screen chuẩn, không có search | Payment, Settings, Transaction detail |
| Header type=title, Background=expand, hasSearch=true | Home mini-app có search entry point | Store home, Food home, Travel home |
| Header type=user name, Background=compact | Screen cá nhân hoá theo user hiện tại | User profile, Personal wallet |
| Header type=location, Background=compact | Screen phụ thuộc location | Delivery screen, Address picker |
| Header type=journey, Background=compact | Screen có step / tiến trình / trạng thái | Order status, Delivery tracking, Booking flow |
| Header type=title, Background=light banner, showBackground=false | Hero/banner sáng | Landing có light banner |
| Header type=title, Background=dark banner, showBackground=false | Hero/banner tối | Promotion landing, Event page |
| Header type=full page search, Background=compact | Chỉ dùng cho dedicated Search Page | Search results screen |
| Header type=onboarding, Background=compact | Flow onboarding / registration | Account registration, KYC |
| Header type=forWL | Trường hợp whitelist đặc biệt, cần system confirm | Không dùng tự do |


## Composition Recipes

### Recipe 1: Standard Child Screen
- Components:
  - TopNavigation
  - BackButton
  - HeaderContent(type=title)
  - HelpCenter
  - CloseButton
- Layout:
  - BackButton ở trái
  - Title ở giữa
  - HelpCenter + CloseButton ở phải
  - Background mặc định compact
- When:
  - Mọi child screen depth 2+ hoặc screen mở từ một entry point action
- Example:
  - Payment
  - Settings
  - Detail view

### Recipe 2: Home Mini-app with Search
- Components:
  - TopNavigation
  - HeaderContent(type=title)
  - Shortcut
  - HelpCenter
  - CloseButton
  - Search Entry Point
- Layout:
  - Không có BackButton
  - Title nằm ở phần trên
  - Search Entry Point nằm phía dưới title
  - Shortcut + HelpCenter + CloseButton ở phải
  - Background = expand
- When:
  - Home screen của mini-app có search
- Trigger:
  - User tap Search Entry Point → điều hướng sang Search Page riêng
- Example:
  - Store home
  - Food home
  - Travel home 

### Recipe 3: Journey Tracking Screen
- Components:
  - TopNavigation
  - BackButton
  - HeaderContent(type=journey)
  - HelpCenter
  - CloseButton
- Layout:
  - BackButton trái
  - Journey content ở giữa
  - HelpCenter + CloseButton ở phải
  - Background mặc định compact
- When:
  - Screen theo luồng step-based hoặc tracking
- Example:
  - Order tracking
  - Delivery tracking
  - Booking flow

### Recipe 4: Banner Hero Screen
- Components:
  - TopNavigation
  - BackButton hoặc không, tuỳ page hierarchy
  - HeaderContent(type=title / user / location / journey)
  - HelpCenter
  - CloseButton
- Layout:
  - TopNavigation overlay trên banner
  - Có thể tắt background fill của component để dùng ảnh banner phía sau
  - Text/icon đổi màu theo loại banner sáng hoặc tối
- When:
  - Screen có hero image / promotion banner / landing banner
- Safe area:
  - safe_area = banner_height - (80 + overlap_element_height)

### Recipe 5: Search Page
- Components:
  - TopNavigation
  - HeaderContent(type=full page search)
  - CloseButton hoặc Cancel button theo search header
- Layout:
  - Search input chiếm vùng header content
  - Action hủy/đóng ở phải
  - Không dùng inline search trong screen cũ
- When:
  - Dedicated Search Page duy nhất
- Trigger:
  - Chỉ được mở sau khi user tap Search Entry Point từ variant expand + title 

## Interaction Rules
- On initial render:
  - Component hiển thị theo variant được cấu hình
  - Background hiển thị theo Background property
  - Shadow chưa xuất hiện trong state default
- On back tap:
  - Quay về màn trước
  - Chỉ hiển thị ở các screen có hierarchical navigation
  - Ẩn trên Tab 2–5 và các màn whitelist
- On close tap:
  - Thoát mini-app hoặc thoát flow hiện tại
  - Có thể đi qua prevent popup / survey tùy flow sản phẩm
  - Close Button luôn phải tồn tại
- On help center tap:
  - Mở Bottom Sheet hỗ trợ
  - Bottom Sheet gồm 3 option cố định: FAQ / Online Support / Feedback
  - Không được reorder, rename, add, remove option
- On search entry tap:
  - Không mở keyboard trực tiếp trên chính screen
  - Không search inline
  - Luôn navigate sang dedicated Search Page
- On scroll:
  - Khi isScrolled=true:
    - Background override sang trắng
    - Shadow xuất hiện ở cạnh dưới component
    - Search Entry Point di chuyển lên vị trí title
- On extension pin:
  - Nếu có Extension Area, shadow luôn nằm ở cạnh dưới cùng của vùng extension
- On banner mode:
  - Component overlay trên banner
  - Màu text/icon phụ thuộc light banner hay dark banner
- On merchant mode:
  - Có thể dùng solid brand color riêng thay cho background type chuẩn, nhưng là case đặc biệt theo rule system 

## Data Contract
- Required fields:
  - Header type
  - Background
  - isScrolled
- Optional fields:
  - hasSearch
  - showBackground
  - ExtensionArea
  - Shortcut
- Fixed anatomy:
  - HeaderContent luôn bắt buộc
  - HelpCenter luôn bắt buộc
  - CloseButton luôn bắt buộc
  - BackButton là conditional
  - Shortcut là conditional
- Constraints:
  - hasSearch chỉ có hiệu lực khi Background=expand và Header type=title
  - Background=white chỉ hợp lệ khi isScrolled=true
  - showBackground chỉ áp dụng cho light banner hoặc dark banner
  - Header type=forWL cần explicit confirmation từ system team
  - Header type không được cell-team tự custom hay turn off
- Search contract:
  - Search Entry Point chỉ là entry
  - Dedicated Search Page mới là nơi thực hiện search interaction thật
- Help Center contract:
  - Trigger bằng icon support
  - Opens BottomSheet
  - Options cố định:
    - FAQ
    - Online Support
    - Feedback

## Hierarchy
- Primary usage:
  - TopNavigation là component bắt buộc trên mọi screen
  - Dùng để xác định context + navigation + system actions
- Secondary usage:
  - Search entry point
  - Shortcut
  - ExtensionArea cho pinned content
- Page hierarchy rule:
  - Level 1: Home Mini-app
    - không có BackButton
    - thường dùng compact hoặc expand
  - Level 2: Tab pages 2–5
    - không có BackButton
  - Level 3: Child pages
    - có BackButton
    - default background thường là compact

## Accessibility
- Minimum touch target:
  - BackButton: 44x44pt
  - HelpCenter: 44x44pt
  - CloseButton: 44x44pt
  - Shortcut: 44x44pt
- Screen reader labels:
  - BackButton: Go back
  - CloseButton: Close / Exit mini-app
  - HelpCenter: Help Center
  - Shortcut(pin): Pin to home
  - Shortcut(search): Search
- Motion:
  - Scroll animation cần respect reduced-motion preference của system
- Contrast:
  - Text/icon cần đảm bảo contrast theo background đang dùng
  - Dark banner cần kiểm tra contrast theo ảnh cụ thể
  - Compact/expand color nền hiện còn gap token, cần xác nhận thêm từ designer/system team 

## Do / Don’t

### Do
- Luôn dùng TopNavigation cho mọi màn
- Chọn đúng Header type theo context screen
- Giữ đúng structure trái - giữa - phải theo system
- Dùng Search theo pattern entry point → dedicated Search Page
- Dùng banner + safe area đúng công thức
- Giữ Help Center đúng flow Bottom Sheet hệ thống
- Dùng BackButton đúng page hierarchy
- Dùng state scrolled đúng trigger scroll thực tế

### Don’t
- Không remove TopNavigation
- Không replace bằng custom header
- Không ẩn CloseButton
- Không ẩn HelpCenter
- Không custom HeaderContent
- Không dùng background trắng ngoài state scrolled
- Không search trực tiếp trên current screen
- Không reorder / rename / sửa cấu trúc option trong Help Center
- Không dùng forWL nếu chưa có xác nhận từ system team
- Không dùng Header/Search pattern sai context

## Known Gaps
- Background màu compact / expand hiện chưa có token name được xác nhận rõ trong Colors palette
- Header type=onboarding có tồn tại nhưng rule chưa được document đầy đủ
- Header type=forWL có tồn tại nhưng rule approve/use-case chưa đầy đủ
- Contrast của text trên background compact / expand chưa được verify đầy đủ
- Top Navigation ver 2.0 và bản new cùng tồn tại, cần làm rõ deprecation status
## Spatial Description

Standard Child Screen:
┌──────────────────────────────────────────┐
│ [StatusBar - OS controlled]              │
├──────────────────────────────────────────┤
│ [16] [Back] [Title]     [Pin][Help][Home]│
│                                          │  height = 80
│ Background = compact                     │  horizontal padding = 16
└──────────────────────────────────────────┘

Home Mini-app with Search:
┌──────────────────────────────────────────┐
│ [StatusBar - OS controlled]              │
├──────────────────────────────────────────┤
│ [16] [Title]            [Pin][Help][Home]│
│ [16] [Search Entry Point..........]      │  height = 80 + visible search area
│ Background = expand                      │
└──────────────────────────────────────────┘

Scrolled state:
┌──────────────────────────────────────────┐
│ [StatusBar - OS controlled]              │
├──────────────────────────────────────────┤
│ [16] [Back] [Search/Title]   [Pin][Help][Home]      │
│ Background override = white              │
├──────────────────────────────────────────┤
│ [bottom shadow]                          │
└──────────────────────────────────────────┘

Banner overlay:
┌──────────────────────────────────────────┐
│ [StatusBar - OS controlled]              │
├──────────────────────────────────────────┤
│ overlay on banner image                  │
│ [16] [Back] [Title]     [Pin][Help][Home]│
│ showBackground=false                     │
│ text/icon color follows banner tone      │
└──────────────────────────────────────────┘