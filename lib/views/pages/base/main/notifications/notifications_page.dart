import 'package:flutter/material.dart';

import '../../../../../data/tools/constants/assets/icons.dart';
import '../../../../../data/tools/constants/language/getx_translation.dart';
import '../../../../../data/tools/constants/style/colors.dart';
import 'widgets/daily_notification.dart';
import 'widgets/notification_card.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalization();

    return Scaffold(
      backgroundColor: KTColors.white,
      appBar: AppBar(
        backgroundColor: KTColors.white,
        surfaceTintColor: KTColors.white,
        title: Text(lang.notification),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: const [
            DailyNotification(
              "Bugun",
              notifications: [
                NotificationCard(
                  iconPath: KTIcons.notfPayment,
                  title: "Toʻlov muvaffaqiyatli amalga oshirildi!",
                  subtitle: "Siz xizmatlar uchun toʻlovni amalga oshirdingiz",
                ),
                NotificationCard(
                  iconPath: KTIcons.notfServices,
                  title: "Yangi toifadagi xizmatlar!",
                  subtitle: "Endi sanitariya-tesisat xizmati mavjud",
                ),
              ],
            ),
            DailyNotification(
              "Kecha",
              notifications: [
                NotificationCard(
                  iconPath: KTIcons.notfSprecialOffers,
                  title: "Bugungi maxsus takliflar!",
                  subtitle: "Bugun siz maxsus promoga egasiz!",
                ),
              ],
            ),
            DailyNotification(
              "March 22, 2024",
              notifications: [
                NotificationCard(
                  iconPath: KTIcons.notfPayment,
                  title: "Kredit karta ulandi!",
                  subtitle: "Kredit karta bog'landi!",
                ),
                NotificationCard(
                  iconPath: KTIcons.notfUser,
                  title: "Hisob muvaffaqiyatli sozlandi!",
                  subtitle: "Hisobingiz yaratildi!",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
