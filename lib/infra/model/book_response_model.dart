// To parse this JSON data, do
//
//     final bookResponseModel = bookResponseModelFromJson(jsonString);

import 'dart:convert';

class BookResponseModel {
  BookResponseModel({
    this.kind,
    this.totalItems,
    this.items,
  });

  final String? kind;
  final int? totalItems;
  final List<Item>? items;

  factory BookResponseModel.fromRawJson(String str) => BookResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BookResponseModel.fromJson(Map<String, dynamic> json) => BookResponseModel(
    kind: json["kind"] == null ? null : json["kind"],
    totalItems: json["totalItems"] == null ? null : json["totalItems"],
    items: json["items"] == null ? null : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "kind": kind == null ? null : kind,
    "totalItems": totalItems == null ? null : totalItems,
    "items": items == null ? null : List<dynamic>.from(items!.map((x) => x.toJson())),
  };
}

class Item {
  Item({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
    this.searchInfo,
  });

  final String? kind;
  final String? id;
  final String? etag;
  final String? selfLink;
  final VolumeInfo? volumeInfo;
  final SaleInfo? saleInfo;
  final AccessInfo? accessInfo;
  final SearchInfo? searchInfo;

  factory Item.fromRawJson(String str) => Item.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    kind: json["kind"] == null ? null : "kind",
    id: json["id"] == null ? null : json["id"],
    etag: json["etag"] == null ? null : json["etag"],
    selfLink: json["selfLink"] == null ? null : json["selfLink"],
    volumeInfo: json["volumeInfo"] == null ? null : VolumeInfo.fromJson(json["volumeInfo"]),
    saleInfo: json["saleInfo"] == null ? null : SaleInfo.fromJson(json["saleInfo"]),
    accessInfo: json["accessInfo"] == null ? null : AccessInfo.fromJson(json["accessInfo"]),
    searchInfo: json["searchInfo"] == null ? null : SearchInfo.fromJson(json["searchInfo"]),
  );

  Map<String, dynamic> toJson() => {
    "kind": kind == null ? null : kind,
    "id": id == null ? null : id,
    "etag": etag == null ? null : etag,
    "selfLink": selfLink == null ? null : selfLink,
    "volumeInfo": volumeInfo == null ? null : volumeInfo!.toJson(),
    "saleInfo": saleInfo == null ? null : saleInfo!.toJson(),
    "accessInfo": accessInfo == null ? null : accessInfo!.toJson(),
    "searchInfo": searchInfo == null ? null : searchInfo!.toJson(),
  };
}

class AccessInfo {
  AccessInfo({
    this.country,
    this.viewability,
    this.embeddable,
    this.publicDomain,
    this.textToSpeechPermission,
    this.epub,
    this.pdf,
    this.webReaderLink,
    this.accessViewStatus,
    this.quoteSharingAllowed,
  });

  final String? country;
  final String? viewability;
  final bool? embeddable;
  final bool? publicDomain;
  final String? textToSpeechPermission;
  final Epub? epub;
  final Epub? pdf;
  final String? webReaderLink;
  final String? accessViewStatus;
  final bool? quoteSharingAllowed;

  factory AccessInfo.fromRawJson(String str) => AccessInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AccessInfo.fromJson(Map<String, dynamic> json) => AccessInfo(
    country: json["country"] == null ? null : json["country"],
    viewability: json["viewability"] == null ? null : json["viewability"],
    embeddable: json["embeddable"] == null ? null : json["embeddable"],
    publicDomain: json["publicDomain"] == null ? null : json["publicDomain"],
    textToSpeechPermission: json["textToSpeechPermission"] == null ? null : json["textToSpeechPermission"],
    epub: json["epub"] == null ? null : Epub.fromJson(json["epub"]),
    pdf: json["pdf"] == null ? null : Epub.fromJson(json["pdf"]),
    webReaderLink: json["webReaderLink"] == null ? null : json["webReaderLink"],
    accessViewStatus: json["accessViewStatus"] == null ? null : json["accessViewStatus"],
    quoteSharingAllowed: json["quoteSharingAllowed"] == null ? null : json["quoteSharingAllowed"],
  );

  Map<String, dynamic> toJson() => {
    "country": country == null ? null : country,
    "viewability": viewability == null ? null : viewability,
    "embeddable": embeddable == null ? null : embeddable,
    "publicDomain": publicDomain == null ? null : publicDomain,
    "textToSpeechPermission": textToSpeechPermission == null ? null : textToSpeechPermission,
    "epub": epub == null ? null : epub!.toJson(),
    "pdf": pdf == null ? null : pdf!.toJson(),
    "webReaderLink": webReaderLink == null ? null : webReaderLink,
    "accessViewStatus": accessViewStatus == null ? null : accessViewStatus,
    "quoteSharingAllowed": quoteSharingAllowed == null ? null : quoteSharingAllowed,
  };
}

class Epub {
  Epub({
    this.isAvailable,
  });

  final bool? isAvailable;

  factory Epub.fromRawJson(String str) => Epub.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Epub.fromJson(Map<String, dynamic> json) => Epub(
    isAvailable: json["isAvailable"] == null ? null : json["isAvailable"],
  );

  Map<String, dynamic> toJson() => {
    "isAvailable": isAvailable == null ? null : isAvailable,
  };
}

class SaleInfo {
  SaleInfo({
    this.country,
    this.saleability,
    this.isEbook,
    this.listPrice,
    this.retailPrice,
    this.buyLink,
    this.offers,
  });

  final String? country;
  final String? saleability;
  final bool? isEbook;
  final SaleInfoListPrice? listPrice;
  final SaleInfoListPrice? retailPrice;
  final String? buyLink;
  final List<Offer>? offers;

  factory SaleInfo.fromRawJson(String str) => SaleInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SaleInfo.fromJson(Map<String, dynamic> json) => SaleInfo(
    country: json["country"] == null ? null : json["country"],
    saleability: json["saleability"] == null ? null : json["saleability"],
    isEbook: json["isEbook"] == null ? null : json["isEbook"],
    listPrice: json["listPrice"] == null ? null : SaleInfoListPrice.fromJson(json["listPrice"]),
    retailPrice: json["retailPrice"] == null ? null : SaleInfoListPrice.fromJson(json["retailPrice"]),
    buyLink: json["buyLink"] == null ? null : json["buyLink"],
    offers: json["offers"] == null ? null : List<Offer>.from(json["offers"].map((x) => Offer.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "country": country == null ? null : country,
    "saleability": saleability == null ? null : saleability,
    "isEbook": isEbook == null ? null : isEbook,
    "listPrice": listPrice == null ? null : listPrice!.toJson(),
    "retailPrice": retailPrice == null ? null : retailPrice!.toJson(),
    "buyLink": buyLink == null ? null : buyLink,
    "offers": offers == null ? null : List<dynamic>.from(offers!.map((x) => x.toJson())),
  };
}

class SaleInfoListPrice {
  SaleInfoListPrice({
    this.amount,
    this.currencyCode,
  });

  final double? amount;
  final String? currencyCode;

  factory SaleInfoListPrice.fromRawJson(String str) => SaleInfoListPrice.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SaleInfoListPrice.fromJson(Map<String, dynamic> json) => SaleInfoListPrice(
    amount: json["amount"] == null ? null : json["amount"].toDouble(),
    currencyCode: json["currencyCode"] == null ? null : json["currencyCode"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount == null ? null : amount,
    "currencyCode": currencyCode == null ? null : currencyCode,
  };
}

class Offer {
  Offer({
    this.finskyOfferType,
    this.listPrice,
    this.retailPrice,
  });

  final int? finskyOfferType;
  final OfferListPrice? listPrice;
  final OfferListPrice? retailPrice;

  factory Offer.fromRawJson(String str) => Offer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
    finskyOfferType: json["finskyOfferType"] == null ? null : json["finskyOfferType"],
    listPrice: json["listPrice"] == null ? null : OfferListPrice.fromJson(json["listPrice"]),
    retailPrice: json["retailPrice"] == null ? null : OfferListPrice.fromJson(json["retailPrice"]),
  );

  Map<String, dynamic> toJson() => {
    "finskyOfferType": finskyOfferType == null ? null : finskyOfferType,
    "listPrice": listPrice == null ? null : listPrice!.toJson(),
    "retailPrice": retailPrice == null ? null : retailPrice!.toJson(),
  };
}

class OfferListPrice {
  OfferListPrice({
    this.amountInMicros,
    this.currencyCode,
  });

  final int? amountInMicros;
  final String? currencyCode;

  factory OfferListPrice.fromRawJson(String str) => OfferListPrice.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OfferListPrice.fromJson(Map<String, dynamic> json) => OfferListPrice(
    amountInMicros: json["amountInMicros"] == null ? null : json["amountInMicros"],
    currencyCode: json["currencyCode"] == null ? null : json["currencyCode"],
  );

  Map<String, dynamic> toJson() => {
    "amountInMicros": amountInMicros == null ? null : amountInMicros,
    "currencyCode": currencyCode == null ? null : currencyCode,
  };
}

class SearchInfo {
  SearchInfo({
    this.textSnippet,
  });

  final String? textSnippet;

  factory SearchInfo.fromRawJson(String str) => SearchInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SearchInfo.fromJson(Map<String, dynamic> json) => SearchInfo(
    textSnippet: json["textSnippet"] == null ? null : json["textSnippet"],
  );

  Map<String, dynamic> toJson() => {
    "textSnippet": textSnippet == null ? null : textSnippet,
  };
}

class VolumeInfo {
  VolumeInfo({
    this.title,
    this.subtitle,
    this.authors,
    this.publisher,
    this.publishedDate,
    this.description,
    this.industryIdentifiers,
    this.readingModes,
    this.pageCount,
    this.printType,
    this.categories,
    this.averageRating,
    this.ratingsCount,
    this.maturityRating,
    this.allowAnonLogging,
    this.contentVersion,
    this.panelizationSummary,
    this.imageLinks,
    this.language,
    this.previewLink,
    this.infoLink,
    this.canonicalVolumeLink,
  });

  final String? title;
  final String? subtitle;
  final List<String>? authors;
  final String? publisher;
  final String? publishedDate;
  final String? description;
  final List<IndustryIdentifier>? industryIdentifiers;
  final ReadingModes? readingModes;
  final int? pageCount;
  final String? printType;
  final List<String>? categories;
  final double? averageRating;
  final int? ratingsCount;
  final String? maturityRating;
  final bool? allowAnonLogging;
  final String? contentVersion;
  final PanelizationSummary? panelizationSummary;
  final ImageLinks? imageLinks;
  final String? language;
  final String? previewLink;
  final String? infoLink;
  final String? canonicalVolumeLink;

  factory VolumeInfo.fromRawJson(String str) => VolumeInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VolumeInfo.fromJson(Map<String, dynamic> json) => VolumeInfo(
    title: json["title"] == null ? null : json["title"],
    subtitle: json["subtitle"] == null ? null : json["subtitle"],
    authors: json["authors"] == null ? null : List<String>.from(json["authors"].map((x) => x)),
    publisher: json["publisher"] == null ? null : json["publisher"],
    publishedDate: json["publishedDate"] == null ? null : json["publishedDate"],
    description: json["description"] == null ? null : json["description"],
    industryIdentifiers: json["industryIdentifiers"] == null ? null : List<IndustryIdentifier>.from(json["industryIdentifiers"].map((x) => IndustryIdentifier.fromJson(x))),
    readingModes: json["readingModes"] == null ? null : ReadingModes.fromJson(json["readingModes"]),
    pageCount: json["pageCount"] == null ? null : json["pageCount"],
    printType: json["printType"] == null ? null : json["printType"],
    categories: json["categories"] == null ? null : List<String>.from(json["categories"].map((x) => x)),
    averageRating: json["averageRating"] == null ? null : json["averageRating"].toDouble(),
    ratingsCount: json["ratingsCount"] == null ? null : json["ratingsCount"],
    maturityRating: json["maturityRating"] == null ? null : json["maturityRating"],
    allowAnonLogging: json["allowAnonLogging"] == null ? null : json["allowAnonLogging"],
    contentVersion: json["contentVersion"] == null ? null : json["contentVersion"],
    panelizationSummary: json["panelizationSummary"] == null ? null : PanelizationSummary.fromJson(json["panelizationSummary"]),
    imageLinks: json["imageLinks"] == null ? null : ImageLinks.fromJson(json["imageLinks"]),
    language: json["language"] == null ? null : json["language"],
    previewLink: json["previewLink"] == null ? null : json["previewLink"],
    infoLink: json["infoLink"] == null ? null : json["infoLink"],
    canonicalVolumeLink: json["canonicalVolumeLink"] == null ? null : json["canonicalVolumeLink"],
  );

  Map<String, dynamic> toJson() => {
    "title": title == null ? null : title,
    "subtitle": subtitle == null ? null : subtitle,
    "authors": authors == null ? null : List<dynamic>.from(authors!.map((x) => x)),
    "publisher": publisher == null ? null : publisher,
    "publishedDate": publishedDate == null ? null : publishedDate,
    "description": description == null ? null : description,
    "industryIdentifiers": industryIdentifiers == null ? null : List<dynamic>.from(industryIdentifiers!.map((x) => x.toJson())),
    "readingModes": readingModes == null ? null : readingModes!.toJson(),
    "pageCount": pageCount == null ? null : pageCount,
    "printType": printType == null ? null : printType,
    "categories": categories == null ? null : List<dynamic>.from(categories!.map((x) => x)),
    "averageRating": averageRating == null ? null : averageRating,
    "ratingsCount": ratingsCount == null ? null : ratingsCount,
    "maturityRating": maturityRating == null ? null : maturityRating,
    "allowAnonLogging": allowAnonLogging == null ? null : allowAnonLogging,
    "contentVersion": contentVersion == null ? null : contentVersion,
    "panelizationSummary": panelizationSummary == null ? null : panelizationSummary!.toJson(),
    "imageLinks": imageLinks == null ? null : imageLinks!.toJson(),
    "language": language == null ? null : language,
    "previewLink": previewLink == null ? null : previewLink,
    "infoLink": infoLink == null ? null : infoLink,
    "canonicalVolumeLink": canonicalVolumeLink == null ? null : canonicalVolumeLink,
  };
}

class ImageLinks {
  ImageLinks({
    this.smallThumbnail,
    this.thumbnail,
  });

  final String? smallThumbnail;
  final String? thumbnail;

  factory ImageLinks.fromRawJson(String str) => ImageLinks.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ImageLinks.fromJson(Map<String, dynamic> json) => ImageLinks(
    smallThumbnail: json["smallThumbnail"] == null ? null : json["smallThumbnail"],
    thumbnail: json["thumbnail"] == null ? null : json["thumbnail"],
  );

  Map<String, dynamic> toJson() => {
    "smallThumbnail": smallThumbnail == null ? null : smallThumbnail,
    "thumbnail": thumbnail == null ? null : thumbnail,
  };
}

class IndustryIdentifier {
  IndustryIdentifier({
    this.type,
    this.identifier,
  });

  final Type? type;
  final String? identifier;

  factory IndustryIdentifier.fromRawJson(String str) => IndustryIdentifier.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory IndustryIdentifier.fromJson(Map<String, dynamic> json) => IndustryIdentifier(
    type: json["type"] == null ? null : json["type"],
    identifier: json["identifier"] == null ? null : json["identifier"],
  );

  Map<String, dynamic> toJson() => {
    "type": type == null ? null : type,
    "identifier": identifier == null ? null : identifier,
  };
}

class PanelizationSummary {
  PanelizationSummary({
    this.containsEpubBubbles,
    this.containsImageBubbles,
  });

  final bool? containsEpubBubbles;
  final bool? containsImageBubbles;

  factory PanelizationSummary.fromRawJson(String str) => PanelizationSummary.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PanelizationSummary.fromJson(Map<String, dynamic> json) => PanelizationSummary(
    containsEpubBubbles: json["containsEpubBubbles"] == null ? null : json["containsEpubBubbles"],
    containsImageBubbles: json["containsImageBubbles"] == null ? null : json["containsImageBubbles"],
  );

  Map<String, dynamic> toJson() => {
    "containsEpubBubbles": containsEpubBubbles == null ? null : containsEpubBubbles,
    "containsImageBubbles": containsImageBubbles == null ? null : containsImageBubbles,
  };
}

class ReadingModes {
  ReadingModes({
    this.text,
    this.image,
  });

  final bool? text;
  final bool? image;

  factory ReadingModes.fromRawJson(String str) => ReadingModes.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReadingModes.fromJson(Map<String, dynamic> json) => ReadingModes(
    text: json["text"] == null ? null : json["text"],
    image: json["image"] == null ? null : json["image"],
  );

  Map<String, dynamic> toJson() => {
    "text": text == null ? null : text,
    "image": image == null ? null : image,
  };
}
