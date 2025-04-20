import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tawassuth/screens/scholars/data/scholars_model.dart';
import 'package:tawassuth/utils/ui_helper.dart';

@RoutePage()
class ScholarsDetailScreen extends StatefulWidget {
  const ScholarsDetailScreen({super.key, required this.scholarsData});

  final ScholarsModel scholarsData;

  @override
  State<ScholarsDetailScreen> createState() => _ScholarsDetailScreenState();
}

class _ScholarsDetailScreenState extends State<ScholarsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.scholarsData.sources.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.scholarsData.topic,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                height: screenHeight(context) * 0.1,
                child: Text(widget.scholarsData.desc),
              ),
            ),
            TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.blue,
              tabs: [
                Tab(text: widget.scholarsData.sources[0].source),
                Tab(text: widget.scholarsData.sources[1].source),
                Tab(text: widget.scholarsData.sources[2].source),
              ],
            ),
            Expanded(
              child: TabBarView(
                children:
                    widget.scholarsData.sources
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            child: Text(e.desc),
                          ),
                        )
                        .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
