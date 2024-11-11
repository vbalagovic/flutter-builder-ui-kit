import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_builder_ui/flutter_builder_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OverlayExamplesScreen extends StatefulWidget {
  const OverlayExamplesScreen({super.key});

  @override
  State<OverlayExamplesScreen> createState() => _OverlayExamplesScreenState();
}

class _OverlayExamplesScreenState extends State<OverlayExamplesScreen> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          padding: const EdgeInsets.all(24),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ... (previous imports and initial code remains the same)

                  _buildSection(
                    context: context,
                    title: 'Styled Dialogs',
                    description:
                        'Customizable dialog overlays with various styles and animations',
                    examples: [
                      _OverlayExample(
                        title: 'Basic Dialog',
                        example: ElevatedButton(
                          child: const Text('Show Basic Dialog'),
                          onPressed: () {
                            StyledDialog.show(
                              context: context,
                              title: 'Welcome Back!',
                              message:
                                  'We\'re glad to see you again. Ready to continue your journey?',
                              icon: FontAwesomeIcons.hand,
                              actions: [
                                DialogAction(
                                  label: 'Cancel',
                                  onPressed: () => Navigator.pop(context),
                                ),
                                DialogAction(
                                  label: 'Continue',
                                  isPrimary: true,
                                  onPressed: () => Navigator.pop(context),
                                ),
                              ],
                            );
                          },
                        ),
                        codeSnippet: '''
StyledDialog.show(
  context: context,
  title: 'Welcome Back!',
  message: 'We're glad to see you again. Ready to continue your journey?',
  icon: FontAwesomeIcons.hand,
  actions: [
    DialogAction(
      label: 'Cancel',
      onPressed: () => Navigator.pop(context),
    ),
    DialogAction(
      label: 'Continue',
      isPrimary: true,
      onPressed: () => Navigator.pop(context),
    ),
  ],
);''',
                      ),
                      _OverlayExample(
                        title: 'Destructive Dialog',
                        example: ElevatedButton(
                          child: const Text('Show Destructive Dialog'),
                          onPressed: () {
                            StyledDialog.show(
                              context: context,
                              title: 'Delete Account',
                              message:
                                  'Are you sure you want to delete your account? This action cannot be undone.',
                              icon: FontAwesomeIcons.triangleExclamation,
                              iconColor: Theme.of(context).colorScheme.error,
                              actions: [
                                DialogAction(
                                  label: 'Cancel',
                                  onPressed: () => Navigator.pop(context),
                                ),
                                DialogAction(
                                  label: 'Delete',
                                  isDestructive: true,
                                  isPrimary: true,
                                  onPressed: () => Navigator.pop(context),
                                ),
                              ],
                            );
                          },
                        ),
                        codeSnippet: '''
StyledDialog.show(
  context: context,
  title: 'Delete Account',
  message: 'Are you sure you want to delete your account? This action cannot be undone.',
  icon: FontAwesomeIcons.triangleExclamation,
  iconColor: Theme.of(context).colorScheme.error,
  actions: [
    DialogAction(
      label: 'Cancel',
      onPressed: () => Navigator.pop(context),
    ),
    DialogAction(
      label: 'Delete',
      isDestructive: true,
      isPrimary: true,
      onPressed: () => Navigator.pop(context),
    ),
  ],
);''',
                      ),
                      _OverlayExample(
                        title: 'Form Dialog',
                        example: ElevatedButton(
                          child: const Text('Show Form Dialog'),
                          onPressed: () {
                            final formKey = GlobalKey<FormState>();
                            String? email;
                            String? password;

                            StyledDialog.show(
                              context: context,
                              title: 'Create Account',
                              content: Form(
                                key: formKey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextFormField(
                                      decoration: const InputDecoration(
                                        labelText: 'Email',
                                        prefixIcon:
                                            Icon(FontAwesomeIcons.envelope),
                                      ),
                                      keyboardType: TextInputType.emailAddress,
                                      validator: (value) {
                                        if (value?.isEmpty ?? true) {
                                          return 'Please enter your email';
                                        }
                                        if (!value!.contains('@')) {
                                          return 'Please enter a valid email';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) => email = value,
                                    ),
                                    const SizedBox(height: 16),
                                    TextFormField(
                                      decoration: const InputDecoration(
                                        labelText: 'Password',
                                        prefixIcon: Icon(FontAwesomeIcons.lock),
                                      ),
                                      obscureText: true,
                                      validator: (value) {
                                        if (value?.isEmpty ?? true) {
                                          return 'Please enter a password';
                                        }
                                        if (value!.length < 6) {
                                          return 'Password must be at least 6 characters';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) => password = value,
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                DialogAction(
                                  label: 'Cancel',
                                  onPressed: () => Navigator.pop(context),
                                ),
                                DialogAction(
                                  label: 'Create',
                                  isPrimary: true,
                                  onPressed: () {
                                    if (formKey.currentState?.validate() ??
                                        false) {
                                      formKey.currentState?.save();
                                      Navigator.pop(context);
                                      // Handle form submission
                                    }
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                        codeSnippet: '''
final formKey = GlobalKey<FormState>();
String? email;
String? password;

StyledDialog.show(
  context: context,
  title: 'Create Account',
  content: Form(
    key: formKey,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Email',
            prefixIcon: Icon(FontAwesomeIcons.envelope),
          ),
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return 'Please enter your email';
            }
            if (!value!.contains('@')) {
              return 'Please enter a valid email';
            }
            return null;
          },
          onSaved: (value) => email = value,
        ),
        const SizedBox(height: 16),
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Password',
            prefixIcon: Icon(FontAwesomeIcons.lock),
          ),
          obscureText: true,
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return 'Please enter a password';
            }
            if (value!.length < 6) {
              return 'Password must be at least 6 characters';
            }
            return null;
          },
          onSaved: (value) => password = value,
        ),
      ],
    ),
  ),
  actions: [
    DialogAction(
      label: 'Cancel',
      onPressed: () => Navigator.pop(context),
    ),
    DialogAction(
      label: 'Create',
      isPrimary: true,
      onPressed: () {
        if (formKey.currentState?.validate() ?? false) {
          formKey.currentState?.save();
          Navigator.pop(context);
          // Handle form submission
        }
      },
    ),
  ],
);''',
                      ),
                    ],
                  ),
                  _buildSection(
                    context: context,
                    title: 'Bottom Sheets',
                    description:
                        'Modal bottom sheets with customizable content and actions',
                    examples: [
                      _OverlayExample(
                        title: 'Basic Bottom Sheet',
                        example: ElevatedButton(
                          child: const Text('Show Bottom Sheet'),
                          onPressed: () {
                            StyledBottomSheet.show(
                              context: context,
                              title: 'Filter Options',
                              message: 'Customize your search results',
                              content: Column(
                                children: [
                                  const TextField(
                                    decoration: InputDecoration(
                                      labelText: 'Price Range',
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  ElevatedButton(
                                    child: const Text('Apply Filters'),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        codeSnippet: '''
StyledBottomSheet.show(
  context: context,
  title: 'Filter Options',
  message: 'Customize your search results',
  content: Column(
    children: [
      const TextField(
        decoration: InputDecoration(
          labelText: 'Price Range',
        ),
      ),
      const SizedBox(height: 16),
      ElevatedButton(
        child: const Text('Apply Filters'),
        onPressed: () => Navigator.pop(context),
      ),
    ],
  ),
);''',
                      ),
                      _OverlayExample(
                        title: 'Action Sheet',
                        example: ElevatedButton(
                          child: const Text('Show Action Sheet'),
                          onPressed: () {
                            ActionSheet.show(
                              context: context,
                              actions: [
                                ActionSheetItem(
                                  label: 'Take Photo',
                                  icon: FontAwesomeIcons.camera,
                                  onPressed: () {},
                                ),
                                ActionSheetItem(
                                  label: 'Choose from Gallery',
                                  icon: FontAwesomeIcons.image,
                                  onPressed: () {},
                                ),
                                ActionSheetItem(
                                  label: 'Delete',
                                  icon: FontAwesomeIcons.trash,
                                  isDestructive: true,
                                  onPressed: () {},
                                ),
                              ],
                              cancelLabel: 'Cancel',
                            );
                          },
                        ),
                        codeSnippet: '''
ActionSheet.show(
  context: context,
  actions: [
    ActionSheetItem(
      label: 'Take Photo',
      icon: FontAwesomeIcons.camera,
      onPressed: () {},
    ),
    ActionSheetItem(
      label: 'Choose from Gallery',
      icon: FontAwesomeIcons.image,
      onPressed: () {},
    ),
    ActionSheetItem(
      label: 'Delete',
      icon: FontAwesomeIcons.trash,
      isDestructive: true,
      onPressed: () {},
    ),
  ],
  cancelLabel: 'Cancel',
);''',
                      ),
                      _OverlayExample(
                        title: 'Form Bottom Sheet',
                        example: ElevatedButton(
                          child: const Text('Show Form Sheet'),
                          onPressed: () {
                            final formKey = GlobalKey<FormState>();
                            final addressController = TextEditingController();
                            final cityController = TextEditingController();
                            final zipController = TextEditingController();

                            StyledBottomSheet.show(
                              context: context,
                              title: 'Delivery Address',
                              content: Form(
                                key: formKey,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      controller: addressController,
                                      decoration: const InputDecoration(
                                        labelText: 'Street Address',
                                        prefixIcon:
                                            Icon(FontAwesomeIcons.locationDot),
                                      ),
                                      validator: (value) =>
                                          value?.isEmpty ?? true
                                              ? 'Required'
                                              : null,
                                    ),
                                    const SizedBox(height: 16),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: TextFormField(
                                            controller: cityController,
                                            decoration: const InputDecoration(
                                              labelText: 'City',
                                              prefixIcon:
                                                  Icon(FontAwesomeIcons.city),
                                            ),
                                            validator: (value) =>
                                                value?.isEmpty ?? true
                                                    ? 'Required'
                                                    : null,
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        Expanded(
                                          child: TextFormField(
                                            controller: zipController,
                                            decoration: const InputDecoration(
                                              labelText: 'ZIP',
                                              prefixIcon: Icon(FontAwesomeIcons
                                                  .envelopeCircleCheck),
                                            ),
                                            keyboardType: TextInputType.number,
                                            validator: (value) =>
                                                value?.isEmpty ?? true
                                                    ? 'Required'
                                                    : null,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                SizedBox(
                                  width: double.infinity,
                                  child: FilledButton(
                                    onPressed: () {
                                      if (formKey.currentState?.validate() ??
                                          false) {
                                        Navigator.pop(context);
                                        // Handle address submission
                                      }
                                    },
                                    child: const Text('Save Address'),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        codeSnippet: '''
final formKey = GlobalKey<FormState>();
final addressController = TextEditingController();
final cityController = TextEditingController();
final zipController = TextEditingController();

StyledBottomSheet.show(
  context: context,
  title: 'Delivery Address',
  content: Form(
    key: formKey,
    child: Column(
      children: [
        TextFormField(
          controller: addressController,
          decoration: const InputDecoration(
            labelText: 'Street Address',
            prefixIcon: Icon(FontAwesomeIcons.locationDot),
          ),
          validator: (value) =>
              value?.isEmpty ?? true ? 'Required' : null,
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: TextFormField(
                controller: cityController,
                decoration: const InputDecoration(
                  labelText: 'City',
                  prefixIcon: Icon(FontAwesomeIcons.city),
                ),
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Required' : null,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: TextFormField(
                controller: zipController,
                decoration: const InputDecoration(
                  labelText: 'ZIP',
                  prefixIcon: Icon(FontAwesomeIcons.envelopeCircleCheck),
                ),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Required' : null,
              ),
            ),
          ],
        ),
      ],
    ),
  ),
  actions: [
    SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: () {
          if (formKey.currentState?.validate() ?? false) {
            Navigator.pop(context);
            // Handle address submission
          }
        },
        child: const Text('Save Address'),
      ),
    ),
  ],
);''',
                      ),
                    ],
                  ),
                  _buildSection(
                      context: context,
                      title: 'Popover Menu',
                      description:
                          'Contextual popup menus with various options',
                      examples: [
                        _OverlayExample(
                          title: 'Basic Popover',
                          example: SizedBox(
                            height: 80, // Fixed height for consistent layout
                            child: Center(
                              child: GestureDetector(
                                onTapDown: (details) {
                                  final RenderBox overlay = Overlay.of(context)
                                      .context
                                      .findRenderObject() as RenderBox;
                                  final RenderBox button =
                                      context.findRenderObject() as RenderBox;
                                  final buttonPosition = button.localToGlobal(
                                      Offset.zero,
                                      ancestor: overlay);

                                  showMenu(
                                    context: context,
                                    position: RelativeRect.fromLTRB(
                                      buttonPosition.dx,
                                      buttonPosition.dy + button.size.height,
                                      buttonPosition.dx + button.size.width,
                                      buttonPosition.dy +
                                          button.size.height +
                                          200, // Approximate menu height
                                    ),
                                    items: [
                                      PopupMenuItem(
                                        child: Row(
                                          children: [
                                            Icon(FontAwesomeIcons.pen,
                                                size: 16,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSurface),
                                            const SizedBox(width: 12),
                                            const Text('Edit'),
                                          ],
                                        ),
                                        onTap: () {},
                                      ),
                                      PopupMenuItem(
                                        child: Row(
                                          children: [
                                            Icon(FontAwesomeIcons.share,
                                                size: 16,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSurface),
                                            const SizedBox(width: 12),
                                            const Text('Share'),
                                          ],
                                        ),
                                        onTap: () {},
                                      ),
                                      PopupMenuItem(
                                        child: Row(
                                          children: [
                                            Icon(FontAwesomeIcons.trash,
                                                size: 16,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .error),
                                            const SizedBox(width: 12),
                                            Text('Delete',
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .error)),
                                          ],
                                        ),
                                        onTap: () {},
                                      ),
                                    ],
                                  );
                                },
                                child: ElevatedButton.icon(
                                  icon: const Icon(Icons.more_vert),
                                  label: const Text('Show Menu'),
                                  onPressed: null,
                                ),
                              ),
                            ),
                          ),
                          codeSnippet: '''
GestureDetector(
  onTapDown: (details) {
    final RenderBox overlay = Overlay.of(context)
        .context
        .findRenderObject() as RenderBox;
    final RenderBox button =
        context.findRenderObject() as RenderBox;
    final buttonPosition =
        button.localToGlobal(Offset.zero, ancestor: overlay);

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        buttonPosition.dx,
        buttonPosition.dy + button.size.height,
        buttonPosition.dx + button.size.width,
        buttonPosition.dy + button.size.height + 200,
      ),
      items: [
        PopupMenuItem(
          child: Row(
            children: [
              Icon(FontAwesomeIcons.pen,
                  size: 16,
                  color: Theme.of(context).colorScheme.onSurface),
              const SizedBox(width: 12),
              const Text('Edit'),
            ],
          ),
          onTap: () {},
        ),
        PopupMenuItem(
          child: Row(
            children: [
              Icon(FontAwesomeIcons.share,
                  size: 16,
                  color: Theme.of(context).colorScheme.onSurface),
              const SizedBox(width: 12),
              const Text('Share'),
            ],
          ),
          onTap: () {},
        ),
        PopupMenuItem(
          child: Row(
            children: [
              Icon(FontAwesomeIcons.trash,
                  size: 16,
                  color: Theme.of(context).colorScheme.error),
              const SizedBox(width: 12),
              Text('Delete',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.error)),
            ],
          ),
          onTap: () {},
        ),
      ],
    );
  },
  child: ElevatedButton.icon(
    icon: const Icon(Icons.more_vert),
    label: const Text('Show Menu'),
    onPressed: null,
  ),
),''',
                        ),
                        _OverlayExample(
                          title: 'Context Menu',
                          example: SizedBox(
                            height: 80,
                            child: Center(
                              child: GestureDetector(
                                onSecondaryTapDown: (details) {
                                  showMenu(
                                    context: context,
                                    position: RelativeRect.fromLTRB(
                                      details.globalPosition.dx,
                                      details.globalPosition.dy,
                                      details.globalPosition.dx + 1,
                                      details.globalPosition.dy + 1,
                                    ),
                                    items: [
                                      PopupMenuItem(
                                        child: Row(
                                          children: [
                                            Icon(FontAwesomeIcons.copy,
                                                size: 16,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSurface),
                                            const SizedBox(width: 12),
                                            const Text('Copy'),
                                          ],
                                        ),
                                        onTap: () {},
                                      ),
                                      PopupMenuItem(
                                        child: Row(
                                          children: [
                                            Icon(FontAwesomeIcons.paste,
                                                size: 16,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSurface),
                                            const SizedBox(width: 12),
                                            const Text('Paste'),
                                          ],
                                        ),
                                        onTap: () {},
                                      ),
                                    ],
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .outlineVariant,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Text('Right-click here'),
                                ),
                              ),
                            ),
                          ),
                          codeSnippet: '''
GestureDetector(
  onSecondaryTapDown: (details) {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        details.globalPosition.dx,
        details.globalPosition.dy,
        details.globalPosition.dx + 1,
        details.globalPosition.dy + 1,
      ),
      items: [
        PopupMenuItem(
          child: Row(
            children: [
              Icon(FontAwesomeIcons.copy,
                  size: 16,
                  color: Theme.of(context).colorScheme.onSurface),
              const SizedBox(width: 12),
              const Text('Copy'),
            ],
          ),
          onTap: () {},
        ),
        PopupMenuItem(
          child: Row(
            children: [
              Icon(FontAwesomeIcons.paste,
                  size: 16,
                  color: Theme.of(context).colorScheme.onSurface),
              const SizedBox(width: 12),
              const Text('Paste'),
            ],
          ),
          onTap: () {},
        ),
      ],
    );
  },
  child: Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      border: Border.all(
        color: Theme.of(context).colorScheme.outlineVariant,
      ),
      borderRadius: BorderRadius.circular(8),
    ),
    child: const Text('Right-click here'),
  ),
),''',
                        ),
                      ]),

                  _buildSection(
                    context: context,
                    title: 'Toasts & Loading',
                    description:
                        'Temporary overlay notifications and loading indicators',
                    examples: [
                      _OverlayExample(
                        title: 'Toast Messages',
                        example: Wrap(
                          spacing: 8,
                          children: [
                            ElevatedButton(
                              child: const Text('Success Toast'),
                              onPressed: () {
                                ToastOverlay.show(
                                  context: context,
                                  message: 'Successfully saved!',
                                  icon: FontAwesomeIcons.check,
                                  backgroundColor: Colors.green,
                                );
                              },
                            ),
                            ElevatedButton(
                              child: const Text('Error Toast'),
                              onPressed: () {
                                ToastOverlay.show(
                                  context: context,
                                  message: 'Something went wrong',
                                  icon: FontAwesomeIcons.xmark,
                                  backgroundColor: Colors.red,
                                );
                              },
                            ),
                          ],
                        ),
                        codeSnippet: '''
// Success Toast
ToastOverlay.show(
  context: context,
  message: 'Successfully saved!',
  icon: FontAwesomeIcons.check,
  backgroundColor: Colors.green,
);

// Error Toast
ToastOverlay.show(
  context: context,
  message: 'Something went wrong',
  icon: FontAwesomeIcons.xmark,
  backgroundColor: Colors.red,
);''',
                      ),
                      _OverlayExample(
                        title: 'Loading Overlay',
                        example: ElevatedButton(
                          child: const Text('Show Loading'),
                          onPressed: () async {
                            LoadingOverlay.show(
                              context: context,
                              message: 'Loading...',
                            );
                            await Future.delayed(const Duration(seconds: 2));
                            if (context.mounted) Navigator.pop(context);
                          },
                        ),
                        codeSnippet: '''
LoadingOverlay.show(
  context: context,
  message: 'Loading...',
);

// Hide after async operation
await Future.delayed(const Duration(seconds: 2));
Navigator.pop(context);''',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection({
    required BuildContext context,
    required String title,
    required String description,
    required List<_OverlayExample> examples,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.grey[600],
                ),
          ),
          const SizedBox(height: 32),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            children: examples,
          ),
          const SizedBox(height: 48),
          const Divider(),
        ],
      ),
    );
  }
}

class _OverlayExample extends StatelessWidget {
  final String title;
  final Widget example;
  final String codeSnippet;

  const _OverlayExample({
    required this.title,
    required this.example,
    required this.codeSnippet,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).colorScheme.outlineVariant,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 24),
                Center(child: example),
              ],
            ),
          ),
          const Divider(height: 1),
          Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              title: Row(
                children: [
                  Icon(
                    Icons.code,
                    size: 20,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'View Code',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .surfaceContainerHighest
                        .withOpacity(0.5),
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(16),
                    ),
                  ),
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SelectableText(
                          codeSnippet,
                          style: TextStyle(
                            fontFamily: 'monospace',
                            fontSize: 13,
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: IconButton(
                          icon: const Icon(Icons.copy, size: 18),
                          onPressed: () {
                            Clipboard.setData(ClipboardData(text: codeSnippet));
                            ToastOverlay.show(
                              context: context,
                              message: 'Code copied to clipboard',
                              icon: FontAwesomeIcons.check,
                            );
                          },
                          tooltip: 'Copy code',
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Add example usage for each overlay type
class OverlayExamples {
  static const dialogExamples = {
    'Basic': '''
StyledDialog.show(
  context: context,
  title: 'Confirmation',
  message: 'Are you sure you want to proceed?',
  actions: [
    DialogAction(
      label: 'Cancel',
      onPressed: () => Navigator.pop(context),
    ),
    DialogAction(
      label: 'Confirm',
      isPrimary: true,
      onPressed: () => Navigator.pop(context),
    ),
  ],
)''',
    'Custom Content': '''
StyledDialog.show(
  context: context,
  title: 'Select Options',
  content: Column(
    children: [
      CheckboxListTile(
        title: Text('Option 1'),
        value: true,
        onChanged: (value) {},
      ),
      CheckboxListTile(
        title: Text('Option 2'),
        value: false,
        onChanged: (value) {},
      ),
    ],
  ),
  actions: [
    DialogAction(
      label: 'Done',
      isPrimary: true,
      onPressed: () => Navigator.pop(context),
    ),
  ],
)''',
  };

  static const bottomSheetExamples = {
    'Basic': '''
StyledBottomSheet.show(
  context: context,
  title: 'Sort By',
  actions: [
    ListTile(
      leading: Icon(Icons.sort_by_alpha),
      title: Text('Alphabetical'),
      onTap: () => Navigator.pop(context),
    ),
    ListTile(
      leading: Icon(Icons.calendar_today),
      title: Text('Date'),
      onTap: () => Navigator.pop(context),
    ),
  ],
)''',
    'Action Sheet': '''
ActionSheet.show(
  context: context,
  actions: [
    ActionSheetItem(
      label: 'Share',
      icon: Icons.share,
      onPressed: () {},
    ),
    ActionSheetItem(
      label: 'Delete',
      icon: Icons.delete,
      isDestructive: true,
      onPressed: () {},
    ),
  ],
  cancelLabel: 'Cancel',
)''',
  };

  static const toastExamples = {
    'Success': '''
ToastOverlay.show(
  context: context,
  message: 'Successfully saved!',
  icon: Icons.check_circle,
  backgroundColor: Colors.green,
)''',
    'Error': '''
ToastOverlay.show(
  context: context,
  message: 'Error occurred',
  icon: Icons.error,
  backgroundColor: Colors.red,
)''',
  };

  static const loadingExamples = {
    'Basic': '''
LoadingOverlay.show(
  context: context,
  message: 'Loading...',
)''',
    'Custom': '''
LoadingOverlay.show(
  context: context,
  message: 'Processing...',
  customIndicator: SpinKitRing(
    color: Colors.blue,
    size: 50.0,
  ),
)''',
  };

  static const popoverExamples = {
    'Basic': '''
PopoverMenu(
  items: [
    PopoverMenuItem(
      label: 'Edit',
      icon: Icons.edit,
      onTap: () {},
    ),
    PopoverMenuItem(
      label: 'Delete',
      icon: Icons.delete,
      isDestructive: true,
      onTap: () {},
    ),
  ],
  child: IconButton(
    icon: Icon(Icons.more_vert),
    onPressed: () {},
  ),
)''',
    'Custom Width': '''
PopoverMenu(
  maxWidth: 200,
  items: [
    PopoverMenuItem(
      label: 'View Profile',
      icon: Icons.person,
      onTap: () {},
    ),
    PopoverMenuItem(
      label: 'Settings',
      icon: Icons.settings,
      onTap: () {},
    ),
  ],
  child: TextButton(
    child: Text('Show Menu'),
    onPressed: () {},
  ),
)''',
  };
}
