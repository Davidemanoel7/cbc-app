import 'package:flutter/material.dart';

enum ButtonType {
  primary,
  secondary,
  outlined,
  link,
  text;
}

class CustomButton extends StatefulWidget {
  const CustomButton(
      {super.key,
      required this.title,
      required this.type,
      this.isSelected = false,
      this.icon,
      this.height,
      this.width = double.infinity,
      this.backgroundColor,
      this.onPressed});

  final ButtonType type;
  final double width;
  final double? height;
  final IconData? icon;
  final bool? isSelected;
  final Color? backgroundColor;
  final String title;
  final VoidCallback? onPressed;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case ButtonType.primary:
        return SizedBox(
          width: widget.width,
          height: widget.height,
          child: (widget.icon != null)
              ? ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: widget.backgroundColor ?? Theme.of(context).colorScheme.primary, // Background color
                    // foregroundColor: Colors.white, // Text color
                    iconColor: Colors.white, // Theme.of(context).colorScheme.primaryContainer,
                    elevation: 2, // Elevation (shadow)
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // Rounded corners
                    ),
                    padding: const EdgeInsets.all(8), // Padding
                  ),
                  onPressed: widget.onPressed,
                  icon: Icon(widget.icon, size: 16),
                  label: Text(
                    widget.title,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Colors.white),
                  ),
                )
              : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: widget.backgroundColor ?? Theme.of(context).colorScheme.primary, // Background color
                    foregroundColor: Colors.white, // Text color
                    elevation: 2, // Elevation (shadow)
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // Rounded corners
                    ),
                    padding: const EdgeInsets.all(12), // Padding
                  ),
                  onPressed: widget.onPressed,
                  child: Text(
                    widget.title,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Colors.white),
                  ),
                ),
        );
      case ButtonType.secondary:
        return SizedBox(
          width: double.infinity,
          height: widget.height,
          child: (widget.icon != null)
              ? ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: widget.backgroundColor ?? Theme.of(context).colorScheme.secondary, // Background color
                    elevation: 2, // Elevation (shadow)
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // Rounded corners
                    ),
                    padding: const EdgeInsets.all(12), // Padding
                  ),
                  onPressed: widget.onPressed,
                  icon: Icon(widget.icon),
                  label: Text(
                    widget.title,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Colors.white),
                  ),
                )
              : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: widget.backgroundColor ?? Theme.of(context).colorScheme.secondary, // Background color
                    elevation: 2, // Elevation (shadow)
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // Rounded corners
                    ),
                    padding: const EdgeInsets.all(12), // Padding
                  ),
                  onPressed: widget.onPressed,
                  child: Text(
                    widget.title,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Colors.white),
                  ),
                ),
        );
      case ButtonType.outlined:
        return SizedBox(
          width: widget.width,
          height: widget.height,
          child: (widget.icon != null)
              ? ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    // foregroundColor: LexiColors.orange500, // Background color
                    elevation: 2, // Elevation (shadow)
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // Rounded corners
                      side: BorderSide(
                          color: widget.backgroundColor ?? Theme.of(context).colorScheme.primary, width: 2),
                    ),
                    padding: const EdgeInsets.all(12), // Padding
                  ),
                  onPressed: widget.onPressed,
                  icon: Icon(widget.icon, color: widget.backgroundColor ?? Theme.of(context).colorScheme.primary,),
                  label: Text(
                    widget.title,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: widget.backgroundColor ?? Theme.of(context).colorScheme.primary),
                  ),
                )
              : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.primary, // Background color
                    elevation: 2, // Elevation (shadow)
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // Rounded corners
                      side: BorderSide(
                          color: Theme.of(context).colorScheme.primary, width: 2),
                    ),
                    padding: const EdgeInsets.all(12), // Padding
                  ),
                  onPressed: widget.onPressed,
                  child: Text(
                    widget.title,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
        );
      case ButtonType.link:
        return SizedBox(
          width: widget.width,
          height: widget.height,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Center(
              child: Material(
                child: InkWell(
                  onTap: widget.onPressed,
                  child: Text(
                    widget.title,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: Theme.of(context).colorScheme.primary,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ),
            ),
          ),
        );
      case ButtonType.text:
        return SizedBox(
          width: widget.width,
          height: widget.height,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Center(
              child: Material(
                child: InkWell(
                  onTap: widget.onPressed,
                  child: SizedBox(
                    width: widget.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Center(
                        child: Text(
                          widget.title,
                          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: Colors.black87),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
    }
  }
}
