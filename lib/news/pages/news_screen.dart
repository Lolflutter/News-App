import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../api_manager/models/news_article_model.dart';
import '../../api_manager/models/news_source_model.dart';
import '../../news/view_model/newsViewModel.dart';
import '../../modules/home/app_category/news_card_category.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var category = ModalRoute.of(context)!.settings.arguments as NewsCardCategory;

    return ChangeNotifierProvider(
      create: (context) => NewsViewModel()..getSources(category.id),
      child: Scaffold(
        appBar: AppBar(title: Text(category.name)),
        body: Consumer<NewsViewModel>(
          builder: (context, vm, child) {
            if (vm.sources.isEmpty) {
              return Center(child: CircularProgressIndicator());
            }

            return Column(
              children: [
                DefaultTabController(
                  length: vm.sources.length,
                  child: TabBar(
                      isScrollable: true,
                      tabAlignment: TabAlignment.start,
                      dividerColor: Colors.transparent,
                      labelColor: Colors.white,
                      unselectedLabelColor:Colors.white,
                    onTap: (index) {
                      vm.getNews(vm.sources[index].id ?? '');
                    },
                    tabs: vm.sources.map((e) => Tab(text: e.name ?? '')).toList(),
                  ),
                ),
                Expanded(
                  child: vm.articles.isEmpty
                      ? Center(child: CircularProgressIndicator())
                      : ListView.builder(
                    itemCount: vm.articles.length,
                    itemBuilder: (context, index) {
                      final NewsArticle article = vm.articles[index];
                      return Container(
                        margin: EdgeInsets.all(10),
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.39,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(16),
                                topLeft: Radius.circular(16),
                              ),
                              child: Image.network(
                                article.urlToImage ?? '',
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: MediaQuery.of(context).size.height * 0.25,
                                errorBuilder: (context, error, stackTrace) => Icon(
                                  Icons.broken_image,
                                  size: 100,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                article.title ?? '',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "By: ${article.author?.isNotEmpty == true ? article.author : 'Unknown'}",
                                  style: TextStyle(
                                    color: Color(0xffA0A0A0),
                                    fontSize: 12,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  article.publishedAt != null
                                      ? DateFormat('EEEE MMM').format(DateTime.parse(article.publishedAt!))
                                      : 'Unknown Date',
                                  style: TextStyle(
                                    color: Color(0xffA0A0A0),
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
