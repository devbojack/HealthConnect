import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthconnect/widgets/home_appbar.dart';
import 'package:healthconnect/widgets/my_background.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return MyBackground(
      child: Scaffold(
        appBar: homeAppBar(context),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [searchTextField()]),
      ),
    );
  }

  Widget searchTextField() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: TextField(
        autofocus: true,
        decoration: InputDecoration(
          // focusedBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(12),
          //     borderSide: BorderSide(
          //         color: Theme.of(context).dividerColor.withOpacity(0.),
          //         width: 0.6)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
                color: Theme.of(context).dividerColor.withOpacity(0.2),
                width: 0.6),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
                color: Theme.of(context).dividerColor,
                width: 0.6),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
                color: Theme.of(context).dividerColor.withOpacity(0.4),
                width: 0.6),
          ),
          hintStyle: GoogleFonts.roboto(
            fontSize: 12,
            color: Theme.of(context).dividerColor.withOpacity(0.6),
          ),
          hintText: 'Search',
          contentPadding:
              const EdgeInsets.only(top: 5, bottom: 5, right: 10, left: 16),
          suffixIcon: Icon(
            Icons.search,
            size: 22,
            color: Theme.of(context).dividerColor.withOpacity(0.6),
          ),
        ),
      ),
    );
  }
}
