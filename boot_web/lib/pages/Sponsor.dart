import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

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

  final List<Map<String, dynamic>> _sponsorTiers = [
    {
      'name': 'Bronze',
      'price': '\$500',
      'benefits': ['Logo on website', 'Social media mention'],
      'color': Color(0xFFCD7F32),
    },
    {
      'name': 'Silver',
      'price': '\$1,000',
      'benefits': [
        'Logo on website',
        'Social media mentions',
        'Newsletter mention',
      ],
      'color': Color(0xFFC0C0C0),
    },
    {
      'name': 'Gold',
      'price': '\$2,500',
      'benefits': [
        'Logo on website',
        'Social media mentions',
        'Newsletter mention',
        'Opening ceremony mention',
      ],
      'color': Color(0xFFFFD700),
    },
    {
      'name': 'Custom',
      'price': 'Let\'s talk',
      'benefits': ['Custom sponsorship package'],
      'color': Color(0xFF00FF00),
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

  Future<void> _submitSponsor() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSubmitting = true);

    // Your backend logic goes here
    await Future.delayed(Duration(seconds: 2)); // Simulate API call

    if (mounted) {
      setState(() => _isSubmitting = false);
      _showSuccessDialog();
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
        title: Row(
          children: [
            Icon(
              Symbols.handshake,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(width: 12),
            Text('Thanks for Your Interest!'),
          ],
        ),
        content: Text(
          'We\'ll review your sponsorship inquiry and get back to you within 48 hours to discuss next steps.',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop(); // Go back to main page
            },
            child: Text('Great!'),
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
      appBar: AppBar(
        title: Text('Sponsor Boot 2025'),
        backgroundColor: colorScheme.surface.withAlpha(242),
        foregroundColor: colorScheme.primary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),

              // Header
              Container(
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
                    Icon(
                      Symbols.handshake,
                      color: colorScheme.secondary,
                      size: 64,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Partner with Boot 2025',
                      style: textTheme.headlineLarge?.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Help empower the next generation of OS developers and get your brand in front of talented teen builders',
                      textAlign: TextAlign.center,
                      style: textTheme.bodyLarge?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // Sponsorship Tiers
              Container(
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
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: colorScheme.primary.withAlpha(26),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: colorScheme.primary.withAlpha(77),
                            ),
                          ),
                          child: Icon(
                            Symbols.workspace_premium,
                            color: colorScheme.primary,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Sponsorship Tiers',
                          style: textTheme.titleLarge?.copyWith(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: _sponsorTiers
                          .map(
                            (tier) =>
                                _buildTierCard(tier, colorScheme, textTheme),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Contact Form
              Container(
                width: double.infinity,
                constraints: const BoxConstraints(maxWidth: 600),
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainer,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: colorScheme.outline),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: colorScheme.secondary.withAlpha(26),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: colorScheme.secondary.withAlpha(77),
                            ),
                          ),
                          child: Icon(
                            Symbols.contact_mail,
                            color: colorScheme.secondary,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Get in Touch',
                          style: textTheme.titleLarge?.copyWith(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    TextFormField(
                      controller: _companyController,
                      decoration: InputDecoration(
                        labelText: 'Company Name',
                        hintText: 'Your company or organization',
                        prefixIcon: Icon(Symbols.business),
                        filled: true,
                        fillColor: colorScheme.surfaceContainerHighest
                            .withAlpha(128),
                      ),
                      validator: (value) => value?.trim().isEmpty ?? true
                          ? 'Company name is required'
                          : null,
                    ),
                    const SizedBox(height: 20),

                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: 'Your Name',
                        hintText: 'Contact person name',
                        prefixIcon: Icon(Symbols.person),
                        filled: true,
                        fillColor: colorScheme.surfaceContainerHighest
                            .withAlpha(128),
                      ),
                      validator: (value) => value?.trim().isEmpty ?? true
                          ? 'Name is required'
                          : null,
                    ),
                    const SizedBox(height: 20),

                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email Address',
                        hintText: 'contact@yourcompany.com',
                        prefixIcon: Icon(Symbols.email),
                        filled: true,
                        fillColor: colorScheme.surfaceContainerHighest
                            .withAlpha(128),
                      ),
                      validator: (value) {
                        if (value?.trim().isEmpty ?? true)
                          return 'Email is required';
                        if (!value!.contains('@') || !value.contains('.')) {
                          return 'Enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),

                    DropdownButtonFormField<String>(
                      value: _selectedTier,
                      decoration: InputDecoration(
                        labelText: 'Interested In',
                        prefixIcon: Icon(Symbols.workspace_premium),
                        filled: true,
                        fillColor: colorScheme.surfaceContainerHighest
                            .withAlpha(128),
                      ),
                      items: _sponsorTiers.map<DropdownMenuItem<String>>((
                        tier,
                      ) {
                        return DropdownMenuItem<String>(
                          value: tier['name'],
                          child: Text('${tier['name']} - ${tier['price']}'),
                        );
                      }).toList(),
                      onChanged: (value) =>
                          setState(() => _selectedTier = value!),
                    ),
                    const SizedBox(height: 20),

                    TextFormField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        labelText: 'Message (Optional)',
                        hintText:
                            'Tell us about your company and sponsorship goals...',
                        prefixIcon: Icon(Symbols.message),
                        alignLabelWithHint: true,
                        filled: true,
                        fillColor: colorScheme.surfaceContainerHighest
                            .withAlpha(128),
                      ),
                      maxLines: 4,
                    ),

                    const SizedBox(height: 32),

                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton.icon(
                        onPressed: _isSubmitting ? null : _submitSponsor,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colorScheme.secondary,
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
                            : Icon(Symbols.handshake),
                        label: Text(
                          _isSubmitting
                              ? 'Sending inquiry...'
                              : 'Send Sponsorship Inquiry',
                          style: textTheme.titleMedium?.copyWith(
                            color: colorScheme.onSecondary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Why Sponsor
              Container(
                constraints: const BoxConstraints(maxWidth: 600),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer.withAlpha(77),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: colorScheme.primary.withAlpha(77)),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Symbols.lightbulb,
                          color: colorScheme.primary,
                          size: 24,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Why Sponsor Boot?',
                                style: textTheme.titleMedium?.copyWith(
                                  color: colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '• Connect with talented teen developers\n• Support the next generation of OS builders\n• Showcase your brand to a passionate community\n• Get involved in groundbreaking tech education',
                                style: textTheme.bodyMedium?.copyWith(
                                  color: colorScheme.onSurface,
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTierCard(
    Map<String, dynamic> tier,
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    final isSelected = _selectedTier == tier['name'];

    return Container(
      width: 280,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => setState(() => _selectedTier = tier['name']),
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: isSelected
                  ? colorScheme.primaryContainer.withAlpha(77)
                  : colorScheme.surfaceContainerHighest.withAlpha(128),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected
                    ? colorScheme.primary.withAlpha(128)
                    : tier['color'].withAlpha(128),
                width: 2,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: tier['color'].withAlpha(26),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Symbols.workspace_premium,
                        color: tier['color'],
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tier['name'],
                          style: textTheme.titleLarge?.copyWith(
                            color: tier['color'],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          tier['price'],
                          style: textTheme.titleMedium?.copyWith(
                            color: colorScheme.onSurface,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    if (isSelected) ...[
                      const Spacer(),
                      Icon(
                        Symbols.check_circle,
                        color: colorScheme.primary,
                        size: 24,
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: (tier['benefits'] as List<String>)
                      .map(
                        (benefit) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: Row(
                            children: [
                              Icon(
                                Symbols.check,
                                color: tier['color'],
                                size: 16,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  benefit,
                                  style: textTheme.bodyMedium?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
