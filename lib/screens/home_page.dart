import 'package:facebook_clone/config/pallet.dart';
import 'package:facebook_clone/data/data.dart';
import 'package:facebook_clone/models/post_model.dart';
import 'package:facebook_clone/models/story_model.dart';
import 'package:facebook_clone/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Home_page extends StatelessWidget {
  const Home_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            backgroundColor: Colors.white,
            title: const Text(
              'facebook',
              style: TextStyle(
                color: Palette.facebookBlue,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              ),
            ),
            centerTitle: false,
            floating: true,
            actions: [
              appbar_icon(iconName: Icons.search, onpressed: () {}),
              appbar_icon(
                  iconName: MdiIcons.facebookMessenger, onpressed: () {})
            ],
          ),
          SliverToBoxAdapter(
            child: createPostContainer(currentUser: currentUser),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(0.0, 10, 0, 10),
            sliver: SliverToBoxAdapter(
                child: room(
              onlineUsers: onlineUsers,
            )),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(0.0, 5, 0, 10),
            sliver: SliverToBoxAdapter(
                child:Public_story(currentUser: currentUser, Stories: stories)
                ),
          ),
          SliverList(delegate: SliverChildBuilderDelegate(
            (context, index) {
              final Post post = posts[index];
              return postContainer(post: post);
            },
            childCount: posts.length
          ))
        ],
      ),
    );
  }
}
