
import 'package:flutter/material.dart';



class Clubber extends StatefulWidget {
  @override
  _ClubberState createState() => _ClubberState();
}

class _ClubberState extends State<Clubber> {
  Map<String, bool> items = {'Flutter lernen': false, 'App schreiben': false, 'Reich werden': false, 'Alkohol kaufen': false ,'Spaß haben': false};

  void addItem(String item) {
    setState(() {
      items[item] = false;
    });
    Navigator.of(context).pop();
  }

  void deleteItem(String key) {
    setState(() {
      items.remove(key);
    });
  }

  void toggleDone(String key) {
    setState(() {
      items.update(key, (bool done) => !done);
    });
  }

  void newEntry() {
    showDialog<AlertDialog>(
        context: context,
        builder: (BuildContext context) {
          return AddItemDialog(addItem);
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To-Do-App"),
        backgroundColor: Color.fromRGBO(35, 152, 185, 100),
      ),
      body:
      ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, i) {
          String key = items.keys.elementAt(i);
          return ToDoItem(
            key,
            items[key],
                () => deleteItem(key),
                () => toggleDone(key),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: newEntry,
        child: Icon(Icons.add),
        backgroundColor: Color.fromRGBO(35, 152, 185, 100),
      ),
    );
  }
}

class ToDoItem extends StatelessWidget {
  final String title;
  final bool done;
  final Function remove;
  final Function toggleDone;
  const ToDoItem(this.title, this.done, this.remove, this.toggleDone);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 8.0),
        leading: Checkbox(
          value: done,
          onChanged: (bool value) => toggleDone(),
          activeColor: Color.fromRGBO(23, 152, 185, 100),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            color: done
                ? Color.fromRGBO(23, 152, 185, 100)
                : Colors.black54,
            decoration: done
                ? TextDecoration.lineThrough
                : TextDecoration.none,),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete_outline),
          onPressed: () => remove(),
        ),
        onTap: () {
          Navigator.push<Widget>(
              context,
              MaterialPageRoute<Widget>(builder: (BuildContext context) => DetailScreen(title, done))
          );
        },
      ),
    );
  }
}

class AddItemDialog extends StatefulWidget {

  final void Function(String txt) addItem;
  const AddItemDialog(this.addItem);

  @override
  _AddItemDialogState createState() => _AddItemDialogState();
}

class _AddItemDialogState extends State<AddItemDialog> {

  final GlobalKey<FormState> formKey = GlobalKey();
  String item;

  void save() {
    if (formKey.currentState.validate()) {
      widget.addItem(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                onChanged: (String txt) => item = txt,
                onFieldSubmitted: (String txt) => save(),
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Please enter a value';
                  }
                  return null;
                },
              ),
              RaisedButton(
                onPressed: save,
                color: Color.fromRGBO(23, 152, 185, 100),
                child: Text('Safe', style: TextStyle(color: Colors.white),),
              )
            ],
          )
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {

  const DetailScreen(this.title, this.done);
  final String title;
  final bool done;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: done ? Colors.green : Colors.red,
      appBar: AppBar(
        title: Text('Detail Screen'),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(
                child: Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.center,
                    child: Text(
                      done ? 'Das hast du schon erledigt:' : 'Das musst du noch machen:',
                      style: TextStyle(fontSize: 20, color: Colors.white), textAlign: TextAlign.center,))
            ),
            Expanded(
                child: Container(
                    alignment: Alignment.center,
                    child: Text(title, style: TextStyle(fontSize: 50, color: Colors.white)))
            ),
            Expanded(
              child: IconButton(
                iconSize: 60,
                onPressed: () => Navigator.pop(context),
                icon: Icon(done ? Icons.check : Icons.close, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
