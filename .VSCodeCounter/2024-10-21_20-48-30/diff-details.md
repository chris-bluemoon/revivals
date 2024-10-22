# Diff Details

Date : 2024-10-21 20:48:30

Directory c:\\Users\\Chris Milner\\Dev\\Code\\Flutter\\unearthed

Total : 94 files,  4877 codes, 469 comments, 318 blanks, all 5664 lines

[Summary](results.md) / [Details](details.md) / [Diff Summary](diff.md) / Diff Details

## Files
| filename | language | code | comment | blank | total |
| :--- | :--- | ---: | ---: | ---: | ---: |
| [android/app/build.gradle](/android/app/build.gradle) | Groovy | 2 | 0 | 0 | 2 |
| [android/app/src/debug/AndroidManifest.xml](/android/app/src/debug/AndroidManifest.xml) | XML | 1 | 0 | 0 | 1 |
| [android/app/src/main/AndroidManifest.xml](/android/app/src/main/AndroidManifest.xml) | XML | 1 | 0 | 0 | 1 |
| [android/app/src/profile/AndroidManifest.xml](/android/app/src/profile/AndroidManifest.xml) | XML | 1 | 0 | 0 | 1 |
| [ios/Podfile](/ios/Podfile) | Ruby | 32 | 3 | 10 | 45 |
| [lib/globals.dart](/lib/globals.dart) | Dart | -2 | -1 | -2 | -5 |
| [lib/main.dart](/lib/main.dart) | Dart | 11 | 2 | -3 | 10 |
| [lib/models/filter.dart](/lib/models/filter.dart) | Dart | 79 | 0 | 11 | 90 |
| [lib/models/fitting_renter.dart](/lib/models/fitting_renter.dart) | Dart | 40 | 4 | 11 | 55 |
| [lib/models/item.dart](/lib/models/item.dart) | Dart | 74 | 0 | 1 | 75 |
| [lib/models/item_renter.dart](/lib/models/item_renter.dart) | Dart | 4 | 0 | 0 | 4 |
| [lib/models/renter.dart](/lib/models/renter.dart) | Dart | 8 | -9 | 0 | -1 |
| [lib/screens/authenticate/authenticate.dart](/lib/screens/authenticate/authenticate.dart) | Dart | 25 | 0 | 5 | 30 |
| [lib/screens/authenticate/register.dart](/lib/screens/authenticate/register.dart) | Dart | 158 | 40 | 10 | 208 |
| [lib/screens/authenticate/register_name.dart](/lib/screens/authenticate/register_name.dart) | Dart | 130 | 39 | 9 | 178 |
| [lib/screens/authenticate/register_password.dart](/lib/screens/authenticate/register_password.dart) | Dart | 327 | 47 | 16 | 390 |
| [lib/screens/authenticate/sign_in.dart](/lib/screens/authenticate/sign_in.dart) | Dart | 266 | 99 | 12 | 377 |
| [lib/screens/browse/browse.dart](/lib/screens/browse/browse.dart) | Dart | 1 | 0 | 0 | 1 |
| [lib/screens/browse/category_items.dart](/lib/screens/browse/category_items.dart) | Dart | -83 | -12 | -16 | -111 |
| [lib/screens/browse/designer_item_card.dart](/lib/screens/browse/designer_item_card.dart) | Dart | 49 | 0 | 6 | 55 |
| [lib/screens/browse/designer_items.dart](/lib/screens/browse/designer_items.dart) | Dart | -89 | -7 | -14 | -110 |
| [lib/screens/browse/occasion_items.dart](/lib/screens/browse/occasion_items.dart) | Dart | -82 | -12 | -14 | -108 |
| [lib/screens/browse/style_items.dart](/lib/screens/browse/style_items.dart) | Dart | 8 | 0 | -1 | 7 |
| [lib/screens/favourites/favourites.dart](/lib/screens/favourites/favourites.dart) | Dart | 16 | 2 | 4 | 22 |
| [lib/screens/fitting/booking_calendar.dart](/lib/screens/fitting/booking_calendar.dart) | Dart | 79 | 11 | 13 | 103 |
| [lib/screens/fitting/fitting.dart](/lib/screens/fitting/fitting.dart) | Dart | 202 | 20 | 26 | 248 |
| [lib/screens/fitting/fitting_summary.dart](/lib/screens/fitting/fitting_summary.dart) | Dart | 65 | 0 | 6 | 71 |
| [lib/screens/help_centre/faq_accordion.dart](/lib/screens/help_centre/faq_accordion.dart) | Dart | 13 | -20 | 0 | -7 |
| [lib/screens/help_centre/faqs.dart](/lib/screens/help_centre/faqs.dart) | Dart | 7 | -1 | 0 | 6 |
| [lib/screens/help_centre/how_it_works.dart](/lib/screens/help_centre/how_it_works.dart) | Dart | 310 | 16 | 4 | 330 |
| [lib/screens/help_centre/hygiene_policy.dart](/lib/screens/help_centre/hygiene_policy.dart) | Dart | -27 | -7 | -2 | -36 |
| [lib/screens/help_centre/sizing_guide.dart](/lib/screens/help_centre/sizing_guide.dart) | Dart | 330 | 8 | 4 | 342 |
| [lib/screens/help_centre/what_is.dart](/lib/screens/help_centre/what_is.dart) | Dart | -27 | -7 | -2 | -36 |
| [lib/screens/help_centre/who_are_we.dart](/lib/screens/help_centre/who_are_we.dart) | Dart | 217 | 22 | 6 | 245 |
| [lib/screens/home/all_items_home_widget.dart](/lib/screens/home/all_items_home_widget.dart) | Dart | 51 | 6 | 5 | 62 |
| [lib/screens/home/fitting_home_widget.dart](/lib/screens/home/fitting_home_widget.dart) | Dart | 46 | 6 | 3 | 55 |
| [lib/screens/home/home.dart](/lib/screens/home/home.dart) | Dart | 42 | 11 | 1 | 54 |
| [lib/screens/home/home_page_bottom_card.dart](/lib/screens/home/home_page_bottom_card.dart) | Dart | 3 | 1 | 0 | 4 |
| [lib/screens/home/new_arrivals_carousel.dart](/lib/screens/home/new_arrivals_carousel.dart) | Dart | 40 | 1 | 5 | 46 |
| [lib/screens/home/new_arrivals_home_widget.dart](/lib/screens/home/new_arrivals_home_widget.dart) | Dart | -56 | -6 | -5 | -67 |
| [lib/screens/home/rentals_home_widget.dart](/lib/screens/home/rentals_home_widget.dart) | Dart | 51 | 6 | 5 | 62 |
| [lib/screens/home/to_buy_home_widget.dart](/lib/screens/home/to_buy_home_widget.dart) | Dart | -5 | 0 | 0 | -5 |
| [lib/screens/home_page.dart](/lib/screens/home_page.dart) | Dart | -3 | 2 | 0 | -1 |
| [lib/screens/new_arrivals/new_arrivals.dart](/lib/screens/new_arrivals/new_arrivals.dart) | Dart | -110 | -7 | -11 | -128 |
| [lib/screens/profile/admin.dart](/lib/screens/profile/admin.dart) | Dart | 43 | 8 | 4 | 55 |
| [lib/screens/profile/country_selector.dart](/lib/screens/profile/country_selector.dart) | Dart | 67 | 3 | 6 | 76 |
| [lib/screens/profile/my_account.dart](/lib/screens/profile/my_account.dart) | Dart | -34 | 21 | 0 | -13 |
| [lib/screens/profile/my_fittings.dart](/lib/screens/profile/my_fittings.dart) | Dart | 39 | 9 | 3 | 51 |
| [lib/screens/profile/my_fittings_image_widget.dart](/lib/screens/profile/my_fittings_image_widget.dart) | Dart | 120 | 5 | 8 | 133 |
| [lib/screens/profile/my_history_fittings_image_widget.dart](/lib/screens/profile/my_history_fittings_image_widget.dart) | Dart | 100 | 1 | 9 | 110 |
| [lib/screens/profile/my_history_fittings_list.dart](/lib/screens/profile/my_history_fittings_list.dart) | Dart | 50 | 6 | 10 | 66 |
| [lib/screens/profile/my_purchases_admin_list.dart](/lib/screens/profile/my_purchases_admin_list.dart) | Dart | 52 | 11 | 10 | 73 |
| [lib/screens/profile/my_purchases_image_widget.dart](/lib/screens/profile/my_purchases_image_widget.dart) | Dart | -132 | -1 | -8 | -141 |
| [lib/screens/profile/my_purchases_list.dart](/lib/screens/profile/my_purchases_list.dart) | Dart | 0 | 1 | 0 | 1 |
| [lib/screens/profile/my_rentals.dart](/lib/screens/profile/my_rentals.dart) | Dart | -84 | -4 | -11 | -99 |
| [lib/screens/profile/my_rentals_admin_list.dart](/lib/screens/profile/my_rentals_admin_list.dart) | Dart | 51 | 10 | 10 | 71 |
| [lib/screens/profile/my_rentals_image_widget.dart](/lib/screens/profile/my_rentals_image_widget.dart) | Dart | -132 | -1 | -8 | -141 |
| [lib/screens/profile/my_rentals_list.dart](/lib/screens/profile/my_rentals_list.dart) | Dart | 2 | -5 | 0 | -3 |
| [lib/screens/profile/my_transactions.dart](/lib/screens/profile/my_transactions.dart) | Dart | -9 | 7 | 0 | -2 |
| [lib/screens/profile/my_transactions_admin_image_widget.dart](/lib/screens/profile/my_transactions_admin_image_widget.dart) | Dart | 168 | 2 | 9 | 179 |
| [lib/screens/profile/my_transactions_image_widget.dart](/lib/screens/profile/my_transactions_image_widget.dart) | Dart | 156 | 1 | 9 | 166 |
| [lib/screens/profile/my_upcoming_fittings_list.dart](/lib/screens/profile/my_upcoming_fittings_list.dart) | Dart | 52 | 6 | 10 | 68 |
| [lib/screens/profile/new_arrivals_home_widget.dart](/lib/screens/profile/new_arrivals_home_widget.dart) | Dart | -46 | -2 | -5 | -53 |
| [lib/screens/profile/profile copy.dart](/lib/screens/profile/profile%20copy.dart) | Dart | 88 | 20 | 16 | 124 |
| [lib/screens/profile/profile.dart](/lib/screens/profile/profile.dart) | Dart | -5 | 1 | 1 | -3 |
| [lib/screens/profile/profile_landing.dart](/lib/screens/profile/profile_landing.dart) | Dart | 118 | 3 | 2 | 123 |
| [lib/screens/profile/settings.dart](/lib/screens/profile/settings.dart) | Dart | 328 | 14 | 16 | 358 |
| [lib/screens/sign_up/google_sign_in.dart](/lib/screens/sign_up/google_sign_in.dart) | Dart | 53 | -16 | -3 | 34 |
| [lib/screens/sign_up/login_page.dart](/lib/screens/sign_up/login_page.dart) | Dart | 1 | 0 | 0 | 1 |
| [lib/screens/summary/delivery_radio_widget.dart](/lib/screens/summary/delivery_radio_widget.dart) | Dart | 12 | 0 | 4 | 16 |
| [lib/screens/summary/summary_image_widget.dart](/lib/screens/summary/summary_image_widget.dart) | Dart | 14 | 11 | 0 | 25 |
| [lib/screens/summary/summary_purchase.dart](/lib/screens/summary/summary_purchase.dart) | Dart | 2 | 6 | 0 | 8 |
| [lib/screens/summary/summary_rental.dart](/lib/screens/summary/summary_rental.dart) | Dart | 40 | 6 | -1 | 45 |
| [lib/screens/to_rent/item_widget.dart](/lib/screens/to_rent/item_widget.dart) | Dart | 1 | 0 | 0 | 1 |
| [lib/screens/to_rent/rent_this_with_date_selecter.dart](/lib/screens/to_rent/rent_this_with_date_selecter.dart) | Dart | 95 | 63 | 3 | 161 |
| [lib/screens/to_rent/to_rent.dart](/lib/screens/to_rent/to_rent.dart) | Dart | 82 | 16 | 15 | 113 |
| [lib/services/auth.dart](/lib/services/auth.dart) | Dart | 61 | 9 | 11 | 81 |
| [lib/services/class_store.dart](/lib/services/class_store.dart) | Dart | 124 | -43 | 2 | 83 |
| [lib/services/firestore_service.dart](/lib/services/firestore_service.dart) | Dart | 48 | -7 | 4 | 45 |
| [lib/shared/bottom_navbar_buttons.dart](/lib/shared/bottom_navbar_buttons.dart) | Dart | 0 | 0 | 1 | 1 |
| [lib/shared/common.dart](/lib/shared/common.dart) | Dart | 0 | 0 | -1 | -1 |
| [lib/shared/constants.dart](/lib/shared/constants.dart) | Dart | 12 | 0 | 1 | 13 |
| [lib/shared/filters_page.dart](/lib/shared/filters_page.dart) | Dart | 582 | 29 | 31 | 642 |
| [lib/shared/get_country_price.dart](/lib/shared/get_country_price.dart) | Dart | 26 | 3 | 7 | 36 |
| [lib/shared/item_card.dart](/lib/shared/item_card.dart) | Dart | 140 | -2 | 13 | 151 |
| [lib/shared/item_results.dart](/lib/shared/item_results.dart) | Dart | 284 | 6 | 20 | 310 |
| [lib/shared/line.dart](/lib/shared/line.dart) | Dart | 3 | 5 | 0 | 8 |
| [lib/shared/loading.dart](/lib/shared/loading.dart) | Dart | 16 | 0 | 2 | 18 |
| [lib/shared/no_items_found.dart](/lib/shared/no_items_found.dart) | Dart | 20 | 6 | 5 | 31 |
| [lib/shared/whatsapp copy.dart](/lib/shared/whatsapp%20copy.dart) | Dart | 18 | 3 | 5 | 26 |
| [lib/theme.dart](/lib/theme.dart) | Dart | 4 | 0 | -1 | 3 |
| [lib/variables-old.dart](/lib/variables-old.dart) | Dart | -6 | 0 | -5 | -11 |
| [macos/Podfile](/macos/Podfile) | Ruby | 33 | 1 | 10 | 44 |
| [pubspec.yaml](/pubspec.yaml) | YAML | 15 | 0 | 1 | 16 |

[Summary](results.md) / [Details](details.md) / [Diff Summary](diff.md) / Diff Details