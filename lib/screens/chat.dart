import 'package:flutter/material.dart';



class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  Map<String, bool> items = {'party': false, 'stopit': false, 'graduation': false, 'roof': false ,'wtf': false};

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
        leading: Container(
            height: 40,
            width: 40,
            decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                    fit: BoxFit.fill,
                    image:AssetImage("images/img1.jpg")

                )
            )),
        contentPadding: EdgeInsets.symmetric(vertical: 8.0),

        title: Text(
          title,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            color:
                 Color.fromRGBO(23, 152, 185, 100)
                ,
            decoration: done
                ? TextDecoration.lineThrough
                : TextDecoration.none,),
        ),
        trailing: IconButton(
          icon: Icon(Icons.chat),
          onPressed: () { Navigator.push<Widget>(
              context,
              MaterialPageRoute<Widget>(builder: (BuildContext context) => chat(title)));},
        ),
        onTap: () {
          Navigator.push<Widget>(
              context,
              MaterialPageRoute<Widget>(builder: (BuildContext context) => DetailScreen(title))
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

  const DetailScreen(this.title);
  final String title;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.white,
      appBar: AppBar(


        title: Text('Detail Screen'),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[

            Expanded(
                child: Container(
                    alignment: Alignment.center,
                    child: Text(title, style: TextStyle(fontSize: 50, color: Colors.black)))
            ),
            Expanded(
              child: IconButton(
                iconSize: 60,
                onPressed: () => Navigator.pop(context),
                icon: Icon( Icons.check, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class chat extends StatelessWidget {

  const chat(this.title);
  final String title;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.white,
      appBar: AppBar(
        title: Text('Chat'),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[

            Expanded(
                child: Container(
                    alignment: Alignment.center,
                    child: Text(title, style: TextStyle(fontSize: 50, color: Colors.black)))
            ),
            Expanded(
              child: IconButton(
                iconSize: 60,
                onPressed: () => Navigator.pop(context),
                icon: Icon( Icons.check, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
