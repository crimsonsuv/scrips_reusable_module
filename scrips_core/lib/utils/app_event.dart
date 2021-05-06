enum AppEventType {
  ok,
  save,
  cancel,
  add,
  delete,
  openDrawer,
  openEndDrawer,
  favourite,
  lab,
  medication,
  procedure,
  comment,
  custom,
  education,
  copy,
  copyPatientSummary,
  copyPE,
  copyHpi,
  update
}

class AppEvent<T> {
  AppEventType type;
  T data;

  AppEvent(this.type, this.data);

  AppEvent.type(AppEventType type) : this(type, null);
}
