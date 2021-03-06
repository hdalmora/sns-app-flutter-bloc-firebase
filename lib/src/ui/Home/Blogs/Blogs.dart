import 'package:flutter/material.dart';
import 'package:buddies_osaka/src/ui/widgets/blogs_sliding_cards_horizontal.dart';
import 'package:buddies_osaka/src/ui/Home/Blogs/AllBlogsPage.dart';

class Blogs extends StatefulWidget {
  static const String routeName = 'root_screen';

  final bool createdProfile;

  const Blogs({Key key, this.createdProfile}): super(key: key);

  @override
  _BlogsState createState() => _BlogsState(this.createdProfile);
}

class _BlogsState extends State<Blogs> {
  bool createdProfile;

  _BlogsState(bool createdProfile) {
    this.createdProfile = createdProfile;
  }

  @override
  void didUpdateWidget(Blogs oldWidget) {
    // TODO: implement didUpdateWidget

    if(this.createdProfile != widget.createdProfile) {
      setState(() {
        this.createdProfile = widget.createdProfile;
      });
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: ListView(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 5),

                    BlogsSlidingCardsView(createdProfile: this.createdProfile,),
                    Container(
                      margin: EdgeInsets.only(right: 15.0,),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (BuildContext context) => AllBlogsPage()));
                            },
                            child: Text(
                              "View All >",
                              style: TextStyle(
                                fontSize: 16,

                                color: Colors.black45, //: Colors.grey,

                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
