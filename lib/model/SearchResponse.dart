import 'dart:convert';

SearchResponse searchResponseFromJson(String str) => SearchResponse.fromJson(json.decode(str));

String searchResponseToJson(SearchResponse data) => json.encode(data.toJson());

class SearchResponse {
  int? numFound;
  int? start;
  bool? numFoundExact;
  List<Doc>? docs;
  int? searchResponseNumFound;
  String? q;
  dynamic offset;

  SearchResponse({
    this.numFound,
    this.start,
    this.numFoundExact,
    this.docs,
    this.searchResponseNumFound,
    this.q,
    this.offset,
  });

  factory SearchResponse.fromJson(Map<String, dynamic> json) => SearchResponse(
    numFound: json["numFound"],
    start: json["start"],
    numFoundExact: json["numFoundExact"],
    docs: json["docs"] == null ? [] : List<Doc>.from(json["docs"]!.map((x) => Doc.fromJson(x))),
    searchResponseNumFound: json["num_found"],
    q: json["q"],
    offset: json["offset"],
  );

  Map<String, dynamic> toJson() => {
    "numFound": numFound,
    "start": start,
    "numFoundExact": numFoundExact,
    "docs": docs == null ? [] : List<dynamic>.from(docs!.map((x) => x.toJson())),
    "num_found": searchResponseNumFound,
    "q": q,
    "offset": offset,
  };
}

class Doc {
  List<String>? authorAlternativeName;
  List<String>? authorKey;
  List<String>? authorName;
  List<String>? contributor;
  int? coverI;
  List<String>? ddc;
  EbookAccess? ebookAccess;
  int? ebookCountI;
  int? editionCount;
  List<String>? editionKey;
  int? firstPublishYear;
  bool? hasFulltext;
  List<String>? ia;
  List<String>? iaCollection;
  String? iaCollectionS;
  List<String>? isbn;
  String? key;
  List<Language>? language;
  int? lastModifiedI;
  List<String>? lcc;
  List<String>? lccn;
  int? numberOfPagesMedian;
  List<String>? oclc;
  String? printdisabledS;
  bool? publicScanB;
  List<String>? publishDate;
  List<int>? publishYear;
  List<String>? publisher;
  List<String>? seed;
  String? title;
  String? titleSort;
  String? titleSuggest;
  Type? type;
  List<String>? idAmazon;
  List<String>? subject;
  List<String>? place;
  double? ratingsAverage;
  double? ratingsSortable;
  int? ratingsCount;
  int? ratingsCount1;
  int? ratingsCount2;
  int? ratingsCount3;
  int? ratingsCount4;
  int? ratingsCount5;
  int? readinglogCount;
  int? wantToReadCount;
  int? currentlyReadingCount;
  int? alreadyReadCount;
  List<String>? publisherFacet;
  List<String>? placeKey;
  List<String>? subjectFacet;
  double? version;
  List<String>? placeFacet;
  String? lccSort;
  List<String>? authorFacet;
  List<String>? subjectKey;
  String? ddcSort;
  String? coverEditionKey;
  List<String>? firstSentence;
  List<String>? idGoodreads;
  List<String>? idLibrarything;
  List<String>? iaBoxId;
  List<String>? publishPlace;
  String? lendingEditionS;
  String? lendingIdentifierS;
  String? subtitle;
  List<String>? idOverdrive;
  List<String>? idBetterWorldBooks;
  List<String>? time;
  List<String>? timeFacet;
  List<String>? timeKey;

  Doc({
    this.authorAlternativeName,
    this.authorKey,
    this.authorName,
    this.contributor,
    this.coverI,
    this.ddc,
    this.ebookAccess,
    this.ebookCountI,
    this.editionCount,
    this.editionKey,
    this.firstPublishYear,
    this.hasFulltext,
    this.ia,
    this.iaCollection,
    this.iaCollectionS,
    this.isbn,
    this.key,
    this.language,
    this.lastModifiedI,
    this.lcc,
    this.lccn,
    this.numberOfPagesMedian,
    this.oclc,
    this.printdisabledS,
    this.publicScanB,
    this.publishDate,
    this.publishYear,
    this.publisher,
    this.seed,
    this.title,
    this.titleSort,
    this.titleSuggest,
    this.type,
    this.idAmazon,
    this.subject,
    this.place,
    this.ratingsAverage,
    this.ratingsSortable,
    this.ratingsCount,
    this.ratingsCount1,
    this.ratingsCount2,
    this.ratingsCount3,
    this.ratingsCount4,
    this.ratingsCount5,
    this.readinglogCount,
    this.wantToReadCount,
    this.currentlyReadingCount,
    this.alreadyReadCount,
    this.publisherFacet,
    this.placeKey,
    this.subjectFacet,
    this.version,
    this.placeFacet,
    this.lccSort,
    this.authorFacet,
    this.subjectKey,
    this.ddcSort,
    this.coverEditionKey,
    this.firstSentence,
    this.idGoodreads,
    this.idLibrarything,
    this.iaBoxId,
    this.publishPlace,
    this.lendingEditionS,
    this.lendingIdentifierS,
    this.subtitle,
    this.idOverdrive,
    this.idBetterWorldBooks,
    this.time,
    this.timeFacet,
    this.timeKey,
  });

  factory Doc.fromJson(Map<String, dynamic> json) => Doc(
    authorAlternativeName: json["author_alternative_name"] == null ? [] : List<String>.from(json["author_alternative_name"]!.map((x) => x)),
    authorKey: json["author_key"] == null ? [] : List<String>.from(json["author_key"]!.map((x) => x)),
    authorName: json["author_name"] == null ? [] : List<String>.from(json["author_name"]!.map((x) => x)),
    contributor: json["contributor"] == null ? [] : List<String>.from(json["contributor"]!.map((x) => x)),
    coverI: json["cover_i"],
    ddc: json["ddc"] == null ? [] : List<String>.from(json["ddc"]!.map((x) => x)),
    ebookAccess: ebookAccessValues.map[json["ebook_access"]]!,
    ebookCountI: json["ebook_count_i"],
    editionCount: json["edition_count"],
    editionKey: json["edition_key"] == null ? [] : List<String>.from(json["edition_key"]!.map((x) => x)),
    firstPublishYear: json["first_publish_year"],
    hasFulltext: json["has_fulltext"],
    ia: json["ia"] == null ? [] : List<String>.from(json["ia"]!.map((x) => x)),
    iaCollection: json["ia_collection"] == null ? [] : List<String>.from(json["ia_collection"]!.map((x) => x)),
    iaCollectionS: json["ia_collection_s"],
    isbn: json["isbn"] == null ? [] : List<String>.from(json["isbn"]!.map((x) => x)),
    key: json["key"],
    language: json["language"] == null ? [] : List<Language>.from(json["language"]!.map((x) => languageValues.map[x]!)),
    lastModifiedI: json["last_modified_i"],
    lcc: json["lcc"] == null ? [] : List<String>.from(json["lcc"]!.map((x) => x)),
    lccn: json["lccn"] == null ? [] : List<String>.from(json["lccn"]!.map((x) => x)),
    numberOfPagesMedian: json["number_of_pages_median"],
    oclc: json["oclc"] == null ? [] : List<String>.from(json["oclc"]!.map((x) => x)),
    printdisabledS: json["printdisabled_s"],
    publicScanB: json["public_scan_b"],
    publishDate: json["publish_date"] == null ? [] : List<String>.from(json["publish_date"]!.map((x) => x)),
    publishYear: json["publish_year"] == null ? [] : List<int>.from(json["publish_year"]!.map((x) => x)),
    publisher: json["publisher"] == null ? [] : List<String>.from(json["publisher"]!.map((x) => x)),
    seed: json["seed"] == null ? [] : List<String>.from(json["seed"]!.map((x) => x)),
    title: json["title"],
    titleSort: json["title_sort"],
    titleSuggest: json["title_suggest"],
    type: typeValues.map[json["type"]]!,
    idAmazon: json["id_amazon"] == null ? [] : List<String>.from(json["id_amazon"]!.map((x) => x)),
    subject: json["subject"] == null ? [] : List<String>.from(json["subject"]!.map((x) => x)),
    place: json["place"] == null ? [] : List<String>.from(json["place"]!.map((x) => x)),
    ratingsAverage: json["ratings_average"]?.toDouble(),
    ratingsSortable: json["ratings_sortable"]?.toDouble(),
    ratingsCount: json["ratings_count"],
    ratingsCount1: json["ratings_count_1"],
    ratingsCount2: json["ratings_count_2"],
    ratingsCount3: json["ratings_count_3"],
    ratingsCount4: json["ratings_count_4"],
    ratingsCount5: json["ratings_count_5"],
    readinglogCount: json["readinglog_count"],
    wantToReadCount: json["want_to_read_count"],
    currentlyReadingCount: json["currently_reading_count"],
    alreadyReadCount: json["already_read_count"],
    publisherFacet: json["publisher_facet"] == null ? [] : List<String>.from(json["publisher_facet"]!.map((x) => x)),
    placeKey: json["place_key"] == null ? [] : List<String>.from(json["place_key"]!.map((x) => x)),
    subjectFacet: json["subject_facet"] == null ? [] : List<String>.from(json["subject_facet"]!.map((x) => x)),
    version: json["_version_"]?.toDouble(),
    placeFacet: json["place_facet"] == null ? [] : List<String>.from(json["place_facet"]!.map((x) => x)),
    lccSort: json["lcc_sort"],
    authorFacet: json["author_facet"] == null ? [] : List<String>.from(json["author_facet"]!.map((x) => x)),
    subjectKey: json["subject_key"] == null ? [] : List<String>.from(json["subject_key"]!.map((x) => x)),
    ddcSort: json["ddc_sort"],
    coverEditionKey: json["cover_edition_key"],
    firstSentence: json["first_sentence"] == null ? [] : List<String>.from(json["first_sentence"]!.map((x) => x)),
    idGoodreads: json["id_goodreads"] == null ? [] : List<String>.from(json["id_goodreads"]!.map((x) => x)),
    idLibrarything: json["id_librarything"] == null ? [] : List<String>.from(json["id_librarything"]!.map((x) => x)),
    iaBoxId: json["ia_box_id"] == null ? [] : List<String>.from(json["ia_box_id"]!.map((x) => x)),
    publishPlace: json["publish_place"] == null ? [] : List<String>.from(json["publish_place"]!.map((x) => x)),
    lendingEditionS: json["lending_edition_s"],
    lendingIdentifierS: json["lending_identifier_s"],
    subtitle: json["subtitle"],
    idOverdrive: json["id_overdrive"] == null ? [] : List<String>.from(json["id_overdrive"]!.map((x) => x)),
    idBetterWorldBooks: json["id_better_world_books"] == null ? [] : List<String>.from(json["id_better_world_books"]!.map((x) => x)),
    time: json["time"] == null ? [] : List<String>.from(json["time"]!.map((x) => x)),
    timeFacet: json["time_facet"] == null ? [] : List<String>.from(json["time_facet"]!.map((x) => x)),
    timeKey: json["time_key"] == null ? [] : List<String>.from(json["time_key"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "author_alternative_name": authorAlternativeName == null ? [] : List<dynamic>.from(authorAlternativeName!.map((x) => x)),
    "author_key": authorKey == null ? [] : List<dynamic>.from(authorKey!.map((x) => x)),
    "author_name": authorName == null ? [] : List<dynamic>.from(authorName!.map((x) => x)),
    "contributor": contributor == null ? [] : List<dynamic>.from(contributor!.map((x) => x)),
    "cover_i": coverI,
    "ddc": ddc == null ? [] : List<dynamic>.from(ddc!.map((x) => x)),
    "ebook_access": ebookAccessValues.reverse[ebookAccess],
    "ebook_count_i": ebookCountI,
    "edition_count": editionCount,
    "edition_key": editionKey == null ? [] : List<dynamic>.from(editionKey!.map((x) => x)),
    "first_publish_year": firstPublishYear,
    "has_fulltext": hasFulltext,
    "ia": ia == null ? [] : List<dynamic>.from(ia!.map((x) => x)),
    "ia_collection": iaCollection == null ? [] : List<dynamic>.from(iaCollection!.map((x) => x)),
    "ia_collection_s": iaCollectionS,
    "isbn": isbn == null ? [] : List<dynamic>.from(isbn!.map((x) => x)),
    "key": key,
    "language": language == null ? [] : List<dynamic>.from(language!.map((x) => languageValues.reverse[x])),
    "last_modified_i": lastModifiedI,
    "lcc": lcc == null ? [] : List<dynamic>.from(lcc!.map((x) => x)),
    "lccn": lccn == null ? [] : List<dynamic>.from(lccn!.map((x) => x)),
    "number_of_pages_median": numberOfPagesMedian,
    "oclc": oclc == null ? [] : List<dynamic>.from(oclc!.map((x) => x)),
    "printdisabled_s": printdisabledS,
    "public_scan_b": publicScanB,
    "publish_date": publishDate == null ? [] : List<dynamic>.from(publishDate!.map((x) => x)),
    "publish_year": publishYear == null ? [] : List<dynamic>.from(publishYear!.map((x) => x)),
    "publisher": publisher == null ? [] : List<dynamic>.from(publisher!.map((x) => x)),
    "seed": seed == null ? [] : List<dynamic>.from(seed!.map((x) => x)),
    "title": title,
    "title_sort": titleSort,
    "title_suggest": titleSuggest,
    "type": typeValues.reverse[type],
    "id_amazon": idAmazon == null ? [] : List<dynamic>.from(idAmazon!.map((x) => x)),
    "subject": subject == null ? [] : List<dynamic>.from(subject!.map((x) => x)),
    "place": place == null ? [] : List<dynamic>.from(place!.map((x) => x)),
    "ratings_average": ratingsAverage,
    "ratings_sortable": ratingsSortable,
    "ratings_count": ratingsCount,
    "ratings_count_1": ratingsCount1,
    "ratings_count_2": ratingsCount2,
    "ratings_count_3": ratingsCount3,
    "ratings_count_4": ratingsCount4,
    "ratings_count_5": ratingsCount5,
    "readinglog_count": readinglogCount,
    "want_to_read_count": wantToReadCount,
    "currently_reading_count": currentlyReadingCount,
    "already_read_count": alreadyReadCount,
    "publisher_facet": publisherFacet == null ? [] : List<dynamic>.from(publisherFacet!.map((x) => x)),
    "place_key": placeKey == null ? [] : List<dynamic>.from(placeKey!.map((x) => x)),
    "subject_facet": subjectFacet == null ? [] : List<dynamic>.from(subjectFacet!.map((x) => x)),
    "_version_": version,
    "place_facet": placeFacet == null ? [] : List<dynamic>.from(placeFacet!.map((x) => x)),
    "lcc_sort": lccSort,
    "author_facet": authorFacet == null ? [] : List<dynamic>.from(authorFacet!.map((x) => x)),
    "subject_key": subjectKey == null ? [] : List<dynamic>.from(subjectKey!.map((x) => x)),
    "ddc_sort": ddcSort,
    "cover_edition_key": coverEditionKey,
    "first_sentence": firstSentence == null ? [] : List<dynamic>.from(firstSentence!.map((x) => x)),
    "id_goodreads": idGoodreads == null ? [] : List<dynamic>.from(idGoodreads!.map((x) => x)),
    "id_librarything": idLibrarything == null ? [] : List<dynamic>.from(idLibrarything!.map((x) => x)),
    "ia_box_id": iaBoxId == null ? [] : List<dynamic>.from(iaBoxId!.map((x) => x)),
    "publish_place": publishPlace == null ? [] : List<dynamic>.from(publishPlace!.map((x) => x)),
    "lending_edition_s": lendingEditionS,
    "lending_identifier_s": lendingIdentifierS,
    "subtitle": subtitle,
    "id_overdrive": idOverdrive == null ? [] : List<dynamic>.from(idOverdrive!.map((x) => x)),
    "id_better_world_books": idBetterWorldBooks == null ? [] : List<dynamic>.from(idBetterWorldBooks!.map((x) => x)),
    "time": time == null ? [] : List<dynamic>.from(time!.map((x) => x)),
    "time_facet": timeFacet == null ? [] : List<dynamic>.from(timeFacet!.map((x) => x)),
    "time_key": timeKey == null ? [] : List<dynamic>.from(timeKey!.map((x) => x)),
  };
}

enum EbookAccess {
  BORROWABLE,
  NO_EBOOK,
  PRINTDISABLED,
  PUBLIC,
  UNCLASSIFIED
}

final ebookAccessValues = EnumValues({
  "borrowable": EbookAccess.BORROWABLE,
  "no_ebook": EbookAccess.NO_EBOOK,
  "printdisabled": EbookAccess.PRINTDISABLED,
  "public": EbookAccess.PUBLIC,
  "unclassified": EbookAccess.UNCLASSIFIED
});

enum Language {
  ALB,
  ENG,
  FRE,
  NOB,
  POR,
  RUS,
  SPA,
  TUR
}

final languageValues = EnumValues({
  "alb": Language.ALB,
  "eng": Language.ENG,
  "fre": Language.FRE,
  "nob": Language.NOB,
  "por": Language.POR,
  "rus": Language.RUS,
  "spa": Language.SPA,
  "tur": Language.TUR
});

enum Type {
  WORK
}

final typeValues = EnumValues({
  "work": Type.WORK
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
