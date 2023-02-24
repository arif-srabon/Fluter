class ProductListModel{
  String? status;
  List<Product>? productList;

  ProductListModel({this.status,this.productList});

  ProductListModel.setProductList(Map<String,dynamic> jsonData ){
    status = jsonData['status'];
    if (jsonData['data'] != null) {
      productList = <Product>[];
      jsonData['data'].forEach((v) {
        productList!.add(Product.setProductInfo(v));
      });
    }
  }


}

class Product{
  String? createdDate;
  String? sId;
  int? id;
  String? title;
  String? price;
  String? specialPrice;
  String? image;
  String? category;
  String? subcategory;
  String? remark;
  String? brand;
  String? shop;
  String? shopName;
  String? star;
  String? productCode;
  String? stock;
  String? productName;
  String? img;
  String? unitPrice;
  String? qty;
  String? totalPrice;

  Product(
      { this.createdDate,
        this.sId,
        this.id,
        this.title,
        this.price,
        this.specialPrice,
        this.image,
        this.category,
        this.subcategory,
        this.remark,
        this.brand,
        this.shop,
        this.shopName,
        this.star,
        this.productCode,
        this.stock,
        this.productName,
        this.img,
        this.unitPrice,
        this.qty,
        this.totalPrice});

  Product.setProductInfo(Map<String, dynamic> jsonData) {
    createdDate = jsonData['CreatedDate'];
    sId = jsonData['_id'];
    id = jsonData['id'];
    title = jsonData['title'];
    price = jsonData['price'];
    specialPrice = jsonData['special_price'];
    image = jsonData['image'];
    category = jsonData['category'];
    subcategory = jsonData['subcategory'];
    remark = jsonData['remark'];
    brand = jsonData['brand'];
    shop = jsonData['shop'];
    shopName = jsonData['shop_name'];
    star = jsonData['star'];
    productCode = jsonData['product_code'];
    stock = jsonData['stock'];
    productName = jsonData['ProductName'];
    productCode = jsonData['ProductCode'];
    img = jsonData['Img'];
    unitPrice = jsonData['UnitPrice'];
    qty = jsonData['Qty'];
    totalPrice = jsonData['TotalPrice'];
  }
}