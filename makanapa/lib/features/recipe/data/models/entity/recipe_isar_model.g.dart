// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_isar_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRecipeEntityCollection on Isar {
  IsarCollection<RecipeEntity> get recipeEntitys => this.collection();
}

const RecipeEntitySchema = CollectionSchema(
  name: r'RecipeEntity',
  id: -2687920056723579852,
  properties: {
    r'classType': PropertySchema(
      id: 0,
      name: r'classType',
      type: IsarType.string,
    ),
    r'dataId': PropertySchema(id: 1, name: r'dataId', type: IsarType.long),
    r'dishType': PropertySchema(
      id: 2,
      name: r'dishType',
      type: IsarType.string,
    ),
    r'enName': PropertySchema(id: 3, name: r'enName', type: IsarType.string),
    r'name': PropertySchema(id: 4, name: r'name', type: IsarType.string),
    r'picture': PropertySchema(id: 5, name: r'picture', type: IsarType.string),
  },

  estimateSize: _recipeEntityEstimateSize,
  serialize: _recipeEntitySerialize,
  deserialize: _recipeEntityDeserialize,
  deserializeProp: _recipeEntityDeserializeProp,
  idName: r'id',
  indexes: {
    r'dataId': IndexSchema(
      id: -3108753711740298699,
      name: r'dataId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'dataId',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _recipeEntityGetId,
  getLinks: _recipeEntityGetLinks,
  attach: _recipeEntityAttach,
  version: '3.3.0',
);

int _recipeEntityEstimateSize(
  RecipeEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.classType.length * 3;
  bytesCount += 3 + object.dishType.length * 3;
  bytesCount += 3 + object.enName.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.picture.length * 3;
  return bytesCount;
}

void _recipeEntitySerialize(
  RecipeEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.classType);
  writer.writeLong(offsets[1], object.dataId);
  writer.writeString(offsets[2], object.dishType);
  writer.writeString(offsets[3], object.enName);
  writer.writeString(offsets[4], object.name);
  writer.writeString(offsets[5], object.picture);
}

RecipeEntity _recipeEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RecipeEntity();
  object.classType = reader.readString(offsets[0]);
  object.dataId = reader.readLong(offsets[1]);
  object.dishType = reader.readString(offsets[2]);
  object.enName = reader.readString(offsets[3]);
  object.id = id;
  object.name = reader.readString(offsets[4]);
  object.picture = reader.readString(offsets[5]);
  return object;
}

P _recipeEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _recipeEntityGetId(RecipeEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _recipeEntityGetLinks(RecipeEntity object) {
  return [];
}

void _recipeEntityAttach(
  IsarCollection<dynamic> col,
  Id id,
  RecipeEntity object,
) {
  object.id = id;
}

extension RecipeEntityByIndex on IsarCollection<RecipeEntity> {
  Future<RecipeEntity?> getByDataId(int dataId) {
    return getByIndex(r'dataId', [dataId]);
  }

  RecipeEntity? getByDataIdSync(int dataId) {
    return getByIndexSync(r'dataId', [dataId]);
  }

  Future<bool> deleteByDataId(int dataId) {
    return deleteByIndex(r'dataId', [dataId]);
  }

  bool deleteByDataIdSync(int dataId) {
    return deleteByIndexSync(r'dataId', [dataId]);
  }

  Future<List<RecipeEntity?>> getAllByDataId(List<int> dataIdValues) {
    final values = dataIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'dataId', values);
  }

  List<RecipeEntity?> getAllByDataIdSync(List<int> dataIdValues) {
    final values = dataIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'dataId', values);
  }

  Future<int> deleteAllByDataId(List<int> dataIdValues) {
    final values = dataIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'dataId', values);
  }

  int deleteAllByDataIdSync(List<int> dataIdValues) {
    final values = dataIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'dataId', values);
  }

  Future<Id> putByDataId(RecipeEntity object) {
    return putByIndex(r'dataId', object);
  }

  Id putByDataIdSync(RecipeEntity object, {bool saveLinks = true}) {
    return putByIndexSync(r'dataId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByDataId(List<RecipeEntity> objects) {
    return putAllByIndex(r'dataId', objects);
  }

  List<Id> putAllByDataIdSync(
    List<RecipeEntity> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'dataId', objects, saveLinks: saveLinks);
  }
}

extension RecipeEntityQueryWhereSort
    on QueryBuilder<RecipeEntity, RecipeEntity, QWhere> {
  QueryBuilder<RecipeEntity, RecipeEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterWhere> anyDataId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'dataId'),
      );
    });
  }
}

extension RecipeEntityQueryWhere
    on QueryBuilder<RecipeEntity, RecipeEntity, QWhereClause> {
  QueryBuilder<RecipeEntity, RecipeEntity, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterWhereClause> idNotEqualTo(
    Id id,
  ) {
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

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterWhereClause> idBetween(
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

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterWhereClause> dataIdEqualTo(
    int dataId,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'dataId', value: [dataId]),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterWhereClause> dataIdNotEqualTo(
    int dataId,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'dataId',
                lower: [],
                upper: [dataId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'dataId',
                lower: [dataId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'dataId',
                lower: [dataId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'dataId',
                lower: [],
                upper: [dataId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterWhereClause> dataIdGreaterThan(
    int dataId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'dataId',
          lower: [dataId],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterWhereClause> dataIdLessThan(
    int dataId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'dataId',
          lower: [],
          upper: [dataId],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterWhereClause> dataIdBetween(
    int lowerDataId,
    int upperDataId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'dataId',
          lower: [lowerDataId],
          includeLower: includeLower,
          upper: [upperDataId],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension RecipeEntityQueryFilter
    on QueryBuilder<RecipeEntity, RecipeEntity, QFilterCondition> {
  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
  classTypeEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'classType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
  classTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'classType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
  classTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'classType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
  classTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'classType',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
  classTypeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'classType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
  classTypeEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'classType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
  classTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'classType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
  classTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'classType',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
  classTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'classType', value: ''),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
  classTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'classType', value: ''),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition> dataIdEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'dataId', value: value),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
  dataIdGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'dataId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
  dataIdLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'dataId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition> dataIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'dataId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
  dishTypeEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'dishType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
  dishTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'dishType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
  dishTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'dishType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
  dishTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'dishType',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
  dishTypeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'dishType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
  dishTypeEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'dishType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
  dishTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'dishType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
  dishTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'dishType',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
  dishTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'dishType', value: ''),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
  dishTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'dishType', value: ''),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition> enNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'enName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
  enNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'enName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
  enNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'enName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition> enNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'enName',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
  enNameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'enName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
  enNameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'enName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
  enNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'enName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition> enNameMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'enName',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
  enNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'enName', value: ''),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
  enNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'enName', value: ''),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
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

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
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

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition> idBetween(
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

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
  nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'name',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
  nameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition> nameContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition> nameMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'name',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
  nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
  nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
  pictureEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'picture',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
  pictureGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'picture',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
  pictureLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'picture',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
  pictureBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'picture',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
  pictureStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'picture',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
  pictureEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'picture',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
  pictureContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'picture',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
  pictureMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'picture',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
  pictureIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'picture', value: ''),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
  pictureIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'picture', value: ''),
      );
    });
  }
}

extension RecipeEntityQueryObject
    on QueryBuilder<RecipeEntity, RecipeEntity, QFilterCondition> {}

extension RecipeEntityQueryLinks
    on QueryBuilder<RecipeEntity, RecipeEntity, QFilterCondition> {}

extension RecipeEntityQuerySortBy
    on QueryBuilder<RecipeEntity, RecipeEntity, QSortBy> {
  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> sortByClassType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classType', Sort.asc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> sortByClassTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classType', Sort.desc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> sortByDataId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataId', Sort.asc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> sortByDataIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataId', Sort.desc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> sortByDishType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dishType', Sort.asc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> sortByDishTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dishType', Sort.desc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> sortByEnName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enName', Sort.asc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> sortByEnNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enName', Sort.desc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> sortByPicture() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'picture', Sort.asc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> sortByPictureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'picture', Sort.desc);
    });
  }
}

extension RecipeEntityQuerySortThenBy
    on QueryBuilder<RecipeEntity, RecipeEntity, QSortThenBy> {
  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> thenByClassType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classType', Sort.asc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> thenByClassTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classType', Sort.desc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> thenByDataId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataId', Sort.asc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> thenByDataIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataId', Sort.desc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> thenByDishType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dishType', Sort.asc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> thenByDishTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dishType', Sort.desc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> thenByEnName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enName', Sort.asc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> thenByEnNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enName', Sort.desc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> thenByPicture() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'picture', Sort.asc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> thenByPictureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'picture', Sort.desc);
    });
  }
}

extension RecipeEntityQueryWhereDistinct
    on QueryBuilder<RecipeEntity, RecipeEntity, QDistinct> {
  QueryBuilder<RecipeEntity, RecipeEntity, QDistinct> distinctByClassType({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'classType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QDistinct> distinctByDataId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dataId');
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QDistinct> distinctByDishType({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dishType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QDistinct> distinctByEnName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QDistinct> distinctByName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QDistinct> distinctByPicture({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'picture', caseSensitive: caseSensitive);
    });
  }
}

extension RecipeEntityQueryProperty
    on QueryBuilder<RecipeEntity, RecipeEntity, QQueryProperty> {
  QueryBuilder<RecipeEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RecipeEntity, String, QQueryOperations> classTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'classType');
    });
  }

  QueryBuilder<RecipeEntity, int, QQueryOperations> dataIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dataId');
    });
  }

  QueryBuilder<RecipeEntity, String, QQueryOperations> dishTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dishType');
    });
  }

  QueryBuilder<RecipeEntity, String, QQueryOperations> enNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enName');
    });
  }

  QueryBuilder<RecipeEntity, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<RecipeEntity, String, QQueryOperations> pictureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'picture');
    });
  }
}
