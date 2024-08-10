import 'dart:convert';

class GetUser {
    int? page;
    int? perPage;
    int? total;
    int? totalPages;
    List<UserData>? data;

    GetUser({
        this.page,
        this.perPage,
        this.total,
        this.totalPages,
        this.data,
    });

    factory GetUser.fromRawJson(String str) => GetUser.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetUser.fromJson(Map<String, dynamic> json) => GetUser(
        page: json["page"],
        perPage: json["per_page"],
        total: json["total"],
        totalPages: json["total_pages"],
        data: json["data"] == null ? [] : List<UserData>.from(json["data"]!.map((x) => UserData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "total": total,
        "total_pages": totalPages,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class UserData {
    int? id;
    String? email;
    String? firstName;
    String? lastName;
    String? avatar;

    UserData({
        this.id,
        this.email,
        this.firstName,
        this.lastName,
        this.avatar,
    });

    factory UserData.fromRawJson(String str) => UserData.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
    };
}
