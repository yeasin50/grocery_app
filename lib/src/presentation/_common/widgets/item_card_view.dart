import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../app/app_theme.dart';
import '../../../infrastructure/infrastructure.dart';

class ItemCardView extends StatelessWidget {
  const ItemCardView({
    super.key,
    required this.model,
  });

  final ItemModel model;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFFF2ECEC),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(model.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    model.isSaved ? Icons.favorite : Icons.favorite_border_outlined,
                    color: AppTheme.primary,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text(
                model.type.title,
                style: const TextStyle(color: AppTheme.primary),
              ),
              const Spacer(),
              RatingBarIndicator(
                direction: Axis.horizontal,
                itemSize: 12,
                itemCount: 5,
                rating: model.rating,
                itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber),
              )
            ],
          ),
          Text(
            model.name,
            style: textTheme.bodyLarge?.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            children: [
              Text(
                "\$${model.price.toStringAsFixed(1)}",
                style: textTheme.bodyLarge?.copyWith(
                  color: AppTheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Text(" per kg"),
              const Spacer(),
              Material(
                shape: const CircleBorder(),
                color: AppTheme.primary,
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
