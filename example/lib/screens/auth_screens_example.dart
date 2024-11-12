import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_builder_ui_kit/flutter_builder_ui_kit.dart';

class AuthScreensExampleScreen extends StatelessWidget {
  const AuthScreensExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSection(
                    context: context,
                    title: 'Login Forms',
                    description:
                        'Different variations of login forms with validation',
                    examples: [
                      _AuthExample(
                        title: 'Basic Login',
                        example: _DemoContainer(
                          child: _BasicLoginForm(),
                        ),
                        codeSnippet: '''
Form(
  key: _formKey,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      const Text('Welcome Back!'),
      const StyledTextField(
        label: 'Email',
        validator: emailValidator,
      ),
      const StyledTextField(
        label: 'Password',
        isPassword: true,
        validator: passwordValidator,
      ),
      GradientButton(
        label: 'Sign In',
        onPressed: _handleSubmit,
      ),
    ],
  ),
)''',
                      ),
                      // More examples...
                    ],
                  ),
                  _buildSection(
                    context: context,
                    title: 'Login Forms',
                    description:
                        'Different variations of login forms with validation',
                    examples: [
                      /* _AuthExample(
      title: 'Social Login',
      example: _DemoContainer(
        child: _SocialLoginForm(),
      ),
      codeSnippet: '''
Form(
  key: _formKey,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      const Text(
        'Welcome Back',
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 24),
      // Social Login Buttons
      Row(
        children: [
          Expanded(
            child: _SocialButton(
              icon: FontAwesomeIcons.google,
              label: 'Google',
              onTap: () {},
              backgroundColor: Colors.white,
              textColor: Colors.black87,
              borderColor: Colors.grey.shade300,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _SocialButton(
              icon: FontAwesomeIcons.apple,
              label: 'Apple',
              onTap: () {},
              backgroundColor: Colors.black,
              textColor: Colors.white,
            ),
          ),
        ],
      ),
      const SizedBox(height: 12),
      _SocialButton(
        icon: FontAwesomeIcons.facebook,
        label: 'Continue with Facebook',
        onTap: () {},
        backgroundColor: const Color(0xFF1877F2),
        textColor: Colors.white,
      ),
      // Divider with text
      Row(
        children: [
          const Expanded(child: Divider()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text('or continue with email'),
          ),
          const Expanded(child: Divider()),
        ],
      ),
      // Form fields
      StyledTextField(
        controller: _emailController,
        label: 'Email',
        prefixIcon: Icons.email_outlined,
        validator: emailValidator,
      ),
      StyledTextField(
        controller: _passwordController,
        label: 'Password',
        prefixIcon: Icons.lock_outlined,
        isPassword: true,
        validator: passwordValidator,
      ),
      TextButton(
        onPressed: () {},
        child: const Text('Forgot Password?'),
      ),
      GradientButton(
        label: 'Sign In',
        onTap: _handleSubmit,
        gradientColors: [Colors.blue.shade600, Colors.blue.shade800],
      ),
      // Register link
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Don\'t have an account? '),
          TextButton(
            onPressed: () {},
            child: const Text('Sign Up'),
          ),
        ],
      ),
    ],
  ),
)''',
    ),
    _AuthExample(
      title: 'Glass Effect Login',
      example: _DemoContainer(
        backgroundGradient: LinearGradient(
          colors: [
            Colors.blue.shade900,
            Colors.purple.shade900,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        child: _GlassLoginForm(),
      ),
      codeSnippet: '''
Container(
  decoration: BoxDecoration(
    gradient: LinearGradient(
      colors: [Colors.blue.shade900, Colors.purple.shade900],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  ),
  child: Form(
    key: _formKey,
    child: Column(
      children: [
        const Icon(
          Icons.rocket_launch_rounded,
          color: Colors.white,
          size: 48,
        ),
        const Text(
          'Welcome Back',
          style: TextStyle(color: Colors.white, fontSize: 32),
        ),
        GlassCard(
          style: GlassCardStyle(
            blur: 10,
            opacity: 0.1,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              StyledTextField(
                controller: _emailController,
                label: 'Email',
                labelStyle: TextStyle(color: Colors.white),
                validator: emailValidator,
              ),
              StyledTextField(
                controller: _passwordController,
                label: 'Password',
                isPassword: true,
                labelStyle: TextStyle(color: Colors.white),
                validator: passwordValidator,
              ),
              GradientButton(
                label: 'Sign In',
                onTap: _handleSubmit,
                gradientColors: [
                  Colors.white.withOpacity(0.3),
                  Colors.white.withOpacity(0.1),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _CircleIconButton(
                    icon: FontAwesomeIcons.google,
                    onTap: () {},
                  ),
                  _CircleIconButton(
                    icon: FontAwesomeIcons.apple,
                    onTap: () {},
                  ),
                  _CircleIconButton(
                    icon: FontAwesomeIcons.facebook,
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  ),
)''',
    ),
    _AuthExample(
      title: 'Social Button',
      example: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _SocialButton(
              icon: FontAwesomeIcons.google,
              label: 'Continue with Google',
              onTap: () {},
              backgroundColor: Colors.white,
              textColor: Colors.black87,
              borderColor: Colors.grey.shade300,
            ),
            const SizedBox(height: 12),
            _SocialButton(
              icon: FontAwesomeIcons.apple,
              label: 'Continue with Apple',
              onTap: () {},
              backgroundColor: Colors.black,
              textColor: Colors.white,
            ),
            const SizedBox(height: 12),
            _SocialButton(
              icon: FontAwesomeIcons.facebook,
              label: 'Continue with Facebook',
              onTap: () {},
              backgroundColor: const Color(0xFF1877F2),
              textColor: Colors.white,
            ),
          ],
        ),
      ),
      codeSnippet: '''
_SocialButton(
  icon: FontAwesomeIcons.google,
  label: 'Continue with Google',
  onTap: () {},
  backgroundColor: Colors.white,
  textColor: Colors.black87,
  borderColor: Colors.grey.shade300,
),
_SocialButton(
  icon: FontAwesomeIcons.apple,
  label: 'Continue with Apple',
  onTap: () {},
  backgroundColor: Colors.black,
  textColor: Colors.white,
),
_SocialButton(
  icon: FontAwesomeIcons.facebook,
  label: 'Continue with Facebook',
  onTap: () {},
  backgroundColor: const Color(0xFF1877F2),
  textColor: Colors.white,
),

// Social Button Implementation
class _SocialButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color textColor;
  final Color? borderColor;

  const _SocialButton({
    required this.icon,
    required this.label,
    required this.onTap,
    required this.backgroundColor,
    required this.textColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: borderColor != null
                ? Border.all(color: borderColor!)
                : null,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 20, color: textColor),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}''',
    ),
   */
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
    required List<_AuthExample> examples,
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

class _AuthExample extends StatelessWidget {
  final String title;
  final Widget example;
  final String codeSnippet;

  const _AuthExample({
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
                example,
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
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text('Code copied to clipboard'),
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
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

class _DemoContainer extends StatelessWidget {
  final Widget child;
  final Gradient? backgroundGradient;

  const _DemoContainer({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        gradient: backgroundGradient,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).colorScheme.outlineVariant,
        ),
      ),
      child: child,
    );
  }
}

class _BasicLoginForm extends StatefulWidget {
  @override
  State<_BasicLoginForm> createState() => _BasicLoginFormState();
}

class _BasicLoginFormState extends State<_BasicLoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _handleSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      // Handle login
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Welcome Back!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Sign in to continue',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 32),
            StyledTextField(
              controller: _emailController,
              label: 'Email',
              hint: 'Enter your email',
              prefixIcon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
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
            StyledTextField(
              controller: _passwordController,
              label: 'Password',
              hint: 'Enter your password',
              prefixIcon: Icons.lock_outlined,
              isPassword: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),
            GradientButton(
              label: 'Sign In',
              onPressed: _handleSubmit,
              gradientColors: [
                Colors.blue.shade600,
                Colors.blue.shade700,
              ],
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
