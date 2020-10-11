import 'package:flutter/material.dart';
import 'package:flutter_news_app/viewmodels/article_details_view_model.dart';

class ArticleDetails extends StatefulWidget {
  final String title;
  final String author;
  final String description;
  final String urlToImage;
  final String url;
  final String publishedAt;
  final String content;

  ArticleDetails(this.title, this.author, this.description, this.urlToImage,
      this.url, this.publishedAt, this.content);

  @override
  _ArticleDetailsState createState() => _ArticleDetailsState();
}

class _ArticleDetailsState extends State<ArticleDetails> {
  String title;
  String author;
  String description;
  String urlToImage;
  String url;
  String publishedAt;
  String content;
  ArticleDetailsViewModel detailsViewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     detailsViewModel = new ArticleDetailsViewModel();

  }

  @override
  Widget build(BuildContext context) {
    ArticleDetails argument = ModalRoute.of(context).settings.arguments;
    title = argument.title;
    author = argument.author;
    description = argument.description;
    urlToImage = argument.urlToImage;
    url = argument.url;
    publishedAt = argument.publishedAt;
    content = argument.content;

    return Scaffold(
      appBar: AppBar(title: Text("Article-details"),centerTitle: true,),
      body: Container(
        margin: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          Container(
          height: 250,
          child: Image.network("$urlToImage",fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
          loadingBuilder:(BuildContext context, Widget child,ImageChunkEvent loadingProgress) {
        if (loadingProgress == null)
          return child;
        return Image.asset('assets/images/image.jpg',fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,);
    },
    ),
    ),
            SizedBox(
              height: 10,
            ),
              Wrap(
                children: <Widget>[
                  Text("title: ",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontWeight: FontWeight.w300)),
                  Container(
                    alignment: Alignment.center,
                    child: Text("$title",
                        style: TextStyle(fontWeight: FontWeight.w700,fontSize: 22)),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Wrap(
                children: <Widget>[
                  Text("description: ",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontWeight: FontWeight.w300)),
                  Container(
                    alignment: Alignment.center,
                    child: Text("$description",
                        style: TextStyle(fontWeight: FontWeight.w400)),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Wrap(
                children: <Widget>[
                  Text("content: ",
                      textAlign: TextAlign.start,

                      style: TextStyle(fontWeight: FontWeight.w300)),
                  Container(
                    child: Text("$content",
                        style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16)),
                  ),
                ],
              ),
              SizedBox(
                height: 60,
              ),
              Wrap(
                children: <Widget>[
                  Text("written by: ",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontWeight: FontWeight.w300)),
                  Container(
                    child: Text("$author",
                        style: TextStyle(fontWeight: FontWeight.w900,fontSize: 14)),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text("publishedAt: ",
                      style: TextStyle(fontWeight: FontWeight.w300)),
                  Container(
                    alignment: Alignment.topRight,
                    child: Text("$publishedAt",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(fontWeight: FontWeight.w700,fontSize: 14)),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Wrap(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: Text("The Source: ",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.w300)),
                  ),
                  GestureDetector(
                    onTap: (){
                      detailsViewModel.launchURL('$url');
                    },
                    child: Text("$url",
                        style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16)),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
