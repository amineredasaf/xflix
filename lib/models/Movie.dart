class Movie {
  String? title = 'default title';
  String? OriginalTitle = 'default original title';
  String? overview = 'default overview';
  String? BackdropPath = 'default backdrop path';
  String? posterPath = 'default poster path';
  String? releaseDate = 'default release date';
  double? voteAverage = 0.0;
  int id;

  Movie({
    this.title,
    this.OriginalTitle,
    this.overview,
    this.BackdropPath,
    this.posterPath,
    this.releaseDate,
    this.voteAverage,
    required this.id,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'] ?? json['name'] ?? 'No Title',
      OriginalTitle: json['original_title'] ?? 'No Original Title',
      overview: json['overview'] ?? 'No Overview',
      BackdropPath: json['backdrop_path'] ?? 'No Backdrop Path',
      posterPath: json['poster_path'] ?? 'No Poster Path',
      releaseDate: json['release_date'] ?? 'No Release Date',
      voteAverage: json['vote_average'].toDouble() ?? 0.0,
      id: json['id'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'original_title': OriginalTitle,
      'overview': overview,
      'backdrop_path': BackdropPath,
      'poster_path': posterPath,
      'release_date': releaseDate,
      'vote_average': voteAverage,
      'id': id,
    };
  }
}


/*
{
  "page": 1,
  "results": [
    {
      "adult": false,
      "backdrop_path": "/pWsD91G2R1Da3AKM3ymr3UoIfRb.jpg",
      "genre_ids": [
        878,
        28,
        18
      ],
      "id": 933131,
      "original_language": "ko",
      "original_title": "황야",
      "overview": "After a deadly earthquake turns Seoul into a lawless badland, a fearless huntsman springs into action to rescue a teenager abducted by a mad doctor.",
      "popularity": 1117.08,
      "poster_path": "/zVMyvNowgbsBAL6O6esWfRpAcOb.jpg",
      "release_date": "2024-01-26",
      "title": "Badland Hunters",
      "video": false,
      "vote_average": 6.743,
      "vote_count": 447
    },
    {
      "adult": false,
      "backdrop_path": "/yyFc8Iclt2jxPmLztbP617xXllT.jpg",
      "genre_ids": [
        35,
        10751,
        14
      ],
      "id": 787699,
      "original_language": "en",
      "original_title": "Wonka",
      "overview": "Willy Wonka – chock-full of ideas and determined to change the world one delectable bite at a time – is proof that the best things in life begin with a dream, and if you’re lucky enough to meet Willy Wonka, anything is possible.",
      "popularity": 972.383,
      "poster_path": "/qhb1qOilapbapxWQn9jtRCMwXJF.jpg",
      "release_date": "2023-12-06",
      "title": "Wonka",
      "video": false,
      "vote_average": 7.217,
      "vote_count": 2204
    },
    {
      "adult": false,
      "backdrop_path": "/A0EqMM4WZpzfxpdoDoqICCpzSQ1.jpg",
      "genre_ids": [
        878,
        12,
        28
      ],
      "id": 609681,
      "original_language": "en",
      "original_title": "The Marvels",
      "overview": "Carol Danvers, aka Captain Marvel, has reclaimed her identity from the tyrannical Kree and taken revenge on the Supreme Intelligence. But unintended consequences see Carol shouldering the burden of a destabilized universe. When her duties send her to an anomalous wormhole linked to a Kree revolutionary, her powers become entangled with that of Jersey City super-fan Kamala Khan, aka Ms. Marvel, and Carol’s estranged niece, now S.A.B.E.R. astronaut Captain Monica Rambeau. Together, this unlikely trio must team up and learn to work in concert to save the universe.",
      "popularity": 1035.706,
      "poster_path": "/9GBhzXMFjgcZ3FdR9w3bUMMTps5.jpg",
      "release_date": "2023-11-08",
      "title": "The Marvels",
      "video": false,
      "vote_average": 6.271,
      "vote_count": 1803
    },
    {
      "adult": false,
      "backdrop_path": "/unvtbkgxh47BewQ8pENvdOdme0r.jpg",
      "genre_ids": [
        28,
        18
      ],
      "id": 1212073,
      "original_language": "de",
      "original_title": "60 Minuten",
      "overview": "Desperate to keep custody of his daughter, a mixed martial arts fighter abandons a big match and races across Berlin to attend her birthday party.",
      "popularity": 888.011,
      "poster_path": "/jojfbnIHGsRpodIood3OQoqA45Y.jpg",
      "release_date": "2024-01-19",
      "title": "Sixty Minutes",
      "video": false,
      "vote_average": 6.877,
      "vote_count": 377
    },
    {
      "adult": false,
      "backdrop_path": "/uUiIGztTrfDhPdAFJpr6m4UBMAd.jpg",
      "genre_ids": [
        14,
        28,
        878
      ],
      "id": 634492,
      "original_language": "en",
      "original_title": "Madame Web",
      "overview": "Forced to confront revelations about her past, paramedic Cassandra Webb forges a relationship with three young women destined for powerful futures...if they can all survive a deadly present.",
      "popularity": 793.373,
      "poster_path": "/rULWuutDcN5NvtiZi4FRPzRYWSh.jpg",
      "release_date": "2024-02-14",
      "title": "Madame Web",
      "video": false,
      "vote_average": 5.414,
      "vote_count": 210
    },
    {
      "adult": false,
      "backdrop_path": "/s9YTxwaByYeoSqugYjJJtZjMRAG.jpg",
      "genre_ids": [
        28,
        27,
        35,
        53
      ],
      "id": 1211483,
      "original_language": "en",
      "original_title": "Skal - Fight for Survival",
      "overview": "My name's Arthur, a huge Internet star who's just hit 3 million subs. While in the midst of throwing an epic party to celebrate, the universe had the balls to bring on the effing apocalypse and cut my night short. What was supposed to be a perfect hangover, has turned into an epic fight for survival.",
      "popularity": 827.391,
      "poster_path": "/uQkiDKQyun13mqsOXv7I5MRKr0q.jpg",
      "release_date": "2023-11-24",
      "title": "Skal - Fight for Survival",
      "video": false,
      "vote_average": 5.69,
      "vote_count": 29
    },
    {
      "adult": false,
      "backdrop_path": "/r9oTasGQofvkQY5vlUXglneF64Z.jpg",
      "genre_ids": [
        28,
        35
      ],
      "id": 1029575,
      "original_language": "en",
      "original_title": "The Family Plan",
      "overview": "Dan Morgan is many things: a devoted husband, a loving father, a celebrated car salesman. He's also a former assassin. And when his past catches up to his present, he's forced to take his unsuspecting family on a road trip unlike any other.",
      "popularity": 835.355,
      "poster_path": "/jLLtx3nTRSLGPAKl4RoIv1FbEBr.jpg",
      "release_date": "2023-12-14",
      "title": "The Family Plan",
      "video": false,
      "vote_average": 7.337,
      "vote_count": 953
    },
    {
      "adult": false,
      "backdrop_path": "/ay0PJQZizDXk0pzhoGX4v7K9h7A.jpg",
      "genre_ids": [
        28,
        53
      ],
      "id": 1214314,
      "original_language": "en",
      "original_title": "One More Shot",
      "overview": "Following the attack on the black site in Poland, Navy SEAL Jake Harris is ordered to escort terrorist suspect Amin Mansur to Washington D.C. for interrogation. Before the prisoner transfer process is complete, though, the airport is attacked by a group of heavily armed, well-trained mercenaries.",
      "popularity": 788.472,
      "poster_path": "/nQ1BQg4yMdlYSHvHZgwladzy7EF.jpg",
      "release_date": "2024-01-12",
      "title": "One More Shot",
      "video": false,
      "vote_average": 6.625,
      "vote_count": 152
    },
    {
      "adult": false,
      "backdrop_path": "/rz8GGX5Id2hCW1KzAIY4xwbQw1w.jpg",
      "genre_ids": [
        28,
        35,
        80
      ],
      "id": 955916,
      "original_language": "en",
      "original_title": "Lift",
      "overview": "An international heist crew, led by Cyrus Whitaker, race to lift $500 million in gold from a passenger plane at 40,000 feet.",
      "popularity": 721.877,
      "poster_path": "/46sp1Z9b2PPTgCMyA87g9aTLUXi.jpg",
      "release_date": "2024-01-10",
      "title": "Lift",
      "video": false,
      "vote_average": 6.598,
      "vote_count": 825
    },
    {
      "adult": false,
      "backdrop_path": "/meyhnvssZOPPjud4F1CjOb4snET.jpg",
      "genre_ids": [
        16,
        28,
        12,
        35,
        10751
      ],
      "id": 940551,
      "original_language": "en",
      "original_title": "Migration",
      "overview": "After a migrating duck family alights on their pond with thrilling tales of far-flung places, the Mallard family embarks on a family road trip, from New England, to New York City, to tropical Jamaica.",
      "popularity": 791.016,
      "poster_path": "/ldfCF9RhR40mppkzmftxapaHeTo.jpg",
      "release_date": "2023-12-06",
      "title": "Migration",
      "video": false,
      "vote_average": 7.631,
      "vote_count": 692
    },
    {
      "adult": false,
      "backdrop_path": "/ehumsuIBbgAe1hg343oszCLrAfI.jpg",
      "genre_ids": [
        16,
        10751,
        14,
        12
      ],
      "id": 1022796,
      "original_language": "en",
      "original_title": "Wish",
      "overview": "Asha, a sharp-witted idealist, makes a wish so powerful that it is answered by a cosmic force – a little ball of boundless energy called Star. Together, Asha and Star confront a most formidable foe - the ruler of Rosas, King Magnifico - to save her community and prove that when the will of one courageous human connects with the magic of the stars, wondrous things can happen.",
      "popularity": 640.323,
      "poster_path": "/nesuSdJakNkf0zs7OfoasB6Clxf.jpg",
      "release_date": "2023-11-13",
      "title": "Wish",
      "video": false,
      "vote_average": 6.627,
      "vote_count": 762
    },
    {
      "adult": false,
      "backdrop_path": "/4MCKNAc6AbWjEsM2h9Xc29owo4z.jpg",
      "genre_ids": [
        28,
        53,
        18
      ],
      "id": 866398,
      "original_language": "en",
      "original_title": "The Beekeeper",
      "overview": "One man’s campaign for vengeance takes on national stakes after he is revealed to be a former operative of a powerful and clandestine organization known as Beekeepers.",
      "popularity": 643.559,
      "poster_path": "/A7EByudX0eOzlkQ2FIbogzyazm2.jpg",
      "release_date": "2024-01-10",
      "title": "The Beekeeper",
      "video": false,
      "vote_average": 7.305,
      "vote_count": 1256
    },
    {
      "adult": false,
      "backdrop_path": "/cnqwv5Uz3UW5f086IWbQKr3ksJr.jpg",
      "genre_ids": [
        28,
        12,
        14
      ],
      "id": 572802,
      "original_language": "en",
      "original_title": "Aquaman and the Lost Kingdom",
      "overview": "Black Manta seeks revenge on Aquaman for his father's death. Wielding the Black Trident's power, he becomes a formidable foe. To defend Atlantis, Aquaman forges an alliance with his imprisoned brother. They must protect the kingdom.",
      "popularity": 645.72,
      "poster_path": "/7lTnXOy0iNtBAdRP3TZvaKJ77F6.jpg",
      "release_date": "2023-12-20",
      "title": "Aquaman and the Lost Kingdom",
      "video": false,
      "vote_average": 6.892,
      "vote_count": 1743
    },
    {
      "adult": false,
      "backdrop_path": "/pRmF6VBsRnvWCbLB9P80UvZFMyK.jpg",
      "genre_ids": [
        10749,
        35
      ],
      "id": 1014590,
      "original_language": "en",
      "original_title": "Upgraded",
      "overview": "Ana is an ambitious intern dreaming of a career in the art world while trying to impress her demanding boss Claire. When she's upgraded to first class on a work trip, she meets handsome Will, who mistakes Ana for her boss– a white lie that sets off a glamorous chain of events, romance and opportunity, until her fib threatens to surface.",
      "popularity": 599.886,
      "poster_path": "/9xn7y63VIpUsIVzSP9fYrqJHyl9.jpg",
      "release_date": "2024-02-07",
      "title": "Upgraded",
      "video": false,
      "vote_average": 7.407,
      "vote_count": 359
    },
    {
      "adult": false,
      "backdrop_path": "/sRLC052ieEzkQs9dEtPMfFxYkej.jpg",
      "genre_ids": [
        878,
        18,
        28
      ],
      "id": 848326,
      "original_language": "en",
      "original_title": "Rebel Moon - Part One: A Child of Fire",
      "overview": "When a peaceful colony on the edge of the galaxy finds itself threatened by the armies of the tyrannical Regent Balisarius, they dispatch Kora, a young woman with a mysterious past, to seek out warriors from neighboring planets to help them take a stand.",
      "popularity": 631.493,
      "poster_path": "/ui4DrH1cKk2vkHshcUcGt2lKxCm.jpg",
      "release_date": "2023-12-15",
      "title": "Rebel Moon - Part One: A Child of Fire",
      "video": false,
      "vote_average": 6.389,
      "vote_count": 1488
    },
    {
      "adult": false,
      "backdrop_path": "/y3sKoItrKZdVEfPeLyoE9m5OG2v.jpg",
      "genre_ids": [
        18,
        878,
        28
      ],
      "id": 695721,
      "original_language": "en",
      "original_title": "The Hunger Games: The Ballad of Songbirds & Snakes",
      "overview": "64 years before he becomes the tyrannical president of Panem, Coriolanus Snow sees a chance for a change in fortunes when he mentors Lucy Gray Baird, the female tribute from District 12.",
      "popularity": 593.479,
      "poster_path": "/mBaXZ95R2OxueZhvQbcEWy2DqyO.jpg",
      "release_date": "2023-11-15",
      "title": "The Hunger Games: The Ballad of Songbirds & Snakes",
      "video": false,
      "vote_average": 7.203,
      "vote_count": 1817
    },
    {
      "adult": false,
      "backdrop_path": "/zLj0peaxy5y2SlC6wNIQ4V0pfqg.jpg",
      "genre_ids": [
        16,
        10751,
        35,
        14
      ],
      "id": 1139829,
      "original_language": "en",
      "original_title": "Orion and the Dark",
      "overview": "A boy with an active imagination faces his fears on an unforgettable journey through the night with his new friend: a giant, smiling creature named Dark.",
      "popularity": 531.945,
      "poster_path": "/k6iHs4daxm0RQqFQsE8oE5wWJjj.jpg",
      "release_date": "2024-02-02",
      "title": "Orion and the Dark",
      "video": false,
      "vote_average": 6.629,
      "vote_count": 243
    },
    {
      "adult": false,
      "backdrop_path": "/yl2GfeCaPoxChcGyM5p7vYp1CKS.jpg",
      "genre_ids": [
        28,
        35,
        10749
      ],
      "id": 848187,
      "original_language": "en",
      "original_title": "Role Play",
      "overview": "Emma has a wonderful husband and two kids in the suburbs of New Jersey – she also has a secret life as an assassin for hire – a secret that her husband David discovers when the couple decide to spice up their marriage with a little role play.",
      "popularity": 544.036,
      "poster_path": "/7MhXiTmTl16LwXNPbWCmqxj7UxH.jpg",
      "release_date": "2024-01-04",
      "title": "Role Play",
      "video": false,
      "vote_average": 6.051,
      "vote_count": 363
    },
    {
      "adult": false,
      "backdrop_path": "/nTPFkLUARmo1bYHfkfdNpRKgEOs.jpg",
      "genre_ids": [
        35,
        10749
      ],
      "id": 1072790,
      "original_language": "en",
      "original_title": "Anyone But You",
      "overview": "After an amazing first date, Bea and Ben’s fiery attraction turns ice cold — until they find themselves unexpectedly reunited at a destination wedding in Australia. So they do what any two mature adults would do: pretend to be a couple.",
      "popularity": 810.738,
      "poster_path": "/yRt7MGBElkLQOYRvLTT1b3B1rcp.jpg",
      "release_date": "2023-12-21",
      "title": "Anyone But You",
      "video": false,
      "vote_average": 6.926,
      "vote_count": 507
    },
    {
      "adult": false,
      "backdrop_path": "/zIYROrkHJPYB3VTiW1L9QVgaQO.jpg",
      "genre_ids": [
        28,
        35
      ],
      "id": 897087,
      "original_language": "en",
      "original_title": "Freelance",
      "overview": "An ex-special forces operative takes a job to provide security for a journalist as she interviews a dictator, but a military coup breaks out in the middle of the interview, they are forced to escape into the jungle where they must survive.",
      "popularity": 523.004,
      "poster_path": "/7Bd4EUOqQDKZXA6Od5gkfzRNb0.jpg",
      "release_date": "2023-10-05",
      "title": "Freelance",
      "video": false,
      "vote_average": 6.559,
      "vote_count": 569
    }
  ],
  "total_pages": 42581,
  "total_results": 851610
}
*/