# Flutter View Wrapper

## Getting started

Add this to your `pubspec.yaml` under `dependences`

```yaml
flutter_view_wrapper:
  git: https://github.com/MJ12358/flutter-view-wrapper
```

## Usage

Wrap your pages/screens/views with this widget.

```dart
import 'package:flutter_view_wrapper/flutter_view_wrapper.dart';

class MyView extends StatelessWidget {
  const MyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My View'),
      ),
      body: FlutterViewWrapper(
        child: MyAwesomeWidget(),
      ),
    );
  }
}
```