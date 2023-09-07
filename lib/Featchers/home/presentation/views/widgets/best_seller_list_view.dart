import 'package:bookly/Featchers/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/Featchers/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return ListView.builder(
              itemCount: 10,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: BookListViewItme(bookModel: state.books[index]),
                );
              });
        } else if (state is NewestBooksFailure) {
        
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CsutomLoadingIndicator();
        }
      },
    );
  }
}
