import 'package:flutter/material.dart';

import '../models/data.dart';

class RecommendedForYouSection extends StatelessWidget {
  const RecommendedForYouSection({super.key, this.items, this.onItemTap});

  final List<Map<String, dynamic>>? items;
  final ValueChanged<Map<String, dynamic>>? onItemTap;

  @override
  Widget build(BuildContext context) {
    final visibleItems = (items ?? dataGiven).take(6).toList(growable: false);
    const fixedRatings = [4.0, 3.8, 4.2, 4.1, 3.9, 4.3];
    const fixedOffers = [
      '30% OFF up to ₹75',
      '₹40 OFF above ₹99',
      '₹100 OFF above ₹299',
      '₹60 OFF above ₹149',
      '20% OFF up to ₹120',
      '₹80 OFF above ₹249',
    ];
    const listHorizontalPadding = 16.0;
    const cardSpacing = 12.0;
    final cardWidth =
        ((MediaQuery.sizeOf(context).width -
                    (listHorizontalPadding * 2) -
                    (cardSpacing * 2)) /
                2.9)
            .clamp(96.0, 160.0)
            .toDouble();

    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 6),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: const [
                _FilterPill(
                  icon: Icons.tune,
                  text: 'Filters',
                  showDropDown: true,
                ),
                SizedBox(width: 10),
                _FilterPill(
                  icon: Icons.bolt,
                  text: 'Near & Fast',
                  iconColor: Color(0xFF07A058),
                ),
                SizedBox(width: 10),
                _FilterPill(
                  icon: Icons.schedule,
                  text: 'Schedule',
                  showDropDown: true,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'RECOMMENDED FOR YOU',
              style: TextStyle(
                fontSize: 32 / 2,
                letterSpacing: 2.2,
                fontWeight: FontWeight.w600,
                color: Color(0xFF555B67),
              ),
            ),
          ),
          const SizedBox(height: 14),
          if (visibleItems.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              child: Text(
                'No dishes found for your search.',
                style: TextStyle(
                  color: Color(0xFF6B7280),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          else
            SizedBox(
              height: 192,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: listHorizontalPadding,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: visibleItems.length,
                separatorBuilder: (_, __) => const SizedBox(width: cardSpacing),
                itemBuilder: (context, index) {
                  final item = visibleItems[index];
                  final name = (item['name'] ?? '').toString();
                  final imageUrl = (item['image'] ?? '').toString();
                  final id = item['id'] is int ? item['id'] as int : index + 1;

                  final lower = 30 + (id % 3) * 5;
                  final upper = lower + 5;
                  final rating = fixedRatings[index % fixedRatings.length];
                  final offer = fixedOffers[index % fixedOffers.length];

                  return GestureDetector(
                    onTap: onItemTap == null ? null : () => onItemTap!(item),
                    child: _RecommendationCard(
                      cardWidth: cardWidth,
                      imageUrl: imageUrl,
                      title: name,
                      rating: rating,
                      timeText: '$lower-$upper mins',
                      offerText: offer,
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}

class _FilterPill extends StatelessWidget {
  const _FilterPill({
    required this.icon,
    required this.text,
    this.iconColor = const Color(0xFF535B67),
    this.showDropDown = false,
  });

  final IconData icon;
  final String text;
  final Color iconColor;
  final bool showDropDown;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 19, color: iconColor),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(
              color: Color(0xFF2D3440),
              fontSize: 18 / 1.5,
              fontWeight: FontWeight.w700,
            ),
          ),
          if (showDropDown) ...[
            const SizedBox(width: 8),
            const Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 20,
              color: Color(0xFF2D3440),
            ),
          ],
        ],
      ),
    );
  }
}

class _RecommendationCard extends StatelessWidget {
  const _RecommendationCard({
    required this.cardWidth,
    required this.imageUrl,
    required this.title,
    required this.rating,
    required this.timeText,
    required this.offerText,
  });

  final double cardWidth;
  final String imageUrl;
  final String title;
  final double rating;
  final String timeText;
  final String offerText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: cardWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Stack(
                  children: [
                    SizedBox(
                      height: 106,
                      width: double.infinity,
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          color: const Color(0xFFF0F1F3),
                          alignment: Alignment.center,
                          child: const Icon(Icons.image_not_supported_outlined),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 8,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        constraints: BoxConstraints(maxWidth: cardWidth - 10),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.68),
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        child: Text(
                          offerText,
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: -6,
                bottom: -12,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 7,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0A8B50),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.star, color: Colors.white, size: 12),
                      const SizedBox(width: 3),
                      Text(
                        rating.toStringAsFixed(1),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xFF2D3440),
            ),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              const Icon(
                Icons.alarm_outlined,
                size: 17,
                color: Color(0xFF6B7280),
              ),
              const SizedBox(width: 4),
              Text(
                timeText,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF6B7280),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
