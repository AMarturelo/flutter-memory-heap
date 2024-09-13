import 'package:flutter/cupertino.dart';

class SecureTextEditingController extends TextEditingController {
  String _previousText = '';

  final String printableChars =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  final Map<int, int> obfuscationMap = {};
  final Map<int, int> deobfuscationMap = {};

  SecureTextEditingController() {
    _initializeMaps();
  }

  void _initializeMaps() {
    for (int i = 0; i < printableChars.length; i++) {
      obfuscationMap[printableChars.codeUnitAt(i)] =
          printableChars.codeUnitAt((i + 13) % printableChars.length);
      deobfuscationMap[
      printableChars.codeUnitAt((i + 13) % printableChars.length)] =
          printableChars.codeUnitAt(i);
    }
  }

  @override
  set value(TextEditingValue newValue) {
    final newText = newValue.text;

    final indices = _findDifferenceIndices(_previousText, newText);
    final startIndex = indices[0];
    final endIndex = indices[1];

    final changedSubstring = newText.substring(startIndex, endIndex);

    final obfuscatedSubstring = _obfuscate(changedSubstring);

    final obfuscatedText = newText.substring(0, startIndex) +
        obfuscatedSubstring +
        newText.substring(endIndex);

    _previousText = obfuscatedText;
    super.value =
        newValue.copyWith(text: obfuscatedText, selection: newValue.selection);
  }

  List<int> _findDifferenceIndices(String oldText, String newText) {
    int start = 0;
    int endOld = oldText.length;
    int endNew = newText.length;

    while (start < oldText.length &&
        start < newText.length &&
        oldText[start] == newText[start]) {
      start++;
    }

    while (endOld > start &&
        endNew > start &&
        oldText[endOld - 1] == newText[endNew - 1]) {
      endOld--;
      endNew--;
    }

    return [start, endNew];
  }

  @override
  set text(String newText) {
    value = value.copyWith(
      text: newText,
      selection: const TextSelection.collapsed(offset: -1),
      composing: TextRange.empty,
    );
  }

  @override
  String get text {
    return _deobfuscate(value.text);
  }

  String _obfuscate(String input) {
    List<int> result = input.codeUnits.map((char) {
      return obfuscationMap[char] ?? char;
    }).toList();
    return String.fromCharCodes(result);
  }

  String _deobfuscate(String input) {
    List<int> result = input.codeUnits.map((char) {
      return deobfuscationMap[char] ?? char;
    }).toList();
    return String.fromCharCodes(result);
  }

  @override
  TextSpan buildTextSpan(
      {required BuildContext context,
        TextStyle? style,
        required bool withComposing}) {
    final deobfuscatedText = text;
    return TextSpan(
      text: deobfuscatedText,
      style: style,
    );
  }
}
