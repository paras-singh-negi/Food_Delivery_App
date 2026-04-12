import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/data.dart';
import '../providers/menu_provider.dart';
import '../views/item_details_view.dart';
import '../widgets/recommended_for_you_section.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  static const List<String> dishLabels = [
    'All item',
    'Veg-thali',
    'Chole Bhautre',
    'Dessert',
    'Snack',
    'Cake',
    'Burgur',
  ];

  int selectedIndex = 0;
  int selectedServiceIndex = 0;
  bool isVegModeOn = false;
  final TextEditingController _searchController = TextEditingController();
  String searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    const horizontalPadding = 16.0;
    final cardWidth = (screenWidth - (horizontalPadding * 2)) / 5;
    final normalizedQuery = searchQuery.trim().toLowerCase();
    final filteredRecommendations = normalizedQuery.isEmpty
        ? dataGiven
        : dataGiven
              .where((item) {
                final name = (item['name'] ?? '').toString().toLowerCase();
                return name.contains(normalizedQuery);
              })
              .toList(growable: false);

    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 400,
              width: double.infinity,
              decoration: const BoxDecoration(color: Colors.white),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset('assets/banner.jpg', fit: BoxFit.cover),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0x3D000000), Color(0x00000000)],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 44,
                    left: 16,
                    right: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        'Home',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      SizedBox(width: 2),
                                      Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    'Shyam Vihar,Haldwani',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withValues(alpha: 0.88),
                                border: Border.all(
                                  color: const Color(0xFFD0DBE6),
                                ),
                              ),
                              child: const Icon(
                                Icons.account_balance_wallet_rounded,
                                color: Color(0xFF3B4552),
                                size: 32,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(0xFFFFCD44),
                                  width: 2,
                                ),
                                image: const DecorationImage(
                                  image: AssetImage('assets/pp.jpg'),

                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Container(
                                height: 54,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.search,
                                      color: Color(0xFFE84D5B),
                                      size: 38,
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: TextField(
                                        controller: _searchController,
                                        onChanged: (value) {
                                          setState(() {
                                            searchQuery = value;
                                          });
                                        },
                                        style: const TextStyle(
                                          color: Color(0xFF2D3440),
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        decoration: const InputDecoration(
                                          hintText: 'Search "Ice Cream"',
                                          hintStyle: TextStyle(
                                            color: Color(0xFF626A77),
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          border: InputBorder.none,
                                          isDense: true,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    const SizedBox(
                                      height: 34,
                                      child: VerticalDivider(
                                        thickness: 1.5,
                                        color: Color(0xFFE0E4EA),
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    const Icon(
                                      Icons.mic_none_rounded,
                                      color: Color(0xFFE84D5B),
                                      size: 34,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Column(
                              children: [
                                const Text(
                                  'VEG\nMODE',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 14,
                                    height: 1.0,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isVegModeOn = !isVegModeOn;
                                    });
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 180),
                                    width: 44,
                                    height: 28,
                                    padding: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      color: isVegModeOn
                                          ? const Color(0xFF34C759)
                                          : const Color(0xFFD3D6DC),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Align(
                                      alignment: isVegModeOn
                                          ? Alignment.centerRight
                                          : Alignment.centerLeft,
                                      child: Container(
                                        width: 22,
                                        height: 22,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 120,
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(8, 4, 8, 0),
                scrollDirection: Axis.horizontal,
                itemCount: dataGiven.length > 7 ? 7 : dataGiven.length,
                separatorBuilder: (_, __) => const SizedBox(width: 0),
                itemBuilder: (context, index) {
                  final item = dataGiven[index];
                  final imageUrl = (item['image'] ?? '').toString();

                  return _FoodCard(
                    cardWidth: cardWidth,
                    imageUrl: imageUrl,
                    label: dishLabels[index],
                    isSelected: selectedIndex == index,
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  );
                },
              ),
            ),
            RecommendedForYouSection(
              items: filteredRecommendations,
              onItemTap: (item) {
                context.read<MenuProvider>().selectItem(item);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ItemDetailsView()),
                );
              },
            ),
            Transform.translate(
              offset: const Offset(0, -12),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 64,
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(32),
                          border: Border.all(color: const Color(0xFFE6E8EC)),
                        ),
                        child: Row(
                          children: [
                            _ServicePill(
                              label: 'Delivery',
                              icon: Icons.delivery_dining,
                              isSelected: selectedServiceIndex == 0,
                              onTap: () {
                                setState(() {
                                  selectedServiceIndex = 0;
                                });
                              },
                            ),
                            _ServicePill(
                              label: 'Dining',
                              icon: Icons.local_dining,
                              isSelected: selectedServiceIndex == 1,
                              onTap: () {
                                setState(() {
                                  selectedServiceIndex = 1;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      height: 47,
                      width: 105,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(32),
                          bottomLeft: Radius.circular(32),
                        ),
                        gradient: const LinearGradient(
                          colors: [Color(0xFF6F32F5), Color(0xFF4A2AD9)],
                        ),
                      ),
                      child: const Text(
                        'district ↗',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 6),
          ],
        ),
      ),
    );
  }
}

class _ServicePill extends StatelessWidget {
  const _ServicePill({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFFCEFF2) : Colors.transparent,
            borderRadius: BorderRadius.circular(28),
          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 20,
                color: isSelected
                    ? const Color(0xFFE84D5B)
                    : const Color(0xFF9AA0A8),
              ),
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: isSelected
                      ? const Color(0xFFE84D5B)
                      : const Color(0xFF5E646D),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FoodCard extends StatelessWidget {
  const _FoodCard({
    required this.cardWidth,
    required this.imageUrl,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final double cardWidth;
  final String imageUrl;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 4),
        child: Container(
          width: cardWidth,
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 32,
                backgroundColor: Colors.grey.shade200,
                backgroundImage: NetworkImage(imageUrl),
                onBackgroundImageError: (_, __) {},
              ),
              const SizedBox(height: 6),
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: isSelected
                      ? const Color(0xFF111111)
                      : const Color(0xFF6B7280),
                ),
              ),
              const SizedBox(height: 4),
              if (isSelected)
                Container(
                  height: 3,
                  width: 96,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE84D5B),
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
