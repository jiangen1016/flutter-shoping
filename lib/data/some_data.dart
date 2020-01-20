import 'package:first_flutter/model/index.dart';

// banner
var returnImageUrls = [
  'https://m.360buyimg.com/mobilecms/s700x280_jfs/t1/109998/10/4119/98455/5e1848d4Ee5594730/b91a7b6a0356cecf.jpg!cr_1125x445_0_171!q70.jpg.dpg',
  'https://m.360buyimg.com/mobilecms/s700x280_jfs/t1/98720/27/8984/65321/5e0aa7f5E47e8b2d8/eff26193e1aa3ed5.jpg!cr_1125x445_0_171!q70.jpg.dpg',
  'https://m.360buyimg.com/mobilecms/s700x280_jfs/t1/94955/11/9871/88699/5e146887E5928b393/b72032619b154ad2.jpg!cr_1125x445_0_171!q70.jpg.dpg',
  "https://imgcps.jd.com/ling4/100002795959/5omL5py66LSt5a6e5oOg/5aSH6LSn6LaF5YC8/p-5c13869682acdd181deeff13/feced15b/cr_1125x445_0_171/s1125x690/q70.jpg"
];
// 分类
var returnCategoryList = [
  CategoryItem('京东超市',
      'https://m.360buyimg.com/mobilecms/s120x120_jfs/t1/20983/16/10753/6124/5c8a16aaE5d6b15d7/01e0e818a7505267.png.webp'),
  CategoryItem('数码电器',
      'https://m.360buyimg.com/mobilecms/s120x120_jfs/t1/39401/17/2391/5859/5cc06fcfE2ad40668/28cda0a571b4a576.png.webp'),
  CategoryItem('京东服饰',
      'https://m.360buyimg.com/mobilecms/s120x120_jfs/t1/17169/3/4127/4611/5c2f35cfEd87b0dd5/65c0cdc1362635fc.png.webp'),
  CategoryItem('京东生鲜',
      'https://m.360buyimg.com/mobilecms/s120x120_jfs/t17725/156/1767366877/17404/f45d418b/5ad87bf0N66c5db7c.png.webp'),
  CategoryItem('京东到家',
      'https://m.360buyimg.com/mobilecms/s120x120_jfs/t16990/157/2001547525/17770/a7b93378/5ae01befN2494769f.png.webp'),
  CategoryItem('充值缴费',
      'https://m.360buyimg.com/mobilecms/s120x120_jfs/t22228/270/207441984/11564/88140ab7/5b03fae3N67f78fe3.png.webp'),
  CategoryItem('9.9元拼',
      'https://m.360buyimg.com/mobilecms/s120x120_jfs/t1/20983/16/10753/6124/5c8a16aaE5d6b15d7/01e0e818a7505267.png.webp'),
  CategoryItem('领券',
      'https://m.360buyimg.com/mobilecms/s120x120_jfs/t1/7068/29/8987/5605/5c120da2Ecae1cc3a/016033c7ef3e0c6c.png.webp'),
  CategoryItem('赚钱',
      'https://m.360buyimg.com/mobilecms/s120x120_jfs/t16828/63/2653634926/5662/d18f6fa1/5b03b779N5c0b196f.png.webp'),
  CategoryItem('PLUS会员',
      'https://m.360buyimg.com/mobilecms/s120x120_jfs/t1/22262/9/1470/4527/5c120cd0E5d3c6c66/4792ec307a853e9f.png.webp')
];

var returnAdviceList = [
  Advice('免息星球', '白条免息购',
      'https://m.360buyimg.com/n1/s150x150_jfs/t29566/227/1464891645/10350/a5b133e2/5ce20cdcNd9cdd972.jpg!q70.jpg.dpg'),
  Advice('品牌闪购', '享惊喜折扣',
      'https://m.360buyimg.com/n1/s150x150_jfs/t17677/311/1731306712/38153/32cc1d8d/5ad40f09Ncd7d80d6.png!q70.jpg.dpg'),
  Advice('品牌秒杀', '低价抢大牌',
      'https://m.360buyimg.com/mobilecms/s150x150_jfs/t1/79087/9/714/26464/5cef9636Ea4fe2ba8/90f1c44b1b1f6e2e.png!q70.jpg.dpg'),
  Advice('京东直播', '好货即刻买',
      'https://m.360buyimg.com/mobilecms/s150x150_jfs/t1/69879/9/8578/71866/5d664c56Efb9e9c01/cf382dda9a2207b1.jpg!q70.jpg.dpg'),
  Advice('排行榜', '专属购物指南',
      'https://m.360buyimg.com/mobilecms/s150x150_jfs/t10675/97/2254709219/9497/6ba245fd/59f14a23N0594b89c.jpg!q70.jpg.dpg'),
  Advice('拍拍好物', '二手优品',
      'https://m.360buyimg.com/mobilecms/s150x150_jfs/t1/34938/26/11155/70774/5cefa0c6E5a90edb2/47b686712510d44e.png!q70.jpg.dpg'),
  Advice('新品首发', 'vivo X27',
      'https://m.360buyimg.com/mobilecms/s150x150_jfs/t1/25511/17/11799/79275/5c91a3fbE3575290e/ffcd261423c0b5c8.jpg!q70.jpg.dpg'),
  Advice('发现生活', '发现品质生活',
      'https://m.360buyimg.com/mobilecms/s150x150_jfs/t1/38988/36/7707/54292/5cefa2b0E1cce5cfa/64e76ed6c67568bf.png!q70.jpg.dpg'),
];
var returnSalesList = [
  Sales(799, 999,
      'https://img14.360buyimg.com/n1/s150x150_jfs/t1/30157/6/4977/76566/5c824523E40c2162e/95ae7dc287331831.jpg.dpg'),
  Sales(4799, 12999,
      'https://img10.360buyimg.com/mobilecms/s220x220_jfs/t1/40404/8/12924/159308/5d9d7554Eeba565b4/dc054c921031a602.jpg!cc_220x220!q70.dpg.webp'),
  Sales(2099, 2499,
      'https://img12.360buyimg.com/mobilecms/s220x220_jfs/t1/38322/32/9449/340900/5d0c2ea3E63e74cc0/0203be11856d7e7a.jpg!cc_220x220!q70.dpg.webp'),
  Sales(4998, 5499,
      'https://img12.360buyimg.com/mobilecms/s220x220_jfs/t1/72943/2/7078/208374/5d525465E44101b1e/bd89d862081cd954.jpg!cc_220x220!q70.dpg.webp'),
  Sales(7999, 8499,
      'https://img10.360buyimg.com/mobilecms/s220x220_jfs/t1/8752/20/3886/68537/5bd8a6d4E305fb764/70a1015a7bf5b402.jpg!cc_220x220!q70.dpg.webp'),
  Sales(10598, 12998,
      'https://img12.360buyimg.com/mobilecms/s220x220_jfs/t1/52878/39/11800/138951/5d8c2f35E262cc998/3e2268d903053500.jpg!cc_220x220!q70.dpg.webp')
];
var returnGoodsList = [
  Goods('华为p30 手机 天空之境 8GB+128GB 全网通（白条12期免息0首付）', 3998,
      'https://img10.360buyimg.com/mobilecms/s372x372_jfs/t1/69879/9/8578/71866/5d664c56Efb9e9c01/cf382dda9a2207b1.jpg!q70.dpg.webp'),
  Goods('华为 HUAWEI P30Pro手机【6期免息/享碎屏险/保价30天】 珠光贝母 全网通(8GB 128GB)华为智能手环套装', 5068,
      'https://img12.360buyimg.com/mobilecms/s372x372_jfs/t1/37194/12/7247/61412/5cc6c0f6E91615717/7a917c604a4d9780.jpg!q70.dpg.webp'),
  Goods('华为麦芒8手机【6期免息/立减150元】全网通智能手机 宝石蓝 6G+128G 6期免息+原装耳机', 1699,
      'https://img12.360buyimg.com/mobilecms/s372x372_jfs/t1/57166/2/1732/310229/5cf77c5aE045e7b0f/0a493d6cfcde4489.jpg!q70.dpg.webp'),
  Goods(
      '华为 HUAWEI P30 Pro 超感光徕卡四摄10倍混合变焦麒麟980芯片屏内指纹 8GB+256GB极光色全网通版双4G手机',
      5488,
      'https://img14.360buyimg.com/mobilecms/s372x372_jfs/t1/11352/31/13456/324178/5c98c88dE9419c2ca/4be2efca1d9e2b38.jpg!q70.dpg.webp'),
  Goods(
      '一加 OnePlus 7 Pro 2K+90Hz 流体屏 骁龙855旗舰 4800万超广角三摄 8GB+256GB 星雾蓝 全面屏拍照游戏手机',
      4299,
      'https://img13.360buyimg.com/mobilecms/s372x372_jfs/t1/40586/1/11155/200870/5d49255fEa7738b29/b3e5895230af9915.jpg!q70.dpg.webp'),
  Goods(
      '荣耀20 李现同款 4800万超广角AI四摄 3200W美颜自拍 麒麟Kirin980全网通版8GB+128GB 幻夜黑 全面屏手机',
      2499,
      'https://img12.360buyimg.com/mobilecms/s372x372_jfs/t28906/30/1571661431/255345/986f5fcb/5ce4148aN55586a52.jpg!q70.dpg.webp'),
  Goods('Apple iPhone XR (A2108) 128GB 黑色 移动联通电信4G手机 双卡双待', 5098,
      'https://img10.360buyimg.com/mobilecms/s372x372_jfs/t1/3405/18/3537/69901/5b997c0aE5dc8ed9f/a2c208410ae84d1f.jpg!q70.dpg.webp')
];
