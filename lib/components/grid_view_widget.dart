import 'package:flutter/material.dart';
import 'package:reader_tracker/models/book.dart';
import 'package:reader_tracker/utils/book_details_arguments.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({
    super.key,
    required this._books,
  });

  final List<Book> _books;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: _books.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: .6,
        ),
        itemBuilder: (context, index) {
          Book book = _books[index];
          return Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Theme.of(
                context,
              ).colorScheme.surfaceContainerHighest,
              borderRadius: const BorderRadius.all(Radius.circular(4)),
            ),
            child: GestureDetector(
              onTap: () {
                print("Tapped on book: ${book.title}");
                Navigator.pushNamed(
                  context,
                  '/details',
                  arguments: BookDetailsArguments(itemBook: book),
                );
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Image.network(
                      height: 200,
                      width: 150,
                      fit: BoxFit.cover,
                      book.imageLinks["thumbnail"] ?? '',
                      errorBuilder: (_, __, ___) => const Icon(Icons.book),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      book.title,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      book.authors.join(", & "),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}