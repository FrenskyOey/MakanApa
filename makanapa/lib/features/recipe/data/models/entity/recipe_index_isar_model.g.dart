// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_index_isar_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRecipeIndexEntityCollection on Isar {
  IsarCollection<RecipeIndexEntity> get recipeIndexEntitys => this.collection();
}

const RecipeIndexEntitySchema = CollectionSchema(
  name: r'RecipeIndexEntity',
  id: -2250549704573701178,
  properties: {
    r'dataCounter': PropertySchema(
      id: 0,
      name: r'dataCounter',
      type: IsarType.long,
    ),
    r'filterKey': PropertySchema(
      id: 1,
      name: r'filterKey',
      type: IsarType.string,
    ),
    r'nextCursor': PropertySchema(
      id: 2,
      name: r'nextCursor',
      type: IsarType.long,
    ),
    r'pageIndex': PropertySchema(
      id: 3,
      name: r'pageIndex',
      type: IsarType.long,
    ),
    r'recipeIds': PropertySchema(
      id: 4,
      name: r'recipeIds',
      type: IsarType.longList,
    ),
    r'timestamp': PropertySchema(
      id: 5,
      name: r'timestamp',
      type: IsarType.dateTime,
    ),
  },

  estimateSize: _recipeIndexEntityEstimateSize,
  serialize: _recipeIndexEntitySerialize,
  deserialize: _recipeIndexEntityDeserialize,
  deserializeProp: _recipeIndexEntityDeserializeProp,
  idName: r'id',
  indexes: {
    r'filterKey': IndexSchema(
      id: -6513534407312558196,
      name: r'filterKey',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'filterKey',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _recipeIndexEntityGetId,
  getLinks: _recipeIndexEntityGetLinks,
  attach: _recipeIndexEntityAttach,
  version: '3.3.0',
);

int _recipeIndexEntityEstimateSize(
  RecipeIndexEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.filterKey.length * 3;
  bytesCount += 3 + object.recipeIds.length * 8;
  return bytesCount;
}

void _recipeIndexEntitySerialize(
  RecipeIndexEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.dataCounter);
  writer.writeString(offsets[1], object.filterKey);
  writer.writeLong(offsets[2], object.nextCursor);
  writer.writeLong(offsets[3], object.pageIndex);
  writer.writeLongList(offsets[4], object.recipeIds);
  writer.writeDateTime(offsets[5], object.timestamp);
}

RecipeIndexEntity _recipeIndexEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RecipeIndexEntity();
  object.dataCounter = reader.readLongOrNull(offsets[0]);
  object.filterKey = reader.readString(offsets[1]);
  object.id = id;
  object.nextCursor = reader.readLongOrNull(offsets[2]);
  object.pageIndex = reader.readLong(offsets[3]);
  object.recipeIds = reader.readLongList(offsets[4]) ?? [];
  object.timestamp = reader.readDateTime(offsets[5]);
  return object;
}

P _recipeIndexEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLongList(offset) ?? []) as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _recipeIndexEntityGetId(RecipeIndexEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _recipeIndexEntityGetLinks(
  RecipeIndexEntity object,
) {
  return [];
}

void _recipeIndexEntityAttach(
  IsarCollection<dynamic> col,
  Id id,
  RecipeIndexEntity object,
) {
  object.id = id;
}

extension RecipeIndexEntityByIndex on IsarCollection<RecipeIndexEntity> {
  Future<RecipeIndexEntity?> getByFilterKey(String filterKey) {
    return getByIndex(r'filterKey', [filterKey]);
  }

  RecipeIndexEntity? getByFilterKeySync(String filterKey) {
    return getByIndexSync(r'filterKey', [filterKey]);
  }

  Future<bool> deleteByFilterKey(String filterKey) {
    return deleteByIndex(r'filterKey', [filterKey]);
  }

  bool deleteByFilterKeySync(String filterKey) {
    return deleteByIndexSync(r'filterKey', [filterKey]);
  }

  Future<List<RecipeIndexEntity?>> getAllByFilterKey(
    List<String> filterKeyValues,
  ) {
    final values = filterKeyValues.map((e) => [e]).toList();
    return getAllByIndex(r'filterKey', values);
  }

  List<RecipeIndexEntity?> getAllByFilterKeySync(List<String> filterKeyValues) {
    final values = filterKeyValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'filterKey', values);
  }

  Future<int> deleteAllByFilterKey(List<String> filterKeyValues) {
    final values = filterKeyValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'filterKey', values);
  }

  int deleteAllByFilterKeySync(List<String> filterKeyValues) {
    final values = filterKeyValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'filterKey', values);
  }

  Future<Id> putByFilterKey(RecipeIndexEntity object) {
    return putByIndex(r'filterKey', object);
  }

  Id putByFilterKeySync(RecipeIndexEntity object, {bool saveLinks = true}) {
    return putByIndexSync(r'filterKey', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByFilterKey(List<RecipeIndexEntity> objects) {
    return putAllByIndex(r'filterKey', objects);
  }

  List<Id> putAllByFilterKeySync(
    List<RecipeIndexEntity> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'filterKey', objects, saveLinks: saveLinks);
  }
}

extension RecipeIndexEntityQueryWhereSort
    on QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QWhere> {
  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RecipeIndexEntityQueryWhere
    on QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QWhereClause> {
  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterWhereClause>
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

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterWhereClause>
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

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterWhereClause>
  filterKeyEqualTo(String filterKey) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'filterKey', value: [filterKey]),
      );
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterWhereClause>
  filterKeyNotEqualTo(String filterKey) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'filterKey',
                lower: [],
                upper: [filterKey],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'filterKey',
                lower: [filterKey],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'filterKey',
                lower: [filterKey],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'filterKey',
                lower: [],
                upper: [filterKey],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension RecipeIndexEntityQueryFilter
    on QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QFilterCondition> {
  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterFilterCondition>
  dataCounterIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'dataCounter'),
      );
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterFilterCondition>
  dataCounterIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'dataCounter'),
      );
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterFilterCondition>
  dataCounterEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'dataCounter', value: value),
      );
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterFilterCondition>
  dataCounterGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'dataCounter',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterFilterCondition>
  dataCounterLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'dataCounter',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterFilterCondition>
  dataCounterBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'dataCounter',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterFilterCondition>
  filterKeyEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'filterKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterFilterCondition>
  filterKeyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'filterKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterFilterCondition>
  filterKeyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'filterKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterFilterCondition>
  filterKeyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'filterKey',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterFilterCondition>
  filterKeyStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'filterKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterFilterCondition>
  filterKeyEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'filterKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterFilterCondition>
  filterKeyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'filterKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterFilterCondition>
  filterKeyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'filterKey',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterFilterCondition>
  filterKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'filterKey', value: ''),
      );
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterFilterCondition>
  filterKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'filterKey', value: ''),
      );
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterFilterCondition>
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

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterFilterCondition>
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

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterFilterCondition>
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

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterFilterCondition>
  nextCursorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'nextCursor'),
      );
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterFilterCondition>
  nextCursorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'nextCursor'),
      );
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterFilterCondition>
  nextCursorEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'nextCursor', value: value),
      );
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterFilterCondition>
  nextCursorGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'nextCursor',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterFilterCondition>
  nextCursorLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'nextCursor',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterFilterCondition>
  nextCursorBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'nextCursor',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterFilterCondition>
  pageIndexEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'pageIndex', value: value),
      );
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterFilterCondition>
  pageIndexGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'pageIndex',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterFilterCondition>
  pageIndexLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'pageIndex',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterFilterCondition>
  pageIndexBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'pageIndex',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterFilterCondition>
  recipeIdsElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'recipeIds', value: value),
      );
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterFilterCondition>
  recipeIdsElementGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'recipeIds',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterFilterCondition>
  recipeIdsElementLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'recipeIds',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterFilterCondition>
  recipeIdsElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'recipeIds',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterFilterCondition>
  recipeIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'recipeIds', length, true, length, true);
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterFilterCondition>
  recipeIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'recipeIds', 0, true, 0, true);
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterFilterCondition>
  recipeIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'recipeIds', 0, false, 999999, true);
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterFilterCondition>
  recipeIdsLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'recipeIds', 0, true, length, include);
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterFilterCondition>
  recipeIdsLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'recipeIds', length, include, 999999, true);
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterFilterCondition>
  recipeIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'recipeIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterFilterCondition>
  timestampEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'timestamp', value: value),
      );
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterFilterCondition>
  timestampGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'timestamp',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterFilterCondition>
  timestampLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'timestamp',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterFilterCondition>
  timestampBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'timestamp',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension RecipeIndexEntityQueryObject
    on QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QFilterCondition> {}

extension RecipeIndexEntityQueryLinks
    on QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QFilterCondition> {}

extension RecipeIndexEntityQuerySortBy
    on QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QSortBy> {
  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterSortBy>
  sortByDataCounter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataCounter', Sort.asc);
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterSortBy>
  sortByDataCounterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataCounter', Sort.desc);
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterSortBy>
  sortByFilterKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filterKey', Sort.asc);
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterSortBy>
  sortByFilterKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filterKey', Sort.desc);
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterSortBy>
  sortByNextCursor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextCursor', Sort.asc);
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterSortBy>
  sortByNextCursorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextCursor', Sort.desc);
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterSortBy>
  sortByPageIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pageIndex', Sort.asc);
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterSortBy>
  sortByPageIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pageIndex', Sort.desc);
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterSortBy>
  sortByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterSortBy>
  sortByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }
}

extension RecipeIndexEntityQuerySortThenBy
    on QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QSortThenBy> {
  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterSortBy>
  thenByDataCounter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataCounter', Sort.asc);
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterSortBy>
  thenByDataCounterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataCounter', Sort.desc);
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterSortBy>
  thenByFilterKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filterKey', Sort.asc);
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterSortBy>
  thenByFilterKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filterKey', Sort.desc);
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterSortBy>
  thenByNextCursor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextCursor', Sort.asc);
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterSortBy>
  thenByNextCursorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextCursor', Sort.desc);
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterSortBy>
  thenByPageIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pageIndex', Sort.asc);
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterSortBy>
  thenByPageIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pageIndex', Sort.desc);
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterSortBy>
  thenByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QAfterSortBy>
  thenByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }
}

extension RecipeIndexEntityQueryWhereDistinct
    on QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QDistinct> {
  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QDistinct>
  distinctByDataCounter() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dataCounter');
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QDistinct>
  distinctByFilterKey({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'filterKey', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QDistinct>
  distinctByNextCursor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nextCursor');
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QDistinct>
  distinctByPageIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pageIndex');
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QDistinct>
  distinctByRecipeIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recipeIds');
    });
  }

  QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QDistinct>
  distinctByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timestamp');
    });
  }
}

extension RecipeIndexEntityQueryProperty
    on QueryBuilder<RecipeIndexEntity, RecipeIndexEntity, QQueryProperty> {
  QueryBuilder<RecipeIndexEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RecipeIndexEntity, int?, QQueryOperations>
  dataCounterProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dataCounter');
    });
  }

  QueryBuilder<RecipeIndexEntity, String, QQueryOperations>
  filterKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'filterKey');
    });
  }

  QueryBuilder<RecipeIndexEntity, int?, QQueryOperations> nextCursorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nextCursor');
    });
  }

  QueryBuilder<RecipeIndexEntity, int, QQueryOperations> pageIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pageIndex');
    });
  }

  QueryBuilder<RecipeIndexEntity, List<int>, QQueryOperations>
  recipeIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recipeIds');
    });
  }

  QueryBuilder<RecipeIndexEntity, DateTime, QQueryOperations>
  timestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timestamp');
    });
  }
}
