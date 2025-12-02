// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_detail_isar_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRecipeDetailEntityCollection on Isar {
  IsarCollection<RecipeDetailEntity> get recipeDetailEntitys =>
      this.collection();
}

const RecipeDetailEntitySchema = CollectionSchema(
  name: r'RecipeDetailEntity',
  id: 4630281281172531967,
  properties: {
    r'ingredients': PropertySchema(
      id: 0,
      name: r'ingredients',
      type: IsarType.objectList,

      target: r'IngredientsEmbedModel',
    ),
    r'recipe': PropertySchema(
      id: 1,
      name: r'recipe',
      type: IsarType.object,

      target: r'RecipeEmbedModel',
    ),
    r'recipeId': PropertySchema(id: 2, name: r'recipeId', type: IsarType.long),
  },

  estimateSize: _recipeDetailEntityEstimateSize,
  serialize: _recipeDetailEntitySerialize,
  deserialize: _recipeDetailEntityDeserialize,
  deserializeProp: _recipeDetailEntityDeserializeProp,
  idName: r'id',
  indexes: {
    r'recipeId': IndexSchema(
      id: 7223263824597846537,
      name: r'recipeId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'recipeId',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {
    r'IngredientsEmbedModel': IngredientsEmbedModelSchema,
    r'RecipeEmbedModel': RecipeEmbedModelSchema,
  },

  getId: _recipeDetailEntityGetId,
  getLinks: _recipeDetailEntityGetLinks,
  attach: _recipeDetailEntityAttach,
  version: '3.3.0',
);

int _recipeDetailEntityEstimateSize(
  RecipeDetailEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.ingredients.length * 3;
  {
    final offsets = allOffsets[IngredientsEmbedModel]!;
    for (var i = 0; i < object.ingredients.length; i++) {
      final value = object.ingredients[i];
      bytesCount += IngredientsEmbedModelSchema.estimateSize(
        value,
        offsets,
        allOffsets,
      );
    }
  }
  bytesCount +=
      3 +
      RecipeEmbedModelSchema.estimateSize(
        object.recipe,
        allOffsets[RecipeEmbedModel]!,
        allOffsets,
      );
  return bytesCount;
}

void _recipeDetailEntitySerialize(
  RecipeDetailEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<IngredientsEmbedModel>(
    offsets[0],
    allOffsets,
    IngredientsEmbedModelSchema.serialize,
    object.ingredients,
  );
  writer.writeObject<RecipeEmbedModel>(
    offsets[1],
    allOffsets,
    RecipeEmbedModelSchema.serialize,
    object.recipe,
  );
  writer.writeLong(offsets[2], object.recipeId);
}

RecipeDetailEntity _recipeDetailEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RecipeDetailEntity();
  object.id = id;
  object.ingredients =
      reader.readObjectList<IngredientsEmbedModel>(
        offsets[0],
        IngredientsEmbedModelSchema.deserialize,
        allOffsets,
        IngredientsEmbedModel(),
      ) ??
      [];
  object.recipe =
      reader.readObjectOrNull<RecipeEmbedModel>(
        offsets[1],
        RecipeEmbedModelSchema.deserialize,
        allOffsets,
      ) ??
      RecipeEmbedModel();
  object.recipeId = reader.readLong(offsets[2]);
  return object;
}

P _recipeDetailEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<IngredientsEmbedModel>(
                offset,
                IngredientsEmbedModelSchema.deserialize,
                allOffsets,
                IngredientsEmbedModel(),
              ) ??
              [])
          as P;
    case 1:
      return (reader.readObjectOrNull<RecipeEmbedModel>(
                offset,
                RecipeEmbedModelSchema.deserialize,
                allOffsets,
              ) ??
              RecipeEmbedModel())
          as P;
    case 2:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _recipeDetailEntityGetId(RecipeDetailEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _recipeDetailEntityGetLinks(
  RecipeDetailEntity object,
) {
  return [];
}

void _recipeDetailEntityAttach(
  IsarCollection<dynamic> col,
  Id id,
  RecipeDetailEntity object,
) {
  object.id = id;
}

extension RecipeDetailEntityByIndex on IsarCollection<RecipeDetailEntity> {
  Future<RecipeDetailEntity?> getByRecipeId(int recipeId) {
    return getByIndex(r'recipeId', [recipeId]);
  }

  RecipeDetailEntity? getByRecipeIdSync(int recipeId) {
    return getByIndexSync(r'recipeId', [recipeId]);
  }

  Future<bool> deleteByRecipeId(int recipeId) {
    return deleteByIndex(r'recipeId', [recipeId]);
  }

  bool deleteByRecipeIdSync(int recipeId) {
    return deleteByIndexSync(r'recipeId', [recipeId]);
  }

  Future<List<RecipeDetailEntity?>> getAllByRecipeId(List<int> recipeIdValues) {
    final values = recipeIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'recipeId', values);
  }

  List<RecipeDetailEntity?> getAllByRecipeIdSync(List<int> recipeIdValues) {
    final values = recipeIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'recipeId', values);
  }

  Future<int> deleteAllByRecipeId(List<int> recipeIdValues) {
    final values = recipeIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'recipeId', values);
  }

  int deleteAllByRecipeIdSync(List<int> recipeIdValues) {
    final values = recipeIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'recipeId', values);
  }

  Future<Id> putByRecipeId(RecipeDetailEntity object) {
    return putByIndex(r'recipeId', object);
  }

  Id putByRecipeIdSync(RecipeDetailEntity object, {bool saveLinks = true}) {
    return putByIndexSync(r'recipeId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByRecipeId(List<RecipeDetailEntity> objects) {
    return putAllByIndex(r'recipeId', objects);
  }

  List<Id> putAllByRecipeIdSync(
    List<RecipeDetailEntity> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'recipeId', objects, saveLinks: saveLinks);
  }
}

extension RecipeDetailEntityQueryWhereSort
    on QueryBuilder<RecipeDetailEntity, RecipeDetailEntity, QWhere> {
  QueryBuilder<RecipeDetailEntity, RecipeDetailEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<RecipeDetailEntity, RecipeDetailEntity, QAfterWhere>
  anyRecipeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'recipeId'),
      );
    });
  }
}

extension RecipeDetailEntityQueryWhere
    on QueryBuilder<RecipeDetailEntity, RecipeDetailEntity, QWhereClause> {
  QueryBuilder<RecipeDetailEntity, RecipeDetailEntity, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<RecipeDetailEntity, RecipeDetailEntity, QAfterWhereClause>
  idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<RecipeDetailEntity, RecipeDetailEntity, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RecipeDetailEntity, RecipeDetailEntity, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RecipeDetailEntity, RecipeDetailEntity, QAfterWhereClause>
  idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<RecipeDetailEntity, RecipeDetailEntity, QAfterWhereClause>
  recipeIdEqualTo(int recipeId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'recipeId', value: [recipeId]),
      );
    });
  }

  QueryBuilder<RecipeDetailEntity, RecipeDetailEntity, QAfterWhereClause>
  recipeIdNotEqualTo(int recipeId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'recipeId',
                lower: [],
                upper: [recipeId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'recipeId',
                lower: [recipeId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'recipeId',
                lower: [recipeId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'recipeId',
                lower: [],
                upper: [recipeId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<RecipeDetailEntity, RecipeDetailEntity, QAfterWhereClause>
  recipeIdGreaterThan(int recipeId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'recipeId',
          lower: [recipeId],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<RecipeDetailEntity, RecipeDetailEntity, QAfterWhereClause>
  recipeIdLessThan(int recipeId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'recipeId',
          lower: [],
          upper: [recipeId],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<RecipeDetailEntity, RecipeDetailEntity, QAfterWhereClause>
  recipeIdBetween(
    int lowerRecipeId,
    int upperRecipeId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'recipeId',
          lower: [lowerRecipeId],
          includeLower: includeLower,
          upper: [upperRecipeId],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension RecipeDetailEntityQueryFilter
    on QueryBuilder<RecipeDetailEntity, RecipeDetailEntity, QFilterCondition> {
  QueryBuilder<RecipeDetailEntity, RecipeDetailEntity, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<RecipeDetailEntity, RecipeDetailEntity, QAfterFilterCondition>
  idGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RecipeDetailEntity, RecipeDetailEntity, QAfterFilterCondition>
  idLessThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RecipeDetailEntity, RecipeDetailEntity, QAfterFilterCondition>
  idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<RecipeDetailEntity, RecipeDetailEntity, QAfterFilterCondition>
  ingredientsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'ingredients', length, true, length, true);
    });
  }

  QueryBuilder<RecipeDetailEntity, RecipeDetailEntity, QAfterFilterCondition>
  ingredientsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'ingredients', 0, true, 0, true);
    });
  }

  QueryBuilder<RecipeDetailEntity, RecipeDetailEntity, QAfterFilterCondition>
  ingredientsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'ingredients', 0, false, 999999, true);
    });
  }

  QueryBuilder<RecipeDetailEntity, RecipeDetailEntity, QAfterFilterCondition>
  ingredientsLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'ingredients', 0, true, length, include);
    });
  }

  QueryBuilder<RecipeDetailEntity, RecipeDetailEntity, QAfterFilterCondition>
  ingredientsLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'ingredients', length, include, 999999, true);
    });
  }

  QueryBuilder<RecipeDetailEntity, RecipeDetailEntity, QAfterFilterCondition>
  ingredientsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ingredients',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<RecipeDetailEntity, RecipeDetailEntity, QAfterFilterCondition>
  recipeIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'recipeId', value: value),
      );
    });
  }

  QueryBuilder<RecipeDetailEntity, RecipeDetailEntity, QAfterFilterCondition>
  recipeIdGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'recipeId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RecipeDetailEntity, RecipeDetailEntity, QAfterFilterCondition>
  recipeIdLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'recipeId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RecipeDetailEntity, RecipeDetailEntity, QAfterFilterCondition>
  recipeIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'recipeId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension RecipeDetailEntityQueryObject
    on QueryBuilder<RecipeDetailEntity, RecipeDetailEntity, QFilterCondition> {
  QueryBuilder<RecipeDetailEntity, RecipeDetailEntity, QAfterFilterCondition>
  ingredientsElement(FilterQuery<IngredientsEmbedModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'ingredients');
    });
  }

  QueryBuilder<RecipeDetailEntity, RecipeDetailEntity, QAfterFilterCondition>
  recipe(FilterQuery<RecipeEmbedModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'recipe');
    });
  }
}

extension RecipeDetailEntityQueryLinks
    on QueryBuilder<RecipeDetailEntity, RecipeDetailEntity, QFilterCondition> {}

extension RecipeDetailEntityQuerySortBy
    on QueryBuilder<RecipeDetailEntity, RecipeDetailEntity, QSortBy> {
  QueryBuilder<RecipeDetailEntity, RecipeDetailEntity, QAfterSortBy>
  sortByRecipeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recipeId', Sort.asc);
    });
  }

  QueryBuilder<RecipeDetailEntity, RecipeDetailEntity, QAfterSortBy>
  sortByRecipeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recipeId', Sort.desc);
    });
  }
}

extension RecipeDetailEntityQuerySortThenBy
    on QueryBuilder<RecipeDetailEntity, RecipeDetailEntity, QSortThenBy> {
  QueryBuilder<RecipeDetailEntity, RecipeDetailEntity, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RecipeDetailEntity, RecipeDetailEntity, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RecipeDetailEntity, RecipeDetailEntity, QAfterSortBy>
  thenByRecipeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recipeId', Sort.asc);
    });
  }

  QueryBuilder<RecipeDetailEntity, RecipeDetailEntity, QAfterSortBy>
  thenByRecipeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recipeId', Sort.desc);
    });
  }
}

extension RecipeDetailEntityQueryWhereDistinct
    on QueryBuilder<RecipeDetailEntity, RecipeDetailEntity, QDistinct> {
  QueryBuilder<RecipeDetailEntity, RecipeDetailEntity, QDistinct>
  distinctByRecipeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recipeId');
    });
  }
}

extension RecipeDetailEntityQueryProperty
    on QueryBuilder<RecipeDetailEntity, RecipeDetailEntity, QQueryProperty> {
  QueryBuilder<RecipeDetailEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<
    RecipeDetailEntity,
    List<IngredientsEmbedModel>,
    QQueryOperations
  >
  ingredientsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ingredients');
    });
  }

  QueryBuilder<RecipeDetailEntity, RecipeEmbedModel, QQueryOperations>
  recipeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recipe');
    });
  }

  QueryBuilder<RecipeDetailEntity, int, QQueryOperations> recipeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recipeId');
    });
  }
}
