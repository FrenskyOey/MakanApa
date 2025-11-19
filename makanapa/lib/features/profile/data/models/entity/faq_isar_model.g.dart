// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_isar_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFaqEntityCollection on Isar {
  IsarCollection<FaqEntity> get faqEntitys => this.collection();
}

const FaqEntitySchema = CollectionSchema(
  name: r'FaqEntity',
  id: 2469987260660207348,
  properties: {
    r'content': PropertySchema(id: 0, name: r'content', type: IsarType.string),
    r'dataId': PropertySchema(id: 1, name: r'dataId', type: IsarType.string),
    r'title': PropertySchema(id: 2, name: r'title', type: IsarType.string),
  },

  estimateSize: _faqEntityEstimateSize,
  serialize: _faqEntitySerialize,
  deserialize: _faqEntityDeserialize,
  deserializeProp: _faqEntityDeserializeProp,
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
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _faqEntityGetId,
  getLinks: _faqEntityGetLinks,
  attach: _faqEntityAttach,
  version: '3.3.0',
);

int _faqEntityEstimateSize(
  FaqEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.content.length * 3;
  bytesCount += 3 + object.dataId.length * 3;
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _faqEntitySerialize(
  FaqEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.content);
  writer.writeString(offsets[1], object.dataId);
  writer.writeString(offsets[2], object.title);
}

FaqEntity _faqEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FaqEntity();
  object.content = reader.readString(offsets[0]);
  object.dataId = reader.readString(offsets[1]);
  object.id = id;
  object.title = reader.readString(offsets[2]);
  return object;
}

P _faqEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _faqEntityGetId(FaqEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _faqEntityGetLinks(FaqEntity object) {
  return [];
}

void _faqEntityAttach(IsarCollection<dynamic> col, Id id, FaqEntity object) {
  object.id = id;
}

extension FaqEntityByIndex on IsarCollection<FaqEntity> {
  Future<FaqEntity?> getByDataId(String dataId) {
    return getByIndex(r'dataId', [dataId]);
  }

  FaqEntity? getByDataIdSync(String dataId) {
    return getByIndexSync(r'dataId', [dataId]);
  }

  Future<bool> deleteByDataId(String dataId) {
    return deleteByIndex(r'dataId', [dataId]);
  }

  bool deleteByDataIdSync(String dataId) {
    return deleteByIndexSync(r'dataId', [dataId]);
  }

  Future<List<FaqEntity?>> getAllByDataId(List<String> dataIdValues) {
    final values = dataIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'dataId', values);
  }

  List<FaqEntity?> getAllByDataIdSync(List<String> dataIdValues) {
    final values = dataIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'dataId', values);
  }

  Future<int> deleteAllByDataId(List<String> dataIdValues) {
    final values = dataIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'dataId', values);
  }

  int deleteAllByDataIdSync(List<String> dataIdValues) {
    final values = dataIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'dataId', values);
  }

  Future<Id> putByDataId(FaqEntity object) {
    return putByIndex(r'dataId', object);
  }

  Id putByDataIdSync(FaqEntity object, {bool saveLinks = true}) {
    return putByIndexSync(r'dataId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByDataId(List<FaqEntity> objects) {
    return putAllByIndex(r'dataId', objects);
  }

  List<Id> putAllByDataIdSync(
    List<FaqEntity> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'dataId', objects, saveLinks: saveLinks);
  }
}

extension FaqEntityQueryWhereSort
    on QueryBuilder<FaqEntity, FaqEntity, QWhere> {
  QueryBuilder<FaqEntity, FaqEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FaqEntityQueryWhere
    on QueryBuilder<FaqEntity, FaqEntity, QWhereClause> {
  QueryBuilder<FaqEntity, FaqEntity, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<FaqEntity, FaqEntity, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<FaqEntity, FaqEntity, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<FaqEntity, FaqEntity, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<FaqEntity, FaqEntity, QAfterWhereClause> idBetween(
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

  QueryBuilder<FaqEntity, FaqEntity, QAfterWhereClause> dataIdEqualTo(
    String dataId,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'dataId', value: [dataId]),
      );
    });
  }

  QueryBuilder<FaqEntity, FaqEntity, QAfterWhereClause> dataIdNotEqualTo(
    String dataId,
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
}

extension FaqEntityQueryFilter
    on QueryBuilder<FaqEntity, FaqEntity, QFilterCondition> {
  QueryBuilder<FaqEntity, FaqEntity, QAfterFilterCondition> contentEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'content',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<FaqEntity, FaqEntity, QAfterFilterCondition> contentGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'content',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<FaqEntity, FaqEntity, QAfterFilterCondition> contentLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'content',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<FaqEntity, FaqEntity, QAfterFilterCondition> contentBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'content',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<FaqEntity, FaqEntity, QAfterFilterCondition> contentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'content',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<FaqEntity, FaqEntity, QAfterFilterCondition> contentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'content',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<FaqEntity, FaqEntity, QAfterFilterCondition> contentContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'content',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<FaqEntity, FaqEntity, QAfterFilterCondition> contentMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'content',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<FaqEntity, FaqEntity, QAfterFilterCondition> contentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'content', value: ''),
      );
    });
  }

  QueryBuilder<FaqEntity, FaqEntity, QAfterFilterCondition>
  contentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'content', value: ''),
      );
    });
  }

  QueryBuilder<FaqEntity, FaqEntity, QAfterFilterCondition> dataIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'dataId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<FaqEntity, FaqEntity, QAfterFilterCondition> dataIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'dataId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<FaqEntity, FaqEntity, QAfterFilterCondition> dataIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'dataId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<FaqEntity, FaqEntity, QAfterFilterCondition> dataIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'dataId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<FaqEntity, FaqEntity, QAfterFilterCondition> dataIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'dataId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<FaqEntity, FaqEntity, QAfterFilterCondition> dataIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'dataId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<FaqEntity, FaqEntity, QAfterFilterCondition> dataIdContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'dataId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<FaqEntity, FaqEntity, QAfterFilterCondition> dataIdMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'dataId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<FaqEntity, FaqEntity, QAfterFilterCondition> dataIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'dataId', value: ''),
      );
    });
  }

  QueryBuilder<FaqEntity, FaqEntity, QAfterFilterCondition> dataIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'dataId', value: ''),
      );
    });
  }

  QueryBuilder<FaqEntity, FaqEntity, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<FaqEntity, FaqEntity, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<FaqEntity, FaqEntity, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<FaqEntity, FaqEntity, QAfterFilterCondition> idBetween(
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

  QueryBuilder<FaqEntity, FaqEntity, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<FaqEntity, FaqEntity, QAfterFilterCondition> titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<FaqEntity, FaqEntity, QAfterFilterCondition> titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<FaqEntity, FaqEntity, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'title',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<FaqEntity, FaqEntity, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<FaqEntity, FaqEntity, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<FaqEntity, FaqEntity, QAfterFilterCondition> titleContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<FaqEntity, FaqEntity, QAfterFilterCondition> titleMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'title',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<FaqEntity, FaqEntity, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'title', value: ''),
      );
    });
  }

  QueryBuilder<FaqEntity, FaqEntity, QAfterFilterCondition> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'title', value: ''),
      );
    });
  }
}

extension FaqEntityQueryObject
    on QueryBuilder<FaqEntity, FaqEntity, QFilterCondition> {}

extension FaqEntityQueryLinks
    on QueryBuilder<FaqEntity, FaqEntity, QFilterCondition> {}

extension FaqEntityQuerySortBy on QueryBuilder<FaqEntity, FaqEntity, QSortBy> {
  QueryBuilder<FaqEntity, FaqEntity, QAfterSortBy> sortByContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.asc);
    });
  }

  QueryBuilder<FaqEntity, FaqEntity, QAfterSortBy> sortByContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.desc);
    });
  }

  QueryBuilder<FaqEntity, FaqEntity, QAfterSortBy> sortByDataId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataId', Sort.asc);
    });
  }

  QueryBuilder<FaqEntity, FaqEntity, QAfterSortBy> sortByDataIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataId', Sort.desc);
    });
  }

  QueryBuilder<FaqEntity, FaqEntity, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<FaqEntity, FaqEntity, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension FaqEntityQuerySortThenBy
    on QueryBuilder<FaqEntity, FaqEntity, QSortThenBy> {
  QueryBuilder<FaqEntity, FaqEntity, QAfterSortBy> thenByContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.asc);
    });
  }

  QueryBuilder<FaqEntity, FaqEntity, QAfterSortBy> thenByContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.desc);
    });
  }

  QueryBuilder<FaqEntity, FaqEntity, QAfterSortBy> thenByDataId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataId', Sort.asc);
    });
  }

  QueryBuilder<FaqEntity, FaqEntity, QAfterSortBy> thenByDataIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataId', Sort.desc);
    });
  }

  QueryBuilder<FaqEntity, FaqEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FaqEntity, FaqEntity, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<FaqEntity, FaqEntity, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<FaqEntity, FaqEntity, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension FaqEntityQueryWhereDistinct
    on QueryBuilder<FaqEntity, FaqEntity, QDistinct> {
  QueryBuilder<FaqEntity, FaqEntity, QDistinct> distinctByContent({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'content', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FaqEntity, FaqEntity, QDistinct> distinctByDataId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dataId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FaqEntity, FaqEntity, QDistinct> distinctByTitle({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }
}

extension FaqEntityQueryProperty
    on QueryBuilder<FaqEntity, FaqEntity, QQueryProperty> {
  QueryBuilder<FaqEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FaqEntity, String, QQueryOperations> contentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'content');
    });
  }

  QueryBuilder<FaqEntity, String, QQueryOperations> dataIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dataId');
    });
  }

  QueryBuilder<FaqEntity, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }
}
