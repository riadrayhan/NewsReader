import 'package:flutter/material.dart';

import '../components/news_item_list.dart';
import '../models/news_model.dart';
import '../services/api_services.dart';
import 'package:flutter/widgets.dart';

class BreakingNews extends StatefulWidget {
  const BreakingNews({Key? key}) : super(key: key);

  @override
  State<BreakingNews> createState() => _BreakingNewsState();
}

class _BreakingNewsState extends State<BreakingNews> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        // Refresh the news list
      },
      child: FutureBuilder(
        future: ApiServices().getBreakingNews(),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            List<NewsModel> breakingNewsList = snapshot.data ?? [];

            return Column(
              children: [
                TextField(
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Search news',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: breakingNewsList.length,
                    itemBuilder: (context, index) {
                      // Filter the news list based on the search query
                      if (searchQuery.isNotEmpty &&
                          !breakingNewsList[index].title
                          !.toLowerCase()
                              .contains(searchQuery.toLowerCase())) {
                        return Container();
                      }

                      return NewsItemList(newsModel: breakingNewsList[index]);
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}