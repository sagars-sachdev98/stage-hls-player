import 'package:stage_hls_assignment/features/video_list/data/models/video_list.model.dart';
import 'package:stage_hls_assignment/features/video_list/data/sources/video_list.source.dart';

class MockVideolistDataSourceImpl implements VideoListDataSource {
  @override
  Future<List<VideoListModel>?> getVideos() {
    List<Map<String, dynamic>> videos = [
      {
        "thumbnail":
            "https://i.ibb.co/R23YCsN/Screenshot-2024-02-11-at-2-45-44-AM.png",
        "url": "https://media.stage.in/show/HLS/pAj83sBsX9Sszm6i6h.m3u8",
        "title": "Punarjanam",
        "year": "2023"
      },
      {
        "thumbnail":
            "https://i.ibb.co/fv1zGsh/Screenshot-2024-02-11-at-2-46-09-AM.png",
        "url": "https://media.stage.in/show/HLS/jaj3K3Vy0x1Qp8s4rA.m3u8",
        "title": "Dada Lakhmi",
        "year": "2022"
      },
      {
        "thumbnail":
            "https://i.ibb.co/18pwSjj/Screenshot-2024-02-11-at-3-22-26-AM.png",
        "url": "https://media.stage.in/show/HLS/09vxTB8H7DOxuapojJ.m3u8",
        "title": "Dhakad Chhoriyaan",
        "year": "2024"
      },
      {
        "thumbnail":
            "https://i.ibb.co/wyVQvHz/Screenshot-2024-02-11-at-3-22-58-AM.png",
        "url": "https://media.stage.in/show/HLS/pKttSRazFB92n1ZvbD.m3u8",
        "title": "12vi Aala Pyar",
        "year": "2023"
      },
      {
        "thumbnail":
            "https://i.ibb.co/X7k9SkB/Screenshot-2024-02-11-at-3-23-25-AM.png",
        "url": "https://media.stage.in/show/HLS/gusqx4fwvxxelMZkzd.m3u8",
        "title": "Bhaichara",
        "year": "2023"
      },
      {
        "thumbnail":
            "https://i.ibb.co/Hz4k7pk/Screenshot-2024-02-11-at-3-23-53-AM.png",
        "url": "https://media.stage.in/show/HLS/83mhz8WmOIUMVfsXnD.m3u8",
        "title": "Sanki Aashiq",
        "year": "2023"
      },
      {
        "thumbnail":
            "https://i.ibb.co/YQdMg84/Screenshot-2024-02-11-at-3-24-25-AM.png",
        "url": "https://media.stage.in/show/HLS/jHVW6PXuneyPtBw5qc.m3u8",
        "title": "Doojvar",
        "year": "2023"
      },
      {
        "thumbnail":
            "https://i.ibb.co/zFdcm57/Screenshot-2024-02-11-at-3-24-47-AM.png",
        "url": "https://media.stage.in/show/HLS/fhHBqqPzJFN40DoMFA.m3u8",
        "title": "Bajri Mafia",
        "year": "2023"
      },
      {
        "thumbnail":
            "https://i.ibb.co/8DkNsMB/Screenshot-2024-02-11-at-3-25-17-AM.png",
        "url": "https://media.stage.in/show/HLS/9CxYcIEd2bMFGbnG9Z.m3u8",
        "title": "Safe House",
        "year": "2021"
      },
      {
        "thumbnail":
            "https://i.ibb.co/L9pD9Hx/Screenshot-2024-02-11-at-3-25-39-AM.png",
        "url": "https://media.stage.in/show/HLS/BFsduF2fgrR7TUMtau.m3u8",
        "title": "Mewat",
        "year": "2023"
      },
    ];
    return Future.value(videos.map((e) => VideoListModel.fromJson(e)).toList());
  }
}
