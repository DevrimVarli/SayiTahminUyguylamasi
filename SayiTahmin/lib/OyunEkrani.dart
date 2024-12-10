import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sayitahmin/Sonu%C3%A7Ekrani.dart';

class OyunEkrani extends StatefulWidget {
  const OyunEkrani({super.key});

  @override
  State<OyunEkrani> createState() => _OyunEkraniState();
}

class _OyunEkraniState extends State<OyunEkrani> {
  var tfController=TextEditingController();
  int rasgeleSayi=0;
  int kalanHak=5;
  String yonlendirme="";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    rasgeleSayi=Random().nextInt(101);
    print("Rastgele Sayi:$rasgeleSayi");
  }
  @override
  Widget build(BuildContext context) {
    var ekran_bilgisi=MediaQuery.of(context);
    var ekran_genisligi=ekran_bilgisi.size.width;
    var ekran_yuksekligi=ekran_bilgisi.size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Tahmin Ekrani"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(

                padding:  EdgeInsets.only(top:ekran_yuksekligi/20,bottom: ekran_yuksekligi/20 ),
                child: Text("Kalan Hak:$kalanHak ",style: TextStyle(
                    fontSize: ekran_yuksekligi/30,
                    color: Colors.pink),),
              ),
              Padding(
                padding:  EdgeInsets.only(top:ekran_yuksekligi/20,bottom: ekran_yuksekligi/20 ),
                child: Text("Yardım: Tahmini :$yonlendirme",style: TextStyle(
                  fontSize: ekran_yuksekligi/40,
                ),),
              ),
              Padding(
                padding: EdgeInsets.only(top:ekran_yuksekligi/20,bottom: ekran_yuksekligi/20 ),
                child: TextField(
                  controller:tfController ,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(

                    hintText: "Yazınız",
                    hintStyle: TextStyle(color: Colors.blue),
                    labelText: "Tahmin",
                      labelStyle: TextStyle(color: Colors.blue),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10),),
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    )


                    )



                  ),
              ),

              SizedBox(
                width: ekran_genisligi/2,
                child: Padding(
                  padding:  EdgeInsets.only(top:ekran_yuksekligi/20,bottom: ekran_yuksekligi/20 ),
                  child: ElevatedButton(
                    onPressed: (){
                      setState(() {
                        kalanHak-=1;
                      });
                      int tahmin=int.parse(tfController.text);
                      if(tahmin==rasgeleSayi){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>SonucEkrani(sonuc: true,sayi: rasgeleSayi,)));
                        return;
                      }
                      if(tahmin>rasgeleSayi){
                        setState(() {
                          yonlendirme="Tahmini Azalt";

                        });
                      }
                      if(tahmin<rasgeleSayi){
                        setState(() {
                          yonlendirme="Tahmini Arttır";
                        });
                      }
                      if(kalanHak==0){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>SonucEkrani(sonuc: false,sayi: rasgeleSayi,)));
                        return;
                      }
                      tfController.text="";


                    },
                    child: Text("TAHMİN ET",style: TextStyle(color: Colors.white),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.zero),
                      ),
                    ),


                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
