import 'package:facebook_clo/core/constants/app_colors.dart';
import 'package:facebook_clo/core/constants/constants.dart';
import 'package:facebook_clo/core/widgets/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});
  static const routeName = "/home-screen";

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkGreyColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.realWhiteColor,
        title: _buildFacebookText(),
        actions: [
          _buildSearchWidget(),
          _buildMessenger(),
        ],
        bottom: TabBar(
          dividerColor: AppColors.realWhiteColor,
          tabs: Constants.getHomeScreenTabs(_tabController.index),
          controller: _tabController,
          onTap: (index) {
            setState(() {});
          },
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: Constants.screens,
      ),
    );
  }

  Widget _buildFacebookText() {
    return const Text(
      "facebook",
      style: TextStyle(
        color: AppColors.blueColor,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildSearchWidget() {
    return const RoundIconButton(icon: FontAwesomeIcons.magnifyingGlass);
  }

  Widget _buildMessenger() {
    return const RoundIconButton(icon: FontAwesomeIcons.facebookMessenger);
  }
}
