import 'package:flutter/material.dart';
import 'package:news_app/core/routes/app_routes_name.dart';
import 'package:news_app/modules/home/app_category/news_card_category.dart';

import '../../../core/theme/app_colors.dart';

class NewsCardWidget extends StatelessWidget {
  final NewsCardCategory category;
  final bool isLeft;
  const NewsCardWidget({
    super.key,
    required this.category,
    required this.isLeft,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return InkWell(
      onTap: () => Navigator.pushNamed(context, AppRoutesName.news,arguments: category),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.23,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: AppColors.white,
        ),
        child: Row(
          textDirection: isLeft ? TextDirection.ltr : TextDirection.rtl,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                category.image,
                fit: BoxFit.cover,
                height: double.infinity,
                width: MediaQuery.of(context).size.width * 0.4,
              ),
            ),
            Spacer(),
            Column(
              children: [
                Spacer(),
                Text(
                  category.name,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: Colors.black,
                  ),
                ),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(84),
                    color: Colors.black.withOpacity(0.5),
                  ),
                  child: Row(
                    textDirection: isLeft ? TextDirection.ltr : TextDirection.rtl,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'View All',
                          style: theme.textTheme.bodySmall!.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.black,
                        child: Icon(
                          isLeft
                              ? Icons.arrow_forward_ios_rounded
                              : Icons.arrow_back_ios_new_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
