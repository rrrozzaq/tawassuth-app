import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tawassuth/core/components/search_field.dart';
import 'package:tawassuth/core/router/app_router.gr.dart';
import 'package:tawassuth/screens/scholars/data/scholars_model.dart';

@RoutePage()
class ScholarsScreen extends StatefulWidget {
  const ScholarsScreen({super.key});

  @override
  State<ScholarsScreen> createState() => _ScholarsScreenState();
}

class _ScholarsScreenState extends State<ScholarsScreen> {
  late List<ScholarsModel> scholarsList;
  final searchCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    scholarsList = [
      ScholarsModel(
        topic: 'Apakah Menonton Anime Baik',
        desc: "Membahas Mengenai anime dari segala prespektif dan kategori",
        sources: [
          SourceModel(
            source: 'Ega Okta',
            desc:
                'Menonton Anime hukumnya wajib gais, apapun yang terjadi, dimanapun dan kapanpun kita harus nonton anime dan baca manga',
          ),
          SourceModel(
            source: 'Didi Suhardi',
            desc:
                'Jikalau Kalian ingin Menonton, tontonlah secukupnya. jika ada link yang menarik tolong saling berbagi',
          ),
          SourceModel(
            source: 'Rifky Hernanda',
            desc:
                'Hidup sebagai introvert, Nonton anime pagi sampai malam, jangan lupa BELI MERCH SUISEI',
          ),
        ],
      ),
      ScholarsModel(
        topic: 'Membaca Manga H**tai di malam minggu',
        desc:
            "Pembahasan apakah baik untuk membaca Manga H**tai di malam minggu",
        sources: [
          SourceModel(
            source: 'Ega Okta',
            desc:
                'Menonton Anime hukumnya wajib gais, apapun yang terjadi, dimanapun dan kapanpun kita harus nonton anime dan baca manga',
          ),
          SourceModel(
            source: 'Didi Suhardi',
            desc:
                'Jikalau Kalian ingin Menonton, tontonlah secukupnya. jika ada link yang menarik tolong saling berbagi',
          ),
          SourceModel(
            source: 'Rifky Hernanda',
            desc:
                'Hidup sebagai introvert, Nonton anime pagi sampai malam, jangan lupa BELI MERCH SUISEI',
          ),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scholars'), centerTitle: true),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          TSearchtextField(
            controller: searchCtrl,
            label: 'Search Scholars',
            hintText: 'Topic',
            onSubmit: () {},
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: scholarsList.length,
                itemBuilder: (ctx, i) {
                  return Card(
                    child: ListTile(
                      onTap: () {
                        context.router.push(
                          ScholarsDetailRoute(scholarsData: scholarsList[i]),
                        );
                      },
                      leading: const Icon(Icons.book),
                      title: Text(
                        scholarsList[i].topic,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        scholarsList[i].desc,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall!.copyWith(color: Colors.grey),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 15),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
