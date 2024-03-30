import 'package:flutter/material.dart';
import 'package:smart_pay/presentation/onboarding/sign_in.dart';

import '../../core/constants.dart';
import '../../core/reusable_widgets/app_button.dart';
import '../../core/reusable_widgets/app_text.dart';
import '../../core/size_config.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  PageController _controller = PageController();
  int selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Padding(
        padding:  EdgeInsets.only(
            left: getProportionateScreenWidth(44),
            right: getProportionateScreenWidth(44),
          bottom: getProportionateScreenHeight(24),
        ),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(24),),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                      const SignIn()));
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CreateGeneralText(
                        inputText: 'Skip',
                        fontSize: 16,
                        fontFamily: FontFamily.sfProDisplay,
                        weight: FontWeight.w600,
                        colorName:Palette.skipColor
                    ),

                  ],
                ),
              ),
              Expanded(
                child: PageView.builder(
                  itemCount: data.length,
                  controller: _controller,
                  onPageChanged: (index) {
                    selectedIndex = index;
                    setState(() {});
                  },
                  itemBuilder: (context, i) {
                    var details = data[i];
                    return buildOnboardContent(
                      image: details.image,
                      title: details.title,
                      subtitle: details.subtitle,
                    );
                  },
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    data.length,
                        (index) => _buildIndicator(context, index)),
              ),
              SizedBox(height: getProportionateScreenHeight(34),),
              BuildButton(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                  const SignIn()));
                },
                height: getProportionateScreenHeight(56),
                width: double.infinity,
                borderRadius: BorderRadius.circular(16),
                buttonColor: Palette.primaryColor,
                child: const Center(
                  child: CreateGeneralText(
                    inputText: 'Get Started',
                    fontSize: 16,
                    fontFamily: FontFamily.sfProDisplay,
                    weight: FontWeight.w700,
                    colorName: Palette.backgroundColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  AnimatedContainer _buildIndicator(BuildContext context, int index) =>
      AnimatedContainer(
        height: getProportionateScreenHeight(6),
        width:selectedIndex == index? getProportionateScreenWidth(32):getProportionateScreenWidth(6),
        margin: EdgeInsets.only(right: getProportionateScreenWidth(4)),
        decoration: BoxDecoration(
          color: selectedIndex == index
              ? Palette.primaryColor
              : Palette.dividerColor,
          borderRadius: BorderRadius.circular(10),
        ),
        duration: const Duration(
          milliseconds: 100,
        ),
        curve: Curves.decelerate,
      );
  Column buildOnboardContent({
    required String image,
    required String title,
    required String subtitle,
  }) {
    return Column(
      children: [
        SizedBox(height: getProportionateScreenHeight(80),),
        SizedBox(
          height: getProportionateScreenHeight(250),
            width: double.infinity,
            child: Image.asset(image)),
        SizedBox(height: getProportionateScreenHeight(46),),
        CreateGeneralText(
            inputText: title,
            fontSize: 24,
            textAlign: TextAlign.center,
            fontFamily: FontFamily.sfProDisplay,
            weight: FontWeight.w600,
            colorName:Palette.primaryColor ),
        SizedBox(height: getProportionateScreenHeight(16),),
          CreateGeneralText(inputText: subtitle,
            fontSize: 16,
            textAlign: TextAlign.center,
              fontFamily: FontFamily.sfProDisplay,
            weight: FontWeight.w500,
            colorName:Palette.textColor ),
      ],
    );
  }
}
class OnBoard {
  final String image, title, subtitle;

  OnBoard(
      {required this.image, required this.title, required this.subtitle});
}

final List<OnBoard> data = [
  OnBoard(
      image: 'assets/images/IMG.png',
      title: 'Finance app the safest and most trusted',
      subtitle: 'Your finance work starts here. Our here to help you track and deal with speeding up your transactions.'),
  OnBoard(
    image: 'assets/images/IMG 2.png',
    title: 'The fastest transaction process only here',
    subtitle: 'Get easy to pay all your bills with just a few steps. Paying your bills become fast and efficient.',
  ),

];
