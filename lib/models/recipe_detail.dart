class RecipeDetail {
  Data? data;

  RecipeDetail({this.data});

  RecipeDetail.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
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
  String? attention;
  String? customHeadTitle;
  bool? isFavorite;
  bool? isFavoriteFree;
  bool? isCooked;
  bool? isVisible;
  bool? canCookingReport;
  int? state;
  int? statePremium;
  int? stateMealMenu;
  int? cookingTimeValue;
  String? cookingTime;
  String? cookingCost;
  String? nutrientUnit;
  RecipeDetail? recipeDetail;
  String? createdAt;
  String? updatedAt;
  // Null? advertiser;
  FoodCreator? foodCreator;
  List<Articles>? articles;
  SquareVideo? squareVideo;
  SquareVideo? squareMp4Video;
  List<IngredientGroups>? ingredientGroups;
  List<RecipeTags>? recipeTags;
  // Null? recipeQas;
  List<RecipeServings>? recipeServings;
  List<RecipeSteps>? recipeSteps;
  Nutrient? nutrient;
  // Null? banner;

  Data({
    this.id,
    this.idStr,
    this.lead,
    this.title,
    this.description,
    this.attention,
    this.customHeadTitle,
    this.isFavorite,
    this.isFavoriteFree,
    this.isCooked,
    this.isVisible,
    this.canCookingReport,
    this.state,
    this.statePremium,
    this.stateMealMenu,
    this.cookingTimeValue,
    this.cookingTime,
    this.cookingCost,
    this.nutrientUnit,
    this.recipeDetail,
    this.createdAt,
    this.updatedAt,
    // this.advertiser,
    this.foodCreator,
    this.articles,
    this.squareVideo,
    this.squareMp4Video,
    this.ingredientGroups,
    this.recipeTags,
    // this.recipeQas,
    this.recipeServings,
    this.recipeSteps,
    this.nutrient,
    // this.banner
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idStr = json['id_str'];
    lead = json['lead'];
    title = json['title'];
    description = json['description'];
    attention = json['attention'];
    customHeadTitle = json['custom_head_title'];
    isFavorite = json['is_favorite'];
    isFavoriteFree = json['is_favorite_free'];
    isCooked = json['is_cooked'];
    isVisible = json['is_visible'];
    canCookingReport = json['can_cooking_report'];
    state = json['state'];
    statePremium = json['state_premium'];
    stateMealMenu = json['state_meal_menu'];
    cookingTimeValue = json['cooking_time_value'];
    cookingTime = json['cooking_time'];
    cookingCost = json['cooking_cost'];
    nutrientUnit = json['nutrient_unit'];
    // recipeDetail = json['recipe_detail'] != null
    //     ? RecipeDetailChild.fromJson(json['recipe_detail'])
    //     : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    // advertiser = json['advertiser'];
    foodCreator = json['food_creator'] != null
        ? FoodCreator.fromJson(json['food_creator'])
        : null;
    if (json['articles'] != null) {
      articles = <Articles>[];
      json['articles'].forEach((v) {
        articles!.add(Articles.fromJson(v));
      });
    }
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
    if (json['recipe_tags'] != null) {
      recipeTags = <RecipeTags>[];
      json['recipe_tags'].forEach((v) {
        recipeTags!.add(RecipeTags.fromJson(v));
      });
    }
    // recipeQas = json['recipe_qas'];
    if (json['recipe_servings'] != null) {
      recipeServings = <RecipeServings>[];
      json['recipe_servings'].forEach((v) {
        recipeServings!.add(RecipeServings.fromJson(v));
      });
    }
    if (json['recipe_steps'] != null) {
      recipeSteps = <RecipeSteps>[];
      json['recipe_steps'].forEach((v) {
        recipeSteps!.add(RecipeSteps.fromJson(v));
      });
    }
    nutrient =
        json['nutrient'] != null ? Nutrient.fromJson(json['nutrient']) : null;
    // banner = json['banner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['id_str'] = idStr;
    data['lead'] = lead;
    data['title'] = title;
    data['description'] = description;
    data['attention'] = attention;
    data['custom_head_title'] = customHeadTitle;
    data['is_favorite'] = isFavorite;
    data['is_favorite_free'] = isFavoriteFree;
    data['is_cooked'] = isCooked;
    data['is_visible'] = isVisible;
    data['can_cooking_report'] = canCookingReport;
    data['state'] = state;
    data['state_premium'] = statePremium;
    data['state_meal_menu'] = stateMealMenu;
    data['cooking_time_value'] = cookingTimeValue;
    data['cooking_time'] = cookingTime;
    data['cooking_cost'] = cookingCost;
    data['nutrient_unit'] = nutrientUnit;
    if (recipeDetail != null) {
      data['recipe_detail'] = recipeDetail!.toJson();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    // data['advertiser'] = advertiser;
    if (foodCreator != null) {
      data['food_creator'] = foodCreator!.toJson();
    }
    if (articles != null) {
      data['articles'] = articles!.map((v) => v.toJson()).toList();
    }
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
    if (recipeTags != null) {
      data['recipe_tags'] = recipeTags!.map((v) => v.toJson()).toList();
    }
    // data['recipe_qas'] = recipeQas;
    if (recipeServings != null) {
      data['recipe_servings'] = recipeServings!.map((v) => v.toJson()).toList();
    }
    if (recipeSteps != null) {
      data['recipe_steps'] = recipeSteps!.map((v) => v.toJson()).toList();
    }
    if (nutrient != null) {
      data['nutrient'] = nutrient!.toJson();
    }
    // data['banner'] = banner;
    return data;
  }
}

class RecipeDetailChild {
  CookingTime? cookingTime;
  CookingCost? cookingCost;
  CookingCost? calorie;
  String? nutrientUnit;

  RecipeDetailChild(
      {this.cookingTime, this.cookingCost, this.calorie, this.nutrientUnit});

  RecipeDetailChild.fromJson(Map<String, dynamic> json) {
    cookingTime = json['cooking_time'] != null
        ? CookingTime.fromJson(json['cooking_time'])
        : null;
    cookingCost = json['cooking_cost'] != null
        ? CookingCost.fromJson(json['cooking_cost'])
        : null;
    calorie =
        json['calorie'] != null ? CookingCost.fromJson(json['calorie']) : null;
    nutrientUnit = json['nutrient_unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cookingTime != null) {
      data['cooking_time'] = cookingTime!.toJson();
    }
    if (cookingCost != null) {
      data['cooking_cost'] = cookingCost!.toJson();
    }
    if (calorie != null) {
      data['calorie'] = calorie!.toJson();
    }
    data['nutrient_unit'] = nutrientUnit;
    return data;
  }
}

class CookingTime {
  int? value;
  String? unit;
  String? prefix;
  String? suffix;

  CookingTime({this.value, this.unit, this.prefix, this.suffix});

  CookingTime.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    unit = json['unit'];
    prefix = json['prefix'];
    suffix = json['suffix'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['unit'] = unit;
    data['prefix'] = prefix;
    data['suffix'] = suffix;
    return data;
  }
}

class CookingCost {
  int? value;
  String? unit;
  String? suffix;

  CookingCost({this.value, this.unit, this.suffix});

  CookingCost.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    unit = json['unit'];
    suffix = json['suffix'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['unit'] = unit;
    data['suffix'] = suffix;
    return data;
  }
}

class FoodCreator {
  int? id;
  String? idStr;
  String? name;
  String? catchCopy;
  String? imageUrl;
  String? profile;
  String? career;
  String? certification;
  // List<Null>? recommendedRecipes;

  FoodCreator({
    this.id,
    this.idStr,
    this.name,
    this.catchCopy,
    this.imageUrl,
    this.profile,
    this.career,
    this.certification,
    // this.recommendedRecipes
  });

  FoodCreator.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idStr = json['id_str'];
    name = json['name'];
    catchCopy = json['catch_copy'];
    imageUrl = json['image_url'];
    profile = json['profile'];
    career = json['career'];
    certification = json['certification'];
    // if (json['recommended_recipes'] != null) {
    //   recommendedRecipes = <Null>[];
    //   json['recommended_recipes'].forEach((v) {
    //     recommendedRecipes!.add(Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['id_str'] = idStr;
    data['name'] = name;
    data['catch_copy'] = catchCopy;
    data['image_url'] = imageUrl;
    data['profile'] = profile;
    data['career'] = career;
    data['certification'] = certification;
    // if (recommendedRecipes != null) {
    //   data['recommended_recipes'] =
    //       recommendedRecipes!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class Articles {
  int? id;
  // Null? advertiserId;
  String? title;
  String? description;
  // Null? thumbnail;
  String? imageUrl;
  bool? hasIndexes;
  String? openedAt;
  String? revisedAt;
  // Null? indexes;
  // Null? contents;
  bool? displayMetadata;

  Articles(
      {this.id,
      // this.advertiserId,
      this.title,
      this.description,
      // this.thumbnail,
      this.imageUrl,
      this.hasIndexes,
      this.openedAt,
      this.revisedAt,
      // this.indexes,
      // this.contents,
      this.displayMetadata});

  Articles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    // advertiserId = json['advertiser_id'];
    title = json['title'];
    description = json['description'];
    // thumbnail = json['thumbnail'];
    imageUrl = json['image_url'];
    hasIndexes = json['has_indexes'];
    openedAt = json['opened_at'];
    revisedAt = json['revised_at'];
    // indexes = json['indexes'];
    // contents = json['contents'];
    displayMetadata = json['display_metadata'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    // data['advertiser_id'] = advertiserId;
    data['title'] = title;
    data['description'] = description;
    // data['thumbnail'] = thumbnail;
    data['image_url'] = imageUrl;
    data['has_indexes'] = hasIndexes;
    data['opened_at'] = openedAt;
    data['revised_at'] = revisedAt;
    // data['indexes'] = indexes;
    // data['contents'] = contents;
    data['display_metadata'] = displayMetadata;
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
  int? id;
  String? name;
  List<RecipeIngredients>? recipeIngredients;

  IngredientGroups({this.id, this.name, this.recipeIngredients});

  IngredientGroups.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['recipe_ingredients'] != null) {
      recipeIngredients = <RecipeIngredients>[];
      json['recipe_ingredients'].forEach((v) {
        recipeIngredients!.add(RecipeIngredients.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (recipeIngredients != null) {
      data['recipe_ingredients'] =
          recipeIngredients!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RecipeIngredients {
  int? ingredientId;
  String? name;
  String? servings1;

  RecipeIngredients({this.ingredientId, this.name, this.servings1});

  RecipeIngredients.fromJson(Map<String, dynamic> json) {
    ingredientId = json['ingredient_id'];
    name = json['name'];
    servings1 = json['servings1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ingredient_id'] = ingredientId;
    data['name'] = name;
    data['servings1'] = servings1;
    return data;
  }
}

class RecipeTags {
  String? recipeId;
  String? recipeIdStr;
  int? tagId;
  String? tagName;

  RecipeTags({this.recipeId, this.recipeIdStr, this.tagId, this.tagName});

  RecipeTags.fromJson(Map<String, dynamic> json) {
    recipeId = json['recipe_id'];
    recipeIdStr = json['recipe_id_str'];
    tagId = json['tag_id'];
    tagName = json['tag_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['recipe_id'] = recipeId;
    data['recipe_id_str'] = recipeIdStr;
    data['tag_id'] = tagId;
    data['tag_name'] = tagName;
    return data;
  }
}

class RecipeServings {
  String? recipeId;
  String? recipeIdStr;
  int? servings;
  String? name;

  RecipeServings({this.recipeId, this.recipeIdStr, this.servings, this.name});

  RecipeServings.fromJson(Map<String, dynamic> json) {
    recipeId = json['recipe_id'];
    recipeIdStr = json['recipe_id_str'];
    servings = json['servings'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['recipe_id'] = recipeId;
    data['recipe_id_str'] = recipeIdStr;
    data['servings'] = servings;
    data['name'] = name;
    return data;
  }
}

class RecipeSteps {
  String? recipeId;
  String? recipeIdStr;
  int? step;
  String? description;
  String? point;
  SquareVideo? squareVideo;

  RecipeSteps(
      {this.recipeId,
      this.recipeIdStr,
      this.step,
      this.description,
      this.point,
      this.squareVideo});

  RecipeSteps.fromJson(Map<String, dynamic> json) {
    recipeId = json['recipe_id'];
    recipeIdStr = json['recipe_id_str'];
    step = json['step'];
    description = json['description'];
    point = json['point'];
    squareVideo = json['square_video'] != null
        ? SquareVideo.fromJson(json['square_video'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['recipe_id'] = recipeId;
    data['recipe_id_str'] = recipeIdStr;
    data['step'] = step;
    data['description'] = description;
    data['point'] = point;
    if (squareVideo != null) {
      data['square_video'] = squareVideo!.toJson();
    }
    return data;
  }
}

// class SquareVideo {
//   String? url;
//   String? posterUrl;

//   SquareVideo({this.url, this.posterUrl});

//   SquareVideo.fromJson(Map<String, dynamic> json) {
//     url = json['url'];
//     posterUrl = json['poster_url'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['url'] = this.url;
//     data['poster_url'] = this.posterUrl;
//     return data;
//   }
// }

class Nutrient {
  String? recipeId;
  String? recipeIdStr;
  List<Items>? items;

  Nutrient({this.recipeId, this.recipeIdStr, this.items});

  Nutrient.fromJson(Map<String, dynamic> json) {
    recipeId = json['recipe_id'];
    recipeIdStr = json['recipe_id_str'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['recipe_id'] = recipeId;
    data['recipe_id_str'] = recipeIdStr;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? name;
  String? displayName;
  String? iconType;
  String? amount;
  bool? isLocked;

  Items(
      {this.name, this.displayName, this.iconType, this.amount, this.isLocked});

  Items.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    displayName = json['display_name'];
    iconType = json['icon_type'];
    amount = json['amount'];
    isLocked = json['is_locked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['display_name'] = displayName;
    data['icon_type'] = iconType;
    data['amount'] = amount;
    data['is_locked'] = isLocked;
    return data;
  }
}
