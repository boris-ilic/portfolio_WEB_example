import 'dart:developer';

import 'package:boris_ilic_portfolio/core/base/base_async_cubit.dart';
import 'package:boris_ilic_portfolio/core/base/base_async_state.dart';
import 'package:boris_ilic_portfolio/features/blog/model/blog_feed_model.dart';
import 'package:boris_ilic_portfolio/repositories/blog_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'blog_state.dart';
part 'blog_cubit.freezed.dart';

class BlogCubit extends BaseAsyncCubit<BlogState> {
  BlogCubit() {
    emit(const AsyncValue.initial(data: BlogState()));
  }

  Future<void> getAllBlogPost() async {
    emit(
      AsyncValue.loading(
        data: state.data!,
      ),
    );
    await runguarded(() async {
      BlogFeedModelList blogFeedModelList =
          await BlogRepository().fetchBlogPosts();

      log("===================");
      log(blogFeedModelList.items.length.toString());
      log("===================");
      return state.data!.copyWith(
        items: blogFeedModelList.items,
      );
    });
  }
}
