import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  static const String route = 'ChatScreen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = Firestore.instance;
  TextEditingController msgTextInput;
  FirebaseUser user;

  String messageText;
  void getCurrentUser() async {
    final _user = await _auth.currentUser();
    try {
      if (_user != null) {
        user = _user;
      } else {
        Navigator.pop(context);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(),
            StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('messages').snapshots(),
              //initialData: initialData ,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                final QuerySnapshot messages = snapshot.data;
                List<Widget> messageList = [];
                if (!snapshot.hasData) {
                  return Center(
                    child: Text('Loading messages...'),
                  );
                }
                for (DocumentSnapshot message in messages.documents) {
                  Widget messageLine = MessageBubble(
                    msg: message.data['msg'],
                    sender: (message.data['sender'] == user.email)
                        ? 'current'
                        : message.data['sender'],
                  );
                  messageList.add(messageLine);
                }

                return Expanded(
                  child: ListView(
                    children: messageList,
                  ),
                );
              },
            ),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: msgTextInput,
                      onChanged: (value) => messageText = value,
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      _firestore.collection('messages').add(
                        {
                          'sender': user.email,
                          'msg': messageText,
                        },
                      );
                      setState(() {
                        msgTextInput.clear();
                      });
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    Key key,
    @required this.msg,
    @required this.sender,
  }) : super(key: key);

  final String msg;
  final String sender;

  @override
  Widget build(BuildContext context) {
    if (sender == 'current') {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              elevation: 10,
              color: Colors.lightBlue,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  msg,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          CircleAvatar(
            child: Image.asset('images/logo.png'),
          ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            child: Image.asset('images/logo.png')
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              elevation: 10,
              color: Colors.lightBlue,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  msg,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }
  }
}
