class ValidatorItem {
  final void Function() onEmitError;
  final bool Function() onValidator;

  ValidatorItem({required this.onEmitError, required this.onValidator});
}
