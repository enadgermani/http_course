class Article extends Comparable {
  String id;
  String name;
  String category;
  num price;
  String description;
  String imgUrl;
  int sellerId;
  String brandName;

  Article(
      {this.id,
      this.category,
      this.name,
      this.price,
      this.description,
      this.imgUrl,
      this.brandName,
      this.sellerId});

  Map<String, dynamic> toJson() => {
        'category': category,
        'name': name,
        'price': price,
        'description': description,
        'image': imgUrl,
        'brand_name': brandName,
        'seller_id': sellerId
      };

  @override
  int compareTo(other) {
    if (this.price == null || price == null) {
      return null;
    }

    if (this.price < other.price) {
      return 1;
    }

    if (this.price > other.price) {
      return -1;
    }

    if (this.price == other.price) {
      return 0;
    }

    return null;
  }

  Article.fromArticle(Article article) {
    this.name = article.name;
    this.category = article.category;
    this.price = article.price;
    this.description = article.description;
    this.imgUrl = article.imgUrl;
  }

  Article.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.name = json['name'];
    this.brandName = json['brandName'];
    this.category = json['category'];
    this.price = num.parse(json['price']);
    this.description = json['description'];
    this.imgUrl = json['imgUrl'];
    this.sellerId = int.parse(json['sellerId']);
  }

  @override
  String toString() {
    return '{id: $id, name: $name, category: $category, price: $price, description: $description, imgUrl: $imgUrl, sellerId: $sellerId, brandName: $brandName}';
  }

  Article.dress1() {
    id = "0";
    name = 'Wedding dress 1';
    category = 'Tailoring';
    price = 8000;
    description = 'Tessuto in raso romano nobile';
    imgUrl =
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLeKFf68-ant2VM5tVN1eYXTG3D0Zjn00hCA&usqp=CAU';
    sellerId = 0;
    brandName = "brand";
  }

  Article.dress2() {
    id = "1";
    name = 'Wedding dress';
    category = 'Tailoring';
    price = 2500;
    description = 'Tessuto in seta dallo Sri Lanka';
    imgUrl =
        'https://www.aisopos.it/wp-content/uploads/2020/03/Rossella-Cavioni-17-683x1024.jpeg';
  }

  Article.dress3() {
    id = "2";
    name = 'Wedding dress';
    category = 'Tailoring';
    price = 10000;
    description = 'Tessuto iin seta straight outta Compton';
    imgUrl =
        'https://www.aisopos.it/wp-content/uploads/2020/03/Rossella-cavioni-19-683x1024.jpeg';
  }

  Article.dress4() {
    name = 'Evening dress 3';
    category = 'Tailoring';
    price = 5000;
    description = 'Tessuto verde zona Verdansk';
    imgUrl =
        'https://dfocupmdlnlkc.cloudfront.net/original/54e40b32-dcd1-47be-bba2-d7a614a155c6_500x1500.jpg';
  }

  Article.dress5() {
    name = 'Evening dress 5';
    category = 'Tailoring';
    price = 18000;
    description = 'Abito rosso modella che corre';
    imgUrl =
        'https://www.aisopos.it/wp-content/uploads/2020/03/Rossella-Cavioni-5-724x1024.jpeg';
  }

  Article.dress6() {
    name = 'Evening dress 6';
    category = 'Tailoring';
    price = 7000;
    description = 'Tessuto stra figo';
    imgUrl =
        'https://dfocupmdlnlkc.cloudfront.net/original/18770afe-00dd-459d-888f-19a98b30dfa1_500x1500.jpg';
  }

  Article.dress7() {
    name = 'Evening dress 7';
    category = 'Tailoring';
    price = 7000;
    description = 'Descrizione 4';
    imgUrl =
        'https://d3onal9sv3txjm.cloudfront.net/images/w400/1504086601-23A2VqOw.jpg';
  }

  Article.dress8() {
    name = 'Evening dress 7';
    category = 'Tailoring';
    price = 7000;
    description = 'Descrizione 5';
    imgUrl = 'https://rossettifashion.com/wp-content/uploads/2019/08/BLU.jpg';
  }

  Article.dress9() {
    name = 'Evening dress 8';
    category = 'Tailoring';
    price = 7000;
    description = 'Descrizione 6';
    imgUrl =
        'https://weddiness.it/wp-content/uploads/imported/Elegante-abito-da-sera-Eleni-Elias-Mod-P541-B077XTWPGY.jpg';
  }

  Article.dress10() {
    name = 'Evening dress 9';
    category = 'Tailoring';
    price = 7000;
    description = 'Descrizione 7';
    imgUrl =
        'https://images-na.ssl-images-amazon.com/images/I/61288f2QXqL._AC_UY606_.jpg';
  }
  Article.dress11() {
    name = 'Evening dress 10';
    category = 'Tailoring';
    price = 7000;
    description = 'Descrizione 8';
    imgUrl =
        'https://manzara.b-cdn.net/media/catalog/product/cache/10/thumbnail/600x/7b8fef0172c2eb72dd8fd366c999954c/g/i/gianna-1.jpg';
  }

  Article.jewel1() {
    name = 'Jewel 1';
    category = 'Jewelry';
    price = 7000;
    description = 'Descrizione 1';
    imgUrl =
        'https://scontent-mxp1-1.xx.fbcdn.net/v/t1.0-9/49648133_10156355383433853_2472050302174363648_o.jpg?_nc_cat=104&ccb=2&_nc_sid=9267fe&_nc_ohc=_KY6R0SdlLsAX90JMt2&_nc_ht=scontent-mxp1-1.xx&oh=34d6f5513a0b1942640175938ccc0a7b&oe=5FE6F4A0';
  }
  Article.jewel2() {
    name = 'Gioiello 1';
    category = 'Jewelry';
    price = 7000;
    description = 'Descrizione 1';
    imgUrl =
        'https://scontent-mxp1-1.xx.fbcdn.net/v/t1.0-9/48374110_10156329843118853_1802988440061476864_o.jpg?_nc_cat=111&ccb=2&_nc_sid=9267fe&_nc_ohc=zTsvjf0BFUoAX8mXO_R&_nc_ht=scontent-mxp1-1.xx&oh=3f8cf09f5c4ba9ad9d4c36ff29cb532f&oe=5FE7658E';
  }
  Article.jewel3() {
    name = 'Gioiello 1';
    category = 'Jewelry';
    price = 7000;
    description = 'Descrizione 1';
    imgUrl =
        'https://scontent-mxp1-1.xx.fbcdn.net/v/t1.0-9/49496913_10156341138163853_8288164683634966528_o.jpg?_nc_cat=111&ccb=2&_nc_sid=9267fe&_nc_ohc=2bRncQgXyWsAX9NLl6S&_nc_ht=scontent-mxp1-1.xx&oh=2dc405fb59e6e404a3b074641b36665b&oe=5FE8447B';
  }
  Article.jewel4() {
    name = 'Gioiello 1';
    category = 'Jewelry';
    price = 7000;
    description = 'Descrizione 1';
    imgUrl =
        'https://scontent-mxp1-1.xx.fbcdn.net/v/t1.0-9/49132459_10156341142948853_6164876231385808896_o.jpg?_nc_cat=104&ccb=2&_nc_sid=9267fe&_nc_ohc=jqOCL6xrCKsAX9ol3E3&_nc_ht=scontent-mxp1-1.xx&oh=2902c12ff516ca941136de17f827d66b&oe=5FE592DC';
  }
  Article.jewel5() {
    name = 'Gioiello 1';
    category = 'Jewelry';
    price = 7000;
    description = 'Descrizione 1';
    imgUrl =
        'https://scontent-mxp1-1.xx.fbcdn.net/v/t1.0-9/49133152_10156341465663853_4980478324510818304_o.jpg?_nc_cat=102&ccb=2&_nc_sid=9267fe&_nc_ohc=uCNU3kQ6AngAX_DQv3R&_nc_ht=scontent-mxp1-1.xx&oh=8a4eceb5e04c11170df749e8ec9d4e73&oe=5FE5EDCF';
  }

  Article.jewel6() {
    name = 'Gioiello 1';
    category = 'Jewelry';
    price = 7000;
    description = 'Descrizione 1';
    imgUrl =
        'https://scontent-mxp1-1.xx.fbcdn.net/v/t1.0-9/48420605_10156344357578853_2714284125501521920_o.jpg?_nc_cat=106&ccb=2&_nc_sid=9267fe&_nc_ohc=CczPz8DHz7kAX_s6WbO&_nc_ht=scontent-mxp1-1.xx&oh=8cc2e83d19cce4df4315b96bf4cff0a3&oe=5FE6A3A3';
  }
}
