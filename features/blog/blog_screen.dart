import 'package:boris_ilic_portfolio/constants/constants.dart';
import 'package:boris_ilic_portfolio/core/base/base_async_state.dart';
import 'package:boris_ilic_portfolio/features/blog/components/blog_grid_content.dart';
import 'package:boris_ilic_portfolio/features/blog/cubit/blog_cubit.dart';
import 'package:boris_ilic_portfolio/features/navigation/bloc/navigation_bloc.dart';
import 'package:boris_ilic_portfolio/global_components/buttons/section_button.dart';
import 'package:boris_ilic_portfolio/global_components/footer/footer.dart';
import 'package:boris_ilic_portfolio/global_components/green_line.dart';
import 'package:boris_ilic_portfolio/global_components/text/double_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// The main screen widget for displaying blog posts in a grid layout.
///
/// This widget can display either all posts or a limited number of posts
/// based on the [numberOfPosts] parameter.
class BlogScreen extends StatelessWidget {
  /// Optional parameter to limit the number of posts displayed
  final int? numberOfPosts;

  const BlogScreen({super.key, this.numberOfPosts});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlogCubit()..getAllBlogPost(),
      child: BlocBuilder<BlogCubit, AsyncValue<BlogState>>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.hasError) {
            return Center(child: Text('Error: ${state.errorMessage}'));
          }

          return _BlogScreenContent(numberOfPosts: numberOfPosts);
        },
      ),
    );
  }
}

/// The content widget for the blog screen, separated for better organization
class _BlogScreenContent extends StatelessWidget {
  final int? numberOfPosts;

  const _BlogScreenContent({this.numberOfPosts});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isDesktop = constraints.maxWidth > 800;
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? Sizes.size60 : Sizes.size20,
            ),
            child: Column(
              children: [
                _buildHeader(context),
                _buildBlogGrid(context),
                if (numberOfPosts == null) ...[
                  const HorizontalGreenLine(),
                  const Footer(),
                ],
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          child: DoubleTitle(
            subtitle: "Blogs",
            titleBlack: "From My\n",
            titlePurple: "Blog Post",
          ),
        ),
        if (numberOfPosts != null)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: Sizes.size24),
            child: SectionButton(
              label: "View All Blogs",
              onTap: () =>
                  context.read<NavigationBloc>().changeTabIndex(4, context),
            ),
          ),
      ],
    );
  }

  Widget _buildBlogGrid(BuildContext context) {
    return BlocBuilder<BlogCubit, AsyncValue<BlogState>>(
      builder: (context, state) {
        return BlogFeedGrid(
          blogFeedList: state.data!.items,
          numberOfPosts: numberOfPosts,
        );
      },
    );
  }
}
