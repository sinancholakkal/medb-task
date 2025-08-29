class ModuleModel {
  final int moduleId;
  final String moduleName;
  final int sortOrder;
  final String moduleIcon;
  final List<Menu> menus;

  ModuleModel({
    required this.moduleId,
    required this.moduleName,
    required this.sortOrder,
    required this.moduleIcon,
    required this.menus,
  });

  factory ModuleModel.fromJson(Map<String, dynamic> json) {
    return ModuleModel(
      moduleId: json['moduleId'] ?? 0,
      moduleName: json['moduleName'] ?? '',
      sortOrder: json['sortOrder'] ?? 0,
      moduleIcon: json['moduleIcon'] ?? '',
      menus: (json['menus'] as List<dynamic>?)
              ?.map((menu) => Menu.fromJson(menu))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'moduleId': moduleId,
      'moduleName': moduleName,
      'sortOrder': sortOrder,
      'moduleIcon': moduleIcon,
      'menus': menus.map((e) => e.toJson()).toList(),
    };
  }
}

class Menu {
  final int menuId;
  final String menuName;
  final int sortOrder;
  final String menuIcon;
  final String actionName;
  final String controllerName;
  final Map<String, dynamic> rights;

  Menu({
    required this.menuId,
    required this.menuName,
    required this.sortOrder,
    required this.menuIcon,
    required this.actionName,
    required this.controllerName,
    required this.rights,
  });

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(
      menuId: json['menuId'] ?? 0,
      menuName: json['menuName'] ?? '',
      sortOrder: json['sortOrder'] ?? 0,
      menuIcon: json['menuIcon'] ?? '',
      actionName: json['actionName'] ?? '',
      controllerName: json['controllerName'] ?? '',
      rights: json['rights'] ?? {},
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'menuId': menuId,
      'menuName': menuName,
      'sortOrder': sortOrder,
      'menuIcon': menuIcon,
      'actionName': actionName,
      'controllerName': controllerName,
      'rights': rights,
    };
  }
}
