import 'package:flutter/material.dart';
import 'package:flutter_news_app/models/newsModel.dart';
import 'package:flutter_news_app/viewmodels/news_view_model.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  bool isLoading = false;
  List<NewsArticleModel> newsArticle;
  List<NewsArticleModel> newsArticleImage;
  NewsViewModel newsViewModel;
  @override
  void initState() {
    // TODO: implement initState
    newsArticle = new List<NewsArticleModel>();
    newsViewModel = new NewsViewModel();
    newsArticleImage = new List<NewsArticleModel>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.fromLTRB(15, 30, 15, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(15, 20, 15, 5),
              child: Text("Top headlines in the US", style: TextStyle(
                  color: Colors.amber,
                  fontWeight: FontWeight.w900,
                  fontSize: 22
              ),),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 75, 0),

              child: Divider(
                  thickness: 2.0,
                  height: 0,
                  color: Colors.black
              ),
            ),
            Expanded(
              child: Center(
                child: FutureBuilder<List<NewsArticleModel>>(
                    future: newsViewModel.fetchTopHeadlines(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        print(snapshot.data.length);
                        newsArticle = snapshot.data;
                        return ListView.builder(
                            itemCount: newsArticle.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  newsViewModel.goToDetails(
                                      context,
                                      newsArticle[index].title,
                                      newsArticle[index].author,
                                      newsArticle[index].description,
                                      newsArticle[index].urlToImage,
                                      newsArticle[index].url,
                                      newsArticle[index].publishedAt,
                                      newsArticle[index].content);
                                },
                                child: Container(
                                  margin:
                                  EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                      side: BorderSide(
                                          width: 0.9,
                                          color: Theme
                                              .of(context)
                                              .primaryColor),
                                    ),
                                    elevation: 10,
                                    child: Container(
                                      padding: EdgeInsets.all(0.0),
                                      child: Stack(
                                        alignment: Alignment.bottomCenter,
                                        children: <Widget>[
                                          Container(
                                            height: 250,
                                            child: Image.network(
                                              "${newsArticle[index]
                                                  .urlToImage}",
                                              fit: BoxFit.cover,
                                              width: double.infinity,
                                              height: double.infinity,
                                              loadingBuilder: (
                                                  BuildContext context,
                                                  Widget child,
                                                  ImageChunkEvent loadingProgress) {
                                                if (loadingProgress == null)
                                                  return child;
                                                return Image.asset(
                                                  'assets/images/image.jpg',
                                                  fit: BoxFit.cover,
                                                  width: double.infinity,
                                                  height: double.infinity,);
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(8.0),
                                            color: Color.fromRGBO(
                                                246, 246, 246, 0.7),
                                            child: Column(
                                              children: <Widget>[
                                                Text("Title:",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontWeight:
                                                        FontWeight.w300)),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                    "${newsArticle[index]
                                                        .title}",
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                        fontWeight:
                                                        FontWeight.bold)),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            });
                      }
                      return CircularProgressIndicator();
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
