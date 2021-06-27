import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';
import 'quote_form.dart';

void main() {
  runApp(MaterialApp(
    home: QuoteList(),
  ));
}

class QuoteList extends StatefulWidget {
  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  List<Quote> quotes = [
    Quote(
        author: "Oscar Wilde",
        text:
            "A person should design the way he makes a living around how he wishes to make a life."),
    Quote(
        author: "Bennedict Cummberbath",
        text:
            "Life was meant to be lived, and curiosity must be kept alive. One must never, for whatever reason, turn his back on life."),
    Quote(
        author: "Fedrick Robenson",
        text:
            "Security is an illusion. Life is either a daring adventure or it is nothing at all.")
  ];

  addNewQuote(Quote quote) {
    setState(() {
      quotes.insert(0, quote);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text("Awesome Quotes"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            QuoteForm(
              addNewQuote: addNewQuote,
            ),
            Column(
              children: quotes
                  .map((quote) => QuoteCard(
                      quote: quote,
                      delete: () {
                        setState(() {
                          quotes.remove(quote);
                        });
                      }))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
