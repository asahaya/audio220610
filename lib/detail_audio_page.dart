import 'package:audio220610/audio_file.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'app_colors.dart' as AppColors;

class DetailAudioPage extends StatefulWidget {
  const DetailAudioPage({Key? key}) : super(key: key);

  @override
  State<DetailAudioPage> createState() => _DetailAudioPageState();
}

class _DetailAudioPageState extends State<DetailAudioPage> {
  late AudioPlayer advancedPlayer;

  @override

  void initState(){
    super.initState();
    advancedPlayer=AudioPlayer();
  }

  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWIdth = MediaQuery.of(context).size.width;
    String imageTwo =
        'https://abm.hayabusa.media/series/90-979/key_portrait.png%3Fversion%3D1630680348?blend-1=%2Fassets%2Fblend%2Fportrait_grad.png&blend-2=%2Fseries%2F90-979%2Flogo.png%3Fversion%3D1630680348&blend-3=%2Fassets%2Fblend%2Fportrait_orig_badge_v20210810.png&blend-left-2=58&blend-left-3=305&blend-top-1=648&blend-top-2=1312&blend-top-3=1964&format=webp&height=364&mode=fast&quality=75&width=256';
    return Scaffold(
      backgroundColor: AppColors.audioGrayBG,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: screenHeight / 3,
            child: Container(
              color: AppColors.audioBlueBG,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              leading: IconButton(
                  onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
              actions: [
                IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              ],
              backgroundColor: Colors.transparent, //透過
              elevation: 0.0, //透過
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              top: screenHeight * 0.2,
              height: screenHeight * 0.36,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Column(
                  children: [
                    SizedBox(height: screenHeight*0.1,),
                    Text(
                      'THE WATER CURE',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Martin Hyatt',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                   AudioFile(advancedPlayer: advancedPlayer,),
                  ],
                ),
              )),
          Positioned(
            top: screenHeight*0.12,
              left: (screenWIdth-150)/2,
              right: (screenWIdth-150)/2,
              height: screenHeight*0.16,
              child: Container(

               decoration: BoxDecoration(
                 color: AppColors.audioGrayBG,
                 borderRadius: BorderRadius.circular(20),
                 border: Border.all(color: Colors.white,width: 2),
               ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white,width: 2),
                      image: DecorationImage(
                        image: NetworkImage("$imageTwo"),
                        fit: BoxFit.cover,
                      )
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
