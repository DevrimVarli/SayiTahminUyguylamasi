import 'package:flutter/material.dart';

class SonucEkrani extends StatefulWidget {
  bool sonuc;
  int sayi;

  SonucEkrani({required this.sonuc, required this.sayi});




  @override
  State<SonucEkrani> createState() => _SonucEkraniState();
}

class _SonucEkraniState extends State<SonucEkrani> {


  @override
  Widget build(BuildContext context) {
    var ekran_bilgisi=MediaQuery.of(context);
    var ekran_genisligi=ekran_bilgisi.size.width;
    var ekran_yuksekligi=ekran_bilgisi.size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Sonuç Ekranı"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:  EdgeInsets.only(top:ekran_yuksekligi/20,bottom: ekran_yuksekligi/20 ),
              child: widget.sonuc ? Image.asset("resimler/mutlu_resim.png"):Image.asset("resimler/uzgun_resim.png"),
            ),
            Padding(
              padding: EdgeInsets.only(top:ekran_yuksekligi/20,bottom: ekran_yuksekligi/20 ),
              child: widget.sonuc ? Text("Kazandınız",style: TextStyle(
                fontSize: ekran_yuksekligi/50,
              ),):Text("Kaybettiniz",style: TextStyle(
                fontSize: ekran_yuksekligi/50,
              ),),
            ),
            widget.sonuc? Text(""):Text("Sonuc:${widget.sayi}",style: TextStyle(fontSize: ekran_yuksekligi/50),),
            SizedBox(
              width: ekran_genisligi/2,
              child: Padding(
                padding:  EdgeInsets.only(top:ekran_yuksekligi/20,bottom: ekran_yuksekligi/20 ),
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.popUntil(context, (route) =>route.isFirst);
                  },
                  child: Text("Tekrar Oyna",style: TextStyle(color: Colors.white),),
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

    );
  }
}
