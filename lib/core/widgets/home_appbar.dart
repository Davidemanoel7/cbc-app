import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
    required this.sizeHeight,
  });

  final double sizeHeight;

  @override
  Size get preferredSize => Size.fromHeight( sizeHeight );

  @override
  Widget build( BuildContext context ) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular( 24 ),
        bottomRight: Radius.circular( 24 )
      ),
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorScheme.of(context).primary,
        elevation: 0,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 16,
            children: [
              CircleAvatar(
                backgroundColor: ColorScheme.of(context).surface,
                radius: 24,
                child: Icon( Icons.person,
                color: Theme.of(context).colorScheme.primary, size: 28),
              ),
              const Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  
                  children: [
                    Text(
                      'Bom dia,',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'David!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
                size: 28
              ),
            ],
          ),
        ),
      ),
    );
  }
}