
class BreedImageResponse {
    final String id;
    final String url;
    final int width;
    final int height;

    BreedImageResponse({
        required this.id,
        required this.url,
        required this.width,
        required this.height,
    });

    factory BreedImageResponse.fromJson(Map<String, dynamic> json) => BreedImageResponse(
        id: json["id"],
        url: json["url"],
        width: json["width"],
        height: json["height"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "width": width,
        "height": height,
    };
}