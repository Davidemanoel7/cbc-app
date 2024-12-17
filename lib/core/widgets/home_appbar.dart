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
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bom dia,',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Theme.of(context).colorScheme.surface
                      ),
                    ),
                    Text(
                      'David!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.surface
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset(
                "./lib/assets/images/market_car.png"
              )
            ],
          ),
        ),
      ),
    );
  }
}