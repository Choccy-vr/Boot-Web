import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import '/Services/supabase/Event_Registration.dart';

class RSVPPage extends StatefulWidget {
  const RSVPPage({super.key});

  @override
  State<RSVPPage> createState() => _RSVPPageState();
}

class _RSVPPageState extends State<RSVPPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();

  bool _isSubmitting = false;
  bool _wantsUpdates = true;

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _submitRSVP() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSubmitting = true);

    await Event_Registration.RSVP(
      _nameController.text.trim(),
      _emailController.text.trim(),
      _wantsUpdates,
    );

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
              Symbols.check_circle,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(width: 12),
            Text('You\'re in!'),
          ],
        ),
        content: Text(
          'Thanks for signing up! We\'ll send you all the details as we get closer to Winter 2025.',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop(); // Go back to main page
            },
            child: Text('Awesome!'),
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
        title: Text('RSVP for Boot 2025'),
        backgroundColor: colorScheme.surface.withAlpha(242),
        foregroundColor: colorScheme.primary,
        leading: IconButton(
          icon: Icon(Symbols.arrow_back),
          tooltip: 'Back',
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),

              // Header
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
                  children: [
                    Icon(
                      Symbols.rocket_launch,
                      color: colorScheme.primary,
                      size: 64,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Join Boot 2025!',
                      style: textTheme.headlineLarge?.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Build your own operating system with teens from around the world',
                      textAlign: TextAlign.center,
                      style: textTheme.bodyLarge?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 8),
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
              ),

              const SizedBox(height: 40),

              // Form
              Container(
                width: double.infinity,
                constraints: const BoxConstraints(maxWidth: 500),
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainer,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: colorScheme.outline),
                ),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        hintText: 'Your name',
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
                        hintText: 'your.email@example.com',
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
                    const SizedBox(height: 24),

                    CheckboxListTile(
                      title: Text('Send me updates about Boot'),
                      subtitle: Text(
                        'Event details, resources, and announcements',
                      ),
                      value: _wantsUpdates,
                      onChanged: (value) =>
                          setState(() => _wantsUpdates = value ?? true),
                      contentPadding: EdgeInsets.zero,
                    ),

                    const SizedBox(height: 32),

                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton.icon(
                        onPressed: _isSubmitting ? null : _submitRSVP,
                        icon: _isSubmitting
                            ? SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    colorScheme.onPrimary,
                                  ),
                                ),
                              )
                            : Icon(Symbols.rocket_launch),
                        label: Text(
                          _isSubmitting ? 'Signing you up...' : 'Count me in!',
                          style: textTheme.titleMedium?.copyWith(
                            color: colorScheme.onPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
