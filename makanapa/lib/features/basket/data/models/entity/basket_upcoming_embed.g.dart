// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket_upcoming_embed.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const BasketUpcomingEmbedSchema = Schema(
  name: r'BasketUpcomingEmbed',
  id: 7674787249775810428,
  properties: {
    r'endDate': PropertySchema(
      id: 0,
      name: r'endDate',
      type: IsarType.dateTime,
    ),
    r'groupId': PropertySchema(id: 1, name: r'groupId', type: IsarType.long),
    r'startDate': PropertySchema(
      id: 2,
      name: r'startDate',
      type: IsarType.dateTime,
    ),
  },

  estimateSize: _basketUpcomingEmbedEstimateSize,
  serialize: _basketUpcomingEmbedSerialize,
  deserialize: _basketUpcomingEmbedDeserialize,
  deserializeProp: _basketUpcomingEmbedDeserializeProp,
);

int _basketUpcomingEmbedEstimateSize(
  BasketUpcomingEmbed object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _basketUpcomingEmbedSerialize(
  BasketUpcomingEmbed object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.endDate);
  writer.writeLong(offsets[1], object.groupId);
  writer.writeDateTime(offsets[2], object.startDate);
}

BasketUpcomingEmbed _basketUpcomingEmbedDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BasketUpcomingEmbed();
  object.endDate = reader.readDateTime(offsets[0]);
  object.groupId = reader.readLong(offsets[1]);
  object.startDate = reader.readDateTime(offsets[2]);
  return object;
}

P _basketUpcomingEmbedDeserializeProp<P>(
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
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension BasketUpcomingEmbedQueryFilter
    on
        QueryBuilder<
          BasketUpcomingEmbed,
          BasketUpcomingEmbed,
          QFilterCondition
        > {
  QueryBuilder<BasketUpcomingEmbed, BasketUpcomingEmbed, QAfterFilterCondition>
  endDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'endDate', value: value),
      );
    });
  }

  QueryBuilder<BasketUpcomingEmbed, BasketUpcomingEmbed, QAfterFilterCondition>
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

  QueryBuilder<BasketUpcomingEmbed, BasketUpcomingEmbed, QAfterFilterCondition>
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

  QueryBuilder<BasketUpcomingEmbed, BasketUpcomingEmbed, QAfterFilterCondition>
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

  QueryBuilder<BasketUpcomingEmbed, BasketUpcomingEmbed, QAfterFilterCondition>
  groupIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'groupId', value: value),
      );
    });
  }

  QueryBuilder<BasketUpcomingEmbed, BasketUpcomingEmbed, QAfterFilterCondition>
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

  QueryBuilder<BasketUpcomingEmbed, BasketUpcomingEmbed, QAfterFilterCondition>
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

  QueryBuilder<BasketUpcomingEmbed, BasketUpcomingEmbed, QAfterFilterCondition>
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

  QueryBuilder<BasketUpcomingEmbed, BasketUpcomingEmbed, QAfterFilterCondition>
  startDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'startDate', value: value),
      );
    });
  }

  QueryBuilder<BasketUpcomingEmbed, BasketUpcomingEmbed, QAfterFilterCondition>
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

  QueryBuilder<BasketUpcomingEmbed, BasketUpcomingEmbed, QAfterFilterCondition>
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

  QueryBuilder<BasketUpcomingEmbed, BasketUpcomingEmbed, QAfterFilterCondition>
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

extension BasketUpcomingEmbedQueryObject
    on
        QueryBuilder<
          BasketUpcomingEmbed,
          BasketUpcomingEmbed,
          QFilterCondition
        > {}
