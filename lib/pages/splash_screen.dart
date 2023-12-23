import 'package:erikum_music_player/constants/colors.dart';
import 'package:erikum_music_player/constants/text_style.dart';
import 'package:erikum_music_player/pages/album_page.dart';
import 'package:erikum_music_player/pages/home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();
  void _onIntroEnd(context) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => const HomePage()));
  }

  Widget _buildFullScreenImage() {
    return Image.asset(
      'assets/images/intro.png',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/images/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    var pageDecoration = PageDecoration(
        titleTextStyle: myTextStyle(size: 18, weight: FontWeight.w700),
        bodyTextStyle: myTextStyle(size: 16),
        bodyPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        pageColor: darkColor,
        imagePadding: EdgeInsets.zero);
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: darkColor,
      allowImplicitScrolling: false,
      autoScrollDuration: null,
      infiniteAutoScroll: false,
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(top: 16, right: 16),
          child: _buildImage('intro.png', 100),
        )),
      ),
      globalFooter: SizedBox(
        // backgroundColor: darkColor,
        width: double.infinity,
        height: 160,
        child: ElevatedButton(
          child: Text(
            "Skip",
            style: myTextStyle(size: 16, weight: FontWeight.bold),
          ),
          onPressed: () => _onIntroEnd(context),
        ),
      ),
      pages: [
        PageViewModel(
            title: 'title 1',
            body:
                "Unleash the power of sound, as we redefine the way you experience music.",
            image: _buildImage('intro.png'),
            decoration: pageDecoration),
        PageViewModel(
            title: 'title 1',
            body:
                "Unleash the power of sound, as we redefine the way you experience music.",
            image: _buildImage('intro.png'),
            decoration: pageDecoration),
        PageViewModel(
            title: 'title 1',
            body:
                "Unleash the power of sound, as we redefine the way you experience music.",
            image: _buildImage('intro.png'),
            decoration: pageDecoration)
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      back: const Icon(Icons.arrow_back),
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
