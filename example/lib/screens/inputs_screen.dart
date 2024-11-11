import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_builder_ui_kit/flutter_builder_ui_kit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputExamplesScreen extends StatefulWidget {
  const InputExamplesScreen({super.key});

  @override
  State<InputExamplesScreen> createState() => _InputExamplesScreenState();
}

class _InputExamplesScreenState extends State<InputExamplesScreen> {
  final _scrollController = ScrollController();
  DateTime? _calendarDate;
  DateTime? _dropdownDate;
  DateTime? _customStyleDate;
  DateTime? _rangeDate;
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
                  _buildSection(
                    context: context,
                    title: 'Styled Text Fields',
                    description:
                        'Customizable text input fields with various styles',
                    examples: [
                      _InputExample(
                        title: 'Basic Inputs',
                        example: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const StyledTextField(
                              label: 'Full Name',
                              hint: 'Enter your full name',
                              prefixIcon: Icons.person_outline,
                              textCapitalization: TextCapitalization.words,
                            ),
                            const SizedBox(height: 16),
                            StyledTextField(
                              label: 'Email Address',
                              hint: 'Enter your email',
                              prefixIcon: Icons.email_outlined,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            const StyledTextField(
                              label: 'Password',
                              hint: 'Enter your password',
                              prefixIcon: Icons.lock_outline,
                              isPassword: true,
                            ),
                          ],
                        ),
                        codeSnippet: '''
const StyledTextField(
  label: 'Full Name',
  hint: 'Enter your full name',
  prefixIcon: Icons.person_outline,
  textCapitalization: TextCapitalization.words,
),

StyledTextField(
  label: 'Email Address',
  hint: 'Enter your email',
  prefixIcon: Icons.email_outlined,
  keyboardType: TextInputType.emailAddress,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    return null;
  },
),

const StyledTextField(
  label: 'Password',
  hint: 'Enter your password',
  prefixIcon: Icons.lock_outline,
  isPassword: true,
),''',
                      ),
                      _InputExample(
                        title: 'Input with Actions',
                        example: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            StyledTextField(
                              label: 'Search Location',
                              hint: 'Enter location',
                              prefixIcon: Icons.location_on_outlined,
                              suffixIcon: Icons.my_location,
                              onSuffixIconTap: () {
                                // Handle location tap
                              },
                            ),
                            const SizedBox(height: 16),
                            StyledTextField(
                              label: 'Promo Code',
                              hint: 'Enter code',
                              prefixIcon: Icons.discount_outlined,
                              suffixIcon: Icons.arrow_forward,
                              textCapitalization: TextCapitalization.characters,
                              inputFormatters: [
                                UpperCaseTextFormatter(),
                                FilteringTextInputFormatter.allow(
                                    RegExp('[A-Z0-9]')),
                                LengthLimitingTextInputFormatter(8),
                              ],
                              onSuffixIconTap: () {
                                // Handle apply code
                              },
                            ),
                          ],
                        ),
                        codeSnippet: '''
StyledTextField(
  label: 'Search Location',
  hint: 'Enter location',
  prefixIcon: Icons.location_on_outlined,
  suffixIcon: Icons.my_location,
  onSuffixIconTap: () {
    // Handle location tap
  },
),

StyledTextField(
  label: 'Promo Code',
  hint: 'Enter code',
  prefixIcon: Icons.discount_outlined,
  suffixIcon: Icons.arrow_forward,
  textCapitalization: TextCapitalization.characters,
  inputFormatters: [
    UpperCaseTextFormatter(),
    FilteringTextInputFormatter.allow(RegExp('[A-Z0-9]')),
    LengthLimitingTextInputFormatter(8),
  ],
  onSuffixIconTap: () {
    // Handle apply code
  },
),''',
                      ),
                      _InputExample(
                        title: 'Special Inputs',
                        example: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const StyledTextField(
                              label: 'Phone Number',
                              hint: '+1 (000) 000-0000',
                              prefixIcon: Icons.phone_outlined,
                              keyboardType: TextInputType.phone,
                            ),
                            const SizedBox(height: 16),
                            StyledTextField(
                              label: 'Amount',
                              hint: '0.00',
                              prefixIcon: Icons.attach_money,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'^\d*\.?\d{0,2}')),
                              ],
                            ),
                          ],
                        ),
                        codeSnippet: '''
const StyledTextField(
  label: 'Phone Number',
  hint: '+1 (000) 000-0000',
  prefixIcon: Icons.phone_outlined,
  keyboardType: TextInputType.phone,
),

StyledTextField(
  label: 'Amount',
  hint: '0.00',
  prefixIcon: Icons.attach_money,
  keyboardType: const TextInputType.numberWithOptions(decimal: true),
  inputFormatters: [
    FilteringTextInputFormatter.allow(RegExp(r'^d*.?d{0,2}')),
  ],
),''',
                      ),
                    ],
                  ),
                  _buildSection(
                    context: context,
                    title: 'Basic Date Inputs',
                    description:
                        'Simple date input with different picker types',
                    examples: [
                      _InputExample(
                        title: 'Calendar Picker',
                        example: DateInput(
                          label: 'Select Date',
                          hint: 'YYYY-MM-DD',
                          initialValue: _calendarDate,
                          onChanged: (date) =>
                              setState(() => _calendarDate = date),
                          style: const DateInputStyle(
                            pickerType: DatePickerType.calendar,
                            dateFormat: 'yyyy-MM-dd',
                          ),
                        ),
                        codeSnippet: '''
DateInput(
  label: 'Select Date',
  hint: 'YYYY-MM-DD',
  initialValue: selectedDate,
  onChanged: (date) => setState(() => selectedDate = date),
  style: const DateInputStyle(
    pickerType: DatePickerType.calendar,
    dateFormat: 'yyyy-MM-dd',
  ),
)''',
                      ),
                      _InputExample(
                        title: 'Dropdown Picker',
                        example: DateInput(
                          label: 'Birth Date',
                          hint: 'Select date',
                          initialValue: _dropdownDate,
                          onChanged: (date) =>
                              setState(() => _dropdownDate = date),
                          style: const DateInputStyle(
                            pickerType: DatePickerType.dropdown,
                            dateFormat: 'MMM d, yyyy',
                          ),
                        ),
                        codeSnippet: '''
DateInput(
  label: 'Birth Date',
  hint: 'Select date',
  initialValue: selectedDate,
  onChanged: (date) => setState(() => selectedDate = date),
  style: const DateInputStyle(
    pickerType: DatePickerType.dropdown,
    dateFormat: 'MMM d, yyyy',
  ),
)''',
                      ),
                    ],
                  ),
                  _buildSection(
                    context: context,
                    title: 'Custom Styled Inputs',
                    description:
                        'Date inputs with custom styling and configurations',
                    examples: [
                      _InputExample(
                        title: 'Custom Style',
                        example: DateInput(
                          label: 'Event Date',
                          hint: 'Pick a date',
                          initialValue: _customStyleDate,
                          onChanged: (date) =>
                              setState(() => _customStyleDate = date),
                          style: DateInputStyle(
                            pickerType: DatePickerType.calendar,
                            dateFormat: 'EEE, MMM d, yyyy',
                            calendarIcon: const Icon(FontAwesomeIcons.calendar),
                            iconColor: Colors.indigo,
                            fillColor: Colors.indigo.withOpacity(0.05),
                            borderRadius: 12,
                            pickerSelectedDayColor: Colors.indigo,
                            pickerHeaderStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                            pickerDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                  color: Colors.indigo.withOpacity(0.2)),
                            ),
                          ),
                        ),
                        codeSnippet: '''
DateInput(
  label: 'Event Date',
  hint: 'Pick a date',
  initialValue: selectedDate,
  onChanged: (date) => setState(() => selectedDate = date),
  style: DateInputStyle(
    pickerType: DatePickerType.calendar,
    dateFormat: 'EEE, MMM d, yyyy',
    calendarIcon: const Icon(FontAwesomeIcons.calendar),
    iconColor: Colors.indigo,
    fillColor: Colors.indigo.withOpacity(0.05),
    borderRadius: 12,
    pickerSelectedDayColor: Colors.indigo,
    pickerHeaderStyle: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    pickerDecoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: Colors.indigo.withOpacity(0.2)),
    ),
  ),
)''',
                      ),
                      _InputExample(
                        title: 'Date Range',
                        example: DateInput(
                          label: 'Appointment Date',
                          hint: 'Next 30 days only',
                          initialValue: _rangeDate,
                          onChanged: (date) =>
                              setState(() => _rangeDate = date),
                          style: DateInputStyle(
                            pickerType: DatePickerType.calendar,
                            dateFormat: 'MMM d, yyyy',
                            allowedRange: DateRange(
                              start: DateTime.now(),
                              end: DateTime.now().add(const Duration(days: 30)),
                            ),
                            selectableWeekDays: [
                              1,
                              2,
                              3,
                              4,
                              5
                            ], // Monday to Friday
                            showWeekdays: true,
                            showWeekNumbers: true,
                            pickerTodayColor: Colors.green.withOpacity(0.1),
                            pickerDisabledDayColor:
                                Colors.grey.withOpacity(0.3),
                          ),
                        ),
                        codeSnippet: '''
DateInput(
  label: 'Appointment Date',
  hint: 'Next 30 days only',
  initialValue: selectedDate,
  onChanged: (date) => setState(() => selectedDate = date),
  style: DateInputStyle(
    pickerType: DatePickerType.calendar,
    dateFormat: 'MMM d, yyyy',
    allowedRange: DateRange(
      start: DateTime.now(),
      end: DateTime.now().add(const Duration(days: 30)),
    ),
    selectableWeekDays: [1, 2, 3, 4, 5], // Monday to Friday
    showWeekdays: true,
    showWeekNumbers: true,
    pickerTodayColor: Colors.green.withOpacity(0.1),
    pickerDisabledDayColor: Colors.grey.withOpacity(0.3),
  ),
)''',
                      ),
                    ],
                  ),
                  _buildSection(
                    context: context,
                    title: 'Validation Examples',
                    description: 'Date inputs with different validation rules',
                    examples: [
                      _InputExample(
                        title: 'Required Field',
                        example: DateInput(
                          label: 'Due Date',
                          hint: 'Required field',
                          required: true,
                          validator: (date) {
                            if (date == null) return 'Date is required';
                            if (date.isBefore(DateTime.now())) {
                              return 'Date must be in the future';
                            }
                            return null;
                          },
                        ),
                        codeSnippet: '''
DateInput(
  label: 'Due Date',
  hint: 'Required field',
  required: true,
  validator: (date) {
    if (date == null) return 'Date is required';
    if (date.isBefore(DateTime.now())) {
      return 'Date must be in the future';
    }
    return null;
  },
)''',
                      ),
                      _InputExample(
                        title: 'With Disabled Dates',
                        example: DateInput(
                          label: 'Meeting Date',
                          hint: 'Select available date',
                          style: DateInputStyle(
                            pickerType: DatePickerType.calendar,
                            dateFormat: 'MMM d, yyyy',
                            disabledDates: [
                              DateTime.now().add(const Duration(days: 1)),
                              DateTime.now().add(const Duration(days: 2)),
                              DateTime.now().add(const Duration(days: 5)),
                            ],
                            pickerDisabledDayColor: Colors.red.withOpacity(0.3),
                          ),
                        ),
                        codeSnippet: '''
DateInput(
  label: 'Meeting Date',
  hint: 'Select available date',
  style: DateInputStyle(
    pickerType: DatePickerType.calendar,
    dateFormat: 'MMM d, yyyy',
    disabledDates: [
      DateTime.now().add(const Duration(days: 1)),
      DateTime.now().add(const Duration(days: 2)),
      DateTime.now().add(const Duration(days: 5)),
    ],
    pickerDisabledDayColor: Colors.red.withOpacity(0.3),
  ),
)''',
                      ),
                    ],
                  ),
                  _buildSection(
                    context: context,
                    title: 'Search Bar',
                    description: 'Expandable search bar with smooth animations',
                    examples: [
                      _InputExample(
                        title: 'Default Search',
                        example: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AnimatedSearchBar(
                              hint: 'Search items...',
                              onChanged: (value) {
                                // Handle search
                              },
                            ),
                          ],
                        ),
                        codeSnippet: '''
AnimatedSearchBar(
  hint: 'Search items...',
  onChanged: (value) {
    // Handle search
  },
),''',
                      ),
                      _InputExample(
                        title: 'Custom Width',
                        example: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AnimatedSearchBar(
                              hint: 'Search products...',
                              expandedWidth: 400,
                              onChanged: (value) {
                                // Handle search
                              },
                            ),
                          ],
                        ),
                        codeSnippet: '''
AnimatedSearchBar(
  hint: 'Search products...',
  expandedWidth: 400,
  onChanged: (value) {
    // Handle search
  },
),''',
                      ),
                    ],
                  ),
                  _buildSection(
                    context: context,
                    title: 'PIN Input',
                    description:
                        'Input field for PIN codes and OTP verification',
                    examples: [
                      _InputExample(
                        title: 'Basic PIN',
                        example: PinInput(
                          onCompleted: (pin) {
                            // Handle PIN completion
                          },
                        ),
                        codeSnippet: '''
PinInput(
  onCompleted: (pin) {
    // Handle PIN completion
  },
),''',
                      ),
                      _InputExample(
                        title: 'Secure PIN',
                        example: PinInput(
                          length: 4,
                          obscureText: true,
                          onCompleted: (pin) {
                            // Handle PIN completion
                          },
                        ),
                        codeSnippet: '''
PinInput(
  length: 4,
  obscureText: true,
  onCompleted: (pin) {
    // Handle PIN completion
  },
),''',
                      ),
                    ],
                  ),
                  _buildSection(
                    context: context,
                    title: 'Tag Input',
                    description: 'Input field for adding and managing tags',
                    examples: [
                      _InputExample(
                        title: 'Basic Tags',
                        example: TagInput(
                          hint: 'Add interests...',
                          initialTags: const ['Flutter', 'Dart'],
                          onTagsChanged: (tags) {
                            // Handle tags change
                          },
                        ),
                        codeSnippet: '''
TagInput(
  hint: 'Add interests...',
  initialTags: const ['Flutter', 'Dart'],
  onTagsChanged: (tags) {
    // Handle tags change
  },
),''',
                      ),
                      _InputExample(
                        title: 'Limited Tags',
                        example: TagInput(
                          hint: 'Add up to 3 skills...',
                          maxTags: 3,
                          onTagsChanged: (tags) {
                            // Handle tags change
                          },
                        ),
                        codeSnippet: '''
TagInput(
  hint: 'Add up to 3 skills...',
  maxTags: 3,
  onTagsChanged: (tags) {
    // Handle tags change
  },
),''',
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
    required List<_InputExample> examples,
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

class _InputExample extends StatelessWidget {
  final String title;
  final Widget example;
  final String codeSnippet;

  const _InputExample({
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

// Add this helper class for the promo code input
class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

// Add example usage for each input type
class InputExamples {
  static const textFieldExamples = {
    'Basic': '''
StyledTextField(
  label: 'Username',
  hint: 'Enter your username',
  prefixIcon: Icons.person_outline,
)''',
    'Password': '''
StyledTextField(
  label: 'Password',
  hint: 'Enter your password',
  prefixIcon: Icons.lock_outline,
  isPassword: true,
)''',
    'Email': '''
StyledTextField(
  label: 'Email',
  hint: 'Enter your email',
  prefixIcon: Icons.email_outline,
  keyboardType: TextInputType.emailAddress,
  validator: (value) {
    if (value == null || !value.contains('@')) {
      return 'Please enter a valid email';
    }
    return null;
  },
)''',
  };

  static const searchBarExamples = {
    'Default': '''
AnimatedSearchBar(
  hint: 'Search...',
  onChanged: (value) {
    // Handle search
  },
)''',
    'Custom Width': '''
AnimatedSearchBar(
  hint: 'Search products...',
  expandedWidth: 400,
  onChanged: (value) {
    // Handle search
  },
  onClear: () {
    // Handle clear
  },
)''',
  };

  static const pinInputExamples = {
    'Basic': '''
PinInput(
  length: 4,
  onCompleted: (pin) {
    print('Entered PIN: \$pin');
  },
)''',
    'Secure': '''
PinInput(
  length: 5,
  obscureText: true,
  onCompleted: (pin) {
    // Handle secure PIN
  },
)''',
  };

  static const tagInputExamples = {
    'Basic': '''
TagInput(
  hint: 'Add tags...',
  onTagsChanged: (tags) {
    print('Current tags: \$tags');
  },
)''',
    'Limited': '''
TagInput(
  hint: 'Add up to 5 tags...',
  maxTags: 5,
  onTagsChanged: (tags) {
    // Handle tags
  },
)''',
  };
}
