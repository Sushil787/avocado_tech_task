import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:starter/core/constants/app_route.dart';
import 'package:starter/core/utils/snackbar.dart';
import 'package:starter/features/posts/domain/model/posts_model.dart';
import 'package:starter/features/posts/presentation/bloc/posts_bloc.dart';

/// Posts Page
class PostPage extends StatefulWidget {
  // ignore: public_member_api_docs
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  void initState() {
    super.initState();
    context.read<PostsBloc>().add(const PostsEvent.fetchPost());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Posts',
        ),
        actions: [
          GestureDetector(
            onTap: () {
              GoRouter.of(context).push(AppRoute.videoPost);
            },
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              child: const Icon(
                Icons.holiday_village,
                color: Colors.white,
                size: 26,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: BlocConsumer<PostsBloc, PostsState>(
          builder: (context, state) {
            return state.maybeMap(
              initial: (_) => const Text('Initial State'),
              loading: (_) => CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
              loaded: (_) => buildPosts(_.posts),
              error: (message) => Text(message.toString()),
              orElse: () => const SizedBox.shrink(),
            );
          },
          listener: (context, state) {
            debugPrint(state.toString());
            state.mapOrNull(
              error: (_) => showSnackBar(context, _.message),
            );
          },
        ),
      ),
    );
  }

 /// Post Widget

  Widget buildPosts(List<Posts> posts) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 8,
      ),
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return Divider(
            color: Theme.of(context).primaryColor,
          );
        },
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return ListTile(
            subtitleTextStyle: const TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              child: Text(
                posts[index].id.toString(),
              ),
            ),
            title: Text(posts[index].title),
            isThreeLine: true,
            subtitle: Text(posts[index].body),
          );
        },
      ),
    );
  }
}
