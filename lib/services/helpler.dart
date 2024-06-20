import 'package:flutter/services.dart' as the_bundle;
import 'package:sneakershop_fe/models/sneaker_model.dart';

//this class  fetches data from the json file and return it to the app
class Helper {
  Future<List<Sneaker>>getMaleSneakers()async{
    final data=await  the_bundle.rootBundle.loadString("assets/json/men.json");
    final maleShoes=sneakerFromJson(data);
    return  maleShoes;
  }
  Future<List<Sneaker>>getFemaleSneakers()async{
    final data=await  the_bundle.rootBundle.loadString("assets/json/women.json");
    final femaleShoes=sneakerFromJson(data);
    return  femaleShoes;
  }
  Future<List<Sneaker>>getKidsSneakers()async{
    final data=await  the_bundle.rootBundle.loadString("assets/json/kids.json");
    final kidsShoes=sneakerFromJson(data);
    return  kidsShoes;
  }

  //Single  sneaker
   Future<Sneaker> getMaleSneakerById(String  id) async {
    final data = await the_bundle.rootBundle.loadString("assets/json/men.json");
    final maleShoes = sneakerFromJson(data);
    final sneaker=maleShoes.firstWhere((sneaker)=>sneaker.id==id);
    return sneaker;
  }
   Future<Sneaker> getFemaleSneakerById(String  id) async {
    final data = await the_bundle.rootBundle.loadString("assets/json/women.json");
    final sneakers = sneakerFromJson(data);
    final sneaker=sneakers.firstWhere((sneaker)=>sneaker.id==id);
    return sneaker;
  }
   Future<Sneaker> getKidSneakerById(String  id) async {
    final data = await the_bundle.rootBundle.loadString("assets/json/kids.json");
    final sneakers = sneakerFromJson(data);
    final sneaker=sneakers.firstWhere((sneaker)=>sneaker.id==id);
    return sneaker;
  }
}
