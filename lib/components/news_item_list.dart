
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/news_model.dart';
import '../screens/news_details.dart';

class NewsItemList extends StatelessWidget {
  final NewsModel newsModel;
  const NewsItemList({Key? key, required this.newsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0).copyWith(top: 3),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetails(newsModel: newsModel),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              height: 200,
              width: double.infinity,
              fit: BoxFit.fitHeight,
              imageUrl: newsModel.urlToImage.toString(),
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    newsModel.source!.name.toString(),
                    style: TextStyle(fontSize: 9, color: Colors.white),
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  newsModel.publishedAt.toString(),
                  style: TextStyle(fontSize: 9),
                ),
              ],
            ),
            SizedBox(height: 3),
            Row(
              children: [
                Text(
                  "Written by: ",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                ),
                newsModel.author == null
                    ? Container()
                    : Text(
                        newsModel.author.toString(),
                        style: TextStyle(fontSize: 10),
                      ),
              ],
            ),
            SizedBox(height: 3),
            Text(
              newsModel.title.toString(),
              style: TextStyle(fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
