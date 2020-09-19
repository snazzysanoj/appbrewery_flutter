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
                for (DocumentSnapshot message in messages.documents) {
                  String msg = message.data['msg'];
                  String sender = message.data['sender'];
                  Widget messageLine = Text('$msg from $sender');
                  messageList.add(messageLine);
                }

                return Container(
                  child: Column(
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
