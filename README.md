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
    flutter_builder_ui_kit: ^1.0.0
```

## Usage

```dart
import 'package:flutter_builder_ui_kit/flutter_builder_ui_kit.dart';
```

### Buttons examples
<img width="768" alt="Screenshot 2024-11-11 at 23 32 09" src="https://github.com/user-attachments/assets/10856011-0c03-4d55-98cf-4a3b83f17e46">

```dart
import 'package:flutter_builder_ui_kit/flutter_builder_ui_kit.dart';

BouncingIconButton(
    icon: Icons.favorite,
    onPressed: () {},
    color: Colors.red,
    size: 56,
),
```

### Inputs examples
<img width="619" alt="Screenshot 2024-11-11 at 23 32 44" src="https://github.com/user-attachments/assets/805bc4d1-36d3-4261-9e5e-92525f587415">

```dart
import 'package:flutter_builder_ui_kit/flutter_builder_ui_kit.dart';

PinInput(
    length: 4,
    obscureText: true,
    onCompleted: (pin) {
    // Handle PIN completion
    },
)
```

### Cards examples
<img width="802" alt="Screenshot 2024-11-11 at 23 33 00" src="https://github.com/user-attachments/assets/cef8dc7c-efdb-4c49-a63f-501729e8d098">

```dart
import 'package:flutter_builder_ui_kit/flutter_builder_ui_kit.dart';

StatusCard(
    customColor: Colors.green.shade400,
    type: StatusType.success,
    title: 'Payment Successful',
    message: 'Your transaction has been completed.',
    onClose: () {},
),
```

### List Tiles examples
<img width="772" alt="Screenshot 2024-11-11 at 23 33 17" src="https://github.com/user-attachments/assets/2ca1ccda-f409-4b62-83fd-1fa2ccb44051">

```dart
import 'package:flutter_builder_ui_kit/flutter_builder_ui_kit.dart';

AnimatedListTile(
    leading: Icons.inbox,
    title: 'Inbox',
    subtitle: '3 new messages',
    onTap: () {},
),
```

### Overlays examples
<img width="839" alt="Screenshot 2024-11-11 at 23 33 39" src="https://github.com/user-attachments/assets/16896f44-2c6b-4f82-80fe-534ea0997f4e">

```dart
import 'package:flutter_builder_ui_kit/flutter_builder_ui_kit.dart';

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
<img width="770" alt="Screenshot 2024-11-11 at 23 33 56" src="https://github.com/user-attachments/assets/b60c3d78-c9ac-49b8-a7c6-697fb2a25f73">

```dart
import 'package:flutter_builder_ui_kit/flutter_builder_ui_kit.dart';

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

For detailed documentation, please visit our [UI kit website](https://flutter-builder-ui-kit.web.app/), or go to [Flutter Builder](https://flutter-builder.app/).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
