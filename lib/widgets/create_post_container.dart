import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_clone/models/user_model.dart';
import 'package:facebook_clone/widgets/widget.dart';
import 'package:flutter/material.dart';

class createPostContainer extends StatelessWidget {
  final User currentUser;
  createPostContainer({Key? key, required this.currentUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding:const  EdgeInsets.fromLTRB(17, 8, 12, 0),
      child: Column(
        children: [
          Row(
            children: [
              profile_avater(imageUrl: currentUser.imageUrl),
              const SizedBox(
                width: 10,
              ),
              const Expanded(
                  child: TextField(
                decoration: InputDecoration.collapsed(
                    hintText: 'What\'s on your mind?'),
              ))
            ],
          ),
          const Divider(
            thickness: 0.5,
            height: 10,
          ),
          Container(
            height: 40,
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.videocam,
                    color: Colors.red,
                  ),
                  label: const Text(
                    'Live',
                    style: TextStyle(color: Colors.black),
                  )),
            const   VerticalDivider(
                width: 8,
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.photo_library,
                  color: Colors.green,
                ),
                label:const  Text(
                  'Photo',
                  style: TextStyle(color: Colors.black),
                ),
              ),
             const  VerticalDivider(
                width: 8,
              ),
              TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.video_call,
                    color: Colors.purpleAccent,
                  ),
                  label:
                      const Text('Room', style: TextStyle(color: Colors.black))),
              const VerticalDivider(
                width: 8,
              ),
            ]),
          )
        ],
      ),
    );
  }
}
