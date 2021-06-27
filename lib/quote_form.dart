import 'package:flutter/material.dart';
import 'package:quotes/quote.dart';

class QuoteForm extends StatefulWidget {
  final Function addNewQuote;

  QuoteForm({required this.addNewQuote});

  @override
  _QuoteFormState createState() =>
      _QuoteFormState(addNewQuote: this.addNewQuote);
}

class _QuoteFormState extends State<QuoteForm> {
  String newQuote = "";
  String newAuthor = "";

  final Function addNewQuote;

  _QuoteFormState({required this.addNewQuote});

  void clearProperties() {
    setState(() {
      this.newAuthor = "";
      this.newQuote = "";
    });
    newQuoteController.clear();
    newAuthorController.clear();
  }

  void addQuote(Quote newQuoteData) {
    addNewQuote(newQuoteData);
    clearProperties();
  }

  final newQuoteController = TextEditingController();
  final newAuthorController = TextEditingController();

  _handleNewQuoteChange() {
    setState(() {
      this.newQuote = newQuoteController.text;
    });
  }

  _handleNewAuthorChange() {
    setState(() {
      this.newAuthor = newAuthorController.text;
    });
  }

  @override
  void initState() {
    super.initState();
    newQuoteController.addListener(_handleNewQuoteChange);
    newAuthorController.addListener(_handleNewAuthorChange);
  }

  @override
  void dispose() {
    newQuoteController.dispose();
    newAuthorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext buildContext) {
    return Container(
      margin: EdgeInsets.fromLTRB(9.0, 16.0, 9.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              obscureText: false,
              keyboardType: TextInputType.multiline,
              minLines: 1,
              controller: newQuoteController,
              // onChanged: (text) {
              //   setState(() {
              //     newQuote = text;
              //   });
              // },
              style: TextStyle(fontSize: 20.0),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
                labelText: "Add new quote",
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            TextField(
              obscureText: false,
              keyboardType: TextInputType.multiline,
              minLines: 1,
              controller: newAuthorController,
              // onChanged: (text) {
              //   setState(() {
              //     newAuthor = text;
              //   });
              // },
              style: TextStyle(fontSize: 20.0),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
                labelText: "Author",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          if (this.newQuote == "" || this.newAuthor == "") {
                            showDialog(
                                context: buildContext,
                                builder: (BuildContext context) => AlertDialog(
                                      title: Text("All field must not empty!"),
                                      actions: [
                                        TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: Text("Ok"))
                                      ],
                                    ));
                          } else {
                            Quote newQuoteData =
                                Quote(text: newQuote, author: newAuthor);
                            addQuote(newQuoteData);
                          }
                        },
                        child: Text("Add"))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
