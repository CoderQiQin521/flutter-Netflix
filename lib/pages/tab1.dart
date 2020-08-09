import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// tab 第一个页面
class ProductList extends StatelessWidget {
  const ProductList({
    Key key,
  }) : super(key: key);
  // final List<Product> products; this.products

  // 退出app
  static Future<void> pop() async {
    await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.amber,
        ),
        title: Text(
          '电影',
          style: TextStyle(color: Colors.amber),
        ),
        centerTitle: true,
        // backgroundColor: Colors.white,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(0),
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://mirror-gold-cdn.xitu.io/168e08d73c736f6183a?imageView2/1/w/180/h/180/q/85/format/webp/interlace/1'),
              ),
              accountName: Text(
                'CoderQiQin',
                style: TextStyle(fontSize: 22.0, color: Colors.amber),
              ),
              accountEmail: Text(
                '296670156@qq.com',
                style: TextStyle(color: Colors.white54),
              ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://res.cloudinary.com/dqxtn0ick/image/upload/v1542285471/header/home.jpg'))),
            ),
            ListTile(
              title: Text('退出'),
              trailing: Icon(Icons.exit_to_app),
              onTap: () async {
                await pop();
              },
            )
          ],
        ),
      ),
      body: Test(),
      // body: ListView.builder(
      //   itemCount: products.length,
      //   itemBuilder: (context, index) {
      //     return ListTile(
      //       leading: Icon(Icons.mobile_screen_share),
      //       title: Text(products[index].title),
      //       subtitle: Text('全栈工程师1,我使用flutter,完美适配android&ios平台,高性能60fps框架'),
      //       onTap: () async {
      //         final result = await Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) => Detail2(),
      //           ),
      //         );
      //         print(result);

      //         Scaffold.of(context).showSnackBar(
      //           SnackBar(
      //             content: Text('${result}'),
      //           ),
      //         );

      //         print('打印${index}');
      //       },
      //     );
      //   },
      // ),
    );
  }

  _navigatorToDetail(BuildContext context) async {}
}

// 无状态组件
class Test extends StatelessWidget {
  const Test({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      padding: EdgeInsets.all(10.0),
      child: Column(children: [
        Text(
            'Netflix（/ˈnɛtflɪks/），或译为网飞、奈飞，是起源于美国、在多国提供网络视频点播的OTT服务公司[5]，并同时在美国国内经营单一费率邮寄DVD出租服务，后者是使用回邮信封寄送DVD和Blu-ray出租光盘至消费者指定的收件地址。公司由里德·哈斯廷斯和马克·兰多夫在1997年8月29日成立，总部位于加利福尼亚州的洛斯盖图，1999年开始推出订阅制的服务。到了2009年，Netflix已可提供超过10万部电影DVD，订阅者数超过1000万人[6]。如今，Netflix在流媒体平台上已是世界数一数二的佼佼者，主要的竞争对手有HBO、亚马逊视频、Disney+、YouTube、Apple TV+及AT&T。2017年6月6日，《2017年BrandZ最具价值全球品牌100强》公布，Netflix名列第92位。2017年11月30日，美国流媒体巨头、世界最大的收费视频网站Netflix买下《白夜追凶》播放权，这是该公司首次买下中国的网络剧集版权，计划在全球190多个国家和地区上线。2018年10月，《财富》未来公司50强排行榜发布，Netflix排名第八。2018年12月，世界品牌实验室编制的《2018世界品牌500强》揭晓，排名第88。2019年10月，位列2019福布斯全球数字经济100强榜第46名。2019年10月，Interbrand发布的全球品牌百强榜排名65。2020年1月22日，名列2020年《财富》全球最受赞赏公司榜单第16位。'),
        SizedBox(height: 20),
        Text(
            '除了光盘出租服务外，Netflix另外提供在线视频流服务，能使用各种网络设备链接到Netflix的在线内容数据库，单一订阅者的账号能同时让多人使用，即使在非订阅者的电脑或设备上也能登录服务。网络流和实体光盘的数据库有显著的不同，光盘数据库提供较多的电影选择[7]，而网络流数据库则有较多的Netflix原创内容。根据Sandvine公司在2013年的报告，Netflix是美国最大的下传网络流量来源，共占据了32.3%的下传总流量，以及28.8%的集计下载流量[8]。当流服务刚推出时，Netflix的传统光盘出租订阅者能免费使用流服务。订阅者每月月费的1美元约可换得1小时的流视频（例如16.99美元的方案，订阅者可获得17小时的影片流时间）。2008年1月，Netflix取消了流服务的时间限制，几乎所有光盘出租服务订阅者都可免费享有不限时数的影片流（然而4.99美元月费的订阅者每月仍仅能观看2小时的流视频），这项改变是回应了Hulu和苹果公司所新推出的视频出租服务[9]。在2015年4月，由于光盘出租和网络流市场的差异性，Netflix将DVD出租订阅和流订阅服务独立分开，完全取消了流视频的时数限制。目前Netflix的在线视频流服务订阅费用约为每月7.99至11.99美元，并针对新订阅者提供第一个月免费的服务。在2014年10月10日以前，Netflix的流服务并不支持Linux PC，然而以Linux为基础架构的Roku机顶盒则可以使用Netflix服务。Linux电脑的用户可透过转接器将Roku机顶盒、电子游戏主机或Blu-ray光盘播放器连接至Linux电脑，或使用VirtualBox或QEMU等虚拟电脑软件运行Microsoft Windows来观看Netflix。在《TechRepublic》2010年8月的一篇专访中，Neflix的公司通信副总裁表示Linux上可使用的Moonlight等Silverlightj外挂组件并不支持Netflix需要的PlayReady数字版权管理（DRM）系统。[10]然而，Netflix支持Android操作系统，Android是Linux核心为主的复刻版本。一套以Wine为基础的非官方程式能让用户在不安装Windows虚拟机的情况下观看Netflix流视频。此套名为“Pipelight”的Firefox外挂组件，是以桌面版Netflix项目为基础，透过链接到在Wine基底上运行的Silverlight外挂组件，让Linux本地的网络浏览器能播放Netflix。[11]然而，在2014年10月10日，Ubuntu 12.04或14.04版本的用户，能安装支持Netflix HTML5数字版权管理机制的Chrome浏览器外挂组件。[12]透过Google Chrome播放的Netflix视频最高支持720p的清晰度。[13]根据尼尔森在2011年7月进行的调查，42%的Netflix订阅户使用个人电脑进行流、25%透过Wii游戏主机、14%的用户将电脑连接至电视、13%使用PlayStation 3，12%使用Xbox 360。[14]可观看的视频内容是依据用户的IP地址决定。对于大多数的用户，IP地址与其所在的地理位置相同。然而这也代表，如果用者透过其他国家的网络服务链接Netflix，则可观看该国市场提供的视频内容。')
      ]),
    ));
  }
}
