import 'package:flutter/material.dart';
import 'package:leap/style.dart';


var home1 = Column(
  children: [
    Image.asset("lib/assets/plant1.png" ,scale: 0.9),
    Container(
      margin: const EdgeInsets.fromLTRB(30, 20, 30, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('레몬 바질 Lemon Basil' ,style: TextStyle(
              fontFamily: 'SansM',
              color: Colors.black87,
              fontSize: 25
          ),),
          const Text('', style:  TextStyle(
              fontFamily: 'SansM',
              color: Colors.black87,
              fontSize: 6
          ),),
          const Text('바질은 꿀풀목 꿀풀과 속한 한해살이풀이다. 키는 20~60cm 정도이며 잎은 연한 녹색의 타원형으로 길이 1.5~5cm, 너비 1~3cm 정도이다. 향이 강하게 나므로 향신료 또는 방향제로 쓰인다. 열대 아시아가 원산이다.번식은 주로 씨앗으로 한다.',
            style: TextStyle(
                fontFamily: 'SansM',
                color: Colors.black87,
                fontSize: 14
            ),)
        ],
      ),
    ),
  ],
);

var home2 = Column(
  children: [
    Image.asset("lib/assets/plant3.png" , scale: 0.9),
    Container(
      margin: const EdgeInsets.fromLTRB(30, 20, 30, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('바질 Basil' ,style: TextStyle(
              fontFamily: 'SansM',
              color: Colors.black87,
              fontSize: 25
          ),),
          const Text('', style:  TextStyle(
              fontFamily: 'SansM',
              color: Colors.black87,
              fontSize: 6
          ),),
          const Text('바질은 꿀풀목 꿀풀과 속한 한해살이풀이다. 키는 20~60cm 정도이며 잎은 연한 녹색의 타원형으로 길이 1.5~5cm, 너비 1~3cm 정도이다. 향이 강하게 나므로 향신료 또는 방향제로 쓰인다. 열대 아시아가 원산이다.번식은 주로 씨앗으로 한다.',
            style: TextStyle(
                fontFamily: 'SansM',
                color: Colors.black87,
                fontSize: 14
            ),)
        ],
      ),
    ),
  ],
);

var home3 = Column(
  children: [
    Image.asset("lib/assets/plant2.png" , scale: 0.9),
    Container(
      margin: const EdgeInsets.fromLTRB(30, 20, 30, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('바질 Basil' ,style: TextStyle(
              fontFamily: 'SansM',
              color: Colors.black87,
              fontSize: 25
          ),),
          const Text('', style:  TextStyle(
              fontFamily: 'SansM',
              color: Colors.black87,
              fontSize: 6
          ),),
          const Text('바질은 꿀풀목 꿀풀과 속한 한해살이풀이다. 키는 20~60cm 정도이며 잎은 연한 녹색의 타원형으로 길이 1.5~5cm, 너비 1~3cm 정도이다. 향이 강하게 나므로 향신료 또는 방향제로 쓰인다. 열대 아시아가 원산이다.번식은 주로 씨앗으로 한다.',
            style: TextStyle(
                fontFamily: 'SansM',
                color: Colors.black87,
                fontSize: 14
            ),)
        ],
      ),
    ),
  ],
);

var home4 = Column(
  children: [
    Image.asset("lib/assets/plant4.png", scale: 0.9),
    Container(
      margin: const EdgeInsets.fromLTRB(30, 20, 30, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('바질 Basil' ,style: TextStyle(
              fontFamily: 'SansM',
              color: Colors.black87,
              fontSize: 25
          ),),
          const Text('', style:  TextStyle(
              fontFamily: 'SansM',
              color: Colors.black87,
              fontSize: 6
          ),),
          const Text('바질은 꿀풀목 꿀풀과 속한 한해살이풀이다. 키는 20~60cm 정도이며 잎은 연한 녹색의 타원형으로 길이 1.5~5cm, 너비 1~3cm 정도이다. 향이 강하게 나므로 향신료 또는 방향제로 쓰인다. 열대 아시아가 원산이다.번식은 주로 씨앗으로 한다.',
            style: TextStyle(
                fontFamily: 'SansM',
                color: Colors.black87,
                fontSize: 14
            ),)
        ],
      ),
    ),
  ],
);


class ImageBox extends StatelessWidget {
  const ImageBox({Key? key, this.adress}) : super(key: key);

  final adress;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10)
      ),
      alignment: Alignment.center,
      child: Image.asset(adress)
    );
  }
}
