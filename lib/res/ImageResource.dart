var imageUrlList = [
  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1571378067128&di=a693db5153caeda8b8b36dd3f7527b2e&imgtype=0&src=http%3A%2F%2Fwx2.sinaimg.cn%2Fthumb150%2F0070528Aly1fo4h17nt5hj30xc0m8wwa.jpg",
  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1571972553&di=d55e3f08f1a24f5c564150833edea22b&imgtype=jpg&er=1&src=http%3A%2F%2Fwx2.sinaimg.cn%2Fthumb150%2F65a9a1ffgy1fr4z2wvinaj20m80etq5j.jpg",
  "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3056705682,45663607&fm=15&gp=0.jpg",
  "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3345026347,2266649699&fm=26&gp=0.jpg",
  "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2735362127,4232423319&fm=26&gp=0.jpg",
  "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3501278083,1639385994&fm=26&gp=0.jpg",
  "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3341435883,95842575&fm=26&gp=0.jpg",
  "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=4249076133,4249081791&fm=26&gp=0.jpg",
  "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2003242043,689056013&fm=26&gp=0.jpg",
  "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1604240148,3902114757&fm=26&gp=0.jpg",
  "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3585993630,2513992436&fm=26&gp=0.jpg",
  "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2860132563,712651659&fm=26&gp=0.jpg",
  "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=880787696,3224665242&fm=11&gp=0.jpg",
  "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1006275540,3334048295&fm=26&gp=0.jpg",
  "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3348857396,3466602711&fm=26&gp=0.jpg",
  "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3095925285,2423166299&fm=26&gp=0.jpg",
  "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=400808770,1664542884&fm=26&gp=0.jpg",
  "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2300421006,734437280&fm=26&gp=0.jpg",
  "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=4062796679,3780422220&fm=26&gp=0.jpg",
  "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=276318947,820384431&fm=26&gp=0.jpg",
  "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1629581345,1511360637&fm=11&gp=0.jpg",
  "http://liftadstorage.shaxuntech.com/Ft9iRtpVM8Av-TErhxXFMeE2w0cU.jpg?imageView2/0/w/200/h/200/q/75"
];

var adSiteScene = ["小区", "写字楼", "商场", "医院", "酒店", "商业广场", "私人住宅", "商住楼"];

var bannerImageUrl = [
  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1573455000680&di=21a932e2ee375455e79f60d612721d39&imgtype=0&src=http%3A%2F%2Fhbimg.huabanimg.com%2F5494450357e426011255c0868a0e03d664d62d0d2c1dc-v3O3vq_fw658",
  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1573455000674&di=5273bccb2c0201ad0960c9bbe09f591a&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F0183cb5859e975a8012060c82510f6.jpg",
  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1573455000672&di=f0e6367de4e2fd90a0640f7b124f0811&imgtype=0&src=http%3A%2F%2Fimg3.redocn.com%2Ftupian%2F20151217%2Fshoutixiangbaowangzhanbanner_5618281.jpg",
  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1573455000669&di=de1ca8da6722b14586773aabd6b49867&imgtype=0&src=http%3A%2F%2Fpic59.nipic.com%2Ffile%2F20150127%2F19913576_111514646820_2.jpg",
  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1573455000665&di=cf1687a4755c02779294dda519c780d1&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F01868958ac40eaa801219c77160c87.jpg%401280w_1l_2o_100sh.jpg"
];
