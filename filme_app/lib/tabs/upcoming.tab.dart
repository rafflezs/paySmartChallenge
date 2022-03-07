import 'package:filme_app/models/movie.model.dart';
import 'package:filme_app/services/query.service.dart';
import 'package:flutter/material.dart';

class UpcomingTab extends StatelessWidget {
  const UpcomingTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: QueryService().getUpcoming(),
      builder: ((context, snapshot) {
        return Text(snapshot.data.toString());
      }),
    );
  }
}
