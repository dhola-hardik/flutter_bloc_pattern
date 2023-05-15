import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern/infra/models/book_response_model.dart';

class ItemBook extends StatelessWidget {
  final BookModel data;

  const ItemBook({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        shape: BoxShape.rectangle,
        border: Border.all(color: Theme.of(context).focusColor.withOpacity(0.05)),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).focusColor.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ListTile(
        leading: SizedBox(
          height: 80,
          width: 80,
          child: Image.network(
            data.volumeInfo!.imageLinks?.thumbnail ?? '',
            height: 80,
            width: 80,
            fit: BoxFit.contain,
          ),
        ),
        title: Text(data.volumeInfo!.title ?? ''),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            data.volumeInfo!.subtitle ?? (data.volumeInfo!.description ?? ''),
            maxLines: 4,
          ),
        ),
      ),
    );
  }
}
