import 'package:flutter/material.dart';

import '../../../domain/entities/message.dart';

class HisMessageBubble extends StatelessWidget {

  final Message message;

  const HisMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(message.text, style: const TextStyle(color: Colors.white),),
          ),
        ),
        const SizedBox( height: 5 ),
        _ImageBubble( message.imageUrl! ),
        const SizedBox( height: 10 ),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {

  final String imageUrl;

  const _ImageBubble(this.imageUrl);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
        child: Image.network(
          imageUrl, 
          width: size.width * 0.8, // * Colocamos el width del 70% con relación al teléfono
          height: 200,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            
            if( loadingProgress == null ) return child;

            return Container(
              width: size.width * 0.8,
              height: 200,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: const Text('Mi amor está enviando una imagen'), 
            );

          },
          ),
      );
  }
}