// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_meal_embed.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const DailyMealEmbedSchema = Schema(
  name: r'DailyMealEmbed',
  id: 2448835352189457229,
  properties: {
    r'dinner': PropertySchema(
      id: 0,
      name: r'dinner',
      type: IsarType.object,

      target: r'RecipeEmbedModel',
    ),
    r'lunch': PropertySchema(
      id: 1,
      name: r'lunch',
      type: IsarType.object,

      target: r'RecipeEmbedModel',
    ),
    r'times': PropertySchema(id: 2, name: r'times', type: IsarType.dateTime),
  },

  estimateSize: _dailyMealEmbedEstimateSize,
  serialize: _dailyMealEmbedSerialize,
  deserialize: _dailyMealEmbedDeserialize,
  deserializeProp: _dailyMealEmbedDeserializeProp,
);

int _dailyMealEmbedEstimateSize(
  DailyMealEmbed object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.dinner;
    if (value != null) {
      bytesCount +=
          3 +
          RecipeEmbedModelSchema.estimateSize(
            value,
            allOffsets[RecipeEmbedModel]!,
            allOffsets,
          );
    }
  }
  {
    final value = object.lunch;
    if (value != null) {
      bytesCount +=
          3 +
          RecipeEmbedModelSchema.estimateSize(
            value,
            allOffsets[RecipeEmbedModel]!,
            allOffsets,
          );
    }
  }
  return bytesCount;
}

void _dailyMealEmbedSerialize(
  DailyMealEmbed object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<RecipeEmbedModel>(
    offsets[0],
    allOffsets,
    RecipeEmbedModelSchema.serialize,
    object.dinner,
  );
  writer.writeObject<RecipeEmbedModel>(
    offsets[1],
    allOffsets,
    RecipeEmbedModelSchema.serialize,
    object.lunch,
  );
  writer.writeDateTime(offsets[2], object.times);
}

DailyMealEmbed _dailyMealEmbedDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DailyMealEmbed();
  object.dinner = reader.readObjectOrNull<RecipeEmbedModel>(
    offsets[0],
    RecipeEmbedModelSchema.deserialize,
    allOffsets,
  );
  object.lunch = reader.readObjectOrNull<RecipeEmbedModel>(
    offsets[1],
    RecipeEmbedModelSchema.deserialize,
    allOffsets,
  );
  object.times = reader.readDateTime(offsets[2]);
  return object;
}

P _dailyMealEmbedDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<RecipeEmbedModel>(
            offset,
            RecipeEmbedModelSchema.deserialize,
            allOffsets,
          ))
          as P;
    case 1:
      return (reader.readObjectOrNull<RecipeEmbedModel>(
            offset,
            RecipeEmbedModelSchema.deserialize,
            allOffsets,
          ))
          as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension DailyMealEmbedQueryFilter
    on QueryBuilder<DailyMealEmbed, DailyMealEmbed, QFilterCondition> {
  QueryBuilder<DailyMealEmbed, DailyMealEmbed, QAfterFilterCondition>
  dinnerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'dinner'),
      );
    });
  }

  QueryBuilder<DailyMealEmbed, DailyMealEmbed, QAfterFilterCondition>
  dinnerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'dinner'),
      );
    });
  }

  QueryBuilder<DailyMealEmbed, DailyMealEmbed, QAfterFilterCondition>
  lunchIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lunch'),
      );
    });
  }

  QueryBuilder<DailyMealEmbed, DailyMealEmbed, QAfterFilterCondition>
  lunchIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lunch'),
      );
    });
  }

  QueryBuilder<DailyMealEmbed, DailyMealEmbed, QAfterFilterCondition>
  timesEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'times', value: value),
      );
    });
  }

  QueryBuilder<DailyMealEmbed, DailyMealEmbed, QAfterFilterCondition>
  timesGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'times',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DailyMealEmbed, DailyMealEmbed, QAfterFilterCondition>
  timesLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'times',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DailyMealEmbed, DailyMealEmbed, QAfterFilterCondition>
  timesBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'times',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension DailyMealEmbedQueryObject
    on QueryBuilder<DailyMealEmbed, DailyMealEmbed, QFilterCondition> {
  QueryBuilder<DailyMealEmbed, DailyMealEmbed, QAfterFilterCondition> dinner(
    FilterQuery<RecipeEmbedModel> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'dinner');
    });
  }

  QueryBuilder<DailyMealEmbed, DailyMealEmbed, QAfterFilterCondition> lunch(
    FilterQuery<RecipeEmbedModel> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'lunch');
    });
  }
}
