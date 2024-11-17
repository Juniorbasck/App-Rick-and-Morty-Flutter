import 'package:flutter/material.dart';
import 'package:ricka_and_morty/character/service/character_response.dart';
import 'package:ricka_and_morty/shared/widgets/default_cicle_widget.dart';

class CharacterCardWidget extends StatelessWidget {
  const CharacterCardWidget({super.key, required this.response, this.onTap});

  final CharacterResponse response;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: theme.cardTheme.elevation ?? 0.0,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 200,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(response.image),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 8.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        response.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: theme.textTheme.titleLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          DefaultCicleWidget(
                            status: response.status.toLowerCase(),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Text(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              '${response.status} - ${response.species}',
                              style: theme.textTheme.titleSmall,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Text(
                        'Last known location ',
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Expanded(
                        child: Text(
                          response.location.name,
                          style: theme.textTheme.bodySmall,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
