// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket_group_isar_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBasketGroupEntityCollection on Isar {
  IsarCollection<BasketGroupEntity> get basketGroupEntitys => this.collection();
}

const BasketGroupEntitySchema = CollectionSchema(
  name: r'BasketGroupEntity',
  id: -8046283764652075030,
  properties: {
    r'currentGroup': PropertySchema(
      id: 0,
      name: r'currentGroup',
      type: IsarType.object,

      target: r'BasketUpcomingEmbed',
    ),
    r'lastUpdated': PropertySchema(
      id: 1,
      name: r'lastUpdated',
      type: IsarType.dateTime,
    ),
    r'upcomingData': PropertySchema(
      id: 2,
      name: r'upcomingData',
      type: IsarType.objectList,

      target: r'BasketUpcomingEmbed',
    ),
  },

  estimateSize: _basketGroupEntityEstimateSize,
  serialize: _basketGroupEntitySerialize,
  deserialize: _basketGroupEntityDeserialize,
  deserializeProp: _basketGroupEntityDeserializeProp,
  idName: r'id',
  indexes: {
    r'lastUpdated': IndexSchema(
      id: 8989359681631629925,
      name: r'lastUpdated',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'lastUpdated',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {r'BasketUpcomingEmbed': BasketUpcomingEmbedSchema},

  getId: _basketGroupEntityGetId,
  getLinks: _basketGroupEntityGetLinks,
  attach: _basketGroupEntityAttach,
  version: '3.3.0',
);

int _basketGroupEntityEstimateSize(
  BasketGroupEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.currentGroup;
    if (value != null) {
      bytesCount +=
          3 +
          BasketUpcomingEmbedSchema.estimateSize(
            value,
            allOffsets[BasketUpcomingEmbed]!,
            allOffsets,
          );
    }
  }
  bytesCount += 3 + object.upcomingData.length * 3;
  {
    final offsets = allOffsets[BasketUpcomingEmbed]!;
    for (var i = 0; i < object.upcomingData.length; i++) {
      final value = object.upcomingData[i];
      bytesCount += BasketUpcomingEmbedSchema.estimateSize(
        value,
        offsets,
        allOffsets,
      );
    }
  }
  return bytesCount;
}

void _basketGroupEntitySerialize(
  BasketGroupEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<BasketUpcomingEmbed>(
    offsets[0],
    allOffsets,
    BasketUpcomingEmbedSchema.serialize,
    object.currentGroup,
  );
  writer.writeDateTime(offsets[1], object.lastUpdated);
  writer.writeObjectList<BasketUpcomingEmbed>(
    offsets[2],
    allOffsets,
    BasketUpcomingEmbedSchema.serialize,
    object.upcomingData,
  );
}

BasketGroupEntity _basketGroupEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BasketGroupEntity();
  object.currentGroup = reader.readObjectOrNull<BasketUpcomingEmbed>(
    offsets[0],
    BasketUpcomingEmbedSchema.deserialize,
    allOffsets,
  );
  object.id = id;
  object.lastUpdated = reader.readDateTime(offsets[1]);
  object.upcomingData =
      reader.readObjectList<BasketUpcomingEmbed>(
        offsets[2],
        BasketUpcomingEmbedSchema.deserialize,
        allOffsets,
        BasketUpcomingEmbed(),
      ) ??
      [];
  return object;
}

P _basketGroupEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<BasketUpcomingEmbed>(
            offset,
            BasketUpcomingEmbedSchema.deserialize,
            allOffsets,
          ))
          as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readObjectList<BasketUpcomingEmbed>(
                offset,
                BasketUpcomingEmbedSchema.deserialize,
                allOffsets,
                BasketUpcomingEmbed(),
              ) ??
              [])
          as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _basketGroupEntityGetId(BasketGroupEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _basketGroupEntityGetLinks(
  BasketGroupEntity object,
) {
  return [];
}

void _basketGroupEntityAttach(
  IsarCollection<dynamic> col,
  Id id,
  BasketGroupEntity object,
) {
  object.id = id;
}

extension BasketGroupEntityQueryWhereSort
    on QueryBuilder<BasketGroupEntity, BasketGroupEntity, QWhere> {
  QueryBuilder<BasketGroupEntity, BasketGroupEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<BasketGroupEntity, BasketGroupEntity, QAfterWhere>
  anyLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'lastUpdated'),
      );
    });
  }
}

extension BasketGroupEntityQueryWhere
    on QueryBuilder<BasketGroupEntity, BasketGroupEntity, QWhereClause> {
  QueryBuilder<BasketGroupEntity, BasketGroupEntity, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<BasketGroupEntity, BasketGroupEntity, QAfterWhereClause>
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

  QueryBuilder<BasketGroupEntity, BasketGroupEntity, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BasketGroupEntity, BasketGroupEntity, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BasketGroupEntity, BasketGroupEntity, QAfterWhereClause>
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

  QueryBuilder<BasketGroupEntity, BasketGroupEntity, QAfterWhereClause>
  lastUpdatedEqualTo(DateTime lastUpdated) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'lastUpdated',
          value: [lastUpdated],
        ),
      );
    });
  }

  QueryBuilder<BasketGroupEntity, BasketGroupEntity, QAfterWhereClause>
  lastUpdatedNotEqualTo(DateTime lastUpdated) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'lastUpdated',
                lower: [],
                upper: [lastUpdated],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'lastUpdated',
                lower: [lastUpdated],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'lastUpdated',
                lower: [lastUpdated],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'lastUpdated',
                lower: [],
                upper: [lastUpdated],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<BasketGroupEntity, BasketGroupEntity, QAfterWhereClause>
  lastUpdatedGreaterThan(DateTime lastUpdated, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'lastUpdated',
          lower: [lastUpdated],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<BasketGroupEntity, BasketGroupEntity, QAfterWhereClause>
  lastUpdatedLessThan(DateTime lastUpdated, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'lastUpdated',
          lower: [],
          upper: [lastUpdated],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<BasketGroupEntity, BasketGroupEntity, QAfterWhereClause>
  lastUpdatedBetween(
    DateTime lowerLastUpdated,
    DateTime upperLastUpdated, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'lastUpdated',
          lower: [lowerLastUpdated],
          includeLower: includeLower,
          upper: [upperLastUpdated],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension BasketGroupEntityQueryFilter
    on QueryBuilder<BasketGroupEntity, BasketGroupEntity, QFilterCondition> {
  QueryBuilder<BasketGroupEntity, BasketGroupEntity, QAfterFilterCondition>
  currentGroupIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'currentGroup'),
      );
    });
  }

  QueryBuilder<BasketGroupEntity, BasketGroupEntity, QAfterFilterCondition>
  currentGroupIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'currentGroup'),
      );
    });
  }

  QueryBuilder<BasketGroupEntity, BasketGroupEntity, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<BasketGroupEntity, BasketGroupEntity, QAfterFilterCondition>
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

  QueryBuilder<BasketGroupEntity, BasketGroupEntity, QAfterFilterCondition>
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

  QueryBuilder<BasketGroupEntity, BasketGroupEntity, QAfterFilterCondition>
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

  QueryBuilder<BasketGroupEntity, BasketGroupEntity, QAfterFilterCondition>
  lastUpdatedEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastUpdated', value: value),
      );
    });
  }

  QueryBuilder<BasketGroupEntity, BasketGroupEntity, QAfterFilterCondition>
  lastUpdatedGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastUpdated',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<BasketGroupEntity, BasketGroupEntity, QAfterFilterCondition>
  lastUpdatedLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastUpdated',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<BasketGroupEntity, BasketGroupEntity, QAfterFilterCondition>
  lastUpdatedBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastUpdated',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<BasketGroupEntity, BasketGroupEntity, QAfterFilterCondition>
  upcomingDataLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'upcomingData', length, true, length, true);
    });
  }

  QueryBuilder<BasketGroupEntity, BasketGroupEntity, QAfterFilterCondition>
  upcomingDataIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'upcomingData', 0, true, 0, true);
    });
  }

  QueryBuilder<BasketGroupEntity, BasketGroupEntity, QAfterFilterCondition>
  upcomingDataIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'upcomingData', 0, false, 999999, true);
    });
  }

  QueryBuilder<BasketGroupEntity, BasketGroupEntity, QAfterFilterCondition>
  upcomingDataLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'upcomingData', 0, true, length, include);
    });
  }

  QueryBuilder<BasketGroupEntity, BasketGroupEntity, QAfterFilterCondition>
  upcomingDataLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'upcomingData', length, include, 999999, true);
    });
  }

  QueryBuilder<BasketGroupEntity, BasketGroupEntity, QAfterFilterCondition>
  upcomingDataLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'upcomingData',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension BasketGroupEntityQueryObject
    on QueryBuilder<BasketGroupEntity, BasketGroupEntity, QFilterCondition> {
  QueryBuilder<BasketGroupEntity, BasketGroupEntity, QAfterFilterCondition>
  currentGroup(FilterQuery<BasketUpcomingEmbed> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'currentGroup');
    });
  }

  QueryBuilder<BasketGroupEntity, BasketGroupEntity, QAfterFilterCondition>
  upcomingDataElement(FilterQuery<BasketUpcomingEmbed> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'upcomingData');
    });
  }
}

extension BasketGroupEntityQueryLinks
    on QueryBuilder<BasketGroupEntity, BasketGroupEntity, QFilterCondition> {}

extension BasketGroupEntityQuerySortBy
    on QueryBuilder<BasketGroupEntity, BasketGroupEntity, QSortBy> {
  QueryBuilder<BasketGroupEntity, BasketGroupEntity, QAfterSortBy>
  sortByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.asc);
    });
  }

  QueryBuilder<BasketGroupEntity, BasketGroupEntity, QAfterSortBy>
  sortByLastUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.desc);
    });
  }
}

extension BasketGroupEntityQuerySortThenBy
    on QueryBuilder<BasketGroupEntity, BasketGroupEntity, QSortThenBy> {
  QueryBuilder<BasketGroupEntity, BasketGroupEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BasketGroupEntity, BasketGroupEntity, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BasketGroupEntity, BasketGroupEntity, QAfterSortBy>
  thenByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.asc);
    });
  }

  QueryBuilder<BasketGroupEntity, BasketGroupEntity, QAfterSortBy>
  thenByLastUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.desc);
    });
  }
}

extension BasketGroupEntityQueryWhereDistinct
    on QueryBuilder<BasketGroupEntity, BasketGroupEntity, QDistinct> {
  QueryBuilder<BasketGroupEntity, BasketGroupEntity, QDistinct>
  distinctByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUpdated');
    });
  }
}

extension BasketGroupEntityQueryProperty
    on QueryBuilder<BasketGroupEntity, BasketGroupEntity, QQueryProperty> {
  QueryBuilder<BasketGroupEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BasketGroupEntity, BasketUpcomingEmbed?, QQueryOperations>
  currentGroupProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentGroup');
    });
  }

  QueryBuilder<BasketGroupEntity, DateTime, QQueryOperations>
  lastUpdatedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUpdated');
    });
  }

  QueryBuilder<BasketGroupEntity, List<BasketUpcomingEmbed>, QQueryOperations>
  upcomingDataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'upcomingData');
    });
  }
}
