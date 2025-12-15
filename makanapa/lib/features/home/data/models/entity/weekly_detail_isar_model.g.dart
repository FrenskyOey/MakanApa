// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weekly_detail_isar_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetWeeklyDetailEntityCollection on Isar {
  IsarCollection<WeeklyDetailEntity> get weeklyDetailEntitys =>
      this.collection();
}

const WeeklyDetailEntitySchema = CollectionSchema(
  name: r'WeeklyDetailEntity',
  id: -1069174269746213981,
  properties: {
    r'endDate': PropertySchema(
      id: 0,
      name: r'endDate',
      type: IsarType.dateTime,
    ),
    r'groupId': PropertySchema(id: 1, name: r'groupId', type: IsarType.long),
    r'meals': PropertySchema(
      id: 2,
      name: r'meals',
      type: IsarType.objectList,

      target: r'DailyMealEmbed',
    ),
    r'startDate': PropertySchema(
      id: 3,
      name: r'startDate',
      type: IsarType.dateTime,
    ),
  },

  estimateSize: _weeklyDetailEntityEstimateSize,
  serialize: _weeklyDetailEntitySerialize,
  deserialize: _weeklyDetailEntityDeserialize,
  deserializeProp: _weeklyDetailEntityDeserializeProp,
  idName: r'id',
  indexes: {
    r'groupId': IndexSchema(
      id: -8523216633229774932,
      name: r'groupId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'groupId',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {
    r'DailyMealEmbed': DailyMealEmbedSchema,
    r'RecipeEmbedModel': RecipeEmbedModelSchema,
  },

  getId: _weeklyDetailEntityGetId,
  getLinks: _weeklyDetailEntityGetLinks,
  attach: _weeklyDetailEntityAttach,
  version: '3.3.0',
);

int _weeklyDetailEntityEstimateSize(
  WeeklyDetailEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.meals.length * 3;
  {
    final offsets = allOffsets[DailyMealEmbed]!;
    for (var i = 0; i < object.meals.length; i++) {
      final value = object.meals[i];
      bytesCount += DailyMealEmbedSchema.estimateSize(
        value,
        offsets,
        allOffsets,
      );
    }
  }
  return bytesCount;
}

void _weeklyDetailEntitySerialize(
  WeeklyDetailEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.endDate);
  writer.writeLong(offsets[1], object.groupId);
  writer.writeObjectList<DailyMealEmbed>(
    offsets[2],
    allOffsets,
    DailyMealEmbedSchema.serialize,
    object.meals,
  );
  writer.writeDateTime(offsets[3], object.startDate);
}

WeeklyDetailEntity _weeklyDetailEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = WeeklyDetailEntity();
  object.endDate = reader.readDateTime(offsets[0]);
  object.groupId = reader.readLong(offsets[1]);
  object.id = id;
  object.meals =
      reader.readObjectList<DailyMealEmbed>(
        offsets[2],
        DailyMealEmbedSchema.deserialize,
        allOffsets,
        DailyMealEmbed(),
      ) ??
      [];
  object.startDate = reader.readDateTime(offsets[3]);
  return object;
}

P _weeklyDetailEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readObjectList<DailyMealEmbed>(
                offset,
                DailyMealEmbedSchema.deserialize,
                allOffsets,
                DailyMealEmbed(),
              ) ??
              [])
          as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _weeklyDetailEntityGetId(WeeklyDetailEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _weeklyDetailEntityGetLinks(
  WeeklyDetailEntity object,
) {
  return [];
}

void _weeklyDetailEntityAttach(
  IsarCollection<dynamic> col,
  Id id,
  WeeklyDetailEntity object,
) {
  object.id = id;
}

extension WeeklyDetailEntityByIndex on IsarCollection<WeeklyDetailEntity> {
  Future<WeeklyDetailEntity?> getByGroupId(int groupId) {
    return getByIndex(r'groupId', [groupId]);
  }

  WeeklyDetailEntity? getByGroupIdSync(int groupId) {
    return getByIndexSync(r'groupId', [groupId]);
  }

  Future<bool> deleteByGroupId(int groupId) {
    return deleteByIndex(r'groupId', [groupId]);
  }

  bool deleteByGroupIdSync(int groupId) {
    return deleteByIndexSync(r'groupId', [groupId]);
  }

  Future<List<WeeklyDetailEntity?>> getAllByGroupId(List<int> groupIdValues) {
    final values = groupIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'groupId', values);
  }

  List<WeeklyDetailEntity?> getAllByGroupIdSync(List<int> groupIdValues) {
    final values = groupIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'groupId', values);
  }

  Future<int> deleteAllByGroupId(List<int> groupIdValues) {
    final values = groupIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'groupId', values);
  }

  int deleteAllByGroupIdSync(List<int> groupIdValues) {
    final values = groupIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'groupId', values);
  }

  Future<Id> putByGroupId(WeeklyDetailEntity object) {
    return putByIndex(r'groupId', object);
  }

  Id putByGroupIdSync(WeeklyDetailEntity object, {bool saveLinks = true}) {
    return putByIndexSync(r'groupId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByGroupId(List<WeeklyDetailEntity> objects) {
    return putAllByIndex(r'groupId', objects);
  }

  List<Id> putAllByGroupIdSync(
    List<WeeklyDetailEntity> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'groupId', objects, saveLinks: saveLinks);
  }
}

extension WeeklyDetailEntityQueryWhereSort
    on QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QWhere> {
  QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QAfterWhere>
  anyGroupId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'groupId'),
      );
    });
  }
}

extension WeeklyDetailEntityQueryWhere
    on QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QWhereClause> {
  QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QAfterWhereClause>
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

  QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QAfterWhereClause>
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

  QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QAfterWhereClause>
  groupIdEqualTo(int groupId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'groupId', value: [groupId]),
      );
    });
  }

  QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QAfterWhereClause>
  groupIdNotEqualTo(int groupId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'groupId',
                lower: [],
                upper: [groupId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'groupId',
                lower: [groupId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'groupId',
                lower: [groupId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'groupId',
                lower: [],
                upper: [groupId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QAfterWhereClause>
  groupIdGreaterThan(int groupId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'groupId',
          lower: [groupId],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QAfterWhereClause>
  groupIdLessThan(int groupId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'groupId',
          lower: [],
          upper: [groupId],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QAfterWhereClause>
  groupIdBetween(
    int lowerGroupId,
    int upperGroupId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'groupId',
          lower: [lowerGroupId],
          includeLower: includeLower,
          upper: [upperGroupId],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension WeeklyDetailEntityQueryFilter
    on QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QFilterCondition> {
  QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QAfterFilterCondition>
  endDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'endDate', value: value),
      );
    });
  }

  QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QAfterFilterCondition>
  endDateGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'endDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QAfterFilterCondition>
  endDateLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'endDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QAfterFilterCondition>
  endDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'endDate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QAfterFilterCondition>
  groupIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'groupId', value: value),
      );
    });
  }

  QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QAfterFilterCondition>
  groupIdGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'groupId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QAfterFilterCondition>
  groupIdLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'groupId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QAfterFilterCondition>
  groupIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'groupId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QAfterFilterCondition>
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

  QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QAfterFilterCondition>
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

  QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QAfterFilterCondition>
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

  QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QAfterFilterCondition>
  mealsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'meals', length, true, length, true);
    });
  }

  QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QAfterFilterCondition>
  mealsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'meals', 0, true, 0, true);
    });
  }

  QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QAfterFilterCondition>
  mealsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'meals', 0, false, 999999, true);
    });
  }

  QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QAfterFilterCondition>
  mealsLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'meals', 0, true, length, include);
    });
  }

  QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QAfterFilterCondition>
  mealsLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'meals', length, include, 999999, true);
    });
  }

  QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QAfterFilterCondition>
  mealsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'meals',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QAfterFilterCondition>
  startDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'startDate', value: value),
      );
    });
  }

  QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QAfterFilterCondition>
  startDateGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'startDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QAfterFilterCondition>
  startDateLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'startDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QAfterFilterCondition>
  startDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'startDate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension WeeklyDetailEntityQueryObject
    on QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QFilterCondition> {
  QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QAfterFilterCondition>
  mealsElement(FilterQuery<DailyMealEmbed> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'meals');
    });
  }
}

extension WeeklyDetailEntityQueryLinks
    on QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QFilterCondition> {}

extension WeeklyDetailEntityQuerySortBy
    on QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QSortBy> {
  QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QAfterSortBy>
  sortByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.asc);
    });
  }

  QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QAfterSortBy>
  sortByEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.desc);
    });
  }

  QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QAfterSortBy>
  sortByGroupId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupId', Sort.asc);
    });
  }

  QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QAfterSortBy>
  sortByGroupIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupId', Sort.desc);
    });
  }

  QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QAfterSortBy>
  sortByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QAfterSortBy>
  sortByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }
}

extension WeeklyDetailEntityQuerySortThenBy
    on QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QSortThenBy> {
  QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QAfterSortBy>
  thenByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.asc);
    });
  }

  QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QAfterSortBy>
  thenByEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.desc);
    });
  }

  QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QAfterSortBy>
  thenByGroupId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupId', Sort.asc);
    });
  }

  QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QAfterSortBy>
  thenByGroupIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupId', Sort.desc);
    });
  }

  QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QAfterSortBy>
  thenByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QAfterSortBy>
  thenByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }
}

extension WeeklyDetailEntityQueryWhereDistinct
    on QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QDistinct> {
  QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QDistinct>
  distinctByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endDate');
    });
  }

  QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QDistinct>
  distinctByGroupId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'groupId');
    });
  }

  QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QDistinct>
  distinctByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startDate');
    });
  }
}

extension WeeklyDetailEntityQueryProperty
    on QueryBuilder<WeeklyDetailEntity, WeeklyDetailEntity, QQueryProperty> {
  QueryBuilder<WeeklyDetailEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<WeeklyDetailEntity, DateTime, QQueryOperations>
  endDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endDate');
    });
  }

  QueryBuilder<WeeklyDetailEntity, int, QQueryOperations> groupIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'groupId');
    });
  }

  QueryBuilder<WeeklyDetailEntity, List<DailyMealEmbed>, QQueryOperations>
  mealsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'meals');
    });
  }

  QueryBuilder<WeeklyDetailEntity, DateTime, QQueryOperations>
  startDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startDate');
    });
  }
}
