import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/menu_provider.dart';

class ItemDetailsView extends StatelessWidget {
  const ItemDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Consumer<MenuProvider>(
          builder: (context, menuProvider, _) {
            final item = menuProvider.selectedItem;
            if (item == null) {
              return const Center(
                child: Text(
                  'No item selected yet.',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              );
            }

            final title = (item['name'] ?? '').toString();
            final imageUrl = (item['image'] ?? '').toString();
            final quantity = menuProvider.quantityFor(item);

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 32),
                    Row(
                      children: [
                        _CircleIconButton(
                          icon: Icons.arrow_back_ios_new_rounded,
                          onTap: () => Navigator.pop(context),
                        ),
                        const Spacer(),
                        Container(
                          width: 130,
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF2F4F7),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: const Color(0xFFE8ECF2)),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search',
                              border: InputBorder.none,
                              prefixIcon: const Icon(
                                Icons.search_rounded,
                                color: Color(0xFF5A6270),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 12,
                              ),
                            ),
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF252C3A),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        _CircleIconButton(icon: Icons.group_add_outlined),
                        const SizedBox(width: 8),
                        _CircleIconButton(icon: Icons.more_vert_rounded),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      title,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 29,
                                        fontWeight: FontWeight.w900,
                                        color: Color(0xFF202635),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  const Icon(
                                    Icons.info_outline,
                                    size: 21,
                                    color: Colors.black54,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              const _SmallMetaRow(
                                icon: Icons.location_on_outlined,
                                text: '1 km . Haldwani Locality',
                              ),
                              const SizedBox(height: 6),
                              const _SmallMetaRow(
                                icon: Icons.access_time_rounded,
                                text: '30-35 mins . Schedule for later',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 90),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFF0A8B50),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.white,
                                    size: 14,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    '4.0',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'By 4',
                              style: TextStyle(
                                fontSize: 11,
                                color: Color(0xFF6A7280),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    const SizedBox(height: 12),
                    Container(
                      width: 200,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF7FAF8),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.check_circle_outline,
                            size: 14,
                            color: Color(0xFF2A7D4E),
                          ),
                          SizedBox(width: 6),
                          Text(
                            'No packaging charges',
                            style: TextStyle(
                              color: Color(0xFF2A7D4E),
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),

                    const Divider(
                      height: 1,
                      color: Colors.black26,
                      thickness: 1,
                    ),
                    const SizedBox(height: 30),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF2F4F7),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.local_offer_outlined,
                            size: 16,
                            color: Color(0xFF5A6270),
                          ),
                          SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              'Flat ₹100 OFF above ₹499',
                              style: TextStyle(
                                color: Color(0xFF3E4654),
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Text(
                            '3 offers',
                            style: TextStyle(
                              color: Color(0xFF7A828F),
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(width: 2),
                          Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Color(0xFF7A828F),
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 19),
                    const Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _InfoChip(label: 'Filters', icon: Icons.tune),
                        _InfoChip(
                          label: 'Veg',
                          icon: Icons.stop_circle,
                          iconColor: Color(0xFF2FAE61),
                        ),
                        _InfoChip(
                          label: 'Egg',
                          icon: Icons.egg_alt_outlined,
                          iconColor: Color(0xFFF2B300),
                        ),
                        _InfoChip(
                          label: 'Non-veg',
                          icon: Icons.change_history,
                          iconColor: Color(0xFFD15A4A),
                        ),
                      ],
                    ),
                    const SizedBox(height: 17),
                    const Row(
                      children: [
                        Text(
                          'Recommended for you',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF222A39),
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.keyboard_arrow_up_rounded,
                          color: Color(0xFF5D6572),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 8),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFE8ECF2)),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.stop_circle,
                                  color: Color(0xFF2FAE61),
                                  size: 14,
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF252C3A),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  '₹169',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF252C3A),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  'Paneer, Onion, Capsicum, Tomato]',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF6A7280),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                const Row(
                                  children: [
                                    Icon(
                                      Icons.bookmark_border_rounded,
                                      size: 20,
                                      color: Color(0xFFA0A7B3),
                                    ),
                                    SizedBox(width: 8),
                                    Icon(
                                      Icons.share_outlined,
                                      size: 20,
                                      color: Color(0xFFA0A7B3),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          SizedBox(
                            width: 140,
                            height: 160,
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Positioned.fill(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 8,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(14),
                                      child: Image.network(
                                        imageUrl,
                                        fit: BoxFit.cover,
                                        errorBuilder: (_, __, ___) => Container(
                                          color: const Color(0xFFF0F1F3),
                                          alignment: Alignment.center,
                                          child: const Icon(
                                            Icons.image_not_supported_outlined,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 18,
                                  right: 18,
                                  bottom: -8,
                                  child: _AddButton(
                                    quantity: quantity,
                                    onAdd: () => menuProvider.addItem(item),
                                    onRemove: () =>
                                        menuProvider.removeItem(item),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 45),
                    Row(
                      children: [
                        const Text(
                          'Thali',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF232938),
                            borderRadius: BorderRadius.circular(11),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.menu_book_rounded,
                                color: Colors.white,
                                size: 20,
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Menu',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 18,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5FAFF),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xFFDDEAFB)),
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.delivery_dining_rounded,
                            size: 23,
                            color: Color(0xFF4787DC),
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Get FREE delivery above ₹99 with GOLD',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF3A4B66),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  const _CircleIconButton({required this.icon, this.onTap});

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 34,
        width: 34,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xFFE3E6EB)),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 19, color: const Color(0xFF2F3746)),
      ),
    );
  }
}

class _SmallMetaRow extends StatelessWidget {
  const _SmallMetaRow({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 17, color: const Color(0xFF69707D)),
        const SizedBox(width: 5),
        Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF5E6674),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({
    required this.label,
    required this.icon,
    this.iconColor = const Color(0xFF5A6270),
  });

  final String label;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: const Color(0xFFE0E4EA)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: iconColor),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: Color(0xFF394151),
            ),
          ),
        ],
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  const _AddButton({
    required this.quantity,
    required this.onAdd,
    required this.onRemove,
  });

  final int quantity;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    if (quantity <= 0) {
      return SizedBox(
        height: 34,
        child: ElevatedButton(
          onPressed: onAdd,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: const Color(0xFFE84D5B),
            elevation: 0,
            side: const BorderSide(color: Color(0xFFE84D5B), width: 1.4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.zero,
          ),
          child: const Text(
            'ADD   +',
            style: TextStyle(
              color: Color(0xFFE84D5B),
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      );
    }

    return SizedBox(
      height: 34,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xFFE84D5B), width: 1.4),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
              child: _QtyActionButton(icon: Icons.remove, onPressed: onRemove),
            ),
            Expanded(
              child: Center(
                child: Text(
                  '$quantity',
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color(0xFFE84D5B),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            Expanded(
              child: _QtyActionButton(icon: Icons.add, onPressed: onAdd),
            ),
          ],
        ),
      ),
    );
  }
}

class _QtyActionButton extends StatelessWidget {
  const _QtyActionButton({required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Icon(icon, color: const Color(0xFFE84D5B), size: 16),
    );
  }
}
