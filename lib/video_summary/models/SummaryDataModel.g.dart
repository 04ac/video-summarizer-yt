// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SummaryDataModel.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSummaryDataModelCollection on Isar {
  IsarCollection<SummaryDataModel> get summaryDataModels => this.collection();
}

const SummaryDataModelSchema = CollectionSchema(
  name: r'SummaryDataModel',
  id: -839431788626377072,
  properties: {
    r'selectedModel': PropertySchema(
      id: 0,
      name: r'selectedModel',
      type: IsarType.string,
    ),
    r'summaryText': PropertySchema(
      id: 1,
      name: r'summaryText',
      type: IsarType.string,
    ),
    r'videoUrl': PropertySchema(
      id: 2,
      name: r'videoUrl',
      type: IsarType.string,
    )
  },
  estimateSize: _summaryDataModelEstimateSize,
  serialize: _summaryDataModelSerialize,
  deserialize: _summaryDataModelDeserialize,
  deserializeProp: _summaryDataModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _summaryDataModelGetId,
  getLinks: _summaryDataModelGetLinks,
  attach: _summaryDataModelAttach,
  version: '3.1.0+1',
);

int _summaryDataModelEstimateSize(
  SummaryDataModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.selectedModel.length * 3;
  bytesCount += 3 + object.summaryText.length * 3;
  bytesCount += 3 + object.videoUrl.length * 3;
  return bytesCount;
}

void _summaryDataModelSerialize(
  SummaryDataModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.selectedModel);
  writer.writeString(offsets[1], object.summaryText);
  writer.writeString(offsets[2], object.videoUrl);
}

SummaryDataModel _summaryDataModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SummaryDataModel(
    selectedModel: reader.readString(offsets[0]),
    summaryText: reader.readString(offsets[1]),
    videoUrl: reader.readString(offsets[2]),
  );
  object.id = id;
  return object;
}

P _summaryDataModelDeserializeProp<P>(
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

Id _summaryDataModelGetId(SummaryDataModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _summaryDataModelGetLinks(SummaryDataModel object) {
  return [];
}

void _summaryDataModelAttach(
    IsarCollection<dynamic> col, Id id, SummaryDataModel object) {
  object.id = id;
}

extension SummaryDataModelQueryWhereSort
    on QueryBuilder<SummaryDataModel, SummaryDataModel, QWhere> {
  QueryBuilder<SummaryDataModel, SummaryDataModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SummaryDataModelQueryWhere
    on QueryBuilder<SummaryDataModel, SummaryDataModel, QWhereClause> {
  QueryBuilder<SummaryDataModel, SummaryDataModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SummaryDataModel, SummaryDataModel, QAfterWhereClause>
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

  QueryBuilder<SummaryDataModel, SummaryDataModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SummaryDataModel, SummaryDataModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SummaryDataModel, SummaryDataModel, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SummaryDataModelQueryFilter
    on QueryBuilder<SummaryDataModel, SummaryDataModel, QFilterCondition> {
  QueryBuilder<SummaryDataModel, SummaryDataModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SummaryDataModel, SummaryDataModel, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SummaryDataModel, SummaryDataModel, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SummaryDataModel, SummaryDataModel, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SummaryDataModel, SummaryDataModel, QAfterFilterCondition>
      selectedModelEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'selectedModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SummaryDataModel, SummaryDataModel, QAfterFilterCondition>
      selectedModelGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'selectedModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SummaryDataModel, SummaryDataModel, QAfterFilterCondition>
      selectedModelLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'selectedModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SummaryDataModel, SummaryDataModel, QAfterFilterCondition>
      selectedModelBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'selectedModel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SummaryDataModel, SummaryDataModel, QAfterFilterCondition>
      selectedModelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'selectedModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SummaryDataModel, SummaryDataModel, QAfterFilterCondition>
      selectedModelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'selectedModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SummaryDataModel, SummaryDataModel, QAfterFilterCondition>
      selectedModelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'selectedModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SummaryDataModel, SummaryDataModel, QAfterFilterCondition>
      selectedModelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'selectedModel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SummaryDataModel, SummaryDataModel, QAfterFilterCondition>
      selectedModelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'selectedModel',
        value: '',
      ));
    });
  }

  QueryBuilder<SummaryDataModel, SummaryDataModel, QAfterFilterCondition>
      selectedModelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'selectedModel',
        value: '',
      ));
    });
  }

  QueryBuilder<SummaryDataModel, SummaryDataModel, QAfterFilterCondition>
      summaryTextEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'summaryText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SummaryDataModel, SummaryDataModel, QAfterFilterCondition>
      summaryTextGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'summaryText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SummaryDataModel, SummaryDataModel, QAfterFilterCondition>
      summaryTextLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'summaryText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SummaryDataModel, SummaryDataModel, QAfterFilterCondition>
      summaryTextBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'summaryText',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SummaryDataModel, SummaryDataModel, QAfterFilterCondition>
      summaryTextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'summaryText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SummaryDataModel, SummaryDataModel, QAfterFilterCondition>
      summaryTextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'summaryText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SummaryDataModel, SummaryDataModel, QAfterFilterCondition>
      summaryTextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'summaryText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SummaryDataModel, SummaryDataModel, QAfterFilterCondition>
      summaryTextMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'summaryText',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SummaryDataModel, SummaryDataModel, QAfterFilterCondition>
      summaryTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'summaryText',
        value: '',
      ));
    });
  }

  QueryBuilder<SummaryDataModel, SummaryDataModel, QAfterFilterCondition>
      summaryTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'summaryText',
        value: '',
      ));
    });
  }

  QueryBuilder<SummaryDataModel, SummaryDataModel, QAfterFilterCondition>
      videoUrlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'videoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SummaryDataModel, SummaryDataModel, QAfterFilterCondition>
      videoUrlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'videoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SummaryDataModel, SummaryDataModel, QAfterFilterCondition>
      videoUrlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'videoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SummaryDataModel, SummaryDataModel, QAfterFilterCondition>
      videoUrlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'videoUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SummaryDataModel, SummaryDataModel, QAfterFilterCondition>
      videoUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'videoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SummaryDataModel, SummaryDataModel, QAfterFilterCondition>
      videoUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'videoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SummaryDataModel, SummaryDataModel, QAfterFilterCondition>
      videoUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'videoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SummaryDataModel, SummaryDataModel, QAfterFilterCondition>
      videoUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'videoUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SummaryDataModel, SummaryDataModel, QAfterFilterCondition>
      videoUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'videoUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<SummaryDataModel, SummaryDataModel, QAfterFilterCondition>
      videoUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'videoUrl',
        value: '',
      ));
    });
  }
}

extension SummaryDataModelQueryObject
    on QueryBuilder<SummaryDataModel, SummaryDataModel, QFilterCondition> {}

extension SummaryDataModelQueryLinks
    on QueryBuilder<SummaryDataModel, SummaryDataModel, QFilterCondition> {}

extension SummaryDataModelQuerySortBy
    on QueryBuilder<SummaryDataModel, SummaryDataModel, QSortBy> {
  QueryBuilder<SummaryDataModel, SummaryDataModel, QAfterSortBy>
      sortBySelectedModel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedModel', Sort.asc);
    });
  }

  QueryBuilder<SummaryDataModel, SummaryDataModel, QAfterSortBy>
      sortBySelectedModelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedModel', Sort.desc);
    });
  }

  QueryBuilder<SummaryDataModel, SummaryDataModel, QAfterSortBy>
      sortBySummaryText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'summaryText', Sort.asc);
    });
  }

  QueryBuilder<SummaryDataModel, SummaryDataModel, QAfterSortBy>
      sortBySummaryTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'summaryText', Sort.desc);
    });
  }

  QueryBuilder<SummaryDataModel, SummaryDataModel, QAfterSortBy>
      sortByVideoUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'videoUrl', Sort.asc);
    });
  }

  QueryBuilder<SummaryDataModel, SummaryDataModel, QAfterSortBy>
      sortByVideoUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'videoUrl', Sort.desc);
    });
  }
}

extension SummaryDataModelQuerySortThenBy
    on QueryBuilder<SummaryDataModel, SummaryDataModel, QSortThenBy> {
  QueryBuilder<SummaryDataModel, SummaryDataModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SummaryDataModel, SummaryDataModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SummaryDataModel, SummaryDataModel, QAfterSortBy>
      thenBySelectedModel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedModel', Sort.asc);
    });
  }

  QueryBuilder<SummaryDataModel, SummaryDataModel, QAfterSortBy>
      thenBySelectedModelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedModel', Sort.desc);
    });
  }

  QueryBuilder<SummaryDataModel, SummaryDataModel, QAfterSortBy>
      thenBySummaryText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'summaryText', Sort.asc);
    });
  }

  QueryBuilder<SummaryDataModel, SummaryDataModel, QAfterSortBy>
      thenBySummaryTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'summaryText', Sort.desc);
    });
  }

  QueryBuilder<SummaryDataModel, SummaryDataModel, QAfterSortBy>
      thenByVideoUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'videoUrl', Sort.asc);
    });
  }

  QueryBuilder<SummaryDataModel, SummaryDataModel, QAfterSortBy>
      thenByVideoUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'videoUrl', Sort.desc);
    });
  }
}

extension SummaryDataModelQueryWhereDistinct
    on QueryBuilder<SummaryDataModel, SummaryDataModel, QDistinct> {
  QueryBuilder<SummaryDataModel, SummaryDataModel, QDistinct>
      distinctBySelectedModel({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'selectedModel',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SummaryDataModel, SummaryDataModel, QDistinct>
      distinctBySummaryText({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'summaryText', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SummaryDataModel, SummaryDataModel, QDistinct>
      distinctByVideoUrl({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'videoUrl', caseSensitive: caseSensitive);
    });
  }
}

extension SummaryDataModelQueryProperty
    on QueryBuilder<SummaryDataModel, SummaryDataModel, QQueryProperty> {
  QueryBuilder<SummaryDataModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SummaryDataModel, String, QQueryOperations>
      selectedModelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'selectedModel');
    });
  }

  QueryBuilder<SummaryDataModel, String, QQueryOperations>
      summaryTextProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'summaryText');
    });
  }

  QueryBuilder<SummaryDataModel, String, QQueryOperations> videoUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'videoUrl');
    });
  }
}
