
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/news_model.dart';

class NewsDetails extends StatelessWidget {
  final NewsModel newsModel;
  const NewsDetails({Key? key, required this.newsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          newsModel.title.toString(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
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
            ),
            SizedBox(height: 8),
            Text(
              newsModel.description.toString(),
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(height: 8),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  final uri = Uri.parse(newsModel.url.toString());
                  if (!await launchUrl(uri)) {
                    throw Exception("Could not launch");
                  }
                },
                child: Text("Read more...."),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
