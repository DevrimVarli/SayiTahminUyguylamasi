import 'package:flutter/material.dart';
import 'package:sayitahmin/OyunEkrani.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});


  @override
  State<Anasayfa> createState() => _AnasayfaState();

}

class _AnasayfaState extends State<Anasayfa> {



  @override
  Widget build(BuildContext context) {
    var ekran_bilgisi=MediaQuery.of(context);
    var ekran_genisligi=ekran_bilgisi.size.width;
    var ekran_yuksekligi=ekran_bilgisi.size.height;
    return  Scaffold(
      appBar: AppBar(
        title: Text("Anasayfa"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:  EdgeInsets.only(top:ekran_yuksekligi/20,bottom:ekran_yuksekligi/ 10),
                child: Text("Tahmin Oyunu",style: TextStyle(
                  fontSize: ekran_genisligi/20,
                  color: Colors.black,
                ),),
              ),
              Padding(
                padding:  EdgeInsets.only(top: ekran_yuksekligi/10,bottom: ekran_yuksekligi/5),
                child: Image.asset("resimler/zar_resim.png"),
              ),
              Padding(
                padding:  EdgeInsets.only(top: ekran_yuksekligi/10,bottom: ekran_yuksekligi/5),
                child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder:(context)=>OyunEkrani()));
                    },
                    child: Text("Oyuna Başla",style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.zero),
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
