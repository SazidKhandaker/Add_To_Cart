class modelclass {
  String photo;
  String name;
  double rating;
  int distance;
  int price;
  int totalprice;
  int quantity;
  var subtotal;

  modelclass(this.photo, this.name, this.rating, this.distance, this.price,
      this.totalprice, this.quantity, this.subtotal);

  static List<modelclass> getdata() {
    return [
      modelclass(
          "https://images.unsplash.com/photo-1580959375944-abd7e991f971?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=388&q=80",
          "Stack",
          9.8,
          1200,
          1150,
          0,
          1,
          0),
      modelclass(
          "https://images.unsplash.com/photo-1560684352-8497838a2229?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=528&q=80",
          "Creamy Pasta",
          7.8,
          550,
          480,
          0,
          0,
          0),
      modelclass(
          "https://images.unsplash.com/photo-1556040220-4096d522378d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
          "Fllset Ramen",
          6.8,
          1200,
          660,
          0,
          0,
          0),
      modelclass(
          "https://images.unsplash.com/photo-1525351326368-efbb5cb6814d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80",
          "Egg sandwich",
          5.8,
          200,
          180,
          0,
          0,
          0),
    ];
  }
}
