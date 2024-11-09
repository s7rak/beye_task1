class KpiResult {
  late final int componentId;
  late final Component component;
  late final View view;
  late final List<KpiResultDto> kpiResultDto;

  KpiResult.fromJson(Map<String, dynamic> json){
    componentId = json['componentId'];
    component = Component.fromJson(json['component']);
    view = View.fromJson(json['view']);
    kpiResultDto = List.from(json['kpiResultDto']).map((e)=>KpiResultDto.fromJson(e)).toList();
  }
}

class Component {
  Component({
    required this.componentId,
    required this.componentName,
    required this.description,
    required this.current,
    required this.lastValue,
    required this.lastMonth,
    required this.yesterday,
    required this.growth,
    required this.budget,
    required this.ranking,
    required this.vintage,
    required this.movement,
    required this.monthlyTrend,
    this.top,
  });
  late final int componentId;
  late final String componentName;
  late final String description;
  late final bool current;
  late final bool lastValue;
  late final bool lastMonth;
  late final bool yesterday;
  late final bool growth;
  late final bool budget;
  late final bool ranking;
  late final bool vintage;
  late final bool movement;
  late final bool monthlyTrend;
  late final Null top;

  Component.fromJson(Map<String, dynamic> json){
    componentId = json['componentId'];
    componentName = json['componentName'];
    description = json['description'];
    current = json['current'];
    lastValue = json['lastValue'];
    lastMonth = json['lastMonth'];
    yesterday = json['yesterday'];
    growth = json['growth'];
    budget = json['budget'];
    ranking = json['ranking'];
    vintage = json['vintage'];
    movement = json['movement'];
    monthlyTrend = json['monthlyTrend'];
    top = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['componentId'] = componentId;
    _data['componentName'] = componentName;
    _data['description'] = description;
    _data['current'] = current;
    _data['lastValue'] = lastValue;
    _data['lastMonth'] = lastMonth;
    _data['yesterday'] = yesterday;
    _data['growth'] = growth;
    _data['budget'] = budget;
    _data['ranking'] = ranking;
    _data['vintage'] = vintage;
    _data['movement'] = movement;
    _data['monthlyTrend'] = monthlyTrend;
    _data['top'] = top;
    return _data;
  }
}

class View {
  View({
    required this.viewId,
    required this.viewKeyName,
    required this.moduleId,
    required this.module,
    required this.hasMoreActions,
    required this.hasFilter,
    required this.hasGroup,
    required this.dimModule,
    required this.dimName,
    required this.hasDateFilter,
    this.filterKey,
    this.fromDate,
    this.toDate,
    required this.hasAI,
  });
  late final int viewId;
  late final String viewKeyName;
  late final int moduleId;
  late final Module module;
  late final bool hasMoreActions;
  late final bool hasFilter;
  late final bool hasGroup;
  late final String dimModule;
  late final String dimName;
  late final bool hasDateFilter;
  late final Null filterKey;
  late final Null fromDate;
  late final Null toDate;
  late final bool hasAI;

  View.fromJson(Map<String, dynamic> json){
    viewId = json['viewId'];
    viewKeyName = json['viewKeyName'];
    moduleId = json['moduleId'];
    module = Module.fromJson(json['module']);
    hasMoreActions = json['hasMoreActions'];
    hasFilter = json['hasFilter'];
    hasGroup = json['hasGroup'];
    dimModule = json['dimModule'];
    dimName = json['dimName'];
    hasDateFilter = json['hasDateFilter'];
    filterKey = null;
    fromDate = null;
    toDate = null;
    hasAI = json['hasAI'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['viewId'] = viewId;
    _data['viewKeyName'] = viewKeyName;
    _data['moduleId'] = moduleId;
    _data['module'] = module.toJson();
    _data['hasMoreActions'] = hasMoreActions;
    _data['hasFilter'] = hasFilter;
    _data['hasGroup'] = hasGroup;
    _data['dimModule'] = dimModule;
    _data['dimName'] = dimName;
    _data['hasDateFilter'] = hasDateFilter;
    _data['filterKey'] = filterKey;
    _data['fromDate'] = fromDate;
    _data['toDate'] = toDate;
    _data['hasAI'] = hasAI;
    return _data;
  }
}

class Module {
  Module({
    required this.moduleId,
    this.moduleName,
    this.alias,
    this.moduleOrder,
    this.isHiddenInUI,
  });
  late final int moduleId;
  late final Null moduleName;
  late final Null alias;
  late final Null moduleOrder;
  late final Null isHiddenInUI;

  Module.fromJson(Map<String, dynamic> json){
    moduleId = json['moduleId'];
    moduleName = null;
    alias = null;
    moduleOrder = null;
    isHiddenInUI = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['moduleId'] = moduleId;
    _data['moduleName'] = moduleName;
    _data['alias'] = alias;
    _data['moduleOrder'] = moduleOrder;
    _data['isHiddenInUI'] = isHiddenInUI;
    return _data;
  }
}

class KpiResultDto {
  late final List<Data> data;
  late final double current;
  late final String kpiName;
  late final String kpiAlias;
  late final String kpiType;
  late final String labelCurrentText;
  late final bool isIncremental;
  late final String asOfDate;
  late final String fromDate;
  late final String toDate;

  KpiResultDto.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
    current = json['current'];
    kpiName = json['kpiName'];
    kpiAlias = json['kpiAlias'];
    kpiType = json['kpiType'];
    labelCurrentText = json['labelCurrentText'];
    isIncremental = json['isIncremental'];
    asOfDate = json['asOfDate'];
    fromDate = json['fromDate'];
    toDate = json['toDate'];
  }
}

class Data {
  Data({
    required this.kpiAlias,
    required this.total,
    required this.percentage,
    required this.date,
    this.dimDesc,
    this.keyValue,
    this.dimDesc1,
    required this.yearId,
    required this.monthId,
    this.qtrName,
    this.period,
    required this.kpiName,
    this.numerator,
    this.denominator,
    this.budget,
    this.budgetPer,
    this.balance,
  });
  late final String kpiAlias;
  late final double total;
  late final int percentage;
  late final String date;
  late final Null dimDesc;
  late final Null keyValue;
  late final Null dimDesc1;
  late final int yearId;
  late final int monthId;
  late final Null qtrName;
  late final Null period;
  late final String kpiName;
  late final Null numerator;
  late final Null denominator;
  late final int? budget;
  late final Null budgetPer;
  late final Null balance;

  Data.fromJson(Map<String, dynamic> json){
    kpiAlias = json['kpiAlias'];
    total = json['total'];
    percentage = json['percentage'];
    date = json['date'];
    dimDesc = null;
    keyValue = null;
    dimDesc1 = null;
    yearId = json['yearId'];
    monthId = json['monthId'];
    qtrName = null;
    period = null;
    kpiName = json['kpiName'];
    numerator = null;
    denominator = null;
    budget = null;
    budgetPer = null;
    balance = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['kpiAlias'] = kpiAlias;
    _data['total'] = total;
    _data['percentage'] = percentage;
    _data['date'] = date;
    _data['dimDesc'] = dimDesc;
    _data['keyValue'] = keyValue;
    _data['dimDesc1'] = dimDesc1;
    _data['yearId'] = yearId;
    _data['monthId'] = monthId;
    _data['qtrName'] = qtrName;
    _data['period'] = period;
    _data['kpiName'] = kpiName;
    _data['numerator'] = numerator;
    _data['denominator'] = denominator;
    _data['budget'] = budget;
    _data['budgetPer'] = budgetPer;
    _data['balance'] = balance;
    return _data;
  }
}