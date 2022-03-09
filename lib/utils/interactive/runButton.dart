import 'package:algo_app/animations/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class runButton<T extends BaseController> extends StatelessWidget {
  const runButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Selector<T, bool>(
        selector: (_, controller) => controller.running,
        builder: (_, isRunning, child) {
          return ElevatedButton(
            child: child,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Theme.of(context)
                        .colorScheme
                        .primary
                        .withOpacity(0.5);
                  }
                  return null; // Use the component's default.
                },
              ),
            ),
            onPressed: isRunning
                ? null
                : () {
                    Provider.of<T>(context, listen: false).run();
                  },
          );
        },
        child: const Text('Sort', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
