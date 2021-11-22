import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_clone/config/pallet.dart';
import 'package:facebook_clone/models/post_model.dart';
import 'package:facebook_clone/widgets/profile_avater.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class postContainer extends StatelessWidget {
  final Post post;
  const postContainer({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(vertical: 8),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _postHeader(post: post),
                const SizedBox(
                  height: 4,
                ),
                Text(post.caption),
                post.imageUrl != null
                    ? SizedBox.shrink()
                    : SizedBox(
                        height: 6,
                      )
              ],
            ),
          ),
          post.imageUrl != null
              ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 8,),
                child: CachedNetworkImage(imageUrl: post.imageUrl),
              )
              : const SizedBox.shrink(),
            Padding(padding: EdgeInsets.symmetric(horizontal: 12),
            child: _postStat(post: post),
            )
        ],
      ),
    );
  }
}

class _postHeader extends StatelessWidget {
  final Post post;
  const _postHeader({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        profile_avater(imageUrl: post.user.imageUrl),
        SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Text('${post.timeAgo} • ',
                      style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12,
                  )
                ],
              )
            ],
          ),
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))
      ],
    );
  }
}


class _postStat extends StatelessWidget {
  final Post post;
  const _postStat({ Key? key,required this.post }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children : [
              Container(
                padding: const EdgeInsets.all(4 ),
                decoration:const  BoxDecoration(
                  color: Palette.facebookBlue,
                  shape: BoxShape.circle,
                ),
                child:const  Icon(
                  Icons.thumb_up,
                  size: 10,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 4,),
              Expanded(
                child: Text(
                  '${post.likes}',
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              ),
              SizedBox(width: 4,),
              Text(
                '${post.comments} Comments',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(width: 8,),
              Text(
                '${post.shares} Shares',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              )
            ]
          ),
          const Divider(),
        Row(
          children: [
            _PostButton(
              icon: Icon(
                MdiIcons.thumbDownOutline,
                color: Colors.grey,
                size: 20,
              ),
              label: 'likes',
              onTap: () {},
            ),
            _PostButton(
              icon: Icon(
                MdiIcons.commentOutline,
                color: Colors.grey,
                size: 20,
              ),
              label: 'Comment',
              onTap: () {},
            ),
            _PostButton(
              icon: Icon(
                MdiIcons.shareOutline,
                color: Colors.grey,
                size: 25,
              ),
              label: 'share',
              onTap: () {},
            ),
          ],
        )
        ],
        
      ),
    );
  }
}

class _PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final Function onTap; 
  const _PostButton({ Key? key,required this.icon,required this.label,required this.onTap }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: () {},
          child: Container(
            height: 25,
            child : Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: 25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                icon,
                const SizedBox( width: 4,),
                Text(label)
              ],),
            )
          )
        ),
      ),
    );
  }
}