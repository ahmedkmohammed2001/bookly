import 'package:bookly/Featchers/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:bookly/core/utlis/styles.dart';
import 'package:flutter/material.dart';
import 'custom_search_textfield.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            CustomSearchTextField(),
            SizedBox(
              height: 16,
            ),
            Text(" Search Result", style: Styles.textStyle18),
            SizedBox(
              height: 16,
            ),
            Expanded(child: SearchResultListView())
          ],
        ),
      ),
    );
  }
}
