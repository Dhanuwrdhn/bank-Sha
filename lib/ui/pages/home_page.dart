import 'package:bank_sha/shared/shared_method.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/home_latest_transaction_item.dart';
import 'package:bank_sha/ui/widgets/home_service_item.dart';
import 'package:bank_sha/ui/widgets/home_tips_item.dart';
import 'package:bank_sha/ui/widgets/home_user_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: whiteColor,
        shape: CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        notchMargin: 6,
        elevation: 0,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: whiteColor,
          elevation: 0,
        selectedItemColor: blueColor,
        unselectedItemColor: blackColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: blueTextStyle.copyWith(
          fontSize: 10,
          fontWeight: medium,
        ),
        unselectedLabelStyle:blackTextStyle.copyWith(
          fontSize: 10,
          fontWeight: medium,
        ) ,
        items: [
          BottomNavigationBarItem(icon: Image.asset(
          'assets/ic_overview.png',
          width: 20,
          color: blueColor,
        ),
        label: 'Overview',
        ),
        BottomNavigationBarItem(icon: Image.asset(
          'assets/ic_history.png',
          width: 20,
        ),
        label: 'History',
        ),
        BottomNavigationBarItem(icon: Image.asset(
          'assets/ic_statistic.png',
          width: 20,
        ),
        label: 'Statistic',
        ),
        BottomNavigationBarItem(icon: Image.asset(
          'assets/ic_reward.png',
          width: 20,
        ),
        label: 'Reward',
        ),
        
      ],
      
    ),
    
  ),
  floatingActionButton: FloatingActionButton(
      onPressed: (){

      },
      backgroundColor: purpleColor,
      child: Image.asset(
        'assets/ic_plus_circle.png',
        width: 24,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          ),
        children: [
          buildProfile(context),
          buildWalletCard(),
          buildLevel(),
          buildServices(context),
          buildLatestTransaction(),
          buildSendAgain(),
          buildFriendlyTips(),
        ],
        ),
    );
}
Widget buildProfile(BuildContext context){
  return Container(
    margin: const EdgeInsets.only(
    top: 40,
  ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Howdy,',
          style: greyTextStyle.copyWith(
            fontSize: 16,
          ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text('shaynahan',
          style: blackTextStyle.copyWith(
            fontSize: 20,
            fontWeight: semiBold,
          ),
          ),
        ],
      ),
      GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, '/profile');
        },
        child :Container(
        width: 60,
        height: 60,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: AssetImage('assets/img_profile.png'))
        ),
        child: Align(
          alignment: Alignment.topRight,
          child: Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: whiteColor,
            ),
            child: Center(
              child: Icon(
                Icons.check_circle,
                color: greenColor,
                size: 14,
                ),
              ),
            ),
          ),
        ),
      )
    ],
  ),
  );
}
Widget buildWalletCard(){
  return Container(
    width: double.infinity,
    height: 220,
    margin: const EdgeInsets.only(
      top: 30,
    ),
    padding: const EdgeInsets.all(30),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(28),
      image: const DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage(
          'assets/img__bg_card.png',
          ),
        ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Shayna Hanna',
        style: whiteTextStyle.copyWith(
          fontSize: 18,
          fontWeight: medium,
        ),
        ),
        const SizedBox( height: 28,),
        Text('**** **** **** 1280',
        style: whiteTextStyle.copyWith( 
          fontSize: 18,
          fontWeight: medium,
          letterSpacing: 6,
        ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text('Balance',
        style: whiteTextStyle,
        ),
        Text(formatCurrency(12500),
        style: whiteTextStyle.copyWith(
          fontSize: 24,
          fontWeight: semiBold,
        ),
        ),
      ],
    ),
  );
}
Widget buildLevel(){
  return Container(
  margin: const EdgeInsets.only(
      top: 20,
    ),
    padding: const EdgeInsets.all(22),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: whiteColor,
    ),
    child: Column(
      children: [
        Row(children: [
          Text('Level 1',
          style: blackTextStyle.copyWith(
            fontWeight: medium,
          ),
          ),
          const Spacer(),
          Text('55%',
          style: greenTextStyle.copyWith(
            fontWeight: semiBold,
          ),
        ),
        Text('of ${formatCurrency(20000)}',
        style: blackTextStyle.copyWith(
          fontWeight: semiBold,
        ),
        ),
        ],
      ),
      const SizedBox(
        height: 10,
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(55),
        child: LinearProgressIndicator(
        value: 0.55,
        minHeight: 5,
        valueColor: AlwaysStoppedAnimation(greenColor),
        backgroundColor: lightBackgroundColor,
      ),
      ),
      ],
    ),
  );
}
Widget buildServices(BuildContext context){
  return Container(
    margin: const EdgeInsets.only(
      top: 30,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Do Something',
        style: blackTextStyle.copyWith(
          fontSize: 16,
          fontWeight: semiBold
        ),
        ),
        const SizedBox(
            height: 14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HomeServicesItem(
                iconUrl: 'assets/ic_topup.png',
                title: 'Top Up',
                onTap: () {
                  Navigator.pushNamed(context, '/topup');
                },
              ),
              HomeServicesItem(
                iconUrl: 'assets/ic_send.png',
                title: 'Send',
                onTap: () {
                  Navigator.pushNamed(context, '/transfer');
                },
              ),
              HomeServicesItem(
                iconUrl: 'assets/ic_withdraw.png',
                title: 'Withdraw',
                onTap: () {
                
                },
              ),
              HomeServicesItem(
                iconUrl: 'assets/ic_more.png',
                title: 'More',
                onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => const MoreDialog()
                  );
                },
              ),
            ],
          )
      ],
    ),
  );
}
Widget buildLatestTransaction(){
  return Container(
    margin: const EdgeInsets.only(
      top: 30,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Latest Transaction',
        style: blackTextStyle.copyWith(
          fontSize: 16,
          fontWeight: semiBold
        ),
        ),
        
          Container(
            padding: const EdgeInsets.all(22),
            margin: const EdgeInsets.only(
              top: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: whiteColor,
              ),
              child:  Column(
                
                children: [
                  HomeLatestTransactionItem(
                    iconUrl: 'assets/ic_transaction_cat1.png',
                    title: 'Top Up',
                    time: 'yesterday',
                    value: '+ ${formatCurrency(450000,symbol: '' )}'),
                    HomeLatestTransactionItem(
                    iconUrl: 'assets/ic_transaction_cat2.png',
                    title: 'Cashback',
                    time: 'Sep 11',
                    value: '+ ${formatCurrency(22000,symbol: '' )}'),
                    HomeLatestTransactionItem(
                    iconUrl: 'assets/ic_transaction_cat3.png',
                    title: 'Withdraw',
                    time: 'Sep 2',
                    value: '- ${formatCurrency(5000,symbol: '' )}'),
                    HomeLatestTransactionItem(
                    iconUrl: 'assets/ic_transaction_cat4.png',
                    title: 'Transfer',
                    time: 'Aug 27',
                    value: '- ${formatCurrency(1250000,symbol: '' )}'),
                    HomeLatestTransactionItem(
                    iconUrl: 'assets/ic_transaction_cat5.png',
                    title: 'Electric',
                    time: 'Feb 16',
                    value: '- ${formatCurrency(12300000,symbol: '' )}'),
                ],
              ),
          ),
      ]
    ),
  );
}
Widget buildSendAgain(){
return Container(
    margin: const EdgeInsets.only(
      top: 30,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Send Again',
        style: blackTextStyle.copyWith(
          fontSize: 16,
          fontWeight: semiBold
        ),
        ),
        const SizedBox(
          height: 14,
        ),
        const SingleChildScrollView( 
          scrollDirection: Axis.horizontal,
          child:  Row(
          children:  [
          HomeUserItem(
            imageUrl: 'assets/img_friend1.png',
            username: 'yuanita',),
            HomeUserItem(
            imageUrl: 'assets/img_friend2.png',
            username: 'jani',),
            HomeUserItem(
            imageUrl: 'assets/img_friend3.png',
            username: 'urip',),
            HomeUserItem(
            imageUrl: 'assets/img_friend4.png',
            username: 'masa',),
        ],
      ), 
      ),
      
      ],
    ),
);
}
Widget buildFriendlyTips(){
  return Container(
    margin: const EdgeInsets.only(
      top: 30,
      bottom: 50,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Send Again',
        style: blackTextStyle.copyWith(
          fontSize: 16,
          fontWeight: semiBold
        ),
        ),
        const SizedBox(
          height: 14,
        ),
        const Wrap(
          spacing: 17,
          runSpacing: 18,
          children:  [
            HomeTipsItem(
          imageUrl: 'assets/img_tips1.png',
          title: 'Best tips for using a credit card ',
          url: 'https://www.google.com/'
          ),
          HomeTipsItem(
          imageUrl: 'assets/img_tips2.png',
          title: 'Spot the good pie of finance modeld ',
          url: 'https://pub.dev/packages/url_launcher'
          ),
          HomeTipsItem(
          imageUrl: 'assets/img_tips3.png',
          title: 'Great hack to get better advices',
          url: 'https://www.google.com/' 
          ),
          HomeTipsItem(
          imageUrl: 'assets/img_tips4.png',
          title: 'Save more penny buy this instead ',
          url: 'https://www.google.com/'
          ),
          ],
        ),
      ],
    )
  );
}
}

class MoreDialog extends StatelessWidget {
  const MoreDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      alignment: Alignment.bottomCenter,
      content: Container(
        padding: const EdgeInsets.all(30),
        height: 326,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: lightBackgroundColor
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Do More With Us',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
            ),
            const SizedBox(
              height: 13,
            ),
            Wrap(
              spacing: 40,
              runSpacing: 25,
              children: [
                HomeServicesItem(
                iconUrl: 'assets/ic_data.png',
                title: 'Data',
                onTap: () {
                Navigator.pushNamed(context, '/data-provider');
                },
              ),
              HomeServicesItem(
                iconUrl: 'assets/ic_water.png',
                title: 'Water',
                onTap: () {
                
                },
              ),
              HomeServicesItem(
                iconUrl: 'assets/ic_stream.png',
                title: 'Stream',
                onTap: () {
                
                },
              ),
              HomeServicesItem(
                iconUrl: 'assets/ic_movie.png',
                title: 'Movie',
                onTap: () {
                
                },
              ),
              HomeServicesItem(
                iconUrl: 'assets/ic_food.png',
                title: 'Food',
                onTap: () {
                
                },
              ),
              HomeServicesItem(
                iconUrl: 'assets/ic_travel.png',
                title: 'Travel',
                onTap: () {
                
                },
              ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}