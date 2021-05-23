
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';

enum EventBusUtilEventType {
  jumpToGoverment, //跳转到政务。

  commomEvens // 普通通知。
}

class EventBusUtilEvent {

  EventBusUtilEventType eventType;
  dynamic value;

  EventBusUtilEvent({@required this.eventType, this.value});
}


class EventBusUtil {

  EventBus _bus;


  static EventBusUtil _instance;
  static EventBusUtil get instance {
    if(_instance == null) {
      _instance = EventBusUtil._();
      _instance._bus = EventBus();

    }
    return _instance;
  }

  EventBusUtil._();

  void fire(event) {
    this._bus.fire(event);
  }

  void listen<T>(void onData(T event),
      {Function onError, void onDone(), bool cancelOnError}) {

    this._bus.on<T>().listen(onData, onError: onError, onDone: onDone);
  }

  void destroy() {
    _instance._bus.destroy();
    _instance = null;
    _bus = null;
  }

}