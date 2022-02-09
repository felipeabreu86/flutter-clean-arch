import 'package:flutter_clean_arch/src/core/utils/constants.dart';

class ArticlesRequestsParams {
  ArticlesRequestsParams({
    this.apiKey = kApiKey,
    this.category = 'general',
    this.country = 'us',
    this.page = 1,
    this.pageSize = 20,
  });

  final String apiKey;
  final String category;
  final String country;
  final int page;
  final int pageSize;
}
