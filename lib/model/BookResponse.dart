import 'dart:convert';

BookResponse bookResponseFromJson(String str) => BookResponse.fromJson(json.decode(str));

String bookResponseToJson(BookResponse data) => json.encode(data.toJson());

class BookResponse {
  String? query;
  List<Work>? works;
  int? days;
  int? hours;

  BookResponse({
    this.query,
    this.works,
    this.days,
    this.hours,
  });

  factory BookResponse.fromJson(Map<String, dynamic> json) => BookResponse(
    query: json["query"],
    works: json["works"] == null ? [] : List<Work>.from(json["works"]!.map((x) => Work.fromJson(x))),
    days: json["days"],
    hours: json["hours"],
  );

  Map<String, dynamic> toJson() => {
    "query": query,
    "works": works == null ? [] : List<dynamic>.from(works!.map((x) => x.toJson())),
    "days": days,
    "hours": hours,
  };
}

class Work {
  String? key;
  String? title;
  int? editionCount;
  int? firstPublishYear;
  bool? hasFulltext;
  bool? publicScanB;
  List<String>? ia;
  String? iaCollectionS;
  String? coverEditionKey;
  int? coverI;
  List<String>? language;
  List<String>? authorKey;
  List<String>? authorName;
  Availability? availability;
  String? lendingEditionS;
  String? lendingIdentifierS;
  String? subtitle;
  List<String>? idProjectGutenberg;
  List<String>? idStandardEbooks;

  Work({
    this.key,
    this.title,
    this.editionCount,
    this.firstPublishYear,
    this.hasFulltext,
    this.publicScanB,
    this.ia,
    this.iaCollectionS,
    this.coverEditionKey,
    this.coverI,
    this.language,
    this.authorKey,
    this.authorName,
    this.availability,
    this.lendingEditionS,
    this.lendingIdentifierS,
    this.subtitle,
    this.idProjectGutenberg,
    this.idStandardEbooks,
  });

  factory Work.fromJson(Map<String, dynamic> json) => Work(
    key: json["key"],
    title: json["title"],
    editionCount: json["edition_count"],
    firstPublishYear: json["first_publish_year"],
    hasFulltext: json["has_fulltext"],
    publicScanB: json["public_scan_b"],
    ia: json["ia"] == null ? [] : List<String>.from(json["ia"]!.map((x) => x)),
    iaCollectionS: json["ia_collection_s"],
    coverEditionKey: json["cover_edition_key"],
    coverI: json["cover_i"],
    language: json["language"] == null ? [] : List<String>.from(json["language"]!.map((x) => x)),
    authorKey: json["author_key"] == null ? [] : List<String>.from(json["author_key"]!.map((x) => x)),
    authorName: json["author_name"] == null ? [] : List<String>.from(json["author_name"]!.map((x) => x)),
    availability: json["availability"] == null ? null : Availability.fromJson(json["availability"]),
    lendingEditionS: json["lending_edition_s"],
    lendingIdentifierS: json["lending_identifier_s"],
    subtitle: json["subtitle"],
    idProjectGutenberg: json["id_project_gutenberg"] == null ? [] : List<String>.from(json["id_project_gutenberg"]!.map((x) => x)),
    idStandardEbooks: json["id_standard_ebooks"] == null ? [] : List<String>.from(json["id_standard_ebooks"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "key": key,
    "title": title,
    "edition_count": editionCount,
    "first_publish_year": firstPublishYear,
    "has_fulltext": hasFulltext,
    "public_scan_b": publicScanB,
    "ia": ia == null ? [] : List<dynamic>.from(ia!.map((x) => x)),
    "ia_collection_s": iaCollectionS,
    "cover_edition_key": coverEditionKey,
    "cover_i": coverI,
    "language": language == null ? [] : List<dynamic>.from(language!.map((x) => x)),
    "author_key": authorKey == null ? [] : List<dynamic>.from(authorKey!.map((x) => x)),
    "author_name": authorName == null ? [] : List<dynamic>.from(authorName!.map((x) => x)),
    "availability": availability?.toJson(),
    "lending_edition_s": lendingEditionS,
    "lending_identifier_s": lendingIdentifierS,
    "subtitle": subtitle,
    "id_project_gutenberg": idProjectGutenberg == null ? [] : List<dynamic>.from(idProjectGutenberg!.map((x) => x)),
    "id_standard_ebooks": idStandardEbooks == null ? [] : List<dynamic>.from(idStandardEbooks!.map((x) => x)),
  };
}

class Availability {
  bool? availableToBrowse;
  bool? availableToBorrow;
  bool? availableToWaitlist;
  bool? isPrintdisabled;
  bool? isReadable;
  bool? isLendable;
  bool? isPreviewable;
  String? identifier;
  String? isbn;
  dynamic oclc;
  String? openlibraryWork;
  String? openlibraryEdition;
  DateTime? lastLoanDate;
  String? numWaitlist;
  DateTime? lastWaitlistDate;
  bool? isRestricted;
  bool? isBrowseable;
  String? errorMessage;

  Availability({
    this.availableToBrowse,
    this.availableToBorrow,
    this.availableToWaitlist,
    this.isPrintdisabled,
    this.isReadable,
    this.isLendable,
    this.isPreviewable,
    this.identifier,
    this.isbn,
    this.oclc,
    this.openlibraryWork,
    this.openlibraryEdition,
    this.lastLoanDate,
    this.numWaitlist,
    this.lastWaitlistDate,
    this.isRestricted,
    this.isBrowseable,
    this.errorMessage,
  });

  factory Availability.fromJson(Map<String, dynamic> json) => Availability(
    availableToBrowse: json["available_to_browse"],
    availableToBorrow: json["available_to_borrow"],
    availableToWaitlist: json["available_to_waitlist"],
    isPrintdisabled: json["is_printdisabled"],
    isReadable: json["is_readable"],
    isLendable: json["is_lendable"],
    isPreviewable: json["is_previewable"],
    identifier: json["identifier"],
    isbn: json["isbn"],
    oclc: json["oclc"],
    openlibraryWork: json["openlibrary_work"],
    openlibraryEdition: json["openlibrary_edition"],
    lastLoanDate: json["last_loan_date"] == null ? null : DateTime.parse(json["last_loan_date"]),
    numWaitlist: json["num_waitlist"],
    lastWaitlistDate: json["last_waitlist_date"] == null ? null : DateTime.parse(json["last_waitlist_date"]),
    isRestricted: json["is_restricted"],
    isBrowseable: json["is_browseable"],
    errorMessage: json["error_message"],
  );

  Map<String, dynamic> toJson() => {
    "available_to_browse": availableToBrowse,
    "available_to_borrow": availableToBorrow,
    "available_to_waitlist": availableToWaitlist,
    "is_printdisabled": isPrintdisabled,
    "is_readable": isReadable,
    "is_lendable": isLendable,
    "is_previewable": isPreviewable,
    "identifier": identifier,
    "isbn": isbn,
    "oclc": oclc,
    "openlibrary_work": openlibraryWork,
    "openlibrary_edition": openlibraryEdition,
    "last_loan_date": lastLoanDate?.toIso8601String(),
    "num_waitlist": numWaitlist,
    "last_waitlist_date": lastWaitlistDate?.toIso8601String(),
    "is_restricted": isRestricted,
    "is_browseable": isBrowseable,
    "error_message": errorMessage,
  };
}