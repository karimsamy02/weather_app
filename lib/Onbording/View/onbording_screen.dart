import 'package:flutter/material.dart';
import 'package:weather_app/Home/View/home_page.dart';

class OnboringScreen extends StatefulWidget {
  const OnboringScreen({Key? key}) : super(key: key);

  @override
  State<OnboringScreen> createState() => _OnboringScreenState();
}

class _OnboringScreenState extends State<OnboringScreen>
    with TickerProviderStateMixin {
  final List<dynamic> _furniture = [
    {
      'title': 'Real-time \nWeather Data',
      'sub_title': 'Instant Updates Live Conditions',
      'image': 'https://cdn0.iconfinder.com/data/icons/crayon-illlustrations/1500/man_umbrella_weather_forecast_raining_rain_person_character_people-512.png',
    },
    {
      'title': 'Weather Details',
      'sub_title': 'In-depth OverviewHistorical & Current Data',
      'image': 'https://cdni.iconscout.com/illustration/premium/thumb/woman-facing-heavy-wind-5705950-4759563.png',
    },
    {
      'title': 'Know Weather Anytime, Anywhere',
      'sub_title': 'Global Coverage Custom Alerts',
      'image': 'https://cdni.iconscout.com/illustration/premium/thumb/weather-forecast-9279620-7569089.png?f=webp',
    },
  ];

  late final AnimationController _controller;

  late final Animation<double> _animation;

  int _currentIndex = 0;

  final PageController _pageController = PageController();

  void _nextPage() {

    if (_currentIndex < _furniture.length - 1) {
      _pageController.animateToPage(
        _currentIndex + 1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void initState() {
    _controller =
    AnimationController(duration: const Duration(seconds: 20), vsync: this)
      ..repeat(reverse: true);

    _animation = Tween<double>(begin: 1.0, end: 1.5).animate(
        CurvedAnimation(parent: _controller, curve: Curves.linear));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // PageView
          PageView.builder(
            controller: _pageController,
            itemCount: _furniture.length,
            onPageChanged: (int index) {
              _controller.value = 0.0;
              _currentIndex = index;
              _controller.forward();
              setState(() {});
            },
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  // image ====>>>
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(),
                    child: ScaleTransition(
                      scale: _animation,
                      child: Image.network(
                        _furniture[index]['image'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // text ====>>>
                  Container(
                    padding: const EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        colors: [
                          Colors.black.withOpacity(0.9),
                          Colors.black.withOpacity(0.8),
                          Colors.black.withOpacity(0.2),
                          Colors.black.withOpacity(0.1),
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyFadeAnimation(
                          delay: 3,
                          child: Text(
                            _furniture[index]['title'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 42,
                              height: 1,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        MyFadeAnimation(
                          delay: 5,
                          child: Text(
                            _furniture[index]['sub_title'],
                            style: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),

                        // next button ====>>>
                        MyFadeAnimation(
                          delay: 7,
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                              onPressed: () {
                                if (_currentIndex == _furniture.length - 1) {
                                  // Check if it's the last page
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => Home_page(),
                                    ),
                                  );
                                } else {
                                  _nextPage();
                                }
                              },
                              color: Colors.orange,
                              padding: const EdgeInsetsDirectional.only(
                                end: 5,
                                start: 30,
                                top: 5,
                                bottom: 5,
                              ),
                              child: SizedBox(
                                height: 40,
                                width:
                                MediaQuery.of(context).size.width * 0.4,
                                child: Row(
                                  children: [
                                    Text(
                                      _currentIndex == _furniture.length - 1
                                          ? 'Get Started'
                                          : 'Next',
                                      style: TextStyle(
                                        color: Colors.orange.shade50,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const Spacer(),
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: Colors.orange.shade300,
                                        borderRadius: BorderRadius.circular(
                                          40,
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.arrow_forward,
                                        color: Colors.orange.shade100,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),

          // number of pages and current page 1/3 text
          SafeArea(
            child: Container(
              padding: const EdgeInsets.all(20),
              alignment: AlignmentDirectional.topEnd,
              child: Text(
                '${_currentIndex + 1}/${_furniture.length}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// for animation
class MyFadeAnimation extends StatefulWidget {
  final double delay;
  final Widget child;

  const MyFadeAnimation({
    Key? key,
    required this.delay,
    required this.child,
  }) : super(key: key);

  @override
  State<MyFadeAnimation> createState() => _MyFadeAnimationState();
}

class _MyFadeAnimationState extends State<MyFadeAnimation>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _translateYAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );

    _translateYAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );

    Future.delayed(Duration(milliseconds: (500 * widget.delay).round()), () {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget? child) {
        return Opacity(
          opacity: _opacityAnimation.value,
          child: Transform.translate(
            offset: _translateYAnimation.value,
            child: widget.child,
          ),
        );
      },
    );
  }
}

