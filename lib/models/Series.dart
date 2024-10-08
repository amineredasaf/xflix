class Series {
  String? name = 'default name';
  String? posterPath = 'default poster path';
  String? backdropPath = 'default backdrop path';
  String? originalName = 'default original name';
  String? overview = 'default overview';
  String? firstAirDate = 'default first air date';
  double? voteAverage = 0.0;
  int id;

  Series({
    this.name,
    this.posterPath,
    this.backdropPath,
    this.originalName,
    this.overview,
    this.firstAirDate,
    this.voteAverage,
    required this.id,
  });

  factory Series.fromJson(Map<String, dynamic> json) {
    return Series(
      name: json['name'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      originalName: json['original_name'],
      overview: json['overview'],
      firstAirDate: json['first_air_date'],
      voteAverage: json['vote_average'].toDouble(),
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'poster_path': posterPath,
      'backdrop_path': backdropPath,
      'original_name': originalName,
      'overview': overview,
      'first_air_date': firstAirDate,
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
      "backdrop_path": "/AvsNXUbP7UKCVnypyx2eWp8z2N3.jpg",
      "genre_ids": [
        16,
        35,
        10765
      ],
      "id": 94954,
      "origin_country": [
        "US"
      ],
      "original_language": "en",
      "original_name": "Hazbin Hotel",
      "overview": "In attempt to find a non-violent alternative for reducing Hell's overpopulation, the daughter of Lucifer opens a rehabilitation hotel that offers a group of misfit demons a chance at redemption.",
      "popularity": 497.32,
      "poster_path": "/rXojaQcxVUubPLSrFV8PD4xdjrs.jpg",
      "first_air_date": "2024-01-18",
      "name": "Hazbin Hotel",
      "vote_average": 9.132,
      "vote_count": 601
    },
    {
      "adult": false,
      "backdrop_path": "/9faGSFi5jam6pDWGNd0p8JcJgXQ.jpg",
      "genre_ids": [
        18,
        80
      ],
      "id": 1396,
      "origin_country": [
        "US"
      ],
      "original_language": "en",
      "original_name": "Breaking Bad",
      "overview": "Walter White, a New Mexico chemistry teacher, is diagnosed with Stage III cancer and given a prognosis of only two years left to live. He becomes filled with a sense of fearlessness and an unrelenting desire to secure his family's financial future at any cost as he enters the dangerous world of drugs and crime.",
      "popularity": 412.534,
      "poster_path": "/ztkUQFLlC19CCMYHW9o1zWhJRNq.jpg",
      "first_air_date": "2008-01-20",
      "name": "Breaking Bad",
      "vote_average": 8.901,
      "vote_count": 13147
    },
    {
      "adult": false,
      "backdrop_path": "/rkB4LyZHo1NHXFEDHl9vSD9r1lI.jpg",
      "genre_ids": [
        16,
        18,
        10765,
        10759
      ],
      "id": 94605,
      "origin_country": [
        "US"
      ],
      "original_language": "en",
      "original_name": "Arcane",
      "overview": "Amid the stark discord of twin cities Piltover and Zaun, two sisters fight on rival sides of a war between magic technologies and clashing convictions.",
      "popularity": 131.14,
      "poster_path": "/fqldf2t8ztc9aiwn3k6mlX3tvRT.jpg",
      "first_air_date": "2021-11-06",
      "name": "Arcane",
      "vote_average": 8.746,
      "vote_count": 3617
    },
    {
      "adult": false,
      "backdrop_path": "/2rmK7mnchw9Xr3XdiTFSxTTLXqv.jpg",
      "genre_ids": [
        10759,
        35,
        16
      ],
      "id": 37854,
      "origin_country": [
        "JP"
      ],
      "original_language": "ja",
      "original_name": "ワンピース",
      "overview": "Years ago, the fearsome Pirate King, Gol D. Roger was executed leaving a huge pile of treasure and the famous \"One Piece\" behind. Whoever claims the \"One Piece\" will be named the new King of the Pirates.\n\nMonkey D. Luffy, a boy who consumed a \"Devil Fruit,\" decides to follow in the footsteps of his idol, the pirate Shanks, and find the One Piece. It helps, of course, that his body has the properties of rubber and that he's surrounded by a bevy of skilled fighters and thieves to help him along the way.\n\nLuffy will do anything to get the One Piece and become King of the Pirates!",
      "popularity": 220.647,
      "poster_path": "/cMD9Ygz11zjJzAovURpO75Qg7rT.jpg",
      "first_air_date": "1999-10-20",
      "name": "One Piece",
      "vote_average": 8.726,
      "vote_count": 4327
    },
    {
      "adult": false,
      "backdrop_path": "/kU98MbVVgi72wzceyrEbClZmMFe.jpg",
      "genre_ids": [
        16,
        10759,
        10765
      ],
      "id": 246,
      "origin_country": [
        "US"
      ],
      "original_language": "en",
      "original_name": "Avatar: The Last Airbender",
      "overview": "In a war-torn world of elemental magic, a young boy reawakens to undertake a dangerous mystic quest to fulfill his destiny as the Avatar, and bring peace to the world.",
      "popularity": 157.13,
      "poster_path": "/cHFZA8Tlv03nKTGXhLOYOLtqoSm.jpg",
      "first_air_date": "2005-02-21",
      "name": "Avatar: The Last Airbender",
      "vote_average": 8.707,
      "vote_count": 3728
    },
    {
      "adult": false,
      "backdrop_path": "/rBF8wVQN8hTWHspVZBlI3h7HZJ.jpg",
      "genre_ids": [
        16,
        35,
        10765,
        10759
      ],
      "id": 60625,
      "origin_country": [
        "US"
      ],
      "original_language": "en",
      "original_name": "Rick and Morty",
      "overview": "Rick is a mentally-unbalanced but scientifically gifted old man who has recently reconnected with his family. He spends most of his time involving his young grandson Morty in dangerous, outlandish adventures throughout space and alternate universes. Compounded with Morty's already unstable family life, these events cause Morty much distress at home and school.",
      "popularity": 755.547,
      "poster_path": "/gdIrmf2DdY5mgN6ycVP0XlzKzbE.jpg",
      "first_air_date": "2013-12-02",
      "name": "Rick and Morty",
      "vote_average": 8.701,
      "vote_count": 9173
    },
    {
      "adult": false,
      "backdrop_path": "/97cicAYWu4cc0TyXJoDQiMmWI2t.jpg",
      "genre_ids": [
        10759,
        16,
        10765,
        35,
        18
      ],
      "id": 31911,
      "origin_country": [
        "JP"
      ],
      "original_language": "ja",
      "original_name": "鋼の錬金術師 FULLMETAL ALCHEMIST",
      "overview": "Disregard for alchemy’s laws ripped half of Edward Elric’s limbs from his body and left his brother Alphonse’s soul clinging to a suit of armor. To restore what was lost, the brothers seek the Philosopher’s Stone. Enemies and allies – the corrupt military, the Homunculi, and foreign alchemists – will alter the Elric brothers course, but their purpose will remain unchanged and their bond unbreakable.",
      "popularity": 122.029,
      "poster_path": "/5ZFUEOULaVml7pQuXxhpR2SmVUw.jpg",
      "first_air_date": "2009-04-05",
      "name": "Fullmetal Alchemist: Brotherhood",
      "vote_average": 8.694,
      "vote_count": 1870
    },
    {
      "adult": false,
      "backdrop_path": "/70YdbMELM4b8x8VXjlubymb2bQ0.jpg",
      "genre_ids": [
        18,
        10751
      ],
      "id": 70785,
      "origin_country": [
        "CA"
      ],
      "original_language": "en",
      "original_name": "Anne with an E",
      "overview": "A coming-of-age story about an outsider who, against all odds and numerous challenges, fights for love and acceptance and for her place in the world. The series centers on a young orphaned girl in the late 1890’s, who, after an abusive childhood spent in orphanages and the homes of strangers, is mistakenly sent to live with an elderly woman and her aging brother. Over time, 13-year-old Anne will transform their lives and eventually the small town in which they live with her unique spirit, fierce intellect and brilliant imagination.",
      "popularity": 92.02,
      "poster_path": "/6P6tXhjT5tK3qOXzxF9OMLlG7iz.jpg",
      "first_air_date": "2017-03-19",
      "name": "Anne with an E",
      "vote_average": 8.69,
      "vote_count": 4494
    },
    {
      "adult": false,
      "backdrop_path": "/nTvM4mhqNlHIvUkI1gVnW6XP7GG.jpg",
      "genre_ids": [
        16,
        10759,
        10765
      ],
      "id": 85937,
      "origin_country": [
        "JP"
      ],
      "original_language": "ja",
      "original_name": "鬼滅の刃",
      "overview": "It is the Taisho Period in Japan. Tanjiro, a kindhearted boy who sells charcoal for a living, finds his family slaughtered by a demon. To make matters worse, his younger sister Nezuko, the sole survivor, has been transformed into a demon herself. Though devastated by this grim reality, Tanjiro resolves to become a “demon slayer” so that he can turn his sister back into a human, and kill the demon that massacred his family.",
      "popularity": 117.087,
      "poster_path": "/xUfRZu2mi8jH6SzQEJGP6tjBuYj.jpg",
      "first_air_date": "2019-04-06",
      "name": "Demon Slayer: Kimetsu no Yaiba",
      "vote_average": 8.675,
      "vote_count": 5890
    },
    {
      "adult": false,
      "backdrop_path": "/rqbCbjB19amtOtFQbb3K2lgm2zv.jpg",
      "genre_ids": [
        16,
        10765,
        10759
      ],
      "id": 1429,
      "origin_country": [
        "JP"
      ],
      "original_language": "ja",
      "original_name": "進撃の巨人",
      "overview": "Several hundred years ago, humans were nearly exterminated by Titans. Titans are typically several stories tall, seem to have no intelligence, devour human beings and, worst of all, seem to do it for the pleasure rather than as a food source. A small percentage of humanity survived by walling themselves in a city protected by extremely high walls, even taller than the biggest Titans. Flash forward to the present and the city has not seen a Titan in over 100 years. Teenage boy Eren and his foster sister Mikasa witness something horrific as the city walls are destroyed by a Colossal Titan that appears out of thin air. As the smaller Titans flood the city, the two kids watch in horror as their mother is eaten alive. Eren vows that he will murder every single Titan and take revenge for all of mankind.",
      "popularity": 114.26,
      "poster_path": "/hTP1DtLGFamjfu8WqjnuQdP1n4i.jpg",
      "first_air_date": "2013-04-07",
      "name": "Attack on Titan",
      "vote_average": 8.664,
      "vote_count": 5905
    },
    {
      "adult": false,
      "backdrop_path": "/hPea3Qy5Gd6z4kJLUruBbwAH8Rm.jpg",
      "genre_ids": [
        80,
        18
      ],
      "id": 60059,
      "origin_country": [
        "US"
      ],
      "original_language": "en",
      "original_name": "Better Call Saul",
      "overview": "Six years before Saul Goodman meets Walter White. We meet him when the man who will become Saul Goodman is known as Jimmy McGill, a small-time lawyer searching for his destiny, and, more immediately, hustling to make ends meet. Working alongside, and, often, against Jimmy, is “fixer” Mike Ehrmantraut. The series tracks Jimmy’s transformation into Saul Goodman, the man who puts “criminal” in “criminal lawyer\".",
      "popularity": 234.312,
      "poster_path": "/fC2HDm5t0kHl7mTm7jxMR31b7by.jpg",
      "first_air_date": "2015-02-08",
      "name": "Better Call Saul",
      "vote_average": 8.661,
      "vote_count": 4692
    },
    {
      "adult": false,
      "backdrop_path": "/20eIP9o5ebArmu2HxJutaBjhLf4.jpg",
      "genre_ids": [
        18
      ],
      "id": 87108,
      "origin_country": [
        "US"
      ],
      "original_language": "en",
      "original_name": "Chernobyl",
      "overview": "The true story of one of the worst man-made catastrophes in history: the catastrophic nuclear accident at Chernobyl. A tale of the brave men and women who sacrificed to save Europe from unimaginable disaster.",
      "popularity": 93.372,
      "poster_path": "/hlLXt2tOPT6RRnjiUmoxyG1LTFi.jpg",
      "first_air_date": "2019-05-06",
      "name": "Chernobyl",
      "vote_average": 8.658,
      "vote_count": 5739
    },
    {
      "adult": false,
      "backdrop_path": "/6UH52Fmau8RPsMAbQbjwN3wJSCj.jpg",
      "genre_ids": [
        16,
        10765,
        10759,
        18
      ],
      "id": 95557,
      "origin_country": [
        "US"
      ],
      "original_language": "en",
      "original_name": "Invincible",
      "overview": "Mark Grayson is a normal teenager except for the fact that his father is the most powerful superhero on the planet. Shortly after his seventeenth birthday, Mark begins to develop powers of his own and enters into his father’s tutelage.",
      "popularity": 195.939,
      "poster_path": "/dMOpdkrDC5dQxqNydgKxXjBKyAc.jpg",
      "first_air_date": "2021-03-25",
      "name": "Invincible",
      "vote_average": 8.7,
      "vote_count": 4070
    },
    {
      "adult": false,
      "backdrop_path": "/2w8FaLwwJTWr6ExUMeVgT2Th5YT.jpg",
      "genre_ids": [
        16,
        35,
        18,
        10759
      ],
      "id": 42705,
      "origin_country": [
        "JP"
      ],
      "original_language": "ja",
      "original_name": "はじめの一歩",
      "overview": "Makunouchi Ippo is an ordinary high school student in Japan. Since he spends most of his time away from school helping his mother run the family business, he doesn't get to enjoy his younger years like most teenagers. Always a target for bullying at school (the family fishing business grants him a distinct odor), Ippo's life is one of hardship. One of these after-school bullying sessions turns Ippo's life around for the better, as he is saved by a boxer named Takamura. He decides to follow in Takamura's footsteps and train to become a boxer, giving his life direction and purpose. Ippo's path to perfecting his pugilistic prowess is just beginning...",
      "popularity": 267.613,
      "poster_path": "/i3U3J2MWovIBZBnZYYiOLBXqNJZ.jpg",
      "first_air_date": "2000-10-03",
      "name": "Fighting Spirit",
      "vote_average": 8.657,
      "vote_count": 937
    },
    {
      "adult": false,
      "backdrop_path": "/cHyY5z4txdVyGtYMvBJhCqCcJso.jpg",
      "genre_ids": [
        16,
        10765,
        18,
        10759,
        35
      ],
      "id": 92685,
      "origin_country": [
        "US"
      ],
      "original_language": "en",
      "original_name": "The Owl House",
      "overview": "An animated fantasy-comedy series that follows Luz, a self-assured teenage girl who accidentally stumbles upon a portal to a magical world where she befriends a rebellious witch, Eda, and an adorably tiny warrior, King. Despite not having magical abilities, Luz pursues her dream of becoming a witch by serving as Eda's apprentice at the Owl House and ultimately finds a new family in an unlikely setting.",
      "popularity": 164.226,
      "poster_path": "/zhdy3PcNVE15wj1wrxn45ARZBnx.jpg",
      "first_air_date": "2020-01-10",
      "name": "The Owl House",
      "vote_average": 8.7,
      "vote_count": 1471
    },
    {
      "adult": false,
      "backdrop_path": "/jsXKG9uppnPrhqFNhImllyCfLhl.jpg",
      "genre_ids": [
        10759,
        16,
        10765
      ],
      "id": 65930,
      "origin_country": [
        "JP"
      ],
      "original_language": "ja",
      "original_name": "僕のヒーローアカデミア",
      "overview": "A superhero-admiring boy without any powers enrolls in a prestigious hero academy and learns what it really means to be a hero.",
      "popularity": 144.722,
      "poster_path": "/qIKNIkxXYIro6JjNIGyqumrVUKL.jpg",
      "first_air_date": "2016-04-03",
      "name": "My Hero Academia",
      "vote_average": 8.652,
      "vote_count": 4636
    },
    {
      "adult": false,
      "backdrop_path": "/7iTOLVTKoBLwDYcoOA1qTS6NY5y.jpg",
      "genre_ids": [
        16,
        10762,
        35
      ],
      "id": 82728,
      "origin_country": [
        "AU"
      ],
      "original_language": "en",
      "original_name": "Bluey",
      "overview": "Bluey is an inexhaustible six year-old Blue Heeler dog, who loves to play and turns everyday family life into extraordinary adventures, developing her imagination as well as her mental, physical and emotional resilience.",
      "popularity": 228.214,
      "poster_path": "/b9mY0X5T20ZM073hoa5n0dgmbfN.jpg",
      "first_air_date": "2018-10-01",
      "name": "Bluey",
      "vote_average": 8.7,
      "vote_count": 426
    },
    {
      "adult": false,
      "backdrop_path": "/mGFRWVfH0HTTVighIXjtO2Vkz4z.jpg",
      "genre_ids": [
        10759,
        16,
        18
      ],
      "id": 225180,
      "origin_country": [
        "US"
      ],
      "original_language": "en",
      "original_name": "BLUE EYE SAMURAI",
      "overview": "Driven by a dream of revenge against those who made her an outcast in Edo-period Japan, a young warrior cuts a bloody path toward her destiny.",
      "popularity": 101.04,
      "poster_path": "/fXm3JT4WLQVnwukdvghtAblc1wc.jpg",
      "first_air_date": "2023-11-03",
      "name": "BLUE EYE SAMURAI",
      "vote_average": 8.6,
      "vote_count": 243
    },
    {
      "adult": false,
      "backdrop_path": "/smSbK5cd8T9XHcxEUcems23BDEF.jpg",
      "genre_ids": [
        18,
        10765,
        35
      ],
      "id": 67915,
      "origin_country": [
        "KR"
      ],
      "original_language": "ko",
      "original_name": "쓸쓸하고 찬란하神-도깨비",
      "overview": "In his quest for a bride to break his immortal curse, a 939-year-old guardian of souls meets a grim reaper and a sprightly student with a tragic past.",
      "popularity": 119.84,
      "poster_path": "/sPkxHNw5BFvuCFGWw825TS7n6X3.jpg",
      "first_air_date": "2016-12-02",
      "name": "Goblin",
      "vote_average": 8.6,
      "vote_count": 2586
    },
    {
      "adult": false,
      "backdrop_path": "/zH2EyS3HSsl0vgNTBtDtsbGnYev.jpg",
      "genre_ids": [
        35,
        18
      ],
      "id": 62914,
      "origin_country": [
        "ES"
      ],
      "original_language": "ca",
      "original_name": "Merlí",
      "overview": "He’s surly, unorthodox, unapologetically blunt, and he’s about to change your life. Meet the new philosophy teacher, Merlí, who will help his students view the world in a whole new light, both in and out of the classroom.",
      "popularity": 56.247,
      "poster_path": "/eBzpj7PxyeRFCIYHQjB5kDnhX4a.jpg",
      "first_air_date": "2015-09-14",
      "name": "Merlí",
      "vote_average": 8.6,
      "vote_count": 1036
    }
  ],
  "total_pages": 96,
  "total_results": 1905
}

*/