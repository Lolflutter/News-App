class NewsCardCategory {
  String id;
  String name;
  String image;

  NewsCardCategory({required this.id, required this.name, required this.image});

  static List<NewsCardCategory> category = [
    NewsCardCategory(id: 'general', name: 'General', image: 'assets/images/general.png'),
    NewsCardCategory(id: 'business', name: 'Business', image: 'assets/images/buisness.png'),
    NewsCardCategory(id: 'entertainment', name: 'Entertainment', image: 'assets/images/entertainment.png'),
    NewsCardCategory(id: 'health', name: 'Health', image: 'assets/images/health.png'),
    NewsCardCategory(id: 'science', name: 'Science', image: 'assets/images/sience.png'),
    NewsCardCategory(id: 'sports', name: 'Sports', image: 'assets/images/sport.png'),
    NewsCardCategory(id: 'technology', name: 'Technology', image: 'assets/images/technology.png'),
  ];
}
