// 导包
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
// import 'package:video_player/video_player.dart';

// 自定义页面
import './pages/tab1.dart';

Dio dio = new Dio();

// 抽象商品对象
class Product {
  final String title;
  final String description;
  Product(this.title, this.description);
}

void main() {
  runApp(MaterialApp(
      title: '电影', theme: ThemeData.dark(), home: MyNaviationBar()));
}

// ProductList(
//         // 传入list商品数据
//         products: List<Product>.generate(
//             100, (i) => Product('电影$i', '路由动态参数:一个电影详情,电影编号$i'))),
//   )

// main运行的 根组件
class MyNaviationBar extends StatefulWidget {
  MyNaviationBar({Key key}) : super(key: key);

  @override
  _MyNaviationBarState createState() => _MyNaviationBarState();
}

class _MyNaviationBarState extends State<MyNaviationBar> {
  int _currentIndex = 0;
  List<Widget> list = List();

  String title = '';
  @override
  void initState() {
    super.initState();

    // 请求赋值
    getlist().then((res) {
      setState(() {
        title = res['title'];
      });
    });

    /*
    
        products: List<Product>.generate(
            100, (i) => Product('电影', '路由动态参数:一个电影详情,电影编号$i')),
      )
    */
    list..add(ProductList())..add(Detail2());
  }

  getlist() async {
    Response response = await dio.get(
        'https://www.fastmock.site/mock/de8258e7b013fd4589f4d7ed66c78b75/testmock/flutter');
    return response.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.amber,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            title: Text('首页'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('搜索'),
          ),
        ],
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

// tab 2页面
class Detail2 extends StatefulWidget {
  Detail2({Key key}) : super(key: key);

  @override
  _Detail2State createState() => _Detail2State();
}

class _Detail2State extends State<Detail2> {
  String showText = '123';

  Future getHttp() async {
    try {
      Response response = await Dio().get(
          'https://www.fastmock.site/mock/de8258e7b013fd4589f4d7ed66c78b75/testmock/demo');
      print(response);
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    getHttp().then((val) {
      print(val);
      setState(() {
        showText = val['data']['base']['text']['cparagraph'];
      });
      // print(showText);
    });
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '搜索',
            style: TextStyle(color: Colors.amber),
          ),
          centerTitle: true,
        ),
        body: Container(child: Center(child: Text('精彩敬请期待'))));
  }
}

class Detail extends StatelessWidget {
  final Product product;
  const Detail({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('电影详情1:${product.title}'),
        ),
        body: Column(
          children: <Widget>[
            Image.network(
                'http://img5.mtime.cn/pi/2019/09/19/092411.78753623_1000X1000.jpg'),
            Center(
              child: Text(
                product.description,
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              child: RaisedButton(
                child: Text(
                  '后退',
                  style: TextStyle(fontSize: 18.0),
                ),
                color: Colors.black,
                textColor: Colors.red,
                onPressed: () {
                  Navigator.pop(context, '18538300839');
                },
              ),
            )
          ],
        ));
  }
}
