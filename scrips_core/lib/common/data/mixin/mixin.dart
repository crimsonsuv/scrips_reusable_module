mixin UniqueIdMixin {
  String get uniqueId => "";
}

mixin TitleMixin {
  String get title => "";
}

mixin DescriptionMixin {
  String get description => "";
}

mixin CodeMixin {
  String get displayCode => "";
}

mixin SearchableMixin {
  bool containQuery(String query) => false;
}

mixin PercentageMixin {
  String get displayPercentage => "";
}

mixin ModificationTrackerMixin {
  bool get isModified => false;
}
