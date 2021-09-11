import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BackGroundCarrouselItem extends StatelessWidget {
  final String? text;
  final String? imgUrl;
  const BackGroundCarrouselItem({Key? key, this.imgUrl, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return Container(
      child: Stack(children: [
        Align(
          alignment: AlignmentDirectional.bottomEnd,
          child: Container(
            width: mediaQuery.size.width,
            height: mediaQuery.size.height,
            child: imgUrl != null ? CachedNetworkImage(imageUrl: this.imgUrl!) : Image.asset("assets/camisa-brasil.png"),
          ),
        ),
        mediaQuery.size.width < 700.0
            ? Positioned(
                top: mediaQuery.size.height * 0.05,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: AlignmentDirectional.center,
                      child: Text(
                        this.text != null ? this.text! : "Mobile",
                        style: GoogleFonts.nunito(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Positioned(
                top: mediaQuery.size.height / 2 - 100,
                left: mediaQuery.size.width / 10,
                child: Container(
                  width: mediaQuery.size.width,
                  child: Text(
                    this.text != null ? this.text! : "Web",
                    style: GoogleFonts.nunito(
                      fontSize: 30.0,
                    ),
                  ),
                ),
              ),
      ]),
    );
  }
}
