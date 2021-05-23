
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotoViewPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _PhotoViewPageState();
  }
}

class _PhotoViewPageState extends State<PhotoViewPage> {

  List<String> photoList = ["assets/home/2.0x/image0.png","assets/2.0x/image1.png","assets/2.0x/home/image0.png","assets/2.0x/image1.png","assets/home/2.0x/image0.png"];


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("PhotoViewPage"),
      ),
      body: Container(
        child: PhotoViewGallery.builder(
          builder: (BuildContext context, int index) {
            return PhotoViewGalleryPageOptions(
              imageProvider: AssetImage(photoList[index]),
              heroAttributes: PhotoViewHeroAttributes(tag: index),
            );
          },
          itemCount: photoList.length,

        ),
      ),

    );
  }
}

class PhotpGalleryPage extends StatefulWidget {
  final List photoList;
  final int index;
  PhotpGalleryPage({this.photoList, this.index});
  @override
  _PhotpGalleryPageState createState() => _PhotpGalleryPageState();
}

class _PhotpGalleryPageState extends State<PhotpGalleryPage> {

  @override
  int currentIndex = 0;
  int initialIndex; //初始index
  int length;
  int title;
  @override
  void initState() {
    currentIndex = widget.index;
    initialIndex = widget.index;
    length = widget.photoList.length;
    title = initialIndex + 1;
    super.initState();
  }

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
      title = index + 1;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${title} / ${length}'),
        centerTitle: true,
      ),
      body: Container(
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          constraints: BoxConstraints.expand(
            height: MediaQuery.of(context).size.height,
          ),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: <Widget>[

              PhotoViewGallery.builder(
                scrollDirection: Axis.horizontal,
                scrollPhysics: const BouncingScrollPhysics(),
                builder: (BuildContext context, int index) {
                  return PhotoViewGalleryPageOptions(
                    imageProvider: NetworkImage(widget.photoList[index]['image']),
                    initialScale: PhotoViewComputedScale.contained * 1,
                  );
                },
                itemCount: widget.photoList.length,
                // loadingChild: widget.loadingChild,
                backgroundDecoration: BoxDecoration(
                  color: Colors.black,
                ),
                pageController: PageController(initialPage: initialIndex), //点进去哪页默认就显示哪一页
                onPageChanged: onPageChanged,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Image ${currentIndex + 1}",
                  style: const TextStyle(color: Colors.white, fontSize: 17.0, decoration: null),
                ),
              )
            ],
          )),
    );
  }
}