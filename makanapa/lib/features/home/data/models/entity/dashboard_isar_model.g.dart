// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_isar_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDashboardEntityCollection on Isar {
  IsarCollection<DashboardEntity> get dashboardEntitys => this.collection();
}

const DashboardEntitySchema = CollectionSchema(
  name: r'DashboardEntity',
  id: 8281951863799898696,
  properties: {
    r'jsonBlob': PropertySchema(
      id: 0,
      name: r'jsonBlob',
      type: IsarType.string,
    ),
    r'lastUpdated': PropertySchema(
      id: 1,
      name: r'lastUpdated',
      type: IsarType.dateTime,
    ),
  },

  estimateSize: _dashboardEntityEstimateSize,
  serialize: _dashboardEntitySerialize,
  deserialize: _dashboardEntityDeserialize,
  deserializeProp: _dashboardEntityDeserializeProp,
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
  embeddedSchemas: {},

  getId: _dashboardEntityGetId,
  getLinks: _dashboardEntityGetLinks,
  attach: _dashboardEntityAttach,
  version: '3.3.0',
);

int _dashboardEntityEstimateSize(
  DashboardEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.jsonBlob.length * 3;
  return bytesCount;
}

void _dashboardEntitySerialize(
  DashboardEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.jsonBlob);
  writer.writeDateTime(offsets[1], object.lastUpdated);
}

DashboardEntity _dashboardEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DashboardEntity();
  object.id = id;
  object.jsonBlob = reader.readString(offsets[0]);
  object.lastUpdated = reader.readDateTime(offsets[1]);
  return object;
}

P _dashboardEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _dashboardEntityGetId(DashboardEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _dashboardEntityGetLinks(DashboardEntity object) {
  return [];
}

void _dashboardEntityAttach(
  IsarCollection<dynamic> col,
  Id id,
  DashboardEntity object,
) {
  object.id = id;
}

extension DashboardEntityQueryWhereSort
    on QueryBuilder<DashboardEntity, DashboardEntity, QWhere> {
  QueryBuilder<DashboardEntity, DashboardEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<DashboardEntity, DashboardEntity, QAfterWhere> anyLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'lastUpdated'),
      );
    });
  }
}

extension DashboardEntityQueryWhere
    on QueryBuilder<DashboardEntity, DashboardEntity, QWhereClause> {
  QueryBuilder<DashboardEntity, DashboardEntity, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<DashboardEntity, DashboardEntity, QAfterWhereClause>
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

  QueryBuilder<DashboardEntity, DashboardEntity, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DashboardEntity, DashboardEntity, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DashboardEntity, DashboardEntity, QAfterWhereClause> idBetween(
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

  QueryBuilder<DashboardEntity, DashboardEntity, QAfterWhereClause>
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

  QueryBuilder<DashboardEntity, DashboardEntity, QAfterWhereClause>
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

  QueryBuilder<DashboardEntity, DashboardEntity, QAfterWhereClause>
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

  QueryBuilder<DashboardEntity, DashboardEntity, QAfterWhereClause>
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

  QueryBuilder<DashboardEntity, DashboardEntity, QAfterWhereClause>
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

extension DashboardEntityQueryFilter
    on QueryBuilder<DashboardEntity, DashboardEntity, QFilterCondition> {
  QueryBuilder<DashboardEntity, DashboardEntity, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<DashboardEntity, DashboardEntity, QAfterFilterCondition>
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

  QueryBuilder<DashboardEntity, DashboardEntity, QAfterFilterCondition>
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

  QueryBuilder<DashboardEntity, DashboardEntity, QAfterFilterCondition>
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

  QueryBuilder<DashboardEntity, DashboardEntity, QAfterFilterCondition>
  jsonBlobEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'jsonBlob',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DashboardEntity, DashboardEntity, QAfterFilterCondition>
  jsonBlobGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'jsonBlob',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DashboardEntity, DashboardEntity, QAfterFilterCondition>
  jsonBlobLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'jsonBlob',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DashboardEntity, DashboardEntity, QAfterFilterCondition>
  jsonBlobBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'jsonBlob',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DashboardEntity, DashboardEntity, QAfterFilterCondition>
  jsonBlobStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'jsonBlob',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DashboardEntity, DashboardEntity, QAfterFilterCondition>
  jsonBlobEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'jsonBlob',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DashboardEntity, DashboardEntity, QAfterFilterCondition>
  jsonBlobContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'jsonBlob',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DashboardEntity, DashboardEntity, QAfterFilterCondition>
  jsonBlobMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'jsonBlob',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DashboardEntity, DashboardEntity, QAfterFilterCondition>
  jsonBlobIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'jsonBlob', value: ''),
      );
    });
  }

  QueryBuilder<DashboardEntity, DashboardEntity, QAfterFilterCondition>
  jsonBlobIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'jsonBlob', value: ''),
      );
    });
  }

  QueryBuilder<DashboardEntity, DashboardEntity, QAfterFilterCondition>
  lastUpdatedEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastUpdated', value: value),
      );
    });
  }

  QueryBuilder<DashboardEntity, DashboardEntity, QAfterFilterCondition>
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

  QueryBuilder<DashboardEntity, DashboardEntity, QAfterFilterCondition>
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

  QueryBuilder<DashboardEntity, DashboardEntity, QAfterFilterCondition>
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
}

extension DashboardEntityQueryObject
    on QueryBuilder<DashboardEntity, DashboardEntity, QFilterCondition> {}

extension DashboardEntityQueryLinks
    on QueryBuilder<DashboardEntity, DashboardEntity, QFilterCondition> {}

extension DashboardEntityQuerySortBy
    on QueryBuilder<DashboardEntity, DashboardEntity, QSortBy> {
  QueryBuilder<DashboardEntity, DashboardEntity, QAfterSortBy>
  sortByJsonBlob() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jsonBlob', Sort.asc);
    });
  }

  QueryBuilder<DashboardEntity, DashboardEntity, QAfterSortBy>
  sortByJsonBlobDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jsonBlob', Sort.desc);
    });
  }

  QueryBuilder<DashboardEntity, DashboardEntity, QAfterSortBy>
  sortByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.asc);
    });
  }

  QueryBuilder<DashboardEntity, DashboardEntity, QAfterSortBy>
  sortByLastUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.desc);
    });
  }
}

extension DashboardEntityQuerySortThenBy
    on QueryBuilder<DashboardEntity, DashboardEntity, QSortThenBy> {
  QueryBuilder<DashboardEntity, DashboardEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DashboardEntity, DashboardEntity, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DashboardEntity, DashboardEntity, QAfterSortBy>
  thenByJsonBlob() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jsonBlob', Sort.asc);
    });
  }

  QueryBuilder<DashboardEntity, DashboardEntity, QAfterSortBy>
  thenByJsonBlobDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jsonBlob', Sort.desc);
    });
  }

  QueryBuilder<DashboardEntity, DashboardEntity, QAfterSortBy>
  thenByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.asc);
    });
  }

  QueryBuilder<DashboardEntity, DashboardEntity, QAfterSortBy>
  thenByLastUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.desc);
    });
  }
}

extension DashboardEntityQueryWhereDistinct
    on QueryBuilder<DashboardEntity, DashboardEntity, QDistinct> {
  QueryBuilder<DashboardEntity, DashboardEntity, QDistinct> distinctByJsonBlob({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'jsonBlob', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DashboardEntity, DashboardEntity, QDistinct>
  distinctByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUpdated');
    });
  }
}

extension DashboardEntityQueryProperty
    on QueryBuilder<DashboardEntity, DashboardEntity, QQueryProperty> {
  QueryBuilder<DashboardEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DashboardEntity, String, QQueryOperations> jsonBlobProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'jsonBlob');
    });
  }

  QueryBuilder<DashboardEntity, DateTime, QQueryOperations>
  lastUpdatedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUpdated');
    });
  }
}
