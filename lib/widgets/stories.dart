import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_clone/config/pallet.dart';
import 'package:facebook_clone/data/data.dart';
import 'package:facebook_clone/models/story_model.dart';
import 'package:facebook_clone/models/user_model.dart';
import 'package:facebook_clone/widgets/widget.dart';
import 'package:flutter/material.dart';

class Public_story extends StatelessWidget {
  final User currentUser;
  final List<Story> Stories;
  const Public_story(
      {Key? key, required this.currentUser, required this.Stories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        color: Colors.white,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            itemCount: 1 + Stories.length,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: _StoryCard(
                    isAddstory: true,
                    currentUser: currentUser,
                  ),
                );
              }
              final Story story = Stories[index - 1];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: _StoryCard(
                  story: story,
                ),
              );
            }));
  }
}

class _StoryCard extends StatelessWidget {
  const _StoryCard(
      {Key? key, this.isAddstory = false, this.currentUser, this.story})
      : super(key: key);
  final bool isAddstory;
  final User? currentUser;
  final Story? story;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: isAddstory ? currentUser!.imageUrl : story!.imageUrl,
              height: double.infinity,
              width: 110,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: double.infinity,
            width: 110,
            decoration: BoxDecoration(
              gradient: Palette.storyGradient,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          Positioned(
              top: 8,
              left: 8,
              child: isAddstory
                  ? Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        color: Palette.facebookBlue,
                        icon: const Icon(Icons.add),
                        iconSize: 30,
                      ))
                  : profile_avater(
                      imageUrl: story!.user.imageUrl, hasBorder: true)),
          Positioned(
              bottom: 8,
              left: 8,
              right: 8,
              child: Text(
                isAddstory ? 'Add To Story' : story!.user.name,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              ),
              )
        ],
      ),
    );
  }
}
