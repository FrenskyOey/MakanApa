// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket_item_isar_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBasketItemEntityCollection on Isar {
  IsarCollection<BasketItemEntity> get basketItemEntitys => this.collection();
}

const BasketItemEntitySchema = CollectionSchema(
  name: r'BasketItemEntity',
  id: 8778142108530194909,
  properties: {
    r'groupId': PropertySchema(id: 0, name: r'groupId', type: IsarType.long),
    r'ingredientId': PropertySchema(
      id: 1,
      name: r'ingredientId',
      type: IsarType.long,
    ),
    r'isMarked': PropertySchema(id: 2, name: r'isMarked', type: IsarType.bool),
    r'name': PropertySchema(id: 3, name: r'name', type: IsarType.string),
    r'quantity': PropertySchema(id: 4, name: r'quantity', type: IsarType.long),
    r'type': PropertySchema(id: 5, name: r'type', type: IsarType.string),
    r'unit': PropertySchema(id: 6, name: r'unit', type: IsarType.string),
  },

  estimateSize: _basketItemEntityEstimateSize,
  serialize: _basketItemEntitySerialize,
  deserialize: _basketItemEntityDeserialize,
  deserializeProp: _basketItemEntityDeserializeProp,
  idName: r'id',
  indexes: {
    r'groupId': IndexSchema(
      id: -8523216633229774932,
      name: r'groupId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'groupId',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'ingredientId': IndexSchema(
      id: 2486648196709662311,
      name: r'ingredientId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'ingredientId',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _basketItemEntityGetId,
  getLinks: _basketItemEntityGetLinks,
  attach: _basketItemEntityAttach,
  version: '3.3.0',
);

int _basketItemEntityEstimateSize(
  BasketItemEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.type.length * 3;
  bytesCount += 3 + object.unit.length * 3;
  return bytesCount;
}

void _basketItemEntitySerialize(
  BasketItemEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.groupId);
  writer.writeLong(offsets[1], object.ingredientId);
  writer.writeBool(offsets[2], object.isMarked);
  writer.writeString(offsets[3], object.name);
  writer.writeLong(offsets[4], object.quantity);
  writer.writeString(offsets[5], object.type);
  writer.writeString(offsets[6], object.unit);
}

BasketItemEntity _basketItemEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BasketItemEntity();
  object.groupId = reader.readLong(offsets[0]);
  object.id = id;
  object.ingredientId = reader.readLong(offsets[1]);
  object.isMarked = reader.readBool(offsets[2]);
  object.name = reader.readString(offsets[3]);
  object.quantity = reader.readLong(offsets[4]);
  object.type = reader.readString(offsets[5]);
  object.unit = reader.readString(offsets[6]);
  return object;
}

P _basketItemEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _basketItemEntityGetId(BasketItemEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _basketItemEntityGetLinks(BasketItemEntity object) {
  return [];
}

void _basketItemEntityAttach(
  IsarCollection<dynamic> col,
  Id id,
  BasketItemEntity object,
) {
  object.id = id;
}

extension BasketItemEntityQueryWhereSort
    on QueryBuilder<BasketItemEntity, BasketItemEntity, QWhere> {
  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterWhere> anyGroupId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'groupId'),
      );
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterWhere>
  anyIngredientId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'ingredientId'),
      );
    });
  }
}

extension BasketItemEntityQueryWhere
    on QueryBuilder<BasketItemEntity, BasketItemEntity, QWhereClause> {
  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterWhereClause>
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

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterWhereClause> idBetween(
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

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterWhereClause>
  groupIdEqualTo(int groupId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'groupId', value: [groupId]),
      );
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterWhereClause>
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

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterWhereClause>
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

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterWhereClause>
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

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterWhereClause>
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

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterWhereClause>
  ingredientIdEqualTo(int ingredientId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'ingredientId',
          value: [ingredientId],
        ),
      );
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterWhereClause>
  ingredientIdNotEqualTo(int ingredientId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'ingredientId',
                lower: [],
                upper: [ingredientId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'ingredientId',
                lower: [ingredientId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'ingredientId',
                lower: [ingredientId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'ingredientId',
                lower: [],
                upper: [ingredientId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterWhereClause>
  ingredientIdGreaterThan(int ingredientId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'ingredientId',
          lower: [ingredientId],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterWhereClause>
  ingredientIdLessThan(int ingredientId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'ingredientId',
          lower: [],
          upper: [ingredientId],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterWhereClause>
  ingredientIdBetween(
    int lowerIngredientId,
    int upperIngredientId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'ingredientId',
          lower: [lowerIngredientId],
          includeLower: includeLower,
          upper: [upperIngredientId],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension BasketItemEntityQueryFilter
    on QueryBuilder<BasketItemEntity, BasketItemEntity, QFilterCondition> {
  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterFilterCondition>
  groupIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'groupId', value: value),
      );
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterFilterCondition>
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

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterFilterCondition>
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

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterFilterCondition>
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

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterFilterCondition>
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

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterFilterCondition>
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

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterFilterCondition>
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

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterFilterCondition>
  ingredientIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'ingredientId', value: value),
      );
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterFilterCondition>
  ingredientIdGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'ingredientId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterFilterCondition>
  ingredientIdLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'ingredientId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterFilterCondition>
  ingredientIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'ingredientId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterFilterCondition>
  isMarkedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isMarked', value: value),
      );
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterFilterCondition>
  nameEqualTo(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterFilterCondition>
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

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterFilterCondition>
  nameLessThan(
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

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterFilterCondition>
  nameBetween(
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

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterFilterCondition>
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

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterFilterCondition>
  nameEndsWith(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterFilterCondition>
  nameContains(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterFilterCondition>
  nameMatches(String pattern, {bool caseSensitive = true}) {
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

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterFilterCondition>
  nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterFilterCondition>
  nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterFilterCondition>
  quantityEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'quantity', value: value),
      );
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterFilterCondition>
  quantityGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'quantity',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterFilterCondition>
  quantityLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'quantity',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterFilterCondition>
  quantityBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'quantity',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterFilterCondition>
  typeEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'type',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterFilterCondition>
  typeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'type',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterFilterCondition>
  typeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'type',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterFilterCondition>
  typeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'type',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterFilterCondition>
  typeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'type',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterFilterCondition>
  typeEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'type',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterFilterCondition>
  typeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'type',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterFilterCondition>
  typeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'type',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterFilterCondition>
  typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'type', value: ''),
      );
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterFilterCondition>
  typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'type', value: ''),
      );
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterFilterCondition>
  unitEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'unit',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterFilterCondition>
  unitGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'unit',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterFilterCondition>
  unitLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'unit',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterFilterCondition>
  unitBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'unit',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterFilterCondition>
  unitStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'unit',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterFilterCondition>
  unitEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'unit',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterFilterCondition>
  unitContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'unit',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterFilterCondition>
  unitMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'unit',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterFilterCondition>
  unitIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'unit', value: ''),
      );
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterFilterCondition>
  unitIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'unit', value: ''),
      );
    });
  }
}

extension BasketItemEntityQueryObject
    on QueryBuilder<BasketItemEntity, BasketItemEntity, QFilterCondition> {}

extension BasketItemEntityQueryLinks
    on QueryBuilder<BasketItemEntity, BasketItemEntity, QFilterCondition> {}

extension BasketItemEntityQuerySortBy
    on QueryBuilder<BasketItemEntity, BasketItemEntity, QSortBy> {
  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterSortBy>
  sortByGroupId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupId', Sort.asc);
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterSortBy>
  sortByGroupIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupId', Sort.desc);
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterSortBy>
  sortByIngredientId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ingredientId', Sort.asc);
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterSortBy>
  sortByIngredientIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ingredientId', Sort.desc);
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterSortBy>
  sortByIsMarked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMarked', Sort.asc);
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterSortBy>
  sortByIsMarkedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMarked', Sort.desc);
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterSortBy>
  sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterSortBy>
  sortByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterSortBy>
  sortByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterSortBy>
  sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterSortBy> sortByUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.asc);
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterSortBy>
  sortByUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.desc);
    });
  }
}

extension BasketItemEntityQuerySortThenBy
    on QueryBuilder<BasketItemEntity, BasketItemEntity, QSortThenBy> {
  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterSortBy>
  thenByGroupId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupId', Sort.asc);
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterSortBy>
  thenByGroupIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupId', Sort.desc);
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterSortBy>
  thenByIngredientId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ingredientId', Sort.asc);
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterSortBy>
  thenByIngredientIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ingredientId', Sort.desc);
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterSortBy>
  thenByIsMarked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMarked', Sort.asc);
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterSortBy>
  thenByIsMarkedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMarked', Sort.desc);
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterSortBy>
  thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterSortBy>
  thenByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterSortBy>
  thenByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterSortBy>
  thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterSortBy> thenByUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.asc);
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QAfterSortBy>
  thenByUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.desc);
    });
  }
}

extension BasketItemEntityQueryWhereDistinct
    on QueryBuilder<BasketItemEntity, BasketItemEntity, QDistinct> {
  QueryBuilder<BasketItemEntity, BasketItemEntity, QDistinct>
  distinctByGroupId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'groupId');
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QDistinct>
  distinctByIngredientId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ingredientId');
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QDistinct>
  distinctByIsMarked() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isMarked');
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QDistinct> distinctByName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QDistinct>
  distinctByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantity');
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QDistinct> distinctByType({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BasketItemEntity, BasketItemEntity, QDistinct> distinctByUnit({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unit', caseSensitive: caseSensitive);
    });
  }
}

extension BasketItemEntityQueryProperty
    on QueryBuilder<BasketItemEntity, BasketItemEntity, QQueryProperty> {
  QueryBuilder<BasketItemEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BasketItemEntity, int, QQueryOperations> groupIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'groupId');
    });
  }

  QueryBuilder<BasketItemEntity, int, QQueryOperations> ingredientIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ingredientId');
    });
  }

  QueryBuilder<BasketItemEntity, bool, QQueryOperations> isMarkedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isMarked');
    });
  }

  QueryBuilder<BasketItemEntity, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<BasketItemEntity, int, QQueryOperations> quantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantity');
    });
  }

  QueryBuilder<BasketItemEntity, String, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<BasketItemEntity, String, QQueryOperations> unitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unit');
    });
  }
}
