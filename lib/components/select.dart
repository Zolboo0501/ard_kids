import 'package:ard_light/components/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Select extends StatelessWidget {
  final String? hintText;
  final String? errorMessage;
  final List<dynamic> options;
  final dynamic value;
  final void Function(dynamic) onChange;
  final String? label;
  final String? type;
  final String? Function(dynamic)? validator;

  bool get _isAccountType => type == 'account';

  const Select({
    super.key,
    this.hintText,
    this.errorMessage,
    required this.options,
    required this.value,
    required this.onChange,
    this.label,
    this.type,
    this.validator,
  });

  // Helper method to check if value is set
  bool _hasValue() {
    if (value == null) return false;
    if (value is String) return value.isNotEmpty;
    if (value is Map) return value.isNotEmpty;
    return true;
  }

  // Helper method to get display value for the selected item
  String _getDisplayValue() {
    if (!_hasValue()) return hintText ?? '';
    if (value is String) return value;
    if (value is Map<String, dynamic>) {
      return value['title'] ?? value['name'] ?? value.toString();
    }
    return value.toString();
  }

  // Helper method to extract display text from option
  String _getOptionText(dynamic option) {
    if (option is String) {
      return option;
    } else if (option is Map<String, dynamic>) {
      return option['title'] ?? option['name'] ?? option.toString();
    }
    return option.toString();
  }

  // Helper method to extract key from option
  String _getOptionKey(dynamic option) {
    if (option is String) {
      return option;
    } else if (option is Map<String, dynamic>) {
      return option['key'] ??
          option['id'] ??
          option['title'] ??
          option.toString();
    }
    return option.toString();
  }

  // Helper method to build leading widget
  Widget? _buildLeading(dynamic option, BuildContext context) {
    if (option is! Map<String, dynamic> || option['leading'] == null) {
      return null;
    }

    final String leadingPath = option['leading'];
    final bool isSvg = leadingPath.endsWith('.svg');

    return _buildLeadingContainer(
      context: context,
      child: isSvg
          ? SvgPicture.asset(
              leadingPath,
              width: 24,
              height: 24,
              fit: BoxFit.contain,
            )
          : Image.asset(
              leadingPath,
              width: 24,
              height: 24,
              fit: BoxFit.contain,
            ),
    );
  }

  Widget _buildLeadingContainer({
    required Widget child,
    required BuildContext context,
  }) {
    return Container(
      padding: const EdgeInsets.all(8),
      constraints: const BoxConstraints(maxWidth: 48, maxHeight: 48),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.onSurface),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(child: child),
      ),
    );
  }

  // Helper method to build subtitle (e.g., remaining balance)
  Widget? _buildSubTitle(dynamic option, BuildContext context) {
    if (option is! Map<String, dynamic> || option['remaining'] == null) {
      return null;
    }

    return TextView(
      text: '₮${option['remaining'].toStringAsFixed(2)}',
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).colorScheme.primary,
    );
  }

  Widget? _buildTrailing(dynamic option) {
    if (option is! Map<String, dynamic> || option['key'] == null) {
      return null;
    }

    return Radio<String>(
      value: option['key'],
      innerRadius: const WidgetStatePropertyAll<double>(6),
      fillColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.black;
        }
        return Colors.grey.shade400;
      }),
    );
  }

  Widget _renderAccount({
    required BuildContext context,
    required dynamic option,
    required bool isInteractive,
    FormFieldState<dynamic>? field,
  }) {
    final String? groupValue = value is Map<String, dynamic>
        ? value['key']
        : null;

    final listTile = ListTile(
      leading: _buildLeading(option, context),
      title: TextView(text: _getOptionText(option)),
      subtitle: _buildSubTitle(option, context),
      trailing: isInteractive ? _buildTrailing(option) : null,
      onTap: isInteractive
          ? () {
              onChange(option);
              field?.didChange(option);
              Navigator.pop(context);
            }
          : null,
    );

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: isInteractive
          ? RadioGroup(
              groupValue: groupValue,
              onChanged: (String? selectedValue) =>
                  onChange(_getOptionKey(option)),
              child: listTile,
            )
          : listTile,
    );
  }

  void showSelectModal(
    BuildContext context,
    FormFieldState<dynamic>? field,
  ) async {
    await showModalBottomSheet<dynamic>(
      context: context,
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      showDragHandle: true,
      builder: (BuildContext context) {
        return ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom + 10,
            left: 10,
            right: 10,
          ),
          itemCount: options.length,
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          itemBuilder: (context, index) =>
              _buildOptionItem(context, options[index], field),
        );
      },
    );
  }

  Widget _buildOptionItem(
    BuildContext context,
    dynamic option,
    FormFieldState<dynamic>? field,
  ) {
    if (_isAccountType) {
      return _renderAccount(
        context: context,
        option: option,
        isInteractive: true,
        field: field,
      );
    }

    return ListTile(
      title: Center(child: TextView(text: _getOptionText(option))),
      onTap: () {
        onChange(option);
        field?.didChange(option);
        Navigator.pop(context);
      },
    );
  }

  Widget _renderValue(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (_hasValue() && label != null)
          TextView(text: label!, fontSize: 14, fontWeight: FontWeight.w300),

        TextView(
          text: _getDisplayValue(),
          color: _hasValue() ? Colors.black : Theme.of(context).hintColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }

  Widget _renderAccountValue(BuildContext context) {
    if (_hasValue() && value is Map<String, dynamic>) {
      return _renderAccount(
        context: context,
        option: value,
        isInteractive: false,
      );
    }
    return _renderValue(context);
  }

  @override
  Widget build(BuildContext context) {
    return FormField<dynamic>(
      validator: validator,
      initialValue: value,
      builder: (FormFieldState<dynamic> field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                showSelectModal(context, field);
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: field.hasError
                        ? Theme.of(context).colorScheme.error
                        : Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: _isAccountType
                          ? _renderAccountValue(context)
                          : _renderValue(context),
                    ),
                    const Icon(Icons.keyboard_arrow_down, size: 32),
                  ],
                ),
              ),
            ),
            if (field.hasError)
              Padding(
                padding: const EdgeInsets.only(left: 12, top: 8),
                child: TextView(
                  text: field.errorText ?? '',
                  color: Theme.of(context).colorScheme.error,
                  fontSize: 12,
                ),
              ),
          ],
        );
      },
    );
  }
}
