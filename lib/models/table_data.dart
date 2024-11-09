class TableData {
  int? componentId;
  Component? component;
  int? viewId;
  View? view;
  String? kpiName;
  String? dimension;
  String? dimModule;
  int? top;
  bool? hasManageSettings;
  bool? enableChangeDimension;
  bool? enableKpiInfo;
  bool? enableDrillDown;
  bool? enableChangeKpi;
  bool? enableRelatedScreen;
  bool? enableAnalyze;
  bool? isChanged;
  List<KpiResultDtoForTable>? kpiResultDtoForTable;
  String? kpiAlias;
  String? otherKPIsAlias;

  TableData(
      {
        this.componentId,
        this.component,
        this.viewId,
        this.view,
        this.kpiName,
        this.dimension,
        this.dimModule,
        this.top,
        this.hasManageSettings,
        this.enableChangeDimension,
        this.enableKpiInfo,
        this.enableDrillDown,
        this.enableChangeKpi,
        this.enableRelatedScreen,
        this.enableAnalyze,
        this.isChanged,
        this.kpiResultDtoForTable,
        this.kpiAlias,
        this.otherKPIsAlias});

  TableData.fromJson(Map<String, dynamic> json) {
    componentId = json['componentId'];
    component = json['component'] != null
        ? new Component.fromJson(json['component'])
        : null;
    viewId = json['viewId'];
    view = json['view'] != null ? new View.fromJson(json['view']) : null;
    kpiName = json['kpiName'];
    dimension = json['dimension'];
    dimModule = json['dimModule'];
    top = json['top'];
    hasManageSettings = json['hasManageSettings'];
    enableChangeDimension = json['enableChangeDimension'];
    enableKpiInfo = json['enableKpiInfo'];
    enableDrillDown = json['enableDrillDown'];
    enableChangeKpi = json['enableChangeKpi'];
    enableRelatedScreen = json['enableRelatedScreen'];
    enableAnalyze = json['enableAnalyze'];
    isChanged = json['isChanged'];
    if (json['kpiResultDto'] != null) {
      kpiResultDtoForTable = <KpiResultDtoForTable>[];
      json['kpiResultDto'].forEach((v) {
        kpiResultDtoForTable!.add(new KpiResultDtoForTable.fromJson(v));
      });
    }
    kpiAlias = json['kpiAlias'];
    otherKPIsAlias = json['otherKPIsAlias'];
  }
}

class Component {
  int? componentId;
  String? componentName;
  String? description;
  bool? current;
  bool? lastValue;
  bool? lastMonth;
  bool? yesterday;
  bool? growth;
  bool? budget;
  bool? ranking;
  bool? vintage;
  bool? movement;
  bool? monthlyTrend;
  int? top;

  Component(
      {this.componentId,
        this.componentName,
        this.description,
        this.current,
        this.lastValue,
        this.lastMonth,
        this.yesterday,
        this.growth,
        this.budget,
        this.ranking,
        this.vintage,
        this.movement,
        this.monthlyTrend,
        this.top});

  Component.fromJson(Map<String, dynamic> json) {
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
    top = json['top'];
  }
}

class View {
  int? viewId;
  String? viewKeyName;
  int? moduleId;
  bool? hasMoreActions;
  bool? hasFilter;
  bool? hasGroup;
  String? dimModule;
  String? dimName;
  bool? hasDateFilter;
  bool? hasAI;

  View(
      {this.viewId,
        this.viewKeyName,
        this.moduleId,
        this.hasMoreActions,
        this.hasFilter,
        this.hasGroup,
        this.dimModule,
        this.dimName,
        this.hasDateFilter,
        this.hasAI});

  View.fromJson(Map<String, dynamic> json) {
    viewId = json['viewId'];
    viewKeyName = json['viewKeyName'];
    moduleId = json['moduleId'];
    hasMoreActions = json['hasMoreActions'];
    hasFilter = json['hasFilter'];
    hasGroup = json['hasGroup'];
    dimModule = json['dimModule'];
    dimName = json['dimName'];
    hasDateFilter = json['hasDateFilter'];
    hasAI = json['hasAI'];
  }
}

class KpiResultDtoForTable {
  List<Null>? data;
  DynamicGrid? dynamicGrid;
  int? current;
  String? kpiType;
  String? labelCurrentText;

  KpiResultDtoForTable(
      {this.data,
        this.dynamicGrid,
        this.current,
        this.kpiType,
        this.labelCurrentText,
      });

  KpiResultDtoForTable.fromJson(Map<String, dynamic> json) {
    dynamicGrid = json['dynamicGrid'] != null
        ? new DynamicGrid.fromJson(json['dynamicGrid'])
        : null;
    current = json['current'];
    kpiType = json['kpiType'];
    labelCurrentText = json['labelCurrentText'];
  }
}

class DynamicGrid {
  List<Columns>? columns;
  List<Raws>? raws;

  DynamicGrid({this.columns, this.raws});

  DynamicGrid.fromJson(Map<String, dynamic> json) {
    if (json['columns'] != null) {
      columns = <Columns>[];
      json['columns'].forEach((v) {
        columns!.add(new Columns.fromJson(v));
      });
    }
    if (json['raws'] != null) {
      raws = <Raws>[];
      json['raws'].forEach((v) {
        raws!.add(new Raws.fromJson(v));
      });
    }
  }
}

class Columns {
  String? name;
  String? title;
  String? type;
  double? sum;
  double? avg;
  double? min;
  double? max;
  bool? isKpi;
  bool? isHidden;

  Columns(
      {this.name,
        this.title,
        this.type,
        this.sum,
        this.avg,
        this.min,
        this.max,
        this.isKpi,
        this.isHidden,});

  Columns.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    title = json['title'];
    type = json['type'];
    sum = json['sum'];
    avg = json['avg'];
    min = json['min'];
    max = json['max'];
    isKpi = json['isKpi'];
    isHidden = json['isHidden'];
  }
}

class Raws {
  String? dimDesc;
  double? factCustomerLoanOutstandingBalancePBG;
  String? factCustomerLoanOutstandingBalancePBGColor;
  int? factCustomerLoanNumberOfLoansPBG;
  String? factCustomerLoanNumberOfLoansPBGColor;
  double? factCustomerLoanSalesLoansAmount;
  String? factCustomerLoanSalesLoansAmountColor;
  int? factCustomerLoanSalesLoansNumber;
  String? factCustomerLoanSalesLoansNumberColor;
  double? factCustomerLoanDelinquency90daysRatio;
  String? factCustomerLoanDelinquency90daysRatioColor;
  double? factCustomerLoanDelinquency90daysAmount;
  String? factCustomerLoanDelinquency90daysAmountColor;

  Raws(
      {this.dimDesc,
        this.factCustomerLoanOutstandingBalancePBG,
        this.factCustomerLoanOutstandingBalancePBGColor,
        this.factCustomerLoanNumberOfLoansPBG,
        this.factCustomerLoanNumberOfLoansPBGColor,
        this.factCustomerLoanSalesLoansAmount,
        this.factCustomerLoanSalesLoansAmountColor,
        this.factCustomerLoanSalesLoansNumber,
        this.factCustomerLoanSalesLoansNumberColor,
        this.factCustomerLoanDelinquency90daysRatio,
        this.factCustomerLoanDelinquency90daysRatioColor,
        this.factCustomerLoanDelinquency90daysAmount,
        this.factCustomerLoanDelinquency90daysAmountColor});

  Raws.fromJson(Map<String, dynamic> json) {
    dimDesc = json['dim_desc'] ?? "";
    factCustomerLoanOutstandingBalancePBG =
        json['fact_CustomerLoan_Outstanding_Balance_PBG'] ?? 0.0;
    factCustomerLoanOutstandingBalancePBGColor =
        json['fact_CustomerLoan_Outstanding_Balance_PBG_color'] ?? "";
    factCustomerLoanNumberOfLoansPBG =
        json['fact_CustomerLoan_Number_of_Loans_PBG'] ?? 0;
    factCustomerLoanNumberOfLoansPBGColor =
        json['fact_CustomerLoan_Number_of_Loans_PBG_color'] ?? "";
    factCustomerLoanSalesLoansAmount =
        json['fact_CustomerLoan_SalesLoansAmount'] ?? 0.0;
    factCustomerLoanSalesLoansAmountColor =
        json['fact_CustomerLoan_SalesLoansAmount_color'] ?? "";
    factCustomerLoanSalesLoansNumber =
        json['fact_CustomerLoan_SalesLoansNumber'] ?? 0;
    factCustomerLoanSalesLoansNumberColor =
        json['fact_CustomerLoan_SalesLoansNumber_color'] ?? "";
    factCustomerLoanDelinquency90daysRatio =
        json['fact_CustomerLoan_delinquency_90days_ratio'] ?? 0.0;
    factCustomerLoanDelinquency90daysRatioColor =
        json['fact_CustomerLoan_delinquency_90days_ratio_color'] ?? "";
    factCustomerLoanDelinquency90daysAmount =
        json['fact_CustomerLoan_delinquency_90days_Amount'] ?? 0.0;
    factCustomerLoanDelinquency90daysAmountColor =
        json['fact_CustomerLoan_delinquency_90days_Amount_color'] ?? "";
  }
}