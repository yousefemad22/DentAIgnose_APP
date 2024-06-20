// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:html/parser.dart' as html;
import 'package:url_launcher/url_launcher.dart';

//import 'package:webview_flutter/webview_flutter.dart';
//import 'package:webview_flutter/webview_flutter.dart';

class Learn extends StatefulWidget {
  int? whichLearn;
  Learn({super.key, this.whichLearn});

  @override
  State<Learn> createState() => _LearnState();
}

class _LearnState extends State<Learn> {
  bool _showArticles = true, _showVideo = false, _showPodcast = false;

  @override
  void initState() {
    super.setState(() {
      if (widget.whichLearn == 2) {
        _showArticles = false;
        _showVideo = true;
        _showPodcast = false;
      } else if (widget.whichLearn == 3) {
        _showArticles = false;
        _showVideo = false;
        _showPodcast = true;
      } else {
        _showArticles = true;
        _showVideo = false;
        _showPodcast = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0,
        elevation: 0,
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            CupertinoIcons.arrow_left,
            color: Colors.black,
            size: screenSize.width * 0.08,
          ),
        ),
        title: Text(
          'Learn',
          style: TextStyle(
            fontSize: screenSize.width * 0.065,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: screenSize.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: _showArticles
                          ? Color(0xff26a6fe)
                          : Colors.transparent),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenSize.width * .015),
                    child: Center(
                      child: Align(
                        child: SizedBox(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                // Note the correct use of setState with a function
                                _showArticles = true;
                                _showVideo = false;
                                _showPodcast = false;
                                print("_showArticles: $_showArticles");
                                print("_showVideo: $_showVideo");
                                print("_showPodcast: $_showPodcast");
                              });
                            },
                            child: Text(
                              'Articles',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: screenSize.width * 0.065,

                                  // height: 1.2125,
                                  color: _showArticles
                                      ? Colors.white
                                      : Color(0xff26a6fe)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color:
                          _showVideo ? Color(0xff26a6fe) : Colors.transparent),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenSize.width * .015),
                    child: Center(
                      child: Align(
                        child: SizedBox(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _showArticles = false;
                                _showVideo = true;
                                _showPodcast = false;
                                print("_showArticles: $_showArticles");
                                print("_showVideo: $_showVideo");
                                print("_showPodcast: $_showPodcast");
                              });
                            },
                            child: Text(
                              'Videos',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: screenSize.width * 0.065,
                                  // height: 1.2125,
                                  color: _showVideo
                                      ? Colors.white
                                      : Color(0xff26a6fe)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: _showPodcast
                          ? Color(0xff26a6fe)
                          : Colors.transparent),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _showArticles = false;
                        _showVideo = false;
                        _showPodcast = true;
                        print("_showArticles: $_showArticles");
                        print("_showVideo: $_showVideo");
                        print("_showPodcast: $_showPodcast");
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenSize.width * .015),
                      child: Center(
                        child: Align(
                          child: SizedBox(
                            child: Text(
                              'Podcast',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: screenSize.width * 0.065,
                                  // height: 1.2125,
                                  color: _showPodcast
                                      ? Colors.white
                                      : Color(0xff26a6fe)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenSize.height * 0.015,
            ),
            Center(
              child: Column(
                children: [
                  Visibility(
                    visible: _showArticles,
                    // child: Text("javssba fhsafasfoa jo;"),
                    child: ArticleListPage(),
                  ),
                  Visibility(
                    visible: _showVideo,
                    child: const Text("Working on API Videos"),
                    // child: VideoListPage(),
                  ),
                  Visibility(
                    visible: _showPodcast,
                    // child: Text("javssba fhsafasfoa jo;"),
                    child: podcastListPage(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ArticleListPage extends StatefulWidget {
  @override
  _ArticleListPageState createState() => _ArticleListPageState();
}

class _ArticleListPageState extends State<ArticleListPage> {
  List<Map<String, String>>? articles;

  @override
  void initState() {
    super.initState();
    fetchArticles();
  }

  Future<List<Map<String, String>>> fetchArticles() async {
    var url = Uri.parse(
        'https://www.ebi.ac.uk/europepmc/webservices/rest/search?query=dental&format=json');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      articles = List<Map<String, String>>.from(
        jsonResponse['resultList']['result'].map(
          (article) => {
            'title': article['title'] as String,
            // 'pubYear': article['pubYear'] as String,
            'authorString': article['authorString'] as String,
          },
        ),
      );
      print(articles);
      return articles!;
    } else {
      throw Exception('Failed to load articles');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, String>>>(
      future: fetchArticles(), // Using the updated fetch function
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: CircularProgressIndicator(
            color: Color(0xff26a6fe),
          ));
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          var articles = snapshot.data!;
          return Container(
            height: MediaQuery.of(context).size.height * 0.75,
            child: ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                var article = articles[index];
                return Card(
                  color: Color(0xff26a6fe),
                  child: ListTile(
                    textColor: Colors.white,
                    title: Text(article['title'] ?? 'No title available'),
                    subtitle: Text(
                      'Published: ${article['pubYear']}',
                      style:
                          TextStyle(color: Color.fromARGB(255, 234, 234, 234)),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ArticleDetailPage(article: article),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          );
        } else {
          return Center(child: Text('No articles found'));
        }
      },
    );
  }
}

class ArticleDetailPage extends StatelessWidget {
  final dynamic article;

  ArticleDetailPage({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article['title']),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(article['title'],
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Text('Published: ${article['pubYear']}'),
            SizedBox(height: 10),
            Text('Author(s): ${article['authorString']}'),
            SizedBox(height: 10),
            InkWell(
              onTap: () async {
                var url = "https://europepmc.org/article/AGR/${article['id']}";
                if (await canLaunch(url!)) {
                  await launch(url!);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Could not launch $url')));
                }
              },
              child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color(0xff26a6fe)),
                  child: Text(
                    'Read Full Article',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class WebViewContainer extends StatelessWidget {
  final String url;

  WebViewContainer(this.url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Full Article'),
        ),
        body: Text(url)
        //initialUrl: url,
        //javascriptMode: JavascriptMode.unrestricted,
        // ),
        );
  }
}

class podcastListPage extends StatefulWidget {
  @override
  _podcastListPageState createState() => _podcastListPageState();
}

class _podcastListPageState extends State<podcastListPage> {
  List<dynamic> videos = [];
  dynamic podcasts;

  @override
  void initState() {
    super.initState();
    fetchPodcasts();
  }

  Future<List<Map<String, String>>> fetchPodcasts() async {
    var url =
        Uri.parse('https://www.dentaltown.com/blogs/list/podcasts/recent');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var document = html.parse(response.body);
      var podcastElements =
          document.querySelectorAll('#LeftCont .row .col-sm-6');

      if (podcastElements.isNotEmpty) {
        return podcastElements.map((podcast) {
          return {
            'title': podcast.querySelector('a .title')?.text.trim() ??
                'No title available',
            'publisher':
                podcast.querySelector('a .subTitleHeight')?.text.trim() ??
                    'No title available',

            'link': podcast.querySelector('a')?.attributes['href'] ?? '#',
            'pubYear': podcast.querySelector('a .icoCalendar')?.text.trim() ??
                'No title available', // Assuming you have some way to get the year or other details
          };
        }).toList();
      } else {
        print("No podcasts found on the page.");
        return [];
      }
    } else {
      print("Failed to load podcasts. Status code: ${response.statusCode}");
      throw Exception('Failed to load podcasts');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, String>>>(
      future: fetchPodcasts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: CircularProgressIndicator(color: Color(0xff26a6fe)));
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          var podcasts = snapshot.data!;
          return Container(
            height: MediaQuery.of(context).size.height * 0.75,
            child: ListView.builder(
              itemCount: podcasts.length,
              itemBuilder: (context, index) {
                var podcast = podcasts[index];
                return InkWell(
                  onTap: () async {
                    var url = podcast['link'];
                    if (await canLaunch(url!)) {
                      await launch(url!);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Could not launch $url')));
                    }
                  },
                  child: Card(
                    color: const Color(0xff26a6fe),
                    child: ListTile(
                      title: Text(
                        "${podcast['title']!}\n${podcast['publisher']!}",
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        '${podcast['pubYear']}',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 216, 216, 216)),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return Center(child: Text('No podcasts found'));
        }
      },
    );
  }
}
