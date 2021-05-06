enum ItemSelectionMode { none, single, multiple }

/// Manager for items selection
/// It stores various _options, selected items.
class ItemSelectionManager<T> {
  String title;
  List<T> _options;
  List<int> selectedOptionIndexes;

  // max items that can be selected
  int minSelections;

  // max items that can be selected
  int maxSelections;

  // initial selected item when there are options,
  // once options are available
  T initialSelectedItem;

  ItemSelectionManager(this.title, this._options,
      {List<int> selectedOptionIndexes,
      this.maxSelections = 1,
      this.minSelections = 1,
      this.initialSelectedItem,
      bool noSelectionAtStart = false}) {
    if (selectedOptionIndexes == null) {
      this.selectedOptionIndexes = [];
      if (maxSelections == 1 && minSelections > 0 && !noSelectionAtStart) {
        this.selectedOptionIndexes = [0];
      }
    } else {
      this.selectedOptionIndexes = []..addAll(selectedOptionIndexes);
    }
  }

  int get totalOptions => _options?.length ?? 0;

  @override
  String toString() {
    return "${selectedOption()}";
  }

  void toggleSelection(T option) {
    if (selectedOptions().contains(option)) {
      removeOption(option);
    } else {
      selectOption(option);
    }
  }

  void selectOption(T option) {
    if (_options != null) {
      int index = _options.indexOf(option);
      if (index > -1) selectedOptionIndex = index;
    }
  }

  void removeOption(T option) {
    removeSelectedOptionByIndex(options.indexOf(option));
  }

  void removeSelectedOptionByIndex(int index) {
    if (selectedOptions().length > minSelections) {
      if (selectedOptionIndexes.contains(index)) {
        selectedOptionIndexes.remove(index);
      }
    }
  }

  /// null if no item is selected
  T selectedOption() => (_options != null &&
          selectedOptionIndex != -1 &&
          _options.length > selectedOptionIndex)
      ? _options[selectedOptionIndex]
      : null;

  List<T> selectedOptions() =>
      selectedOptionIndexes.map((item) => options[item]).toList();

  /// return index of selected value
  /// -1 if no item is selected
  int get selectedOptionIndex =>
      selectedOptionIndexes.length > 0 ? selectedOptionIndexes[0] : -1;

  set selectedOptionIndex(int index) {
    if (selectedOptionIndexes == null) selectedOptionIndexes = [0];
    if (maxSelections == 1) {
      if (selectedOptionIndexes.length == 0)
        selectedOptionIndexes.add(index);
      else
        selectedOptionIndexes[0] = index;
    } else if (selectedOptionIndexes.length < maxSelections) {
      if (!selectedOptionIndexes.contains(index)) {
        selectedOptionIndexes.add(index);
      }
    }
  }

  List<T> get options => _options;

  set options(List<T> value) {
    if (value == null)
      _options = [];
    else {
      if (_options.isEmpty && value.isNotEmpty && initialSelectedItem != null) {
        _options = value;
        selectOption(initialSelectedItem);
      }
      _options = value;
    }
  }
}
