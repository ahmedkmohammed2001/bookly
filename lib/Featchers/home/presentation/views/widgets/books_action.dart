import 'package:bookly/Featchers/home/data/models/book_model/book_model.dart';
import 'package:bookly/core/widgets/custom_botton.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: CustomBotton(
          onPressed: () async{
            Uri uri = Uri.parse("https://stackoverflow.com/questions/29250152/what-is-the-intent-to-launch-any-website-link-in-google-chrome");
           
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri);
              }
          },
          text: 'Free',
          textColor: Colors.black,
          backgoundColor: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16), bottomLeft: Radius.circular(16)),
        )),
        const Expanded(
            child: CustomBotton(
          text: 'Preview',
          fontSize: 16,
          textColor: Colors.white,
          backgoundColor: Color(0xffEF8262),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(16), bottomRight: Radius.circular(16)),
        )),
      ],
    );
  }
}
