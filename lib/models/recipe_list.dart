class RecipeList {
  List<Data>? data;

  RecipeList({this.data});

  RecipeList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? idStr;
  String? lead;
  String? title;
  String? description;
  int? state;
  int? statePremium;
  bool? isVisible;
  bool? isFavoriteFree;
  // Null? advertiser;
  SquareVideo? squareVideo;
  SquareVideo? squareMp4Video;
  List<IngredientGroups>? ingredientGroups;
  String? calorie;
  String? cookingTime;
  List<CookingTags>? cookingTags;
  // Null? recipeDetail;
  // Null? cookingReportsContainer;

  Data({
    this.id,
    this.idStr,
    this.lead,
    this.title,
    this.description,
    this.state,
    this.statePremium,
    this.isVisible,
    this.isFavoriteFree,
    // this.advertiser,
    this.squareVideo,
    this.squareMp4Video,
    this.ingredientGroups,
    this.calorie,
    this.cookingTime,
    this.cookingTags,
    // this.recipeDetail,
    // this.cookingReportsContainer
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idStr = json['id_str'];
    lead = json['lead'];
    title = json['title'];
    description = json['description'];
    state = json['state'];
    statePremium = json['state_premium'];
    isVisible = json['is_visible'];
    isFavoriteFree = json['is_favorite_free'];
    // advertiser = json['advertiser'];
    squareVideo = json['square_video'] != null
        ? SquareVideo.fromJson(json['square_video'])
        : null;
    squareMp4Video = json['square_mp4_video'] != null
        ? SquareVideo.fromJson(json['square_mp4_video'])
        : null;
    if (json['ingredient_groups'] != null) {
      ingredientGroups = <IngredientGroups>[];
      json['ingredient_groups'].forEach((v) {
        ingredientGroups!.add(IngredientGroups.fromJson(v));
      });
    }
    calorie = json['calorie'];
    cookingTime = json['cooking_time'];
    if (json['cooking_tags'] != null) {
      cookingTags = <CookingTags>[];
      json['cooking_tags'].forEach((v) {
        cookingTags!.add(CookingTags.fromJson(v));
      });
    }
    // recipeDetail = json['recipe_detail'];
    // cookingReportsContainer = json['cooking_reports_container'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['id_str'] = idStr;
    data['lead'] = lead;
    data['title'] = title;
    data['description'] = description;
    data['state'] = state;
    data['state_premium'] = statePremium;
    data['is_visible'] = isVisible;
    data['is_favorite_free'] = isFavoriteFree;
    // data['advertiser'] = advertiser;
    if (squareVideo != null) {
      data['square_video'] = squareVideo!.toJson();
    }
    if (squareMp4Video != null) {
      data['square_mp4_video'] = squareMp4Video!.toJson();
    }
    if (ingredientGroups != null) {
      data['ingredient_groups'] =
          ingredientGroups!.map((v) => v.toJson()).toList();
    }
    data['calorie'] = calorie;
    data['cooking_time'] = cookingTime;
    if (cookingTags != null) {
      data['cooking_tags'] = cookingTags!.map((v) => v.toJson()).toList();
    }
    // data['recipe_detail'] = recipeDetail;
    // data['cooking_reports_container'] = cookingReportsContainer;
    return data;
  }
}

class SquareVideo {
  String? url;
  String? posterUrl;
  String? webpPosterUrl;

  SquareVideo({this.url, this.posterUrl, this.webpPosterUrl});

  SquareVideo.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    posterUrl = json['poster_url'];
    webpPosterUrl = json['webp_poster_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['poster_url'] = posterUrl;
    data['webp_poster_url'] = webpPosterUrl;
    return data;
  }
}

class IngredientGroups {
  List<RecipeIngredients>? recipeIngredients;

  IngredientGroups({this.recipeIngredients});

  IngredientGroups.fromJson(Map<String, dynamic> json) {
    if (json['recipe_ingredients'] != null) {
      recipeIngredients = <RecipeIngredients>[];
      json['recipe_ingredients'].forEach((v) {
        recipeIngredients!.add(RecipeIngredients.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (recipeIngredients != null) {
      data['recipe_ingredients'] =
          recipeIngredients!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RecipeIngredients {
  String? name;

  RecipeIngredients({this.name});

  RecipeIngredients.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}

class CookingTags {
  int? id;
  String? name;
  // Null? description;
  // Null? parents;
  // Null? children;
  // Null? representativeRecipe;
  // Null? recipes;
  // Null? suggests;
  // Null? basicCookingRecipes;

  CookingTags({
    this.id,
    this.name,
    // this.description,
    // this.parents,
    // this.children,
    // this.representativeRecipe,
    // this.recipes,
    // this.suggests,
    // this.basicCookingRecipes
  });

  CookingTags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    // description = json['description'];
    // parents = json['parents'];
    // children = json['children'];
    // representativeRecipe = json['representative_recipe'];
    // recipes = json['recipes'];
    // suggests = json['suggests'];
    // basicCookingRecipes = json['basic_cooking_recipes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    // data['description'] = description;
    // data['parents'] = parents;
    // data['children'] = children;
    // data['representative_recipe'] = representativeRecipe;
    // data['recipes'] = recipes;
    // data['suggests'] = suggests;
    // data['basic_cooking_recipes'] = basicCookingRecipes;
    return data;
  }
}
