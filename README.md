# Flutter Builder UI Kit

A flexible and customizable UI builder package for Flutter applications part of [Flutter Pre-setup](https://github.com/vbalagovic/flutter-presetup/tree/main) and [Flutter Builder](https://flutter-builder.app/) low code generation and easy project setup app.

Full examples and documentation on [UI kit website](https://flutter-builder-ui-kit.web.app/)

## Features

- Easy-to-use builder patterns for common UI components
- Highly customizable widgets
- Responsive design support
- Material Design and Cupertino style components
- Minimal dependencies

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
    flutter_builder_ui: ^1.0.0
```

## Usage

```dart
import 'package:flutter_builder_ui/flutter_builder_ui.dart';
```

### Buttons examples

```dart
import 'package:flutter_builder_ui/flutter_builder_ui.dart';

BouncingIconButton(
    icon: Icons.favorite,
    onPressed: () {},
    color: Colors.red,
    size: 56,
),
```

### Inputs examples

```dart
import 'package:flutter_builder_ui/flutter_builder_ui.dart';

PinInput(
    length: 4,
    obscureText: true,
    onCompleted: (pin) {
    // Handle PIN completion
    },
)
```

### Cards examples

```dart
import 'package:flutter_builder_ui/flutter_builder_ui.dart';

StatusCard(
    customColor: Colors.green.shade400,
    type: StatusType.success,
    title: 'Payment Successful',
    message: 'Your transaction has been completed.',
    onClose: () {},
),
```

### List Tiles examples

```dart
import 'package:flutter_builder_ui/flutter_builder_ui.dart';

AnimatedListTile(
    leading: Icons.inbox,
    title: 'Inbox',
    subtitle: '3 new messages',
    onTap: () {},
),
```

### Overlays examples

```dart
import 'package:flutter_builder_ui/flutter_builder_ui.dart';

ElevatedButton(
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
```

### Bottom bars examples

```dart
import 'package:flutter_builder_ui/flutter_builder_ui.dart';

FloatingBottomBar(
    currentIndex: 0,
    onTap: (_) {},
    leftItems: const [
    NavItemData(
        icon: FontAwesomeIcons.house,
        label: 'Home',
    ),
    NavItemData(
        icon: FontAwesomeIcons.trophy,
        label: 'Rewards',
    ),
    ],
    rightItems: const [
    NavItemData(
        icon: FontAwesomeIcons.compass,
        label: 'Explore',
    ),
    NavItemData(
        icon: FontAwesomeIcons.user,
        label: 'Profile',
    ),
    ],
    floatingAction: FloatingActionData(
    icon: FontAwesomeIcons.plus,
    ),
),
```

## Documentation

For detailed documentation, please visit our [API Reference](documentation_link).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
