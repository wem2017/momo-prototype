# Icon

## React Native

```tsx
import { Icon, IconSources, IconBankSources } from '@momo-kits/foundation';

<Icon
  source="ic_back"                // icon identifier string (from IconSources) or remote URL
  size={24}                       // icon size in pixels (default: 24)
  color={Colors.black_17}         // tint color (default: theme text color, null = no tint)
  style={{}}                      // optional custom styles
  accessibilityLabel="settings"   // optional accessibility label
/>
```

## Compose

```kotlin
import vn.momo.kits.components.Icon

Icon(
    source = "icon_name",          // icon identifier string (from Icons) or remote URL
    size = 24.dp,                  // icon size in dp (default: 24.dp)
    color = Colors.black_17,       // tint color (default: theme text color, null = no tint)
    modifier = Modifier,            // optional modifier
)
```

## Key Differences

| Feature | React Native | Compose |
|---------|-------------|---------|
| Source | String (identifier or URL) | String (identifier or URL) |
| Size | number (pixels) | Dp |
| Style | `StyleProp<ImageStyle>` via `style` | `Modifier` via `modifier` |

## IconSources (1350 icons)

All icons are remote PNG images hosted on `img.mservice.com.vn` or `static.momocdn.net`. The `source` prop accepts either an icon key string or a remote HTTP URL.

### Naming Convention

Icons follow the pattern: `[size_]category_name`

- **No size prefix** = default 24px asset (legacy naming)
- **Size prefix**: `16_`, `24_`, `32_`, `48_` = specific size variant

### Categories

#### Arrow (`arrow_*`)
Navigation arrows, chevrons, rotation, undo/redo.
- `arrow_arrow-back`, `arrow_arrow-down`, `arrow_arrow-next`, `arrow_arrow-top`
- `arrow_chevron_down`, `arrow_chevron_left`, `arrow_chevron_right`, `arrow_chevron_up`
- `arrow_chevron_down_small`, `arrow_chevron_left_small`, `arrow_chevron_right_small`, `arrow_chevron_up_small`
- `arrow_chevrons_double_down`, `arrow_chevrons_double_left`, `arrow_chevrons_double_right`, `arrow_chevrons_double_up`
- `arrow_circle_chevron_bottom`, `arrow_circle_chevron_left`, `arrow_circle_chevron_right`, `arrow_circle_chevron_top`
- `arrow_arrow_bold_forward`, `arrow_arrow_bold_forward_all`, `arrow_arrow_bold_redo`, `arrow_arrow_bold_reply`, `arrow_arrow_bold_reply_all`, `arrow_arrow_bold_undo`
- `arrow_arrow_forward`, `arrow_arrow_redo`, `arrow_arrow_reply`, `arrow_arrow_undo`
- `arrow_diagonals`, `arrow_diagonals_bltr`, `arrow_diagonals_tlbr`, `arrow_hv`
- `arrow_redo`, `arrow_undo`, `arrow_refresh_ccw`, `arrow_refresh_ccw_alert`, `arrow_rotate_ccw`, `arrow_rotate_cw`

#### Basic (`basic_*`)
Common UI actions and user-related icons.
- `basic_account`, `basic_person`, `basic_person_add`, `basic_person_block`, `basic_person_check`, `basic_person_group`, `basic_person_minus`, `basic_person_tag`
- `basic_home`, `basic_setting`, `basic_power`, `basic_options`, `basic_filter`, `basic_sorting`, `basic_sort_a_z`
- `basic_copy`, `basic_delete`, `basic_duplicate`, `basic_flag`
- `basic_chart`, `basic_chart_down`, `basic_chart_up`
- `basic_ticket`, `basic_ticket_full`, `basic_ticket_star`, `basic_ticket_star_full`
- `basic_name_tag`, `basic_Moon`, `basic_sun`, `basic_screen_rotation`, `basic_screen_rotation_lock`
- `basic_pubic`, `basic_pubic_explore`, `basic_pubic_off`, `basic_suport_24`, `basic_support_24h`

#### Chat (`chat_*`)
Messaging and conversation icons.
- `chat_comment`, `chat_comment_alert`, `chat_comment_checked`, `chat_comment_delete`, `chat_comment_empty`, `chat_comment_minus`, `chat_comment_plus`
- `chat_q_and_a`, `chat_sent`, `chat_sticker`, `chat_bot`, `chat_back_space`

#### Connection (`connection_*`)
Connectivity and sharing icons.
- `connection_wifi`, `connection_wifi_no`, `connection_bluetooth`, `connection_bluetooth_no`
- `connection_link`, `connection_link_disable`, `connection_share`, `connection_share_2`
- `connection_airplay`, `connection_broadcast`, `connection_broadcasting`, `connection_cast`, `connection_mail`

#### File (`file_*`)
Document and file management icons.
- `file`, `file_text`, `file_code`, `file_draft`, `file_scan`, `file_search`
- `file_edit`, `file_edit_in_box`, `file_file_create`, `file_delete`, `file_download`, `file_upload`
- `file_checked`, `file_minus`, `file_plus`, `file_pin`, `file_unpin`
- `file_folder`, `file_folder_checked`, `file_folder_cloud`, `file_folder_create`, `file_folder_delete`, `file_folder_forward`, `file_folder_minus`, `file_folder_music`, `file_folder_opened`, `file_folder_photo`, `file_folder_plus`, `file_folder_zip`
- `file_clipboard`, `file_clipboard_checked`, `file_clipboard_delete`, `file_clipboard_minus`, `file_clipboard_note`, `file_clipboard_plus`
- `file_cloud`, `file_cloud_checked`, `file_cloud_connect`, `file_cloud_download`, `file_cloud_no`, `file_cloud_upload`
- `file_briefcase`, `file_database`, `file_mail`, `file_paperclip`, `file_paperclip_no`, `file_shredder`

#### Finance (`finance_*`)
Payment and financial icons.
- `finance_wallet`, `finance_safe`, `finance_atm`, `finance_credit_card`
- `finance_card_1`, `finance_card_2`, `finance_card_jcb`, `finance_card_master`, `finance_card_visa`
- `finance_jcb`, `finance_master`, `finance_visa`, `finance_paypass`
- `finance_saving`, `finance_cash`

#### Gadgets (`gadgets_*`)
Device and hardware icons.
- `gadgets_devices`, `gadgets_mobile`, `gadgets_iphone`, `gadgets_ipad`, `gadgets_laptop`, `gadgets_monitor`
- `gadgets_keyboard`, `gadgets_mouse`, `gadgets_print`, `gadgets_server`
- `gadgets_memory_card`, `gadgets_soft_disk`, `gadgets_usb`

#### Logistics (`logicstics_*`)
Delivery and shipping icons.
- `logicstics_delivery`, `logicstics_delivery_fast`, `logicstics_delivey_bike`
- `logicstics_package`, `logicstics_package_cancel`, `logicstics_package_done`, `logicstics_package_list`, `logicstics_package_preparing`
- `logicstics_trolley_package`

#### Maps (`maps_*`)
Location and navigation icons.
- `maps_location`, `maps_location_no`, `maps_pin`, `maps_pin_add`, `maps_pin_edit`, `maps_pin_no`, `maps_pin_question`, `maps_pin_round`, `maps_pin_start`
- `maps_map`, `maps_map_pin_location`, `maps_globe`, `maps_compass`, `maps_radar`, `maps_route`
- `maps_direction`, `maps_direction_45`, `maps_360`, `maps_panorama`
- `maps_zoom_in`, `maps_zoom_out`

#### Media (`media_*`)
Camera, audio, video, and player controls.
- `media`, `media_add`, `media_search`, `media_collection`
- `media_camera`, `media_camera_add`, `media_camera_linked`, `media_camera_switch`
- `media_video`, `media_record`, `media_slideshow`, `media_timelapse`
- `media_flash_auto`, `media_flash_off`, `media_flash_on`, `media_flashlight_on`, `media_flashlight_off`, `media_flashlight_disable`
- `media_player_pause_circle`, `media_player_play_circle`, `media_player_stop_circle`
- `media_volume`, `media_volume_high`, `media_volume_low`, `media_volume_no`, `media_volume_off`
- `media_repeat`, `media_shuffle`, `media_rotate_left`, `media_rotate_right`
- `media_timer`, `media_timer_3s`, `media_timer_10s`, `media_timer_off`, `media_shutter_speed`
- `media_cd`, `media_color_picker`, `media_control_point`, `media_focus`, `media_leak_add`
- `media_color`, `media_flip`, `media_crop`, `media_nope`

#### Navigation (`navigation_*`)
App navigation and control icons.
- `navigation_close`, `navigation_close_circle`, `navigation_close_circle_full`, `navigation_close_circle_full_02`, `navigation_close_circle_full_2`
- `navigation_plus`, `navigation_plus_circle`, `navigation_plus_circle_full`
- `navigation_minus`, `navigation_minus_circle`, `navigation_minus_circle_full`
- `navigation_menu`, `navigation_more_horiz`, `navigation_more_vert`
- `navigation_search`, `navigation_search_add`, `navigation_search_minus`
- `navigation_app`, `navigation_cash_in`, `navigation_qrcode`, `navigation_scan`
- `navigation_full_screen`, `navigation_full_screen_exit`, `navigation_log_out`
- `navigation_unfold_less`, `navigation_unfold_more`
- `navigation_remove_from_home`, `navigation_add_to_home`

#### Notifications (`notifications_*`)
Alerts, status, and notification icons.
- `notifications_bell`, `notifications_bell_add`, `notifications_bell_alert`, `notifications_bell_checked`, `notifications_bell_full`, `notifications_bell_minus`, `notifications_bell_no`
- `notifications_check`, `notifications_check_circle`, `notifications_check_circle_full`, `notifications_check_double`
- `notifications_alert_octagon`, `notifications_alert_triangle`, `notifications_app_notification`
- `notifications_circle_alert`, `notifications_circle_question`, `notifications_info`
- `notifications_minus_octagon`, `notifications_x_octagon`
- `notifications_guide`

#### Phone Call (`phone_call_*`)
Calling and telephony icons.
- `phone_call`, `phone_call_add`, `phone_call_decline`, `phone_call_end`
- `phone_call_incoming`, `phone_call_outcoming`, `phone_call_missed`, `phone_call_forwarded`, `phone_call_recieved`
- `phone_call_hold`, `phone_call_muted`, `phone_call_no`, `phone_call_phone_calling`
- `phone_call_mic_off`, `phone_call_mic_on`, `phone_call_voicemail`
- `phone_call_hash`, `phone_call_numbers`

#### Reaction (`reaction_*`)
Emoji, likes, and rating icons.
- `reaction_emoji_happy`, `reaction_emoji_sad`, `reaction_emoji_satisfy`
- `reaction_heart`, `reaction_heart_full`, `reaction_heart_disable`
- `reaction_like`, `reaction_like_dislike`
- `reaction_star_full`, `reaction_star_half`, `reaction_star_non`

#### Security (`security_*`)
Authentication and security icons.
- `security_lock`, `security_lock_no`, `security_unlock`
- `security_eye_open`, `security_eye_off`, `security_fingerprint`, `security_verifiedface_id`
- `security_key`, `security_key_no`, `security_password`
- `security_shield`, `security_shield_admin`, `security_shield_check`, `security_shield_disable`

#### Shopping (`shopping_*`)
E-commerce and retail icons.
- `shopping_bag`, `shopping_bag_shopping`, `shopping_cart`, `shopping_store`
- `shopping_coupon`, `shopping_coupon_star`, `shopping_tag`, `shopping_tag_love`
- `shopping_gift_card`, `shopping_fast_food`, `shopping_restaurant`

#### Time (`time_*`)
Clock, calendar, and scheduling icons.
- `time_clock`, `time_clock_reset`, `time_watch`, `time_stop_watch`, `time_stop_watch_disable`
- `time_alarm`, `time_alarm_add`, `time_alarm_check`, `time_alarm_remove`
- `time_calendar`, `time_calendar_add`, `time_calendar_checked`, `time_calendar_remove`, `time_calendar_x`
- `time_note`

#### Travel (`travel_*`)
Transportation, accommodation, and people icons.
- **Transport**: `travel_plane`, `travel_plane_landing`, `travel_plane_take_off`, `travel_car`, `travel_bus`, `travel_taxi`, `travel_subway`, `travel_train_1`, `travel_train_2`, `travel_tram`, `travel_van`, `travel_bike`
- **Accommodation**: `travel_hotel`, `travel_villa`, `travel_apartment`, `travel_bed`, `travel_bed-single`, `travel_bathtub`, `travel_hottub`
- **Amenities**: `travel_kitchen`, `travel_fridge`, `travel_microwave`, `travel_coffee_maker`, `travel_iron`, `travel_laundry`, `travel_dry_clean`, `travel_cleaning_services`, `travel_parking`, `travel_gas_station`, `travel_wc`
- **People**: `travel_people_man`, `travel_people_woman`, `travel_people_women_pregnant`, `travel_people_kid`, `travel_people_baby`, `travel_people_old`, `travel_people_family`, `travel_people_college`, `travel_people_run`, `travel_people_walk`, `travel_people_wheelchair`
- **Seating**: `travel_seat_comfort`, `travel_seat_economy`, `travel_seat_extra_seat`
- **Other**: `travel_Cold`, `travel_Karaoke`, `travel_suport_service`, `travel_airconditional`

### Special Icons

#### MoMo Main (`momomain_*`)
MoMo app tab bar and core feature icons.
- `momomain_account`, `momomain_chat`, `momomain_gift`, `momomain_history`, `momomain_momo`
- `momomain_barcode`, `momomain_barcode_s`, `momomain_scan_code`, `momomain_scan_code_s`
- `momomain_money_in`, `momomain_money_in_s`, `momomain_withdraw`, `momomain_withdraw_2`

#### Tab Bar Icons
Bottom tab active/inactive states for various features.
- `home_momo_active`, `home_momo_inactive`, `home_wallet_inactive`
- `home_friends_active`, `home_friends_inactive`
- `home_history_active`, `home_history_inactive`
- `home_promotions_active`, `home_promotions_inactive`
- `cinema_theaters_picking_active`, `cinema_theaters_picking_disable`
- `cinema_ticket_active`, `cinema_ticket_disable`, `cinema_ticket_my_active`, `cinema_ticket_my_inactive`
- `shop_online_home_active`, `shop_online_home_inactive`
- `shop_online_favorite_active`, `shop_online_favorite_inactive`
- `shop_online_order_active`, `shop_online_order_inactive`
- `shop_online_address_book_active`, `shop_online_address_book_inactive`

#### Graphics (`graphic_*`)
Illustration-style empty states and placeholders.
- `graphic_wifi_disconnect`, `graphic_time_out`, `graphic_not_found`, `graphic_no_data`, `graphic_no_location`
- `graphic_notification`, `graphic_missing`, `graphic_maintance`, `graphic_merchant`
- `graphic_ticket`, `graphic_photo`, `graphic_comment`, `graphic_avatar`
- `graphic_logo`, `graphic_file_default`, `graphic_directory`

#### Common UI Icons (`ic_*`)
Frequently used standalone icons.
- `ic_back`, `ic_back_android`, `ic_back_ios`, `ic_back_arrow`
- `ic_close_24`, `ic_close_x_24`, `ic_close_circle_full`
- `ic_check_24`, `ic_check_mini`, `ic_checked`, `ic_checkbox_checked_24`, `ic_checkbox_unchecked_24`
- `ic_warning`, `ic_warning_24`, `ic_error`, `ic_info_gray`
- `ic_plus`, `ic_minus`, `ic_arrow_next`, `ic_arrow_drop_down_24`
- `ic_eye_24`, `ic_calendar`, `ic_location_24`, `ic_navigation`
- `ic_star`, `ic_star_selected`, `ic_momo`, `ic_momo_small_bottom_left`, `ic_round_momo_tiny`
- `ic_money`, `ic_money_bag`, `ic_discount_voucher`, `ic_tag_voucher`
- `ic_camera_circle`, `ic_backspace_24`, `ic_line`
- `ic_notification_info`, `ic_cinema_poster`, `ic_momo_gift`
- `ic_transaction_history_status_fail`, `ic_transaction_history_status_success`, `ic_transaction_history_status_processing`
- `ic_success_process_white`, `ic_film_pin`, `ic_film_ticket`
- `ic_step_active`, `ic_step_coming`, `ic_support`

#### Miscellaneous
- `Phonebook`, `phonebook_outline`, `home_banner`, `request_money`
- `share`, `addFavorite`, `addShortcut`, `header_background`, `media_fail`
- `help_center`, `arrow-back`, `pin_star`, `pin_star_checked`, `navigation_more_icon`
- `file_pinned`, `basic_flaged`, `basic_user`

### Sized Variants

Many icons have size-specific variants with prefixes: `16_`, `24_`, `32_`, `48_`.

Examples:
- `16_arrow_chevron_right` (16px), `24_arrow_chevron_right` (24px)
- `16_basic_account`, `24_basic_account`
- `16_notifications_bell`, `24_notifications_bell`, `32_notifications_bell`, `48_notifications_bell`

Available size prefixes per category:
- **16 + 24**: arrow, basic, chatting, connection, file, finance, gadgets, maps, media, navigation, phone_call, reaction, security, shopping, time, travel
- **32 + 48**: notifications, security (select icons)
- **24 only**: toggle (`24_toggle_check_box_checked`, `24_toggle_radio_selected`, `24_toggle_turn_on`, etc.)

## IconBankSources (168 icons)

Bank and payment provider logos. Each bank has two variants:
- `{bank}_full` — Full logo with bank name
- `{bank}_icon` — Compact square icon

```tsx
import { IconSources, IconBankSources } from '@momo-kits/foundation';

// Common usage: dot notation + .uri to get the URL string
const momoIcon = IconSources.momomain_momo.uri;        // "https://img.mservice.com.vn/..."
const bankIcon = IconBankSources.bidv_icon.uri;         // "https://static.momocdn.net/..."
const bankFull = IconBankSources.bidv_full.uri;         // "https://static.momocdn.net/..."

// For <Icon> component, just pass the string key name directly
<Icon source="momomain_momo" size={24} />
```

### Available Banks

| Key prefix | Bank name |
|-----------|-----------|
| `abbank` | ABBank |
| `acb` | ACB |
| `argibank` | Agribank |
| `bac_a_bank` | Bac A Bank |
| `baoviet_bank` | BaoViet Bank |
| `bidv` | BIDV |
| `cake_by vpbank` | Cake by VPBank |
| `cimb` | CIMB |
| `donga_bank` | DongA Bank |
| `eximbank` | Eximbank |
| `hdbank` | HDBank |
| `hsbc` | HSBC |
| `ivb` | IVB |
| `kb` | KB |
| `kienlong_bank` | KienLong Bank |
| `lienviet_postbank` | LienViet PostBank |
| `mb_bank` | MB Bank |
| `msb` | MSB |
| `nam_a_bank` | Nam A Bank |
| `ncb` | NCB |
| `ocb` | OCB |
| `ocean_bank` | Ocean Bank |
| `pg_bank` | PG Bank |
| `pvcom_bank` | PVCom Bank |
| `scb` | SCB |
| `sea_bank` | SeABank |
| `shb` | SHB |
| `shinhan_bank` | Shinhan Bank |
| `techcombank` | Techcombank |
| `timo` | Timo |
| `tpbank` | TPBank |
| `vib` | VIB |
| `viet_a bank` | VietABank |
| `viet_capital bank` | Viet Capital Bank |
| `vietcombank` | Vietcombank |
| `vietinbank` | VietinBank |
| `vpbank` | VPBank |
| `gpbank` | GPBank |
| `dsb` | DSB |
| `cb` | CB |
| `bidc` | BIDC |

### E-wallets & Payment Providers

| Key prefix | Provider |
|-----------|----------|
| `momo` | MoMo |
| `grabpay_by_moca` | GrabPay by Moca |
| `moca` | Moca |
| `shopeepay` | ShopeePay |
| `zalopay` | ZaloPay |
| `vnpay` | VNPay |
| `vnpay_money` | VNPay Money |
| `viettel_money` | Viettel Money |
| `viettel_pay` | Viettel Pay |
| `truemoney` | TrueMoney |
| `vinid` | VinID |
| `payme` | PayMe |

### Other Financial Services

| Key prefix | Provider |
|-----------|----------|
| `napas` | NAPAS |
| `baokim` | BaoKim |
| `ecpay` | ECPay |
| `ngan_luong` | Ngan Luong |
| `nextpay` | NextPay |
| `payoo` | Payoo |
| `vtcpay` | VTCPay |
| `vimo` | ViMo |
| `apota` | Apota |

### International Banks

| Key prefix | Bank |
|-----------|------|
| `anz` | ANZ |
| `bangkok_bank` | Bangkok Bank |
| `bank_of china` | Bank of China |
| `cathay_bank` | Cathay Bank |
| `chase_bank` | Chase Bank |
| `citibank` | Citibank |
| `commonwealth_bank` | Commonwealth Bank |
| `deutsche_bank` | Deutsche Bank |
| `hong_leong bank` | Hong Leong Bank |
| `industrial_bank of korea` | Industrial Bank of Korea |
| `keb_hana bank` | KEB Hana Bank |
| `maybank` | Maybank |
| `mega_international commercial bank` | Mega International Commercial Bank |
| `mizuho` | Mizuho |
| `public_bank` | Public Bank |
| `scotiabank` | Scotiabank |
| `smfg` | SMFG |
| `standard_chartered` | Standard Chartered |
| `tyme` | Tyme |
| `tymebank` | TymeBank |
| `ubsp` | UBSP |
| `woori_bank` | Woori Bank |
