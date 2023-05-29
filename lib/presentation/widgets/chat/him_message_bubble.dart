import 'package:flutter/material.dart';

class HimMessageBubble extends StatelessWidget {
  const HimMessageBubble({super.key});

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
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('nostrud mollit amet occaecat et quis', style: TextStyle(color: Colors.white),),
          ),
        ),
        const SizedBox( height: 5 ),
        _ImageBubble(),
        const SizedBox( height: 10 ),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
        child: Image.network(
          'https://yesno.wtf/assets/no/9-dc99c0e3c066b28d3a12262692cd5432.gif', 
          width: size.width * 0.7, // * Colocamos el with del 70% con relación al teléfono
          height: 150,
          fit: BoxFit.cover
          ),
      );
  }
}