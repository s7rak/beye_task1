class KpiResult {
  final int componentViewId;
  final int? containerId;
  final int componentId;
  final Component component;
  final int viewId;
  final View view;
  final String kpiName;
  final String dimension;
  final String dimModule;
  final dynamic top;
  final String chartType;
  final bool hasManageSettings;
  final bool enableChangeDimension;
  final bool enableKpiInfo;
  final bool enableDrillDown;
  final bool enableChangeKpi;
  final bool enableRelatedScreen;
  final bool enableAnalyze;
  final dynamic color;
  final bool isChanged;
  final List<KpiResultDto> kpiResultDto;

  KpiResult({
    required this.componentViewId,
    this.containerId,
    required this.componentId,
    required this.component,
    required this.viewId,
    required this.view,
    required this.kpiName,
    required this.dimension,
    required this.dimModule,
    this.top,
    required this.chartType,
    required this.hasManageSettings,
    required this.enableChangeDimension,
    required this.enableKpiInfo,
    required this.enableDrillDown,
    required this.enableChangeKpi,
    required this.enableRelatedScreen,
    required this.enableAnalyze,
    this.color,
    required this.isChanged,
    required this.kpiResultDto,
  });

  factory KpiResult.fromJson(Map<String, dynamic> json) {
    return KpiResult(
      componentViewId: json['componentViewId'] ?? 0,
      containerId: json['containerId'],
      componentId: json['componentId'] ?? 0,
      component: Component.fromJson(json['component'] ?? {}),
      viewId: json['viewId'] ?? 0,
      view: View.fromJson(json['view'] ?? {}),
      kpiName: json['kpiName'] ?? '',
      dimension: json['dimension'] ?? '',
      dimModule: json['dimModule'] ?? '',
      top: json['top'],
      chartType: json['chartType'] ?? '',
      hasManageSettings: json['hasManageSettings'] ?? false,
      enableChangeDimension: json['enableChangeDimension'] ?? false,
      enableKpiInfo: json['enableKpiInfo'] ?? false,
      enableDrillDown: json['enableDrillDown'] ?? false,
      enableChangeKpi: json['enableChangeKpi'] ?? false,
      enableRelatedScreen: json['enableRelatedScreen'] ?? false,
      enableAnalyze: json['enableAnalyze'] ?? false,
      color: json['color'],
      isChanged: json['isChanged'] ?? false,
      kpiResultDto: (json['kpiResultDto'] as List?)
          ?.map((item) => KpiResultDto.fromJson(item ?? {}))
          .toList() ??
          [],
    );
  }
}

class Component {
  final int componentId;
  final String componentName;
  final String description;
  final bool current;
  final bool lastValue;
  final bool lastMonth;
  final bool yesterday;
  final bool growth;
  final bool budget;
  final bool ranking;
  final bool vintage;
  final bool movement;
  final bool monthlyTrend;
  final dynamic top;

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

  factory Component.fromJson(Map<String, dynamic> json) {
    return Component(
      componentId: json['componentId'] ?? 0,
      componentName: json['componentName'] ?? '',
      description: json['description'] ?? '',
      current: json['current'] ?? false,
      lastValue: json['lastValue'] ?? false,
      lastMonth: json['lastMonth'] ?? false,
      yesterday: json['yesterday'] ?? false,
      growth: json['growth'] ?? false,
      budget: json['budget'] ?? false,
      ranking: json['ranking'] ?? false,
      vintage: json['vintage'] ?? false,
      movement: json['movement'] ?? false,
      monthlyTrend: json['monthlyTrend'] ?? false,
      top: json['top'],
    );
  }
}

class View {
  final int viewId;
  final String viewKeyName;
  final int moduleId;
  final Module module;
  final bool hasMoreActions;
  final bool hasFilter;
  final bool hasGroup;
  final String dimModule;
  final String dimName;
  final bool hasDateFilter;
  final dynamic filterKey;
  final dynamic fromDate;
  final dynamic toDate;
  final bool hasAI;

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

  factory View.fromJson(Map<String, dynamic> json) {
    return View(
      viewId: json['viewId'] ?? 0,
      viewKeyName: json['viewKeyName'] ?? '',
      moduleId: json['moduleId'] ?? 0,
      module: Module.fromJson(json['module'] ?? {}),
      hasMoreActions: json['hasMoreActions'] ?? false,
      hasFilter: json['hasFilter'] ?? false,
      hasGroup: json['hasGroup'] ?? false,
      dimModule: json['dimModule'] ?? '',
      dimName: json['dimName'] ?? '',
      hasDateFilter: json['hasDateFilter'] ?? false,
      filterKey: json['filterKey'],
      fromDate: json['fromDate'],
      toDate: json['toDate'],
      hasAI: json['hasAI'] ?? false,
    );
  }
}

class Module {
  final int moduleId;
  final String? moduleName;
  final String? alias;
  final dynamic moduleOrder;
  final bool? isHiddenInUI;

  Module({
    required this.moduleId,
    this.moduleName,
    this.alias,
    this.moduleOrder,
    this.isHiddenInUI,
  });

  factory Module.fromJson(Map<String, dynamic> json) {
    return Module(
      moduleId: json['moduleId'] ?? 0,
      moduleName: json['moduleName'],
      alias: json['alias'],
      moduleOrder: json['moduleOrder'],
      isHiddenInUI: json['isHiddenInUI'],
    );
  }
}

class KpiResultDto {
  final String kpiAlias;
  final double total;
  final double percentage;
  final String date;
  final dynamic dimDesc;
  final dynamic keyValue;
  final dynamic dimDesc1;
  final int yearId;
  final int monthId;
  final dynamic qtrName;
  final dynamic period;
  final String kpiName;
  final dynamic numerator;
  final dynamic denominator;
  final dynamic budget;
  final dynamic budgetPer;
  final dynamic balance;

  KpiResultDto({
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

  factory KpiResultDto.fromJson(Map<String, dynamic> json) {
    return KpiResultDto(
      kpiAlias: json['kpiAlias'] ?? '',
      total: json['total']?.toDouble() ?? 0.0,
      percentage: json['percentage']?.toDouble() ?? 0.0,
      date: json['date'] ?? '',
      dimDesc: json['dimDesc'],
      keyValue: json['keyValue'],
      dimDesc1: json['dimDesc1'],
      yearId: json['yearId'] ?? 0,
      monthId: json['monthId'] ?? 0,
      qtrName: json['qtrName'],
      period: json['period'],
      kpiName: json['kpiName'] ?? '',
      numerator: json['numerator'],
      denominator: json['denominator'],
      budget: json['budget'],
      budgetPer: json['budgetPer'],
      balance: json['balance'],
    );
  }
}
