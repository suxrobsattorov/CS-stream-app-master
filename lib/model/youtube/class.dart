class AutoGenerate {
	AutoGenerate({
		required this.results,
	});
	late final List<Results> results;

	AutoGenerate.fromJson(Map<String, dynamic> json){
		results = List.from(json['results']).map((e)=>Results.fromJson(e)).toList();
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> _data = <String, dynamic>{};
		_data['results'] = results.map((e)=>e.toJson()).toList();
		return _data;
	}
}

class Results {
	Results({
		required this.uploadedAt,
		required this.id,
		required this.tags,
		required this.nsfw,
		required this.private,
		this.description,
		required this.url,
		required this.unlisted,
		required this.channel,
		required this.thumbnail,
		required this.ratings,
		required this.shorts,
		required this.title,
		required this.live,
		required this.durationFormatted,
		required this.views,
		required this.duration,
		required this.shortsUrl,
		required this.type,
	});
	late final String uploadedAt;
	late final String id;
	late final Tags tags;
	late final bool nsfw;
	late final bool private;
	late final Null description;
	late final String url;
	late final bool unlisted;
	late final Channel channel;
	late final Thumbnail thumbnail;
	late final Ratings ratings;
	late final bool shorts;
	late final String title;
	late final bool live;
	late final String durationFormatted;
	late final int views;
	late final int duration;
	late final String shortsUrl;
	late final String type;

	Results.fromJson(Map<String, dynamic> json){
		uploadedAt = json['uploadedAt'];
		id = json['id'];
		tags = Tags.fromJson(json['tags']);
		nsfw = json['nsfw'];
		private = json['private'];
		description = null;
		url = json['url'];
		unlisted = json['unlisted'];
		channel = Channel.fromJson(json['channel']);
		thumbnail = Thumbnail.fromJson(json['thumbnail']);
		ratings = Ratings.fromJson(json['ratings']);
		shorts = json['shorts'];
		title = json['title'];
		live = json['live'];
		durationFormatted = json['duration_formatted'];
		views = json['views'];
		duration = json['duration'];
		shortsUrl = json['shorts_url'];
		type = json['type'];
	}

	Map<String, dynamic> toJson() {
		final _data = <String, dynamic>{};
		_data['uploadedAt'] = uploadedAt;
		_data['id'] = id;
		_data['tags'] = tags.toJson();
		_data['nsfw'] = nsfw;
		_data['private'] = private;
		_data['description'] = description;
		_data['url'] = url;
		_data['unlisted'] = unlisted;
		_data['channel'] = channel.toJson();
		_data['thumbnail'] = thumbnail.toJson();
		_data['ratings'] = ratings.toJson();
		_data['shorts'] = shorts;
		_data['title'] = title;
		_data['live'] = live;
		_data['duration_formatted'] = durationFormatted;
		_data['views'] = views;
		_data['duration'] = duration;
		_data['shorts_url'] = shortsUrl;
		_data['type'] = type;
		return _data;
	}
}

class Tags {
	Tags();

	Tags.fromJson(Map json);

	Map<String, dynamic> toJson() {
		final _data = <String, dynamic>{};
		return _data;
	}
}

class Channel {
	Channel({
		required this.name,
		required this.icon,
		required this.id,
	});
	late final String name;
	late final String icon;
	late final String id;

	Channel.fromJson(Map<String, dynamic> json){
		name = json['name'];
		icon = json['icon'];
		id = json['id'];
	}

	Map<String, dynamic> toJson() {
		final _data = <String, dynamic>{};
		_data['name'] = name;
		_data['icon'] = icon;
		_data['id'] = id;
		return _data;
	}
}

class Thumbnail {
	Thumbnail({
		required this.url,
		required this.height,
		required this.id,
		required this.width,
	});
	late final String url;
	late final int height;
	late final String id;
	late final int width;

	Thumbnail.fromJson(Map<String, dynamic> json){
		url = json['url'];
		height = json['height'];
		id = json['id'];
		width = json['width'];
	}

	Map<String, dynamic> toJson() {
		final _data = <String, dynamic>{};
		_data['url'] = url;
		_data['height'] = height;
		_data['id'] = id;
		_data['width'] = width;
		return _data;
	}
}

class Ratings {
	Ratings({
		required this.likes,
		required this.dislikes,
	});
	late final int likes;
	late final int dislikes;

	Ratings.fromJson(Map<String, dynamic> json){
		likes = json['likes'];
		dislikes = json['dislikes'];
	}

	Map<String, dynamic> toJson() {
		final _data = <String, dynamic>{};
		_data['likes'] = likes;
		_data['dislikes'] = dislikes;
		return _data;
	}
}