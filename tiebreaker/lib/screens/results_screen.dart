import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import '../services/decision_service.dart';


class ResultsScreen extends StatelessWidget {

  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final result = Provider.of<DecisionService>(context).currentResult;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Analysis Result'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Pros/Cons'),
              Tab(text: 'Comparison'),
              Tab(text: 'SWOT'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            MarkdownBody(data: result!.prosAndCons),
            MarkdownBody(data: result.comparisonTable),
            MarkdownBody(data: result.swotAnalysis),
          ],
        ),
      ),
    );
  }
}