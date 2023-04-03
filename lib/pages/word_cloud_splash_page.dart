import 'package:word_cloud/index.dart';

class WordCloudSplashPage extends StatefulWidget {
  const WordCloudSplashPage({super.key});

  @override
  State<WordCloudSplashPage> createState() => _WordCloudSplashPageState();
}

class _WordCloudSplashPageState extends State<WordCloudSplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _animation.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          sleep(const Duration(milliseconds: 150));
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const WordCloudHomePage(),
            ),
            (route) => false,
          );
        }
      },
    );
    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: 160,
                height: 160,
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
              Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    WordCloudConstant.APP_NAME,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Saira',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
