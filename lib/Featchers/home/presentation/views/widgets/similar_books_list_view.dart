import 'package:bookly/Featchers/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/core/utlis/app_router.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'Custom_book_image.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * .16,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: state.books.length,
      itemBuilder: ((context, index) {
        return  Padding(
          padding: EdgeInsets.symmetric(horizontal: 6),
          child: GestureDetector(onTap: () {
        GoRouter.of(context).push(AppRouter.kbookDetailsView, extra: state.books[index]);
      }, child: CustomBookImage(imageUrl: state.books[index].volumeInfo.imageLinks?.thumbnail??"https://cdn-icons-png.flaticon.com/128/3875/3875172.png")),
        );
      }),
    ),
  );
}else if(state is SimilarBooksFailure){
  return CustomErrorWidget(errMessage: state.errMessage);

}
else{
  return CsutomLoadingIndicator();
}
      },
    );
  }
}
