/**
 * CCT_TYPE_BANK, ACCT_TYPE_STOCK,
 * ACCT_TYPE_CREDIT, ACCT_TYPE_INCOME
 */
enum AccountTypeEnums {
  assets(id: 100000, name: "资产账户"),
  tenpay(id: 100001, name: "腾讯支付"),
  alipay(id: 100002, name: "支付宝"),
  unionpay(id: 100003, name: "云闪付"),
  bank(id: 100003, name: "银行账户"),

  equity(id: 200000, name:"权益"),
  stock(id: 200001, name: "股票账户"),
  funds(id: 200002, name: "基金账户"),

  liabilities(id:300000, name: "负债"),
  credit(id: 300001, name: "信用卡"),

  /**
   * 薪金
      奖金
      利息收入
   */
  incoming(id: 400000, name: "收入账户"),
  /**
   * 开销账户，从500000 到 800000 号段
   * 房租 rent
      用餐 food
      公共交通 traffic
      水电费 utilities
      医疗费用 health
      税费 tax
      保险 insurance
   */

  expensive(id: 500000, name: "开销账户"),
  //房租房贷
  expensive_rent(id: 510000, name: "房租房贷"),
  //餐饮
  expensive_food(id: 520000, name: "餐饮食品"),
  expensive_food_breakfast(id: 521000, name: "早餐"),
  expensive_food_lunch(id: 522000, name: "午餐"),
  expensive_food_dinner(id: 523000, name: "晚餐"),
  expensive_food_midnight_snack(id: 524000, name: "夜宵"),
  expensive_food_snacks(id: 525000, name: "零食"),
  //通勤
  expensive_traffic(id: 530000, name: "通勤费"),
  expensive_traffic_public(id: 531000, name: "公交地铁"),
  expensive_traffic_oil(id: 532000, name: "加油费"),
  expensive_traffic_pass(id: 533000, name: "高速费/过路费"),
  expensive_utilities(id: 540000, name: "水电燃气费"),
  //医疗
  expensive_health(id: 550000, name: "健康保健医疗"),
  //税
  expensive_tax(id: 560000, name: "税费"),
  //保险
  expensive_insurance(id: 570000, name: "保险"),
  //娱乐
  expensive_entertainment(id: 580000, name: "休闲娱乐");
  //TODO: 线上娱乐，

  const AccountTypeEnums({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

}