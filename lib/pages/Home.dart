import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '/theme/terminal_theme.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '/pages/RSVP_Page.dart';
import '/pages/Volunteer_Page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  static const String sponsorEmail = 'mailto:beanoantenucci@gmail.com';
  static const String donateUrl =
      'https://hcb.hackclub.com/donations/start/boot';

  late AnimationController _typewriterController;
  late AnimationController _floatingController;
  late Animation<int> _typewriterAnimation;
  late Animation<double> _floatingAnimation;
  final String _welcomeText = "Welcome to Boot Hackathon 2025";

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _typewriterController = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this,
    );
    _typewriterAnimation = IntTween(begin: 0, end: _welcomeText.length).animate(
      CurvedAnimation(parent: _typewriterController, curve: Curves.easeInOut),
    );

    _floatingController = AnimationController(
      duration: Duration(milliseconds: 3000),
      vsync: this,
    );
    _floatingAnimation = Tween<double>(begin: -10, end: 10).animate(
      CurvedAnimation(parent: _floatingController, curve: Curves.easeInOut),
    );

    _typewriterController.forward();
    _floatingController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _typewriterController.dispose();
    _floatingController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  void _scrollToSection(double offset) {
    _scrollController.animateTo(
      offset,
      duration: Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  void _navigateTo(String destination) {
    switch (destination) {
      case 'RSVP':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RSVPPage()),
        );
        break;
      case 'Volunteer':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => VolunteerPage()),
        );
        break;
      case 'Sponsor':
        _showInProgressDialog();
        break;
    }
  }

  Future<void> _showInProgressDialog() async {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: colorScheme.surfaceContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: colorScheme.outline),
        ),
        title: Row(
          children: [
            Icon(Symbols.info, color: colorScheme.primary, size: 22),
            const SizedBox(width: 8),
            Text(
              'Coming soon',
              style: textTheme.titleLarge?.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        content: Text(
          'This page is in progress. If you\'re interested, email beanoantenucci@gmail.com.',
          style: textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
            height: 1.5,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Close'),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.of(ctx).pop();
              _launchUrl(sponsorEmail);
            },
            icon: const Icon(Symbols.mail),
            label: const Text('Email us'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: _buildNavigationBar(colorScheme, textTheme),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            _buildHeroSection(colorScheme, textTheme),
            const SizedBox(height: 60),
            _buildAboutSection(colorScheme, textTheme),
            const SizedBox(height: 60),
            _buildWhatCountsAsSection(colorScheme, textTheme),
            const SizedBox(height: 60),
            _buildSponsorsSection(colorScheme, textTheme),
            const SizedBox(height: 60),
            _buildVolunteerSection(colorScheme, textTheme),
            const SizedBox(height: 60),
            _buildFAQSection(colorScheme, textTheme),
            const SizedBox(height: 40),
            _buildFooter(colorScheme, textTheme),
          ],
        ),
      ),
      floatingActionButton: AnimatedBuilder(
        animation: _floatingAnimation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, _floatingAnimation.value),
            child: FloatingActionButton.extended(
              onPressed: () => _navigateTo('RSVP'),
              backgroundColor: colorScheme.primary,
              foregroundColor: colorScheme.onPrimary,
              icon: Icon(Symbols.rocket_launch),
              label: Text('RSVP NOW'),
            ),
          );
        },
      ),
    );
  }

  PreferredSizeWidget _buildNavigationBar(
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return AppBar(
      backgroundColor: colorScheme.surface.withAlpha(242),
      elevation: 0,
      scrolledUnderElevation: 4,
      title: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: colorScheme.primary.withAlpha(26),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: colorScheme.primary.withAlpha(77)),
            ),
            child: Icon(Symbols.terminal, color: colorScheme.primary, size: 20),
          ),
          const SizedBox(width: 12),
          Text(
            'Boot 2025',
            style: textTheme.headlineSmall?.copyWith(
              color: colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      actions: [
        _buildNavButton(
          'About',
          () => _scrollToSection(400),
          colorScheme,
          false,
        ),
        _buildNavButton(
          'What Counts',
          () => _scrollToSection(1000),
          colorScheme,
          false,
        ),
        _buildNavButton(
          'Sponsors',
          () => _scrollToSection(1600),
          colorScheme,
          false,
        ),
        _buildNavButton(
          'Volunteer',
          () => _navigateTo('Volunteer'),
          colorScheme,
          true,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: ElevatedButton.icon(
            onPressed: () => _navigateTo('RSVP'),
            icon: Icon(Symbols.rocket_launch, size: 16),
            label: Text('RSVP'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNavButton(
    String text,
    VoidCallback onPressed,
    ColorScheme colorScheme,
    bool isSpecial,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: isSpecial
              ? colorScheme.secondary.withAlpha(26)
              : Colors.transparent,
          foregroundColor: isSpecial
              ? colorScheme.secondary
              : colorScheme.onSurface,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: isSpecial
                ? BorderSide(color: colorScheme.secondary.withAlpha(77))
                : BorderSide.none,
          ),
        ),
        child: Text(text),
      ),
    );
  }

  // Hero Section
  Widget _buildHeroSection(ColorScheme colorScheme, TextTheme textTheme) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 40, 24, 40),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: colorScheme.primary.withAlpha(77),
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: colorScheme.primary.withAlpha(26),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.primary.withAlpha(38),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: colorScheme.primary.withAlpha(77),
                        ),
                      ),
                      child: Text(
                        'boot-terminal ~ Boot@hackathon',
                        style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.primary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Symbols.schedule,
                            color: colorScheme.onPrimary,
                            size: 16,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'Winter 2025',
                            style: TextStyle(
                              color: colorScheme.onPrimary,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                AnimatedBuilder(
                  animation: _typewriterAnimation,
                  builder: (context, child) {
                    String displayText = _welcomeText.substring(
                      0,
                      _typewriterAnimation.value,
                    );
                    return RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '\$ echo "',
                            style: textTheme.headlineSmall?.copyWith(
                              color: colorScheme.secondary,
                            ),
                          ),
                          TextSpan(
                            text: displayText,
                            style: textTheme.headlineLarge?.copyWith(
                              color: colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: '"',
                            style: textTheme.headlineSmall?.copyWith(
                              color: colorScheme.secondary,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),

                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer.withAlpha(77),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: colorScheme.primary.withAlpha(77),
                    ),
                  ),
                  child: Text(
                    'Build your OS. Share. Get prizes.',
                    style: textTheme.titleMedium?.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () => _navigateTo('RSVP'),
                        icon: Icon(Symbols.rocket_launch),
                        label: Text('Join the Hackathon'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () => _scrollToSection(600),
                        icon: Icon(Symbols.info),
                        label: Text('Learn More'),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 16,
                          ),
                          side: BorderSide(
                            color: colorScheme.primary.withAlpha(128),
                            width: 2,
                          ),
                          backgroundColor: colorScheme.primary.withAlpha(13),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // About Section
  Widget _buildAboutSection(ColorScheme colorScheme, TextTheme textTheme) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 40, 24, 40),
      color: colorScheme.surfaceContainer.withAlpha(26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: colorScheme.primary.withAlpha(26),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: colorScheme.primary.withAlpha(77)),
                ),
                child: Icon(Symbols.info, color: colorScheme.primary, size: 24),
              ),
              const SizedBox(width: 16),
              Text(
                'About Boot Hackathon',
                style: textTheme.headlineMedium?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),

          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: _buildAboutContent(colorScheme, textTheme),
                    ),
                    const SizedBox(width: 32),
                    Expanded(child: _buildQuickFacts(colorScheme, textTheme)),
                  ],
                );
              } else {
                return Column(
                  children: [
                    _buildAboutContent(colorScheme, textTheme),
                    const SizedBox(height: 24),
                    _buildQuickFacts(colorScheme, textTheme),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAboutContent(ColorScheme colorScheme, TextTheme textTheme) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colorScheme.outline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Boot is a hackathon where teens from around the world come together to build their own operating systems — from the ground up or from something already great.',
            style: textTheme.bodyLarge?.copyWith(
              color: colorScheme.onSurface,
              height: 1.6,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Whether you\'re going completely custom with LFS or Buildroot, or remixing a distro like Ubuntu into something entirely your own, the choice is yours.',
            style: textTheme.bodyLarge?.copyWith(
              color: colorScheme.onSurfaceVariant,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer.withAlpha(77),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: colorScheme.primary.withAlpha(77)),
            ),
            child: Row(
              children: [
                Icon(
                  Symbols.emoji_events,
                  color: colorScheme.primary,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Throughout the event, participants will make, test, and vote on each other\'s OSes. Sweet prizes await!',
                    style: textTheme.bodyLarge?.copyWith(
                      color: colorScheme.onSurface,
                      height: 1.6,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickFacts(ColorScheme colorScheme, TextTheme textTheme) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colorScheme.primary.withAlpha(77), width: 2),
        boxShadow: [
          BoxShadow(
            color: colorScheme.primary.withAlpha(26),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: colorScheme.primary.withAlpha(26),
                  shape: BoxShape.circle,
                  border: Border.all(color: colorScheme.primary.withAlpha(77)),
                ),
                child: Icon(
                  Symbols.terminal,
                  color: colorScheme.primary,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'Quick Facts',
                style: textTheme.titleLarge?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildEnhancedFactRow(
            'When:',
            'Winter 2025',
            Symbols.schedule,
            colorScheme,
            textTheme,
          ),
          _buildEnhancedFactRow(
            'Platform:',
            'Global/Virtual',
            Symbols.public,
            colorScheme,
            textTheme,
          ),
          _buildEnhancedFactRow(
            'Age:',
            '13-18 years',
            Symbols.group,
            colorScheme,
            textTheme,
          ),
          _buildEnhancedFactRow(
            'Cost:',
            'FREE',
            Symbols.monetization_on,
            colorScheme,
            textTheme,
          ),
        ],
      ),
    );
  }

  Widget _buildEnhancedFactRow(
    String label,
    String value,
    IconData icon,
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withAlpha(128),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: colorScheme.outline.withAlpha(128)),
      ),
      child: Row(
        children: [
          Icon(icon, color: colorScheme.secondary, size: 20),
          const SizedBox(width: 12),
          Text(
            label,
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            value,
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // What Counts As Section
  Widget _buildWhatCountsAsSection(
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 60, 24, 60),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            colorScheme.surfaceContainer.withAlpha(26),
            colorScheme.surfaceContainer.withAlpha(77),
            colorScheme.surfaceContainer.withAlpha(26),
          ],
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Symbols.help_outline, color: colorScheme.primary, size: 32),
              const SizedBox(width: 12),
              Text(
                'What Counts as an OS?',
                style: textTheme.headlineMedium?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer.withAlpha(128),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Any approach works — pick what excites you!',
              style: textTheme.bodyLarge?.copyWith(
                color: colorScheme.onPrimaryContainer,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          const SizedBox(height: 40),

          LayoutBuilder(
            builder: (context, constraints) {
              int columns = constraints.maxWidth > 1000
                  ? 4
                  : constraints.maxWidth > 600
                  ? 2
                  : 1;
              double cardWidth =
                  (constraints.maxWidth - (24 * (columns + 1))) / columns;

              return Wrap(
                spacing: 24,
                runSpacing: 24,
                alignment: WrapAlignment.center,
                children: [
                  _buildWhatCountsCard(
                    'From Scratch',
                    'Pure build using LFS, Buildroot, or your own kernel',
                    Symbols.code,
                    colorScheme.primary,
                    colorScheme,
                    textTheme,
                    cardWidth.clamp(260, 320),
                    '🔥 Hardcore',
                  ),
                  _buildWhatCountsCard(
                    'Base Distro',
                    'Start with Debian, Fedora, or Arch as foundation',
                    Symbols.layers,
                    colorScheme.secondary,
                    colorScheme,
                    textTheme,
                    cardWidth.clamp(260, 320),
                    '⚡ Advanced',
                  ),
                  _buildWhatCountsCard(
                    'Consumer Base',
                    'Customize Ubuntu, Raspberry Pi OS, or similar',
                    Symbols.tune,
                    TerminalColors.yellow,
                    colorScheme,
                    textTheme,
                    cardWidth.clamp(260, 320),
                    '✨ Friendly',
                  ),
                  _buildWhatCountsCard(
                    'Modification',
                    'Theme & package existing OS to make it yours',
                    Symbols.palette,
                    TerminalColors.magenta,
                    colorScheme,
                    textTheme,
                    cardWidth.clamp(260, 320),
                    '🎨 Beginner',
                  ),
                ],
              );
            },
          ),

          const SizedBox(height: 32),

          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest.withAlpha(179),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: colorScheme.primary.withAlpha(77),
                width: 2,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Symbols.lightbulb, color: colorScheme.primary, size: 24),
                const SizedBox(width: 12),
                Flexible(
                  child: Text(
                    'New to OS development? No problem! We\'ll provide guides (WIP).',
                    textAlign: TextAlign.center,
                    style: textTheme.bodyLarge?.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWhatCountsCard(
    String title,
    String description,
    IconData icon,
    Color accentColor,
    ColorScheme colorScheme,
    TextTheme textTheme,
    double width,
    String badge,
  ) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: width,
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                colorScheme.surfaceContainer,
                colorScheme.surfaceContainer.withAlpha(204),
              ],
            ),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: accentColor.withAlpha(77), width: 2),
            boxShadow: [
              BoxShadow(
                color: accentColor.withAlpha(26),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: accentColor.withAlpha(38),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: accentColor.withAlpha(77)),
                ),
                child: Text(
                  badge,
                  style: textTheme.labelSmall?.copyWith(
                    color: accentColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: accentColor.withAlpha(26),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: accentColor.withAlpha(77),
                    width: 2,
                  ),
                ),
                child: Icon(icon, color: accentColor, size: 32),
              ),
              const SizedBox(height: 16),

              Text(
                title,
                textAlign: TextAlign.center,
                style: textTheme.titleLarge?.copyWith(
                  color: accentColor,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 12),

              Text(
                description,
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 16),

              Container(
                width: 40,
                height: 3,
                decoration: BoxDecoration(
                  color: accentColor.withAlpha(153),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Sponsors Section
  Widget _buildSponsorsSection(ColorScheme colorScheme, TextTheme textTheme) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 40, 24, 40),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: colorScheme.secondary.withAlpha(26),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: colorScheme.secondary.withAlpha(77),
                  ),
                ),
                child: Icon(
                  Symbols.handshake,
                  color: colorScheme.secondary,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                'Our Sponsors',
                style: textTheme.headlineMedium?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: colorScheme.secondaryContainer.withAlpha(77),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Made possible by these amazing organizations',
              style: textTheme.bodyLarge?.copyWith(
                color: colorScheme.onSurface,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          const SizedBox(height: 32),

          Container(
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainer,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: colorScheme.outline),
            ),
            child: Column(
              children: [
                Icon(
                  Symbols.business,
                  color: colorScheme.onSurfaceVariant,
                  size: 48,
                ),
                const SizedBox(height: 16),
                Text(
                  'Your logo will appear here',
                  style: textTheme.bodyLarge?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 24),
                OutlinedButton.icon(
                  onPressed: _showInProgressDialog,
                  icon: Icon(Symbols.handshake),
                  label: Text('Become a Sponsor'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Volunteer Section
  Widget _buildVolunteerSection(ColorScheme colorScheme, TextTheme textTheme) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 40, 24, 40),
      color: colorScheme.surfaceContainer.withAlpha(26),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Symbols.volunteer_activism,
                color: colorScheme.secondary,
                size: 32,
              ),
              const SizedBox(width: 16),
              Text(
                'Volunteer With Us',
                style: textTheme.headlineMedium?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: colorScheme.secondaryContainer.withAlpha(77),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Help make Boot amazing for everyone',
              style: textTheme.bodyLarge?.copyWith(
                color: colorScheme.onSurface,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          const SizedBox(height: 32),

          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 1200) {
                return Row(
                  children: [
                    Expanded(
                      child: _buildSimpleVolunteerCard(
                        'Designer',
                        'Help create amazing visuals',
                        Symbols.brush,
                        colorScheme.primary,
                        colorScheme,
                        textTheme,
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: _buildSimpleVolunteerCard(
                        'Reviewer',
                        'Help review projects',
                        Symbols.gavel,
                        colorScheme.secondary,
                        colorScheme,
                        textTheme,
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: _buildSimpleVolunteerCard(
                        'Writer',
                        'Help create guides and materials',
                        Symbols.text_fields_sharp,
                        TerminalColors.yellow,
                        colorScheme,
                        textTheme,
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: _buildSimpleVolunteerCard(
                        'Anything Else',
                        'Whatever you can offer!',
                        Symbols.casino,
                        TerminalColors.blue,
                        colorScheme,
                        textTheme,
                      ),
                    ),
                  ],
                );
              } else if (constraints.maxWidth > 600) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: _buildSimpleVolunteerCard(
                            'Designer',
                            'Help create amazing visuals',
                            Symbols.brush,
                            colorScheme.primary,
                            colorScheme,
                            textTheme,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _buildSimpleVolunteerCard(
                            'Reviewer',
                            'Help review projects',
                            Symbols.gavel,
                            colorScheme.secondary,
                            colorScheme,
                            textTheme,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: _buildSimpleVolunteerCard(
                            'Writer',
                            'Help create guides and materials',
                            Symbols.text_fields_sharp,
                            TerminalColors.yellow,
                            colorScheme,
                            textTheme,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _buildSimpleVolunteerCard(
                            'Anything Else',
                            'Whatever you can offer!',
                            Symbols.casino,
                            TerminalColors.blue,
                            colorScheme,
                            textTheme,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              } else {
                return Column(
                  children: [
                    _buildSimpleVolunteerCard(
                      'Designer',
                      'Help create amazing visuals',
                      Symbols.brush,
                      colorScheme.primary,
                      colorScheme,
                      textTheme,
                    ),
                    const SizedBox(height: 16),
                    _buildSimpleVolunteerCard(
                      'Reviewer',
                      'Help review projects',
                      Symbols.gavel,
                      colorScheme.secondary,
                      colorScheme,
                      textTheme,
                    ),
                    const SizedBox(height: 16),
                    _buildSimpleVolunteerCard(
                      'Writer',
                      'Help create guides and materials',
                      Symbols.text_fields_sharp,
                      TerminalColors.yellow,
                      colorScheme,
                      textTheme,
                    ),
                    const SizedBox(height: 16),
                    _buildSimpleVolunteerCard(
                      'Anything Else',
                      'Whatever you can offer!',
                      Symbols.casino,
                      TerminalColors.blue,
                      colorScheme,
                      textTheme,
                    ),
                  ],
                );
              }
            },
          ),

          const SizedBox(height: 32),
          ElevatedButton.icon(
            onPressed: () => _navigateTo('Volunteer'),
            icon: Icon(Symbols.volunteer_activism),
            label: Text('Sign Up to Volunteer'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSimpleVolunteerCard(
    String title,
    String description,
    IconData icon,
    Color accentColor,
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: accentColor.withAlpha(77), width: 2),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: accentColor.withAlpha(26),
              shape: BoxShape.circle,
              border: Border.all(color: accentColor.withAlpha(77), width: 2),
            ),
            child: Icon(icon, color: accentColor, size: 32),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: textTheme.titleLarge?.copyWith(
              color: accentColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            textAlign: TextAlign.center,
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  // FAQ Section
  Widget _buildFAQSection(ColorScheme colorScheme, TextTheme textTheme) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 40, 24, 40),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: TerminalColors.yellow.withAlpha(26),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: TerminalColors.yellow.withAlpha(77),
                  ),
                ),
                child: Icon(
                  Symbols.quiz,
                  color: TerminalColors.yellow,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                'Frequently Asked Questions',
                style: textTheme.headlineMedium?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),

          _buildSimpleFAQItem(
            'Who can participate?',
            'Any teenager aged 13-18 can participate in Boot. No prior experience with OS development is required!',
            Symbols.group,
            colorScheme,
            textTheme,
          ),
          _buildSimpleFAQItem(
            'But I don\'t know how to make an OS',
            'That is great we will have resources to help you create your own OS!',
            Symbols.help,
            colorScheme,
            textTheme,
          ),
        ],
      ),
    );
  }

  Widget _buildSimpleFAQItem(
    String question,
    String answer,
    IconData icon,
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colorScheme.outline),
      ),
      child: ExpansionTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: colorScheme.primary.withAlpha(26),
            shape: BoxShape.circle,
            border: Border.all(color: colorScheme.primary.withAlpha(77)),
          ),
          child: Icon(icon, color: colorScheme.primary, size: 20),
        ),
        title: Text(
          question,
          style: textTheme.titleMedium?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconColor: colorScheme.primary,
        collapsedIconColor: colorScheme.onSurfaceVariant,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer.withAlpha(26),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: colorScheme.primary.withAlpha(51)),
            ),
            child: Text(
              answer,
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Footer
  Widget _buildFooter(ColorScheme colorScheme, TextTheme textTheme) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      color: colorScheme.surfaceContainerHighest,
      child: Column(
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: _buildFooterBrand(colorScheme, textTheme),
                    ),
                    const SizedBox(width: 32),
                    Expanded(child: _buildFooterLinks(colorScheme, textTheme)),
                  ],
                );
              } else {
                return Column(
                  children: [
                    _buildFooterBrand(colorScheme, textTheme),
                    const SizedBox(height: 24),
                    _buildFooterLinks(colorScheme, textTheme),
                  ],
                );
              }
            },
          ),

          const SizedBox(height: 32),
          Divider(color: colorScheme.outline),
          const SizedBox(height: 20),

          Row(
            children: [
              ElevatedButton.icon(
                onPressed: () => _launchUrl(donateUrl),
                icon: Icon(Symbols.favorite, size: 16),
                label: Text('Donate'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: TerminalColors.red,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFooterBrand(ColorScheme colorScheme, TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: colorScheme.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Symbols.terminal,
                color: colorScheme.onPrimary,
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              'Boot 2025',
              style: textTheme.headlineSmall?.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          'A hackathon where teens from around the world build operating systems.',
          style: textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildFooterLinks(ColorScheme colorScheme, TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Links',
          style: textTheme.titleMedium?.copyWith(
            color: colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        _buildFooterLink('RSVP', () => _navigateTo('RSVP')),
        _buildFooterLink('Volunteer', () => _navigateTo('Volunteer')),
        _buildFooterLink('Sponsor Us', () => _showInProgressDialog()),
        _buildFooterLink('Donate', () => _launchUrl(donateUrl)),
      ],
    );
  }

  Widget _buildFooterLink(String text, VoidCallback onPressed) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
          overlayColor: Theme.of(context).colorScheme.primary.withAlpha(26),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}
