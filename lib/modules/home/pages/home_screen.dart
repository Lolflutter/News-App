import 'package:flutter/material.dart';
import 'package:news_app/core/theme/app_colors.dart';
import 'package:news_app/modules/home/app_category/news_card_category.dart';
import 'package:news_app/modules/home/widgets/news_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
        actions: [Icon(Icons.search, size: 25)],
      ),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.7,
        backgroundColor: AppColors.dark,
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: AppColors.white),
              child: Center(
                child: Text(
                  'News App',
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.home, size: 24, color: AppColors.white),
                      SizedBox(width: 10),
                      Text(
                        'Go To Home',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 7),
                  Divider(color: AppColors.white, thickness: 1),
                  SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.format_paint_rounded,
                        size: 24,
                        color: AppColors.white,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Theme',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good Morning \nHere is Some News For You',
              style: theme.textTheme.bodyMedium,
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: NewsCardCategory.category.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: NewsCardWidget(
                      isLeft: index % 2 == 0,
                      category: NewsCardCategory.category[index],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
