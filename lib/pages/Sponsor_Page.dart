import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import '/Services/supabase/Event_Registration.dart';

class SponsorPage extends StatefulWidget {
  const SponsorPage({super.key});

  @override
  State<SponsorPage> createState() => _SponsorPageState();
}

class _SponsorPageState extends State<SponsorPage> {
  final _formKey = GlobalKey<FormState>();
  final _companyController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  bool _isSubmitting = false;
  String _selectedTier = 'Bronze';
  String? _formError;

  final List<Map<String, dynamic>> _sponsorTiers = [
    {
      'name': 'Bronze',
      'price': '\$500',
      'benefits': [
        'Logo on website',
        'Social media mention',
        'Community recognition',
      ],
      'color': const Color(0xFFCD7F32),
    },
    {
      'name': 'Silver',
      'price': '\$1,000',
      'benefits': [
        'Logo on website',
        'Social media mentions',
        'Newsletter mention',
        'Event materials inclusion',
      ],
      'color': const Color(0xFFC0C0C0),
    },
    {
      'name': 'Gold',
      'price': '\$2,500',
      'benefits': [
        'Logo on website',
        'Social media mentions',
        'Newsletter mention',
        'Opening ceremony mention',
        'Judge participation opportunity',
      ],
      'color': const Color(0xFFFFD700),
    },
    {
      'name': 'Custom',
      'price': 'Let\'s discuss',
      'benefits': ['Custom sponsorship package tailored to your needs'],
      'color': const Color(0xFF00FF00),
    },
  ];

  @override
  void dispose() {
    _companyController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: _buildAppBar(colorScheme, textTheme),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              _buildHeader(colorScheme, textTheme),
              const SizedBox(height: 40),
              //Not Ready
              //_buildSponsorshipTiers(colorScheme, textTheme),
              //const SizedBox(height: 32),
              _buildWhySponsor(colorScheme, textTheme),
              const SizedBox(height: 24),
              _buildContactForm(colorScheme, textTheme),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return AppBar(
      title: Text(
        'Sponsor Boot',
        style: textTheme.headlineSmall?.copyWith(
          color: colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: colorScheme.surface.withAlpha(242),
      foregroundColor: colorScheme.primary,
      elevation: 0,
      scrolledUnderElevation: 4,
    );
  }

  Widget _buildHeader(ColorScheme colorScheme, TextTheme textTheme) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colorScheme.secondary.withAlpha(77),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: colorScheme.secondary.withAlpha(26),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: colorScheme.secondary.withAlpha(26),
              shape: BoxShape.circle,
              border: Border.all(
                color: colorScheme.secondary.withAlpha(77),
                width: 2,
              ),
            ),
            child: Icon(
              Symbols.handshake,
              color: colorScheme.secondary,
              size: 48,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Partner with Boot',
            style: textTheme.headlineLarge?.copyWith(
              color: colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Help empower the next generation of OS developers and connect with talented teen builders from around the world',
            textAlign: TextAlign.center,
            style: textTheme.bodyLarge?.copyWith(
              color: colorScheme.onSurfaceVariant,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSponsorshipTiers(ColorScheme colorScheme, TextTheme textTheme) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colorScheme.outline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader(
            'Sponsorship Tiers',
            'Choose the level that works best for your organization',
            Symbols.workspace_premium,
            colorScheme,
            textTheme,
          ),
          const SizedBox(height: 24),
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 1200) {
                return Row(
                  children: _sponsorTiers
                      .map(
                        (tier) => Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: _buildTierCard(tier, colorScheme, textTheme),
                          ),
                        ),
                      )
                      .toList(),
                );
              } else if (constraints.maxWidth > 800) {
                return Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: _sponsorTiers
                      .map(
                        (tier) => SizedBox(
                          width: (constraints.maxWidth - 32) / 2,
                          child: _buildTierCard(tier, colorScheme, textTheme),
                        ),
                      )
                      .toList(),
                );
              } else {
                return Column(
                  children: _sponsorTiers
                      .map(
                        (tier) => Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: _buildTierCard(tier, colorScheme, textTheme),
                        ),
                      )
                      .toList(),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTierCard(
    Map<String, dynamic> tier,
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    final isSelected = _selectedTier == tier['name'];
    final tierColor = tier['color'] as Color;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => setState(() => _selectedTier = tier['name']),
        borderRadius: BorderRadius.circular(12),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: isSelected
                ? colorScheme.primaryContainer.withAlpha(77)
                : colorScheme.surfaceContainerHighest.withAlpha(128),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected
                  ? colorScheme.primary.withAlpha(128)
                  : tierColor.withAlpha(128),
              width: 2,
            ),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: colorScheme.primary.withAlpha(26),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: tierColor.withAlpha(26),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: tierColor.withAlpha(77),
                        width: 1,
                      ),
                    ),
                    child: Icon(
                      Symbols.workspace_premium,
                      color: tierColor,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tier['name'],
                          style: textTheme.titleLarge?.copyWith(
                            color: tierColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          tier['price'],
                          style: textTheme.titleMedium?.copyWith(
                            color: colorScheme.onSurface,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (isSelected)
                    Icon(
                      Symbols.check_circle,
                      color: colorScheme.primary,
                      size: 28,
                    ),
                ],
              ),
              const SizedBox(height: 16),
              ...((tier['benefits'] as List<String>).map(
                (benefit) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Symbols.check, color: tierColor, size: 18),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          benefit,
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                            height: 1.3,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )).toList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactForm(ColorScheme colorScheme, TextTheme textTheme) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 700),
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colorScheme.outline),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withAlpha(13),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader(
            'Get in Touch',
            'Tell us about your organization and sponsorship interests',
            Symbols.contact_mail,
            colorScheme,
            textTheme,
          ),
          const SizedBox(height: 24),
          if (_formError != null) _buildErrorMessage(colorScheme, textTheme),
          _buildFormFields(colorScheme, textTheme),
          const SizedBox(height: 32),
          _buildSubmitButton(colorScheme, textTheme),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(
    String title,
    String subtitle,
    IconData icon,
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: colorScheme.secondary.withAlpha(26),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: colorScheme.secondary.withAlpha(77)),
              ),
              child: Icon(icon, color: colorScheme.secondary, size: 20),
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: textTheme.titleLarge?.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildErrorMessage(ColorScheme colorScheme, TextTheme textTheme) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.errorContainer,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: colorScheme.error),
      ),
      child: Row(
        children: [
          Icon(Symbols.error, color: colorScheme.error, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              _formError!,
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onErrorContainer,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormFields(ColorScheme colorScheme, TextTheme textTheme) {
    return Column(
      children: [
        _buildTextFormField(
          controller: _companyController,
          label: 'Company Name',
          hint: 'Your company or organization',
          icon: Symbols.business,
          validator: (value) => _validateRequired(value, 'Company name'),
          colorScheme: colorScheme,
        ),
        const SizedBox(height: 20),
        _buildTextFormField(
          controller: _nameController,
          label: 'Your Name',
          hint: 'Contact person name',
          icon: Symbols.person,
          validator: (value) => _validateRequired(value, 'Name'),
          colorScheme: colorScheme,
        ),
        const SizedBox(height: 20),
        _buildTextFormField(
          controller: _emailController,
          label: 'Email Address',
          hint: 'contact@yourcompany.com',
          icon: Symbols.email,
          validator: _validateEmail,
          keyboardType: TextInputType.emailAddress,
          colorScheme: colorScheme,
        ),
        const SizedBox(height: 20),
        //Not Ready
        //_buildTierDropdown(colorScheme, textTheme),
        const SizedBox(height: 20),
        _buildTextFormField(
          controller: _messageController,
          label: 'Message (Optional)',
          hint: 'Tell us about your company and sponsorship goals...',
          icon: Symbols.message,
          maxLines: 4,
          colorScheme: colorScheme,
        ),
      ],
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    String? Function(String?)? validator,
    TextInputType? keyboardType,
    int maxLines = 1,
    required ColorScheme colorScheme,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon),
        alignLabelWithHint: maxLines > 1,
        filled: true,
        fillColor: colorScheme.surfaceContainerHighest.withAlpha(128),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.error, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.error, width: 2),
        ),
      ),
      validator: validator,
      keyboardType: keyboardType,
      maxLines: maxLines,
      enabled: !_isSubmitting,
    );
  }

  Widget _buildTierDropdown(ColorScheme colorScheme, TextTheme textTheme) {
    return DropdownButtonFormField<String>(
      value: _selectedTier,
      decoration: InputDecoration(
        labelText: 'Interested Sponsorship Tier',
        prefixIcon: const Icon(Symbols.workspace_premium),
        filled: true,
        fillColor: colorScheme.surfaceContainerHighest.withAlpha(128),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
      ),
      dropdownColor: colorScheme.surfaceContainer,
      items: _sponsorTiers.map<DropdownMenuItem<String>>((tier) {
        return DropdownMenuItem<String>(
          value: tier['name'],
          child: Row(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: tier['color'],
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text('${tier['name']} - ${tier['price']}'),
            ],
          ),
        );
      }).toList(),
      onChanged: _isSubmitting
          ? null
          : (value) {
              setState(() => _selectedTier = value!);
            },
    );
  }

  Widget _buildSubmitButton(ColorScheme colorScheme, TextTheme textTheme) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton.icon(
        onPressed: _isSubmitting ? null : _submitSponsor,
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.secondary,
          foregroundColor: colorScheme.onSecondary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: _isSubmitting ? 0 : 2,
        ),
        icon: _isSubmitting
            ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    colorScheme.onSecondary,
                  ),
                ),
              )
            : const Icon(Symbols.handshake),
        label: Text(
          _isSubmitting ? 'Sending inquiry...' : 'Send Sponsorship Inquiry',
          style: textTheme.titleMedium?.copyWith(
            color: colorScheme.onSecondary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildWhySponsor(ColorScheme colorScheme, TextTheme textTheme) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 700),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer.withAlpha(77),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.primary.withAlpha(77)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Symbols.lightbulb, color: colorScheme.primary, size: 28),
              const SizedBox(width: 16),
              Text(
                'Why Sponsor Boot?',
                style: textTheme.titleLarge?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ..._buildWhySponsorPoints(colorScheme, textTheme),
        ],
      ),
    );
  }

  List<Widget> _buildWhySponsorPoints(
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    final points = [
      {
        'icon': Symbols.emoji_events,
        'title': 'Power Prizes & Awards',
        'description':
            'Fund prizes, swag, and hardware awards that motivate teen OS builders',
      },
      {
        'icon': Symbols.memory,
        'title': 'Enable Tools & Credits',
        'description':
            'Provide product licenses, infrastructure credits, or devices that gets your product exposure while also accelerating real OS projects',
      },
      {
        'icon': Symbols.card_giftcard,
        'title': 'Support Boot Operations',
        'description':
            'Offer tools, credits, or other resources to help Boot run smoothly',
      },
      {
        'icon': Symbols.handshake,
        'title': 'Community Goodwill',
        'description':
            'Be recognized as a supporter of accessible tech education and youth-led innovation',
      },
    ];

    return points
        .map(
          (point) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  point['icon'] as IconData,
                  color: colorScheme.primary,
                  size: 20,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        point['title'] as String,
                        style: textTheme.titleSmall?.copyWith(
                          color: colorScheme.onSurface,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        point['description'] as String,
                        style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
        .toList();
  }

  // Validation methods
  String? _validateRequired(String? value, String fieldName) {
    if (value?.trim().isEmpty ?? true) {
      return '$fieldName is required';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value?.trim().isEmpty ?? true) {
      return 'Email is required';
    }

    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    if (!emailRegex.hasMatch(value!.trim())) {
      return 'Please enter a valid email address';
    }

    return null;
  }

  // Form submission
  Future<void> _submitSponsor() async {
    setState(() {
      _formError = null;
    });

    if (!_formKey.currentState!.validate()) {
      setState(() {
        _formError = 'Please fix the errors below and try again';
      });
      return;
    }

    setState(() => _isSubmitting = true);

    try {
      Event_Registration.Sponsor(
        _companyController.text.trim(),
        _nameController.text.trim(),
        _emailController.text.trim(),
        _messageController.text.trim(),
      );

      if (mounted) {
        setState(() => _isSubmitting = false);
        _showSuccessDialog();
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
          _formError =
              'Failed to send inquiry: ${e.toString()}. Please try again.';
        });
      }
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Theme.of(context).colorScheme.outline),
        ),
        title: Row(
          children: [
            Icon(
              Symbols.check_circle,
              color: Theme.of(context).colorScheme.primary,
              size: 28,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                'Thanks for Your Interest!',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        content: Text(
          'We\'ve received your sponsorship inquiry. Our team will review your submission and get back to you within 48 hours to discuss next steps.\n\nThank you for considering a partnership with Boot!',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            height: 1.5,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close dialog
              Navigator.of(context).pop(); // Go back to main page
            },
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.primary,
            ),
            child: const Text('Great!'),
          ),
        ],
      ),
    );
  }
}
