import 'package:flutter/material.dart';

/*
*
*
工作原理
Notification的传递过程遵循以下步骤：

发送Notification：子组件创建一个Notification的实例，并通过调用Notification.dispatch(context)方法来发送它。这个方法会使Notification从发送它的组件开始，沿着组件树向上冒泡。
处理Notification：当Notification向上冒泡时，祖先组件可以通过NotificationListener来监听并处理特定类型的Notification。NotificationListener会包裹一个子树，监听并响应通过这个子树发送的Notification。
停止冒泡：在NotificationListener中处理Notification后，可以决定是否停止Notification的进一步冒泡。如果返回true，则冒泡过程终止；如果返回false，Notification将继续向上冒泡。
*/
class NotificationTutorial extends StatefulWidget {
  const NotificationTutorial({super.key});

  @override
  State<NotificationTutorial> createState() => _NotificationTutorialState();
}

class _NotificationTutorialState extends State<NotificationTutorial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notification'),),
      body: NotificationListener (
        onNotification: (notification) {
          if (notification is ScrollStartNotification) {
            print('Scrolling started');
          } else if (notification is ScrollUpdateNotification) {
            print('Scrolling...');
          } else if (notification is ScrollEndNotification) {
            print('Scrolling ended');
          } else if (notification is CustomNotification) {
            print('custom notification ${notification.message}');
          }

          // 是否继续将这个通知向上冒泡。即向上传递。
          return true;
        },
        child: Column(
          children: [

            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) => ListTile(
                  title: Text('Item $index'),
                ),
              ),
            ),
            
            ElevatedButton(onPressed: () {
              CustomNotification('Message').dispatch(context);
            }, child: const Text('Send custom notification'))
          ],
        ),
      ),
    );
  }
}

class CustomNotification extends Notification {
  String message;

  CustomNotification(this.message);
}

