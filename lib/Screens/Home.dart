import 'package:flutter/material.dart';
import 'package:news_demo/appstate/appstate.dart';
import 'package:news_demo/appstate/appstate.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppState(),
      child: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var appstate = Provider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:     Container(
            margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
            child: ElevatedButton(
              child: Text("Get news " , style: TextStyle(color: Colors.black),),
              onPressed: () async {
                await appstate.getnews();
                print(appstate.news);
              },
            ),
          ),
        
      ),
      drawer: Drawer(),
      body: Stack(
        children: [
       
          Container(
            margin: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
            child: (appstate.isfetching)
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: appstate.news.length,
                    itemBuilder: (context, int index) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 2,
                        margin: EdgeInsets.all(2),
                        child: Card(
                          elevation: 4,
                          child: Column(children: [
                            Container(
                              child: Expanded(
                                child: Image.network(
                                  (appstate.news[index]['images'] != null)
                                      ? appstate.news[index]['images']['main']
                                      : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROGVlwDhbC-6RixbdgEwDrABJ6BD3hhM2eJA&usqp=CAU",
                                  errorBuilder: (context, Object exception,
                                      StackTrace? stackTrace) {
                                    return const Text(
                                        'Sorry! Image not found ');
                                  },
                                ),
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Text(
                                  "${appstate.news[index]['sayings'][0]}",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )),
                            Container(
                                margin: EdgeInsets.all(10),
                                child: Stack(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      margin:
                                          EdgeInsets.only(left: 140, top: 0),
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Text(
                                          "more..",
                                          style: TextStyle(color: Colors.blue),
                                        ),
                                      ),
                                    )
                                  ],
                                ))
                          ]),
                        ),
                      );
                    }),
          )
        ],
      ),
    );
  }
}
