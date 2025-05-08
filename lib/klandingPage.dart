// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:Nriweb/constants/colorConstants.dart';
// import 'package:Nriweb/constants/constStyles.dart';
// import 'package:Nriweb/downloadPage.dart';
// import 'package:wave/config.dart';
// import 'package:wave/wave.dart';

// class LandingPage extends StatelessWidget {
//   LandingPage({super.key});
//   final _backgroundColor = ConstColors.mainColorOrange.withOpacity(0.1);

//   static const _colors = [Colors.white, ConstColors.mainColorOrange];

//   static const _durations = [
//     5000,
//     4000,
//   ];

//   static const _heightPercentages = [
//     0.65,
//     0.66,
//   ];
//   List<String> imagess = [
//     "assets/images/eba.jpeg",
//     "assets/images/nkwobi.jpg",
//     "assets/images/indomieeee.jpg",
//     "assets/images/jelloffff.jpeg",
//     "assets/images/okraaa.jpg",
//     "assets/images/afanggg.jpg",
//     "assets/images/foodImage2.png",
//     "assets/images/foodImage3.png",
//     "assets/images/shawama.jpg"
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SafeArea(
//             child: Column(
//       children: [
//         SizedBox(height: 10.h),
//         Row(
//           children: [
//             SizedBox(
//               width: 20.w,
//             ),
//             Container(
//               height: 50,
//               width: 50,
//               decoration: BoxDecoration(
//                   image: const DecorationImage(
//                       fit: BoxFit.cover,
//                       image: AssetImage(
//                         "assets/images/NriMainLogo.png",
//                       )),
//                   borderRadius: BorderRadius.circular(10.r)),
//             ),
//             const Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text("  Nri", style: ConstStyles.SofiaProBold14Orange),
//                 Text("  Delivering your favourites food fast to your doorstep",
//                     style: ConstStyles.SofiaProMedium11Grey3),
//               ],
//             ),
//           ],
//         ),
//         ProductSlider(mainList: imagess),
//         const Text(
//             textAlign: TextAlign.center,
//             "Welcome to Nri, A platform where we deliver to you your favourites delicacies straight to your doorstep click the button below to download the app",
//             style: ConstStyles.SofiaProRegular15Black),
//         SizedBox(height: 20.h),
//         GestureDetector(
//           onTap: () {
//             Navigator.of(context)
//                 .push(MaterialPageRoute(builder: (_) => DownloadPage()));
//             // https: //drive.google.com/file/d/1nnGARht5k1O5CMlE7GmalKLhY2Ewdm3p/view?usp=drive_link
//           },
//           child: Container(
//               decoration: BoxDecoration(
//                   color: ConstColors.mainColorOrange,
//                   borderRadius: BorderRadius.circular(30.r)),
//               height: 70,
//               width: 200,
//               child: const Center(
//                   child: Text("DOWNLOAD NOW",
//                       style: ConstStyles.SofiaProBold20White))),
//         ),
//         Expanded(
//           child: WaveWidget(
//             config: CustomConfig(
//               colors: _colors,
//               durations: _durations,
//               heightPercentages: _heightPercentages,
//             ),
//             // backgroundColor: _backgroundColor,
//             size: const Size(double.infinity, double.infinity),
//             waveAmplitude: 0,
//           ),
//         ),
//       ],
//     )));
//   }
// }

// class ProductSlider extends StatefulWidget {
//   const ProductSlider({
//     super.key,
//     required this.mainList,
//   });

//   final List<String> mainList;

//   @override
//   State<ProductSlider> createState() => _ProductSliderState();
// }

// class _ProductSliderState extends State<ProductSlider> {
//   @override
//   Widget build(BuildContext context) {
//     return CarouselSlider(
//       items: widget.mainList.map((i) {
//         return GestureDetector(
//           child: Container(
//             width: double.infinity,
//             // height: 350,
//             margin: const EdgeInsets.symmetric(horizontal: 14),
//             decoration: BoxDecoration(
//               color: Colors.transparent,
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Stack(
//                   children: [
//                     // Product Image
//                     Container(
//                       height: 200,
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         //   image: DecorationImage(
//                         //     image: AssetImage(i),
//                         //     fit: BoxFit.cover,
//                         //   ),
//                       ),
//                       child: ClipRRect(
//                           borderRadius: BorderRadius.circular(20),
//                           child:
//                               Image.asset(i, height: 200, fit: BoxFit.cover)),
//                     ),

//                     // Units Badge

//                     // Favorite Icon
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         );
//       }).toList(),
//       options: CarouselOptions(
//         height: 260,
//         aspectRatio: 16 / 9,
//         viewportFraction: 0.8,
//         initialPage: 0,
//         enableInfiniteScroll: true,
//         autoPlay: true,
//         autoPlayInterval: const Duration(seconds: 3),
//         autoPlayAnimationDuration: const Duration(milliseconds: 800),
//         autoPlayCurve: Curves.fastOutSlowIn,
//         enlargeCenterPage: true,
//         // pauseAutoPlayOnTouch: true,
//         scrollDirection: Axis.horizontal,
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:go_router/go_router.dart';

class NriApp extends StatelessWidget {
  const NriApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Nri Food Delivery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF6B35),
          primary: const Color(0xFFFF6B35),
          secondary: const Color(0xFF2EC4B6),
        ),
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
      routerConfig: _router,
    );
  }

  // Configure GoRouter for routing
  static final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            const HomePage(),
      ),
      GoRoute(
        path: '/privacy-policy',
        builder: (BuildContext context, GoRouterState state) =>
            const PrivacyPolicyPage(),
      ),
      GoRoute(
        path: '/terms',
        builder: (BuildContext context, GoRouterState state) =>
            const TermsPage(),
      ),
      GoRoute(
        path: '/about',
        builder: (BuildContext context, GoRouterState state) =>
            const AboutPage(),
      ),
      GoRoute(
        path: '/delete-account',
        builder: (BuildContext context, GoRouterState state) =>
            const ContactPage(),
      ),
    ],
  );
}

// Main app header with logo and navigation
class AppHeader extends StatelessWidget {
  final bool showBackButton;

  const AppHeader({
    super.key,
    this.showBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          if (showBackButton)
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                if (context.canPop()) {
                  context.pop();
                } else {
                  context.go('/');
                }
              },
            ),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Text(
                'Nri',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          const Text(
            'Nri Food Delivery',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const Spacer(),
          // Navigation links for wider screens
          if (MediaQuery.of(context).size.width > 800) ...[
            const _NavLink(title: 'Home', path: '/'),
            const _NavLink(title: 'About', path: '/about'),
            const _NavLink(title: 'Delete Account', path: '/delete-account'),
          ] else
            PopupMenuButton<String>(
              icon: const Icon(Icons.menu),
              onSelected: (value) {
                context.go(value);
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: '/',
                  child: Text('Home'),
                ),
                const PopupMenuItem<String>(
                  value: '/about',
                  child: Text('About'),
                ),
                const PopupMenuItem<String>(
                  value: '/delete-account',
                  child: Text('Delete Account'),
                ),
                const PopupMenuItem<String>(
                  value: '/privacy-policy',
                  child: Text('Privacy Policy'),
                ),
                const PopupMenuItem<String>(
                  value: '/terms',
                  child: Text('Terms of Service'),
                ),
              ],
            ),
        ],
      ),
      elevation: 1,
      backgroundColor: Colors.white,
    );
  }
}

class _NavLink extends StatelessWidget {
  final String title;
  final String path;

  const _NavLink({required this.title, required this.path});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => context.go(path),
      child: Text(
        title,
        style: TextStyle(
          color: GoRouterState.of(context).path == path
              ? Theme.of(context).colorScheme.primary
              : Colors.black87,
          fontWeight: GoRouterState.of(context).path == path
              ? FontWeight.bold
              : FontWeight.normal,
        ),
      ),
    );
  }
}

// App footer with additional links
class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF8F8F8),
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FooterLink(
                  title: 'Privacy Policy',
                  onTap: () => context.go('/privacy-policy')),
              const SizedBox(width: 24),
              FooterLink(
                  title: 'Terms of Service', onTap: () => context.go('/terms')),
              const SizedBox(width: 24),
              FooterLink(
                  title: 'Delete Account',
                  onTap: () => context.go('/delete-account')),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            '© 2025 Nri Food Delivery. All rights reserved.',
            style: TextStyle(color: Color(0xFF757575)),
          ),
        ],
      ),
    );
  }
}

class FooterLink extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const FooterLink({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        title,
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

// Home Page
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppHeader(),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Center(
                      child: Text(
                        'Nri',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Welcome to Nri Food Delivery',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Delicious food delivered to your doorstep',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF757575),
                    ),
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {
                      // Add download app link here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 16),
                    ),
                    child: const Text('Download App'),
                  ),
                ],
              ),
            ),
          ),
          const AppFooter(),
        ],
      ),
    );
  }
}

// Privacy Policy Page
class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppHeader(showBackButton: true),
      ),
      body: Column(
        children: [
          Expanded(
            child: PrivacyPolicyContent(),
          ),
          AppFooter(),
        ],
      ),
    );
  }
}

class PrivacyPolicyContent extends StatelessWidget {
  const PrivacyPolicyContent({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final contentWidth = screenWidth > 800 ? 800.0 : screenWidth * 0.9;

    return Center(
      child: Container(
        width: contentWidth,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Privacy Policy',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Last updated: ${_getFormattedDate()}',
                style: const TextStyle(
                  color: Color(0xFF757575),
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 24),
              const PolicySection(
                title: 'Introduction',
                content:
                    'Nri ("we," "our," or "us") is committed to protecting your privacy. This Privacy Policy explains how your personal information is collected, used, and disclosed by Nri when you use our mobile application and related services (collectively, the "Service").\n\nBy accessing or using the Service, you signify that you have read, understood, and agree to our collection, storage, use, and disclosure of your personal information as described in this Privacy Policy.',
              ),
              const PolicySection(
                title: 'Information We Collect',
                content:
                    'We collect several types of information from and about users of our Service:\n\n• Personal Information: When you register for an account, we collect your name, email address, phone number, and delivery address.\n\n• Payment Information: When you make purchases through the Service, your payment information is processed by secure third-party payment processors.\n\n• Location Information: With your consent, we collect precise location data to provide delivery services, show nearby restaurants, and improve our Service.\n\n• Device Information: We automatically collect device information such as your mobile device ID, model, manufacturer, operating system, and IP address.\n\n• Usage Information: We collect information about your interactions with the Service, including order history, browsing history, and time spent on the app.',
              ),
              const PolicySection(
                title: 'How We Use Your Information',
                content:
                    'We use the information we collect to:\n\n• Process and deliver your orders\n• Provide, maintain, and improve our Service\n• Process your payments and prevent fraud\n• Communicate with you about your orders, account, and promotions\n• Send you technical notices, updates, and support messages\n• Respond to your comments and questions\n• Monitor and analyze trends, usage, and activities\n• Personalize your experience and provide content or features that match your profile or interests',
              ),
              const PolicySection(
                title: 'Sharing of Information',
                content:
                    'We may share your personal information with:\n\n• Restaurant Partners: To fulfill your orders\n• Delivery Partners: To deliver your orders\n• Service Providers: Who perform services on our behalf, such as payment processing, data analysis, email delivery, and hosting services\n• Business Transfers: If we are involved in a merger, acquisition, or sale of all or a portion of our assets\n• Legal Requirements: When we believe disclosure is necessary to comply with the law, enforce our policies, or protect our or others\' rights, property, or safety',
              ),
              const PolicySection(
                title: 'Your Choices',
                content:
                    'Account Information: You can update your account information at any time through your profile settings in the app.\n\nLocation Information: You can prevent collection of location data through your device settings, but some features of our Service may not function properly.\n\nPromotional Communications: You can opt out of receiving promotional emails by following the instructions in those emails or by adjusting your notification preferences in your account settings.',
              ),
              const PolicySection(
                title: 'Data Security',
                content:
                    'We implement appropriate security measures to protect your personal information from unauthorized access, alteration, disclosure, or destruction. However, no method of transmission over the Internet or electronic storage is 100% secure, and we cannot guarantee absolute security.',
              ),
              const PolicySection(
                title: 'Children\'s Privacy',
                content:
                    'Our Service is not directed to children under 13, and we do not knowingly collect personal information from children under 13. If we learn we have collected personal information from a child under 13, we will delete such information as quickly as possible.',
              ),
              const PolicySection(
                title: 'Changes to This Privacy Policy',
                content:
                    'We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page and updating the "Last Updated" date. You are advised to review this Privacy Policy periodically for any changes.',
              ),
              const PolicySection(
                title: 'Contact Us',
                content:
                    'If you have any questions about this Privacy Policy, please contact us at:\n\nEmail: Nrifood.care@gmail.com',
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class PolicySection extends StatelessWidget {
  final String title;
  final String content;

  const PolicySection({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF333333),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          content,
          style: const TextStyle(
            fontSize: 16,
            height: 1.5,
            color: Color(0xFF555555),
          ),
        ),
      ],
    );
  }
}

// Terms of Service Page
class TermsPage extends StatelessWidget {
  const TermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppHeader(showBackButton: true),
      ),
      body: Column(
        children: [
          Expanded(
            child: TermsContent(),
          ),
          AppFooter(),
        ],
      ),
    );
  }
}

class TermsContent extends StatelessWidget {
  const TermsContent({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final contentWidth = screenWidth > 800 ? 800.0 : screenWidth * 0.9;

    return Center(
      child: Container(
        width: contentWidth,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Terms of Service',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Last updated: ${_getFormattedDate()}',
                style: const TextStyle(
                  color: Color(0xFF757575),
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 24),
              const PolicySection(
                title: 'Agreement to Terms',
                content:
                    'By accessing or using the Nri Food Delivery mobile application and services, you agree to be bound by these Terms of Service. If you do not agree to these Terms, you may not access or use the Service.',
              ),
              const PolicySection(
                title: 'Use of Service',
                content:
                    'Nri Food Delivery provides a platform connecting users with restaurants and delivery partners. You may use our Service only for lawful purposes and in accordance with these Terms. You agree not to use the Service:\n\n• In any way that violates applicable laws or regulations\n• To impersonate or attempt to impersonate Nri, an Nri employee, another user, or any other person\n• To engage in any conduct that restricts or inhibits anyone\'s use or enjoyment of the Service',
              ),
              const PolicySection(
                title: 'User Accounts',
                content:
                    'To use certain features of the Service, you must register for an account. You agree to provide accurate and complete information when creating your account and to update your information to keep it accurate and current. You are responsible for safeguarding your password and for all activities that occur under your account.',
              ),
              const PolicySection(
                title: 'Orders and Payments',
                content:
                    'By placing an order through our Service, you agree to pay all charges at the prices listed for your selected items, along with any applicable taxes and delivery fees. All payments are processed through secure third-party payment processors. Prices and availability of items are subject to change without notice.',
              ),
              const PolicySection(
                title: 'Delivery',
                content:
                    'Delivery times are estimates and may vary based on factors such as distance, traffic, weather conditions, and restaurant preparation times. Nri is not responsible for delays in delivery due to factors beyond our reasonable control.',
              ),
              const PolicySection(
                title: 'Intellectual Property',
                content:
                    'The Service and its entire contents, features, and functionality are owned by Nri, its licensors, or other providers and are protected by copyright, trademark, and other intellectual property laws. You may not reproduce, distribute, modify, create derivative works of, publicly display, or publicly perform any of the materials from the Service without prior written consent.',
              ),
              const PolicySection(
                title: 'Limitation of Liability',
                content:
                    'Nri shall not be liable for any indirect, incidental, special, consequential, or punitive damages resulting from your access to or use of, or inability to access or use, the Service. In no event shall our total liability to you for all damages exceed the amount paid by you, if any, for accessing or using the Service during the twelve months prior to bringing the claim.',
              ),
              const PolicySection(
                title: 'Changes to Terms',
                content:
                    'We may revise these Terms at any time by posting an updated version on this page. You are expected to check this page from time to time so you are aware of any changes, as they are binding on you.',
              ),
              const PolicySection(
                title: 'Contact Us',
                content:
                    'If you have any questions about these Terms, please contact us at:\n\nEmail: Nrifood.care@gmail.com',
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

// About Page
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppHeader(showBackButton: true),
      ),
      body: Column(
        children: [
          Expanded(
            child: _AboutContent(),
          ),
          const AppFooter(),
        ],
      ),
    );
  }
}

class _AboutContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final contentWidth = screenWidth > 800 ? 800.0 : screenWidth * 0.9;

    return Center(
      child: Container(
        width: contentWidth,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'About Nri',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Our Mission',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'At Nri Food Delivery, our mission is to connect people with the food they love from their favorite local restaurants. We strive to make food delivery convenient, reliable, and satisfying for everyone.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: Color(0xFF555555),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Our Story',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Founded in 2023, Nri Food Delivery began with a simple idea: to make great food more accessible. What started as a small operation serving a few neighborhoods has grown into a platform connecting thousands of customers with their favorite restaurants across multiple cities.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: Color(0xFF555555),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'How It Works',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                '1. Browse restaurants and menus in your area\n'
                '2. Select your favorite dishes and add them to your cart\n'
                '3. Place your order and pay securely through our app\n'
                '4. Track your order in real-time\n'
                '5. Enjoy your food when it arrives at your door',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.8,
                  color: Color(0xFF555555),
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Add download app link here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16),
                  ),
                  child: const Text('Get Started'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Contact Page
class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppHeader(showBackButton: true),
      ),
      body: Column(
        children: [
          Expanded(
            child: _ContactContent(),
          ),
          const AppFooter(),
        ],
      ),
    );
  }
}

class _ContactContent extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final contentWidth = screenWidth > 800 ? 800.0 : screenWidth * 0.9;

    return Center(
      child: Container(
        width: contentWidth,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Delete Account',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
              ),
              const SizedBox(height: 16),
              const PolicySection(
                title: 'Delete Account',
                content:
                    'At Nri App we value your privacy. Currently our app does nbot support direct i app deletion of your account if you would like to account and remove yoyur personal data , please folow the instruction below ',
              ),
              const SizedBox(height: 10),
              const PolicySection(
                title: 'How to Request Account deletion ',
                content:
                    'To delete our account and all associated data please send an email to our support team at Nrifood.care@gmail.com with the subject line "DELETE MY ACCOUNT" In your email, include your email',
              ),
              const SizedBox(height: 10),
              const PolicySection(
                title: 'What happens after you request account delete  ',
                content:
                    'we will verify your identity to prevent uauthorized deletion request \n once verified your accoun will be deleted, this process typically takes 7 days tto complete',
              ),
              const SizedBox(height: 32),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!value.contains('@')) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Subject',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a subject';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Message',
                        border: OutlineInputBorder(),
                        alignLabelWithHint: true,
                      ),
                      maxLines: 5,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your message';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Process form submission
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    'Message sent! We\'ll get back to you soon.')),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 16),
                      ),
                      child: const Text('Send Message'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String content;

  const _ContactItem({
    required this.icon,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 24,
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              content,
              style: const TextStyle(
                color: Color(0xFF555555),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// Helper function for formatted date
String _getFormattedDate() {
  final now = DateTime.now();
  final months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  return '${months[now.month - 1]} ${now.day}, ${now.year}';
}
