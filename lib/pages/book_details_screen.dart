import 'package:flutter/material.dart';
import 'package:reader_tracker/models/book.dart';
import 'package:reader_tracker/utils/book_details_arguments.dart';

class BookDetailsScreen extends StatefulWidget {
  const BookDetailsScreen({super.key});

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as BookDetailsArguments;
    final Book book = args.itemBook;
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text("Book Details")),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              if (book.imageLinks["thumbnail"] != null)
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
              Column(
                children: [
                  Text(book.title, style: theme.titleLarge),
                  Text(book.authors.join(", "), style: theme.labelLarge),
                  Text(
                    "Publisher: ${book.publishedDate}",
                    style: theme.bodyMedium,
                  ),
                  Text("Language: ${book.language}", style: theme.bodyMedium),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(child: Text("Save"), onPressed: () {}),
                      ElevatedButton.icon(
                        icon: Icon(Icons.favorite),
                        onPressed: () {},
                        label: Text("favorite"),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text('Description:', style: theme.titleMedium),
                  SizedBox(height: 5),
                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Theme.of(
                        context,
                      ).colorScheme.secondary.withOpacity(0.1),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    child: Text(book.description != ''? book.description : 'No description available.',
                        style: theme.bodyMedium),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
