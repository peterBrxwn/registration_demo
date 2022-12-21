// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:registration_demo/feature/notification/view/view.dart';
import 'package:registration_demo/utils/app_theme.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({required this.icon, required this.name, Key? key})
      : super(key: key);
  final Widget icon;
  final String name;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: AppTheme.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15),
      ),
      onPressed: () {
        Notify.info('$name button clicked');
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(width: 10),
          Text(
            'Continue with $name',
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppTheme.black,
                ),
          ),
        ],
      ),
    );
  }
}
