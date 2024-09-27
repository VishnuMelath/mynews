import 'package:flutter/material.dart';
import 'package:mynews/models/news_model.dart';
import 'package:mynews/views/widgets/datewidget.dart';

import '../../utils/fontstyles.dart';

class Newstile extends StatelessWidget {
  final NewsDataModel newsmodel;
  const Newstile({
    super.key,
    required this.newsmodel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 130,
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        newsmodel.source,
                        maxLines: 1,
                        style: blackBoldTextStyle,
                      ),
                      Text(
                        newsmodel.content,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: blackPlainTextStyle,
                      ),
                      dateWidget(newsmodel.publishedAt)
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      newsmodel.image,
                      width: 110,
                      height: 110,
                      fit: BoxFit.cover,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
