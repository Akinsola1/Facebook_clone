import 'package:facebook_clone/config/pallet.dart';
import 'package:facebook_clone/models/models.dart';
import 'package:facebook_clone/widgets/widget.dart';
import 'package:flutter/material.dart';

class room extends StatelessWidget {
  final List<User> onlineUsers;
  const room({Key? key, required this.onlineUsers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 60,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8,),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + onlineUsers.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: _createRoomButton(),
            );
          }
          final User user = onlineUsers[index - 1];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: profile_avater(
              imageUrl: user.imageUrl,
              isActive: true,
            ),
          );
        },
      ),
    );
  }
}

class _createRoomButton extends StatelessWidget {
  const _createRoomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        primary: Colors.white,
        textStyle: TextStyle(color: Palette.facebookBlue),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.blueAccent.shade100, width: 3),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (rect) =>
                Palette.createRoomGradient.createShader(rect),
            child: Icon(Icons.video_call, size: 35, color: Colors.white),
          ),
          const SizedBox(height: 4),
          Text(
            'Create\n Room',
            style: TextStyle(color: Colors.black),
          )
        ],
      ),
    );
  }
}
