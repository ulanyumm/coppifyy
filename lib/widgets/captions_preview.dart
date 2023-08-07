import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';

class CaptionPreviewWidget extends StatefulWidget {
  const CaptionPreviewWidget({
    super.key,
  });

  @override
  State<CaptionPreviewWidget> createState() => _CaptionPreviewWidgetState();
}

class _CaptionPreviewWidgetState extends State<CaptionPreviewWidget> {
  String accountName = 'ulanyum@mail.ru';

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Card(
            elevation: 2,
            child: Column(children: [
              ListTile(
                visualDensity: VisualDensity(
                  vertical: -2,
                ),
                leading: CircleAvatar(
                  child: ProfilePicture(
                      random: true,
                      name: accountName,
                      radius: 31,
                      fontsize: 21),
                ),
                title: Text('$accountName', style: TextStyle(fontSize: 11)),
                subtitle: Text('Sponsored', style: TextStyle(fontSize: 10)),
              ),
              Image.asset(
                'assets/images/default-image.png',
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Shop Now'),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      )
                    ],
                  ),
                ),
              ),
              Divider(),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(children: [
                  Icon(Icons.favorite_border),
                  Icon(Icons.chat_bubble_outline_sharp),
                  Icon(Icons.near_me_outlined),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                    text: TextSpan(
                        text: '$accountName',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        children: <TextSpan>[
                      TextSpan(
                        text:
                            ' "Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir. Lorem Ipsum, adı bilinmeyen bir matbaacının bir hurufat numune kitabı oluşturmak üzere bir yazı galerisini alarak karıştırdığı 1500lerden beri endüstri standardı sahte metinler olarak kullanılmıştır. Beşyüz yıl boyunca varlığını sürdürmekle kalmamış, aynı zamanda pek değişmeden elektronik dizgiye de sıçramıştır."',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ])),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      visualDensity: VisualDensity.compact,
                      onPressed: () {},
                      icon: Icon(
                        Icons.thumb_up_outlined,
                        size: 15,
                      )),
                  IconButton(
                      visualDensity: VisualDensity.compact,
                      onPressed: () {},
                      icon: Icon(
                        Icons.thumb_down_outlined,
                        size: 15,
                      )),
                  IconButton(
                      visualDensity: VisualDensity.compact,
                      onPressed: () {},
                      icon: Icon(Icons.copy, size: 15)),
                  IconButton(
                      visualDensity: VisualDensity.compact,
                      onPressed: () {},
                      icon: Icon(
                        Icons.delete_outlined,
                        size: 15,
                      )),
                ],
              ),
            ]),
          )
        ]));
  }
}
