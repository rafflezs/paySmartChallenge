import 'package:filme_app/components/movie_card.component.dart';
import 'package:filme_app/controllers/upcoming.controller.dart';
import 'package:flutter/material.dart';

class UpcomingTab extends StatefulWidget {
  const UpcomingTab({Key? key}) : super(key: key);

  @override
  State<UpcomingTab> createState() => _UpcomingTabState();
}

class _UpcomingTabState extends State<UpcomingTab> {
  UpcomingController controller = UpcomingController();
  @override
  void initState() {
    super.initState();
    _fetch();
  }

  _fetch() async {
    await controller.fetchFirstMovies();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 1,
        crossAxisSpacing: 2,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height * 0.86),
      ),
      padding: EdgeInsets.all(2),
      itemCount: controller.movies!.length,
      itemBuilder: (context, index) {
        return MovieCardComponent(movie: controller.movies![index]);
      },
    );
  }
}
