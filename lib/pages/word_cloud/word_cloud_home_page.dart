import 'package:word_cloud/index.dart';

String _url = 'https://github.com/Cierra-Runis/word_cloud';

class WordCloudHomePage extends StatefulWidget {
  const WordCloudHomePage({super.key});

  @override
  State<WordCloudHomePage> createState() => _WordCloudHomePageState();
}

class _WordCloudHomePageState extends State<WordCloudHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                margin: const EdgeInsets.fromLTRB(0, 32, 16, 32),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: SizedBox(
                  height: 100,
                  width: 300,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () => launchUrlString(
                            _url,
                            mode: LaunchMode.externalApplication,
                          ),
                          icon: Container(
                            width: 90,
                            height: 90,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/icon/app_icon.png'),
                              ),
                              shadows: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 100.0,
                                  spreadRadius: 1.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Text(
                          WordCloudConstant.APP_NAME,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                margin: const EdgeInsets.fromLTRB(0, 0, 16, 16),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: SizedBox(
                  width: 300,
                  height: 450,
                  child: Center(
                    child: MercuriusList(
                      children: [
                        MercuriusListSection(
                          title: const Center(
                            child: Text(
                              'Setting',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          children: [
                            MercuriusListItem(
                              icon: Icon(
                                Icons.width_wide_rounded,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurface
                                    .withOpacity(0.38),
                              ),
                              title: const TextField(
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(hintText: '目标宽度'),
                              ),
                              accessoryView: const Text('像素'),
                            ),
                            MercuriusListItem(
                              icon: Icon(
                                Icons.height_rounded,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurface
                                    .withOpacity(0.38),
                              ),
                              title: const TextField(
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(hintText: '目标高度'),
                              ),
                              accessoryView: const Text('像素'),
                            ),
                            MercuriusListItem(
                              icon: Icon(
                                Icons.color_lens_rounded,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurface
                                    .withOpacity(0.38),
                              ),
                              title: const TextField(
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(hintText: '背景颜色'),
                              ),
                              accessoryView: const Text('　　'),
                            ),
                            MercuriusListItem(
                              icon: Icon(
                                Icons.input_rounded,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurface
                                    .withOpacity(0.38),
                              ),
                              title: null,
                              accessoryView: const Text('解析项'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Card(
            margin: EdgeInsets.fromLTRB(8, 16, 0, 0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: SizedBox(
              width: 800,
              height: 580,
              child: MercuriusList(
                children: [
                  MercuriusListSection(
                    title: Center(
                      child: Text(
                        'Preview',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    children: [
                      SizedBox(
                        height: 480,
                        child: Center(
                          child: Text('在做了在做了'),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
