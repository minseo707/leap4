import 'dart:async';
import 'notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:leap/style.dart';
import 'package:pandabar/pandabar.dart';
import 'backend.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bubble/bubble.dart';
import 'package:keyboard_attachable/keyboard_attachable.dart';

void main() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => Store(),)
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MyApp()
    ),
      )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  void initState() {
    initNotification(); //추가함
  }

  @override
  State<MyApp> createState() => _MyAppState();
}
  String page = 'home';


class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    double displayWidth = MediaQuery.of(context).size.width;
    double displayHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      bottomNavigationBar: PandaBar(
        backgroundColor: Colors.white,
        buttonSelectedColor: Colors.black54,
        fabIcon: const Icon(
          Icons.camera_alt_outlined,
          color: Colors.black87,
        ),
        fabColors: [
          Colors.white,
          Colors.white
        ],
        buttonData: [
          PandaBarButtonData(
              id: 'home',
              icon: Icons.home_outlined,
              title: 'home'
          ),
          PandaBarButtonData(
              id: 'shop',
              icon: Icons.shopping_cart_outlined,
              title: 'shop'
          ),
          PandaBarButtonData(
              id: 'community',
              icon: Icons.people_alt_outlined,
              title: 'community'
          ),
          PandaBarButtonData(
              id: 'setting',
              icon: Icons.settings_outlined,
              title: 'setting'
          ),
        ],
        onChange: (id) {
          setState(() {
            page = id;
          });
        },
        onFabButtonPressed: () {

        },
      ),
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 90,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(5, 0, 15, 0),
              child: IconButton(
                  onPressed: (){},
                  icon: const Icon(Icons.list, color: Colors.black,size: 30,)
              ),
            ),
            const Text('Leap',
              style: TextStyle(
                fontFamily: 'SansB',
                color: Colors.black,
                fontSize:25
            ),)
          ],
        ),
        actions: [
          Container(
            margin: EdgeInsets.fromLTRB(10, 3, 0, 0),
            child: IconButton(
                onPressed: (){
                  Navigator.push(context, SizeTransition5(const ChatPage(name: '스킨답서스',)));
                },
                icon: const Icon(Icons.chat, color: Colors.black, size: 30,)
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 25, 0),
            child: IconButton(
                onPressed: (){
                  Navigator.push(context, SizeTransition5(const AccountPage()));
                },
                icon: const Icon(Icons.account_circle, color: Colors.black,size: 40,)
            ),
          )
        ],
      ),
        body: Builder(
          builder: (context) {
            switch (page) {
              case 'home':
                return Container(
                  key: UniqueKey(),
                  child: SlideFadeTransition(
                    direction: Direction.vertical,
                    curve: Curves.easeOutExpo,
                    animationDuration: const Duration(milliseconds: 500),
                    offset: 0.01,
                    delayStart: const Duration(milliseconds: 0),
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: TextField(
                              onSubmitted: (text){
                                Navigator.push(context, SizeTransition1(const Search()));
                              },
                              style: const TextStyle(
                                  fontFamily: 'Nato',
                                  fontWeight: FontWeight.w400
                              ),
                              cursorColor: Colors.black26,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 10),
                                prefixIcon: Icon(Icons.search),
                                hintText: '어떤 식물을 찾으세요?',
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                ),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                ),
                                filled: true,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(10, 40, 10, 0),
                            child: Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.fromLTRB(15, 0, 15, 30),
                                  child: const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('오늘의 추천식물', style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Nato',
                                          fontWeight: FontWeight.w800
                                      ),)
                                  ),
                                ),
                                Container(
                                  height: displayHeight -234,
                                  child: ListView(
                                      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Column(
                                              children: [
                                                GestureDetector(
                                                  onTap: (){
                                                    Navigator.push(context, SizeTransition1(SecondPage(text: '레몬 바질', object: home1,)));
                                                  },
                                                  child: Container(padding: const EdgeInsets.fromLTRB(0, 0, 0, 15), decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(6.0),
                                                  ),
                                                    child: Image.asset("lib/assets/plant1.png" ,width: displayWidth /2 - 30,),
                                                  ),
                                                ),
                                                GestureDetector(
                                                    onTap: (){
                                                      Navigator.push(context, SizeTransition1(SecondPage(text: '안개꽃', object:home3)));
                                                    },
                                                  child: Container(padding: const EdgeInsets.fromLTRB(0, 0, 0, 0), decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(6.0),
                                                  ),child: Image.asset("lib/assets/plant2.png" ,width: displayWidth /2 - 30,),),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                GestureDetector(
                                                  onTap: (){
                                                    Navigator.push(context, SizeTransition1(SecondPage(text: '바질', object: home2,)));
                                                  },
                                                  child: Container(padding: const EdgeInsets.fromLTRB(0, 0, 0, 15), decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(6.0),
                                                  ),child: Image.asset("lib/assets/plant3.png" ,width: displayWidth /2 - 30,),),
                                                ),
                                                GestureDetector(
                                                  onTap: (){
                                                    Navigator.push(context, SizeTransition1(SecondPage(text: '화이트 장미',object: home4,)));
                                                  },
                                                  child: Container(padding: const EdgeInsets.fromLTRB(0, 0, 0, 0), decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(6.0),
                                                  ),child: Image.asset("lib/assets/plant4.png" ,width: displayWidth /2 - 30,),),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ]
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              case 'shop':
                return Container(
                  key: UniqueKey(),
                  child: SlideFadeTransition(
                    direction: Direction.vertical,
                    curve: Curves.easeOutExpo,
                    animationDuration: const Duration(milliseconds: 500),
                    offset: -0.01,
                    delayStart: const Duration(milliseconds: 0),
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: TextField(
                              onSubmitted: (text){
                                Navigator.push(context, SizeTransition1(const Search()));
                              },
                              style: const TextStyle(
                                  fontFamily: 'Nato',
                                  fontWeight: FontWeight.w400
                              ),
                              cursorColor: Colors.black26,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 10),
                                prefixIcon: Icon(Icons.search),
                                hintText: '어떤 식물을 찾으세요?',
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                ),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                ),
                                filled: true,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(10, 40, 10, 0),
                            child: Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.fromLTRB(15, 0, 15, 30),
                                  child: const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('이 식물 어떠세요?', style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Nato',
                                          fontWeight: FontWeight.w800
                                      ),)
                                  ),
                                ),
                                Container(
                                  height: displayHeight -234,
                                  child: ListView(
                                      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              children: [
                                                GestureDetector(
                                                  onTap: (){
                                                    Navigator.push(context, SizeTransition1(SecondPage(text: '레몬 바질',)));
                                                  },
                                                  child: Container(padding: const EdgeInsets.fromLTRB(0, 0, 0, 15), decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(6.0),
                                                  ),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Image.asset("lib/assets/shop1.png" ,width: displayWidth /2 - 30,),
                                                        Container(
                                                          height: 30,
                                                          width: displayWidth /2 - 30,
                                                          child: ListTile(
                                                            dense: true,
                                                            contentPadding: EdgeInsets.zero,
                                                            leading: const Text(' 식물 1',style: TextStyle(
                                                                fontFamily: 'Nato',
                                                                fontWeight: FontWeight.w500,
                                                                fontSize: 14
                                                            ),),
                                                            trailing: Wrap(
                                                              children: [
                                                                  const Icon(Icons.favorite_outline, size: 18,),
                                                                  const Text('30 ', style: TextStyle(
                                                                      fontFamily: 'Nato',
                                                                      fontWeight: FontWeight.w500,
                                                                      fontSize: 14
                                                                  ),)
                                                                ],
                                                              ),
                                                            ),
                                                        ),
                                                        const Text(' ₩ 6000',style: TextStyle(
                                                          fontFamily: 'Nato',
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: 14
                                                        ),),

                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: (){
                                                    Navigator.push(context, SizeTransition1(SecondPage(text: '레몬 바질',)));
                                                  },
                                                  child: Container(padding: const EdgeInsets.fromLTRB(0, 0, 0, 15), decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(6.0),
                                                  ),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Image.asset("lib/assets/shop3.png" ,width: displayWidth /2 - 30,),
                                                        Container(
                                                          height: 30,
                                                          width: displayWidth /2 - 30,
                                                          child: ListTile(
                                                            dense: true,
                                                            contentPadding: EdgeInsets.zero,
                                                            leading: const Text(' 식물 3',style: TextStyle(
                                                                fontFamily: 'Nato',
                                                                fontWeight: FontWeight.w500,
                                                                fontSize: 14
                                                            ),),
                                                            trailing: Wrap(
                                                              children: [
                                                                const Icon(Icons.favorite, size: 18,),
                                                                const Text('10 ', style: TextStyle(
                                                                    fontFamily: 'Nato',
                                                                    fontWeight: FontWeight.w500,
                                                                    fontSize: 14
                                                                ),)
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        const Text(' ₩ 8000',style: TextStyle(
                                                            fontFamily: 'Nato',
                                                            fontWeight: FontWeight.w500,
                                                            fontSize: 14
                                                        ),),

                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: (){
                                                    Navigator.push(context, SizeTransition1(SecondPage(text: '레몬 바질',)));
                                                  },
                                                  child: Container(padding: const EdgeInsets.fromLTRB(0, 0, 0, 15), decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(6.0),
                                                  ),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Image.asset("lib/assets/shop5.png" ,width: displayWidth /2 - 30,),
                                                        Container(
                                                          height: 30,
                                                          width: displayWidth /2 - 30,
                                                          child: ListTile(
                                                            dense: true,
                                                            contentPadding: EdgeInsets.zero,
                                                            leading: const Text(' 식물 5',style: TextStyle(
                                                                fontFamily: 'Nato',
                                                                fontWeight: FontWeight.w500,
                                                                fontSize: 14
                                                            ),),
                                                            trailing: Wrap(
                                                              children: [
                                                                const Icon(Icons.favorite_outline, size: 18,),
                                                                const Text('15 ', style: TextStyle(
                                                                    fontFamily: 'Nato',
                                                                    fontWeight: FontWeight.w500,
                                                                    fontSize: 14
                                                                ),)
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        const Text(' ₩ 5000',style: TextStyle(
                                                            fontFamily: 'Nato',
                                                            fontWeight: FontWeight.w500,
                                                            fontSize: 14
                                                        ),),

                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                GestureDetector(
                                                  onTap: (){
                                                    Navigator.push(context, SizeTransition1(  SecondPage(text: '레몬 바질',)));
                                                  },
                                                  child: Container(padding: const EdgeInsets.fromLTRB(0, 0, 0, 15), decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(6.0),
                                                  ),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Image.asset("lib/assets/shop2.png" ,width: displayWidth /2 - 30,),
                                                        Container(
                                                          height: 30,
                                                          width: displayWidth /2 - 30,
                                                          child: ListTile(
                                                            dense: true,
                                                            contentPadding: EdgeInsets.zero,
                                                            leading: const Text(' 식물 2',style: TextStyle(
                                                                fontFamily: 'Nato',
                                                                fontWeight: FontWeight.w500,
                                                                fontSize: 14
                                                            ),),
                                                            trailing: Wrap(
                                                              children: [
                                                                const Icon(Icons.favorite, size: 18,),
                                                                const Text('12 ', style: TextStyle(
                                                                    fontFamily: 'Nato',
                                                                    fontWeight: FontWeight.w500,
                                                                    fontSize: 14
                                                                ),)
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        const Text(' ₩ 13000',style: TextStyle(
                                                            fontFamily: 'Nato',
                                                            fontWeight: FontWeight.w500,
                                                            fontSize: 14
                                                        ),),

                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: (){
                                                    Navigator.push(context, SizeTransition1(SecondPage(text: '레몬 바질',)));
                                                  },
                                                  child: Container(padding: const EdgeInsets.fromLTRB(0, 0, 0, 15), decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(6.0),
                                                  ),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Image.asset("lib/assets/shop4.png" ,width: displayWidth /2 - 30,),
                                                        Container(
                                                          height: 30,
                                                          width: displayWidth /2 - 30,
                                                          child: ListTile(
                                                            dense: true,
                                                            contentPadding: EdgeInsets.zero,
                                                            leading: const Text(' 식물 4',style: TextStyle(
                                                                fontFamily: 'Nato',
                                                                fontWeight: FontWeight.w500,
                                                                fontSize: 14
                                                            ),),
                                                            trailing: Wrap(
                                                              children: [
                                                                const Icon(Icons.favorite_outline, size: 18,),
                                                                const Text('34 ', style: TextStyle(
                                                                    fontFamily: 'Nato',
                                                                    fontWeight: FontWeight.w500,
                                                                    fontSize: 14
                                                                ),)
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        const Text(' ₩ 23000',style: TextStyle(
                                                            fontFamily: 'Nato',
                                                            fontWeight: FontWeight.w500,
                                                            fontSize: 14
                                                        ),),

                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ]
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              case 'community':
                return Container(
                  key: UniqueKey(),
                  child: SlideFadeTransition(
                    direction: Direction.horizontal,
                    curve: Curves.easeOutExpo,
                    animationDuration: const Duration(milliseconds: 500),
                    offset: -0.01,
                    delayStart: const Duration(milliseconds: 0),
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: TextField(
                              onSubmitted: (text){
                                Navigator.push(context, SizeTransition1(const Search()));
                              },
                              style: const TextStyle(
                                  fontFamily: 'Nato',
                                  fontWeight: FontWeight.w400
                              ),
                              cursorColor: Colors.black26,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 10),
                                prefixIcon: Icon(Icons.search),
                                hintText: '어떤 식물을 찾으세요?',
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                ),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                ),
                                filled: true,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(10, 40, 10, 0),
                            child: Column(
                              children: [
                                Container(
                                  height: displayHeight -234,
                                  child: ListView(
                                      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              children: [
                                                GestureDetector(
                                                  onTap: (){
                                                    Navigator.push(context, SizeTransition1(SecondPage(text: '식물을 잘 키우는 방법',)));
                                                  },
                                                  child: Container(padding: const EdgeInsets.fromLTRB(0, 0, 0, 25), decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(6.0),
                                                  ),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Image.asset("lib/assets/com1.png" ,width: displayWidth /2 - 30,),
                                                        Container(
                                                          height: 32,
                                                          width: displayWidth /2 - 30,
                                                          child: ListTile(
                                                            dense: true,
                                                            contentPadding: EdgeInsets.zero,
                                                            leading: const Text('식물을 잘 키우는 방법',style: TextStyle(
                                                                fontFamily: 'Nato',
                                                                fontWeight: FontWeight.w500,
                                                                fontSize: 14
                                                            ),),
                                                            trailing: Wrap(
                                                              children: [
                                                                const Icon(Icons.mode_comment_outlined, size: 18,),
                                                                const Text(' 1 ', style: TextStyle(
                                                                    fontFamily: 'Nato',
                                                                    fontWeight: FontWeight.w500,
                                                                    fontSize: 14
                                                                ),)
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        const Text('리프 Leap',style: TextStyle(
                                                            fontFamily: 'Nato',
                                                            fontWeight: FontWeight.w300,
                                                            fontSize: 11
                                                        ),),

                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: (){
                                                    Navigator.push(context, SizeTransition1(SecondPage(text: '식물 카페 방문기',)));
                                                  },
                                                  child: Container(padding: const EdgeInsets.fromLTRB(0, 0, 0, 25), decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(6.0),
                                                  ),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Image.asset("lib/assets/com3.png" ,width: displayWidth /2 - 30,),
                                                        Container(
                                                          height: 32,
                                                          width: displayWidth /2 - 30,
                                                          child: ListTile(
                                                            dense: true,
                                                            contentPadding: EdgeInsets.zero,
                                                            leading: const Text('식물 카페 방문기',style: TextStyle(
                                                                fontFamily: 'Nato',
                                                                fontWeight: FontWeight.w500,
                                                                fontSize: 14
                                                            ),),
                                                            trailing: Wrap(
                                                              children: [
                                                                const Icon(Icons.mode_comment_outlined, size: 18,),
                                                                const Text(' 7 ', style: TextStyle(
                                                                    fontFamily: 'Nato',
                                                                    fontWeight: FontWeight.w500,
                                                                    fontSize: 14
                                                                ),)
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        const Text('한지훈',style: TextStyle(
                                                            fontFamily: 'Nato',
                                                            fontWeight: FontWeight.w300,
                                                            fontSize: 11
                                                        ),),

                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: (){
                                                    Navigator.push(context, SizeTransition1(SecondPage(text: '플렌테이러 팁 7가지',)));
                                                  },
                                                  child: Container(padding: const EdgeInsets.fromLTRB(0, 0, 0, 0), decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(6.0),
                                                  ),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Image.asset("lib/assets/com5.png" ,width: displayWidth /2 - 30,),
                                                        Container(
                                                          height: 32,
                                                          width: displayWidth /2 - 30,
                                                          child: ListTile(
                                                            dense: true,
                                                            contentPadding: EdgeInsets.zero,
                                                            leading: const Text('플랜테리어 팁 7가지',style: TextStyle(
                                                                fontFamily: 'Nato',
                                                                fontWeight: FontWeight.w500,
                                                                fontSize: 14
                                                            ),),
                                                            trailing: Wrap(
                                                              children: [
                                                                const Icon(Icons.mode_comment_outlined, size: 18,),
                                                                const Text(' 11 ', style: TextStyle(
                                                                    fontFamily: 'Nato',
                                                                    fontWeight: FontWeight.w500,
                                                                    fontSize: 14
                                                                ),)
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        const Text('최휴림',style: TextStyle(
                                                            fontFamily: 'Nato',
                                                            fontWeight: FontWeight.w300,
                                                            fontSize: 11
                                                        ),),

                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                GestureDetector(
                                                  onTap: (){
                                                    Navigator.push(context, SizeTransition1(SecondPage(text: '선인장 키우기 5개월차',)));
                                                  },
                                                  child: Container(padding: const EdgeInsets.fromLTRB(0, 0, 0, 25), decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(6.0),
                                                  ),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Image.asset("lib/assets/com2.png" ,width: displayWidth /2 - 30,),
                                                        Container(
                                                          height: 32,
                                                          width: displayWidth /2 - 30,
                                                          child: ListTile(
                                                            dense: true,
                                                            contentPadding: EdgeInsets.zero,
                                                            leading: const Text('선인장 키우기 5개월차',style: TextStyle(
                                                                fontFamily: 'Nato',
                                                                fontWeight: FontWeight.w500,
                                                                fontSize: 14
                                                            ),),
                                                            trailing: Wrap(
                                                              children: [
                                                                const Icon(Icons.mode_comment_outlined, size: 18,),
                                                                const Text(' 4 ', style: TextStyle(
                                                                    fontFamily: 'Nato',
                                                                    fontWeight: FontWeight.w500,
                                                                    fontSize: 14
                                                                ),)
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        const Text('이가람',style: TextStyle(
                                                            fontFamily: 'Nato',
                                                            fontWeight: FontWeight.w300,
                                                            fontSize: 11
                                                        ),),

                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: (){
                                                    Navigator.push(context, SizeTransition1(SecondPage(text: '느낌있는 식물사진을 찍는 방법',)));
                                                  },
                                                  child: Container(padding: const EdgeInsets.fromLTRB(0, 0, 0, 15), decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(6.0),
                                                  ),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Image.asset("lib/assets/com4.png" ,width: displayWidth /2 - 30,),
                                                        Container(
                                                          height: 30,
                                                          width: displayWidth /2 - 30,
                                                          child: ListTile(
                                                            dense: true,
                                                            contentPadding: EdgeInsets.zero,
                                                            leading: const Text('느낌있는 식물사진을 찍는..',style: TextStyle(
                                                                fontFamily: 'Nato',
                                                                fontWeight: FontWeight.w500,
                                                                fontSize: 14
                                                            ),),
                                                            trailing: Wrap(
                                                              children: [
                                                                const Icon(Icons.mode_comment_outlined, size: 18,),
                                                                const Text(' 34 ', style: TextStyle(
                                                                    fontFamily: 'Nato',
                                                                    fontWeight: FontWeight.w500,
                                                                    fontSize: 14
                                                                ),)
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        const Text('리프 Leap',style: TextStyle(
                                                            fontFamily: 'Nato',
                                                            fontWeight: FontWeight.w300,
                                                            fontSize: 11
                                                        ),),

                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ]
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              case 'setting':
                return Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.new_releases_rounded, size: 50,),
                      Text("준비중입니다!",style: black,)
                    ],
                  ),
                );
              default:
                return Container();

            }

          },
        )
    );
  }
}

// Animations Controller

enum Direction { vertical, horizontal }

class SlideFadeTransition extends StatefulWidget {
  final Widget child;
  final double offset;
  final Curve curve;
  final Direction direction;
  final Duration delayStart;
  final Duration animationDuration;

  const SlideFadeTransition({Key? key,
    required this.child,
    this.offset = 1.0,
    this.curve = Curves.easeIn,
    this.direction = Direction.vertical,
    this.delayStart = const Duration(seconds: 0),
    this.animationDuration = const Duration(milliseconds: 1000),
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SlideFadeTransitionState createState() => _SlideFadeTransitionState();
}

class _SlideFadeTransitionState extends State<SlideFadeTransition>
    with SingleTickerProviderStateMixin {
  late Animation<Offset> _animationSlide;

  late AnimationController _animationController;

  late Animation<double> _animationFade;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );

    if (widget.direction == Direction.vertical) {
      _animationSlide =
          Tween<Offset>(begin: Offset(0, widget.offset), end: const Offset(0, 0))
              .animate(CurvedAnimation(
            curve: widget.curve,
            parent: _animationController,
          ));
    } else {
      _animationSlide =
          Tween<Offset>(begin: Offset(widget.offset, 0), end: const Offset(0, 0))
              .animate(CurvedAnimation(
            curve: widget.curve,
            parent: _animationController,
          ));
    }

    _animationFade =
        Tween<double>(begin: -1.0, end: 1.0).animate(CurvedAnimation(
          curve: widget.curve,
          parent: _animationController,
        ));

    Timer(widget.delayStart, () {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animationFade,
      child: SlideTransition(
        position: _animationSlide,
        child: widget.child,
      ),
    );
  }
}


class SizeTransition1 extends PageRouteBuilder {
  final Widget page;

  SizeTransition1(this.page)
      : super(
    pageBuilder: (context, animation, anotherAnimation) => page,
    transitionDuration: const Duration(milliseconds: 400),
    reverseTransitionDuration: const Duration(milliseconds: 200),
    transitionsBuilder: (context, animation, anotherAnimation, child) {
      animation = CurvedAnimation(
          curve: Curves.fastLinearToSlowEaseIn,
          parent: animation,
          reverseCurve: Curves.fastOutSlowIn);
      return Align(
        alignment: Alignment.bottomCenter,
        child: SizeTransition(
          sizeFactor: animation,
          axisAlignment: 0,
          child: page,
        ),
      );
    },
  );
}

class SizeTransitionDown extends PageRouteBuilder {
  final Widget page;

  SizeTransitionDown(this.page)
      : super(
    pageBuilder: (context, animation, anotherAnimation) => page,
    transitionDuration: const Duration(milliseconds: 400),
    reverseTransitionDuration: const Duration(milliseconds: 10),
    transitionsBuilder: (context, animation, anotherAnimation, child) {
      animation = CurvedAnimation(
          curve: Curves.fastLinearToSlowEaseIn,
          parent: animation,
          reverseCurve: Curves.fastOutSlowIn);
      return Align(
        alignment: Alignment.bottomCenter,
        child: SizeTransition(
          axis: Axis.vertical,
          sizeFactor: animation,
          axisAlignment: 3,
          child: page,
        ),
      );
    },
  );
}

class SizeTransition5 extends PageRouteBuilder {
  final Widget page;

  SizeTransition5(this.page)
      : super(
    pageBuilder: (context, animation, anotherAnimation) => page,
    transitionDuration: const Duration(milliseconds: 1000),
    reverseTransitionDuration: const Duration(milliseconds: 200),
    transitionsBuilder: (context, animation, anotherAnimation, child) {
      animation = CurvedAnimation(
          curve: Curves.fastLinearToSlowEaseIn,
          parent: animation,
          reverseCurve: Curves.fastOutSlowIn);
      return Align(
        alignment: Alignment.centerRight,
        child: SizeTransition(
          axis: Axis.horizontal,
          sizeFactor: animation,
          axisAlignment: 0,
          child: page,
        ),
      );
    },
  );
}

class SecondPage extends StatelessWidget {
  SecondPage({Key? key,this.text, this.object}) : super(key: key);
  final text;
  var object;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: [
            SlideFadeTransition(
              delayStart: const Duration(milliseconds: 0),
              animationDuration: const Duration(milliseconds: 600),
              offset: 0.5,
              curve: Curves.easeOutExpo,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    child: object ?? Align(
                      alignment: Alignment.center,
                        child: const Text('페이지를 불러올 수 없습니다.')
                    )
                ),
              ),
            )
          ],
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text('$text' ,style: const TextStyle(
              fontFamily: 'SansM',
            color: Colors.black87
          ),),
          leading: InkWell(child: const Icon(Icons.arrow_back, size: 30, color: Colors.black87,), onTap: (){Navigator.pop(context);},),
          backgroundColor: Colors.white,
          elevation: 0,
        )
    );
  }
}

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 90,
        backgroundColor: const Color(0xFFFFFF),
        leading: InkWell(child: const Icon(Icons.arrow_back, size: 30, color: Colors.black87,), onTap: (){Navigator.pop(context);},),
        title: Row(
          children: [
            const Text('Leap',
              style: TextStyle(
                  fontFamily: 'SansB',
                  color: Colors.black,
                  fontSize:25
              ),)
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 25, 0),
            child: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.account_circle, color: Colors.black,size: 40,)
            ),
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
          image: AssetImage('lib/assets/plant3.png'),
          fit: BoxFit.fitHeight,
            colorFilter: ColorFilter.mode(
                Colors.white54,
                BlendMode.screen
            )
         ),
        ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Container(
            margin: const EdgeInsets.fromLTRB(20, 200, 20, 0),
            child: Column(
              children: [
                const TextField(
                  style: TextStyle(
                      fontFamily: 'Nato',
                      fontWeight: FontWeight.w400
                  ),
                  cursorColor: Colors.black26,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                    prefixIcon: Icon(Icons.search),
                    hintText: '어떤 식물을 등록하실 건가요?',
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    filled: true,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  height: 150,
                  width: MediaQuery.of(context).size.width - 30,
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(''),
                      const Text(''),
                      const Text('', style: TextStyle(fontFamily: 'SansM', color: Colors.black87,fontSize: 6)),
                      Container(child: const Text('    바질 (89일째)', style: TextStyle(fontFamily: 'SansB', color: Colors.black87,fontSize: 23),)),
                      const Text('', style: TextStyle(fontFamily: 'SansM', color: Colors.black87,fontSize: 6)),
                      const Text('       온도 24도', style: TextStyle(fontFamily: 'SansM', color: Colors.black87,fontSize: 15),),
                      const Text('       습도 75%', style: TextStyle(fontFamily: 'SansM', color: Colors.black87,fontSize: 15),),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: PandaBar(
        backgroundColor: Colors.white,
        buttonSelectedColor: Colors.black54,
        fabIcon: const Icon(
          Icons.camera_alt_outlined,
          color: Colors.black87,
        ),
        fabColors: [
          Colors.white,
          Colors.white
        ],
        buttonData: [
          PandaBarButtonData(
              id: 'home',
              icon: Icons.home_outlined,
              title: 'home'
          ),
          PandaBarButtonData(
              id: 'shop',
              icon: Icons.shopping_cart_outlined,
              title: 'shop'
          ),
          PandaBarButtonData(
              id: 'community',
              icon: Icons.people_alt_outlined,
              title: 'community'
          ),
          PandaBarButtonData(
              id: 'setting',
              icon: Icons.settings_outlined,
              title: 'setting'
          ),
        ],
        onChange: (id) {
          setState(() {
            page = id;
          });
        },
        onFabButtonPressed: () {
          showNotification();
        },
      ),
      extendBody: true,
    );
  }
}

class Search extends StatelessWidget {
  const Search({Key? key, this.text = '스킨답서스'}) : super(key: key);

  final text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          padding: EdgeInsets.zero,
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: [
            SlideFadeTransition(
              delayStart: const Duration(milliseconds: 0),
              animationDuration: const Duration(milliseconds: 600),
              offset: 0.5,
              curve: Curves.easeOutExpo,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  child: Column(
                    children: [
                      Image.asset("lib/assets/plant5.png" ,width: MediaQuery.of(context).size.width, scale: 0.1),
                      Container(
                        margin: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('스킨답서스 Golden Pothos' ,style: TextStyle(
                                fontFamily: 'SansM',
                                color: Colors.black87,
                              fontSize: 25
                            ),),
                            const Text('', style:  TextStyle(
                                fontFamily: 'SansM',
                                color: Colors.black87,
                                fontSize: 6
                            ),),
                            const Text('스킨답서스는 상록수 담쟁이과(evergreen vine)로서 20미터(66피트) 크기에, 나뭇잎은 4cm (2 인치)의 지름을 가졌으며, 벽을 타며, 뿌리는 공중에 위치하고 있다. 나뭇잎들은 재기 각각의 모양을 지니고 있으며, 불규칙적으로 최대 100cm (39 인치)의 길이에 45cm의 넓은 면적을 가지는 경우도 있다. 어린 잎들은 아주 작으며, 전형적으로는 20cm 미만 (8 인치)의 길이를 가지고 있다. 꽃은 불염포의 23cm 길이까지 자란다.',
                            style: TextStyle(
                                fontFamily: 'SansM',
                                color: Colors.black87,
                                fontSize: 14
                            ),)
                          ],
                        ),
                      ),
                    ],
                  )
                ),
              ),
            )
          ],
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text('"${text}"에 대한 검색내용' ,style: const TextStyle(
              fontFamily: 'SansM',
              color: Colors.black87
          ),),
          leading: InkWell(child: const Icon(Icons.arrow_back, size: 30, color: Colors.black87,), onTap: (){Navigator.pop(context);},),
          backgroundColor: Colors.white,
          elevation: 0,
        )
    );
  }
}


class ChatPage extends StatefulWidget {
  const ChatPage({Key? key, this.name = '스킨답서스', this.chatList}) : super(key: key);

  final name; // Plant Name
  final chatList;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Padding(
          padding: const EdgeInsets.all(3.0),
          child: IconButton(onPressed: (){}, icon: Icon(Icons.access_alarm),color: Colors.black,),
        )],
        centerTitle: false,
        title: Text("스킨답서스" ,style: const TextStyle(
            fontFamily: 'SansM',
            color: Colors.black87,
          fontSize: 15,
          fontWeight: FontWeight.w900
        ),),
        leading: InkWell(child: const Icon(Icons.arrow_back, size: 30, color: Colors.black87,), onTap: (){Navigator.of(context).popUntil((route) => route.isFirst);},),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            height: MediaQuery.of(context).size.height * context.read<Store>().chatPadding,
            child: ListView(
              children: [
                for (int i= 0; i < context.read<Store>().chatdata.length; i++)
                  if (context.read<Store>().chatdata[i].startsWith("A"))
                    Align(
                      alignment: Alignment.centerRight,
                      child: Bubble(
                        margin: BubbleEdges.only(top: 10),
                        child: Text(context.read<Store>().chatdata[i].replaceAll("A : ", ""), textAlign: TextAlign.right, style: TextStyle(fontFamily: "SansM"),),
                      ),
                    )
                  else if (context.read<Store>().chatdata[i].startsWith("B"))
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Bubble(
                        color: Color.fromRGBO(218, 255, 199, 1.0),
                        margin: BubbleEdges.only(top: 10),
                        child: Text(context.read<Store>().chatdata[i].replaceAll("B : ", ""), style: TextStyle(
                          fontFamily: "SansM"
                        ),),
                      ),
                    )


              ],
            ),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white
                ),
                onPressed: (){
                  Navigator.push(context, SizeTransition1(ChatInput()));
                },
                child: Icon(Icons.send,color: Colors.black87,),
              )
            ),
          ),
        ],
      ),
    );
  }
}

class ChatInput extends StatefulWidget {
  const ChatInput({Key? key}) : super(key: key);

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {

  final chatTextController = TextEditingController();

  void _exportText (){
    print(chatTextController.text);
    setState((){context.read<Store>().addChatdata("A : ${chatTextController.text}");});
  }

  void _clearText (){
    chatTextController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 30,
            ),
            TextField(
              onTap: (){},
              onSubmitted: (text){
                _exportText();
                _clearText();
                Navigator.of(context).pop();
                Navigator.push(context, SizeTransitionDown(ChatPage()));
              },
              controller: chatTextController,
              style: TextStyle(fontFamily: "SansM"),
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: (){
                    _exportText();
                    _clearText();
                    Navigator.of(context).pop();
                    Navigator.push(context, SizeTransitionDown(ChatPage()));
                  },
                  icon: Icon(Icons.send),
                ),
                contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                hintText: '메세지를 입력해 주세요..',
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                filled: true,
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(context, SizeTransitionDown(ChatPage()));
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                height: MediaQuery.of(context).size.height * context.read<Store>().chatPadding,
                child: ListView(
                  children: [
                    for (int i= 0; i < context.read<Store>().chatdata.length; i++)
                      if (context.read<Store>().chatdata[i].startsWith("A"))
                        Align(
                          alignment: Alignment.centerRight,
                          child: Bubble(
                            margin: BubbleEdges.only(top: 10),
                            child: Text(context.read<Store>().chatdata[i].replaceAll("A : ", ""), textAlign: TextAlign.right, style: TextStyle(fontFamily: "SansM"),),
                          ),
                        )
                      else if (context.read<Store>().chatdata[i].startsWith("B"))
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Bubble(
                            color: Color.fromRGBO(218, 255, 199, 1.0),
                            margin: BubbleEdges.only(top: 10),
                            child: Text(context.read<Store>().chatdata[i].replaceAll("B : ", ""), style: TextStyle(
                                fontFamily: "SansM"
                            ),),
                          ),
                        )


                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class Store with ChangeNotifier, DiagnosticableTreeMixin {

  var chatdata = <String>[
    "A : 오늘 진짜 춥다...",
    "B : 난 흙 속인데 그쪽 세상은 춥나봐?",
    "A : 흙 속에  살면 느낌이 어때? 안답답해?",
    "B : 넘나 따뜻한데 너가 물만 잘주면 완벽해",
    "A : 앞으로 더 열심히 줄게!",
    "B : 고마워 지금이 5번째 식물 인생인데 너는 좋은 주인같아",
    "A : 그래 고맙다..ㅎㅎ",
  ];

  var chatPadding = 0.82;


  addChatdata (input){
    chatdata.add(input);
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    // properties.add(IntProperty('count', count));
  }
}