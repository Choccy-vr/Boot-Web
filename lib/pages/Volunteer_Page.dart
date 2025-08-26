import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import '/Services/supabase/Event_Registration.dart';

class VolunteerPage extends StatefulWidget {
  const VolunteerPage({super.key});

  @override
  State<VolunteerPage> createState() => _VolunteerPageState();
}

class _VolunteerPageState extends State<VolunteerPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _experienceController = TextEditingController();
  final _anythingElseController = TextEditingController();

  bool _isSubmitting = false;
  final Set<String> _selectedRoles = {};
  final Set<String> _selectedSkills = {};

  final List<Map<String, dynamic>> _volunteerRoles = [
    {
      'id': 'designer',
      'title': 'Designer',
      'description': 'Create visuals, logos, and marketing materials',
      'icon': Symbols.brush,
    },
    {
      'id': 'reviewer',
      'title': 'Project Reviewer',
      'description': 'Help evaluate and provide feedback on OS projects',
      'icon': Symbols.gavel,
    },
    {
      'id': 'writer',
      'title': 'Content Writer',
      'description': 'Create guides, tutorials, and documentation',
      'icon': Symbols.text_fields_sharp,
    },
    {
      'id': 'organizer',
      'title': 'Event Organizer',
      'description': 'Help coordinate Boot, talk with potential sponsors, etc.',
      'icon': Symbols.event,
    },
    {
      'id': 'anything_else',
      'title': 'Anything Else',
      'description': 'Would like to contribute in other ways not listed',
      'icon': Symbols.casino,
    },
  ];

  final List<String> _skills = [
    'Graphic Design',
    'Web Development',
    'System Administration',
    'Linux/Unix',
    'Technical Writing',
    'Event Management',
    'Kernel Development',
    'Operating Systems Development',
    'C/C++',
    'Dart',
    'Bash/Shell Scripting',
    'Supabase',
    'Distro Building (LFS/Buildroot/Yocto)',
    'Virtualization (QEMU/VirtualBox)',
    'System Security/Hardening',
    'UI/UX Design',
    'Community Moderation',
    'Outreach & Sponsorships',
    'Other (Tell us in field below)',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _experienceController.dispose();
    _anythingElseController.dispose();
    super.dispose();
  }

  Future<void> _submitVolunteer() async {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedRoles.isEmpty) {
      _showError('Please select at least one volunteer role');
      return;
    }

    setState(() => _isSubmitting = true);

    await Event_Registration.Volunteer(
      _nameController.text.trim(),
      _emailController.text.trim(),
      _selectedRoles.toList(),
      _anythingElseController.text.trim(),
      _selectedSkills.toList(),
      _experienceController.text.trim(),
    );

    if (mounted) {
      setState(() => _isSubmitting = false);
      _showSuccessDialog();
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(context).colorScheme.error,
      ),
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
        title: Row(
          children: [
            Icon(
              Symbols.volunteer_activism,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(width: 12),
            Text('Thanks for Volunteering!'),
          ],
        ),
        content: Text(
          'We appreciate you wanting to help make Boot Hackathon amazing! We\'ll contact you once needed.',
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
        title: Text('Volunteer for Boot 2025'),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerLowest,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: colorScheme.secondary.withAlpha(77),
                    width: 2,
                  ),
                ),
                child: Column(
                  children: [
                    Icon(
                      Symbols.volunteer_activism,
                      color: colorScheme.secondary,
                      size: 48,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Help Make Boot Amazing!',
                      style: textTheme.headlineMedium?.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Join our team and help create an incredible experience for teen OS builders',
                      textAlign: TextAlign.center,
                      style: textTheme.bodyLarge?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Basic Info Section
              _buildSection(
                'Basic Information',
                Symbols.person,
                colorScheme,
                textTheme,
                [
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Name *',
                      hintText:
                          'Enter your name or what you liked to be called',
                      prefixIcon: Icon(Symbols.badge),
                    ),
                    validator: (value) =>
                        value?.isEmpty ?? true ? 'Name is required' : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email Address *',
                      hintText: 'your.email@example.com',
                      prefixIcon: Icon(Symbols.email),
                    ),
                    validator: (value) {
                      if (value?.isEmpty ?? true) return 'Email is required';
                      if (!value!.contains('@')) return 'Enter a valid email';
                      return null;
                    },
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Volunteer Roles Section
              _buildSection(
                'What Would You Like To Help With?',
                Symbols.handshake,
                colorScheme,
                textTheme,
                [
                  Text(
                    'Select all roles that interest you:',
                    style: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ...(_volunteerRoles
                      .map(
                        (role) => _buildRoleCard(role, colorScheme, textTheme),
                      )
                      .toList()),

                  // "Anything Else" explanation field - appears when selected
                  if (_selectedRoles.contains('anything_else')) ...[
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: colorScheme.primaryContainer.withAlpha(77),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: colorScheme.primary.withAlpha(77),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Symbols.edit,
                                color: colorScheme.primary,
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Tell us more about how you\'d like to help:',
                                style: textTheme.titleMedium?.copyWith(
                                  color: colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: _anythingElseController,
                            decoration: InputDecoration(
                              hintText:
                                  'e.g., "I can help with social media promotion", "I have experience with streaming/recording", "I can help moderate Discord"...',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor: colorScheme.surface.withAlpha(128),
                            ),
                            maxLines: 3,
                            validator: _selectedRoles.contains('anything_else')
                                ? (value) => value?.trim().isEmpty ?? true
                                      ? 'Please tell us how you\'d like to help'
                                      : null
                                : null,
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),

              const SizedBox(height: 24),

              // Skills Section
              _buildSection(
                'Your Skills',
                Symbols.psychology,
                colorScheme,
                textTheme,
                [
                  Text(
                    'Select your relevant skills:',
                    style: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: _skills
                        .map(
                          (skill) => FilterChip(
                            label: Text(skill),
                            selected: _selectedSkills.contains(skill),
                            onSelected: (selected) {
                              setState(() {
                                if (selected) {
                                  _selectedSkills.add(skill);
                                } else {
                                  _selectedSkills.remove(skill);
                                }
                              });
                            },
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _experienceController,
                    decoration: InputDecoration(
                      labelText: 'Tell us about your experience',
                      hintText: 'What makes you excited to help with Boot?',
                      prefixIcon: Icon(Symbols.description),
                    ),
                    maxLines: 3,
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // Submit Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton.icon(
                  onPressed: _isSubmitting ? null : _submitVolunteer,
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
                      : Icon(Symbols.volunteer_activism),
                  label: Text(
                    _isSubmitting
                        ? 'Submitting Application...'
                        : 'Submit Volunteer Application',
                    style: textTheme.titleMedium?.copyWith(
                      color: colorScheme.onSecondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Info Text
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: colorScheme.secondaryContainer.withAlpha(77),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: colorScheme.secondary.withAlpha(77),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(Symbols.info, color: colorScheme.secondary, size: 20),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'We\'ll review your application and get back to you with more details about volunteering opportunities!',
                        style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurface,
                        ),
                      ),
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

  Widget _buildRoleCard(
    Map<String, dynamic> role,
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    final isSelected = _selectedRoles.contains(role['id']);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            setState(() {
              if (isSelected) {
                _selectedRoles.remove(role['id']);
                // Clear the "anything else" field if deselecting
                if (role['id'] == 'anything_else') {
                  _anythingElseController.clear();
                }
              } else {
                _selectedRoles.add(role['id']);
              }
            });
          },
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isSelected
                  ? colorScheme.primaryContainer.withAlpha(77)
                  : colorScheme.surfaceContainerHighest.withAlpha(128),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected
                    ? colorScheme.primary.withAlpha(128)
                    : colorScheme.outline.withAlpha(128),
                width: 2,
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? colorScheme.primary.withAlpha(26)
                        : colorScheme.onSurfaceVariant.withAlpha(26),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    role['icon'],
                    color: isSelected
                        ? colorScheme.primary
                        : colorScheme.onSurfaceVariant,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        role['title'],
                        style: textTheme.titleMedium?.copyWith(
                          color: isSelected
                              ? colorScheme.primary
                              : colorScheme.onSurface,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        role['description'],
                        style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                if (isSelected)
                  Icon(
                    Symbols.check_circle,
                    color: colorScheme.primary,
                    size: 24,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection(
    String title,
    IconData icon,
    ColorScheme colorScheme,
    TextTheme textTheme,
    List<Widget> children,
  ) {
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
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: colorScheme.primary.withAlpha(26),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: colorScheme.primary.withAlpha(77)),
                ),
                child: Icon(icon, color: colorScheme.primary, size: 20),
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
          const SizedBox(height: 20),
          ...children,
        ],
      ),
    );
  }
}
