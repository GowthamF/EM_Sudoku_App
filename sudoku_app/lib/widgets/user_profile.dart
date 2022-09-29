import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sudoku_bloc/sudoku_bloc.dart';

class UserProfile extends StatefulWidget {
  final LeaderBoardModel leaderBoardModel;
  final Function(String? userId)? openProfile;
  const UserProfile(
      {required this.leaderBoardModel, Key? key, this.openProfile})
      : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white70,
        backgroundImage: CachedNetworkImageProvider(
          'https://robohash.org/${widget.leaderBoardModel.userName}',
        ),
      ),
      title: Text(widget.leaderBoardModel.userName),
      trailing: Text(widget.leaderBoardModel.duration
          .toString()
          .split('.')[0]
          .padLeft(8, '0')),
      subtitle: Text(
          '${widget.leaderBoardModel.country} | ${widget.leaderBoardModel.playedDateTime}'),
      onTap: () {
        if (widget.openProfile != null) {
          widget.openProfile!(widget.leaderBoardModel.userId);
        }
      },
    );
  }
}
