import 'package:ard_light/components/bottom_sheet.dart';
import 'package:ard_light/components/input.dart';
import 'package:ard_light/components/text_view.dart';
import 'package:ard_light/core/utils/constants.dart';
import 'package:ard_light/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class Registerinput extends StatefulWidget {
  final String registerInput;
  final Function(String type, String value) onChange;
  final String? errorMessage;
  final bool showError;
  Registerinput({
    Key? key,
    required this.registerInput,
    required this.onChange,
    this.errorMessage,
    this.showError = false,
  }) : super(key: key);

  @override
  _RegisterinputState createState() => _RegisterinputState();
}

class _RegisterinputState extends State<Registerinput> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (widget.registerInput.isNotEmpty && widget.registerInput.length > 1) {
        widget.onChange("third", controller.text);
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () async {
                await CustomBottomSheet.show(
                  context: context,
                  child: BottomSheetLetter(
                    type: "first",
                    onChange: widget.onChange,
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: widget.showError
                      ? Border.all(
                          color: Theme.of(context).colorScheme.error,
                          width: 1,
                        )
                      : Border.all(
                          color: Theme.of(context).colorScheme.onSurface,
                          width: 1.5,
                        ),
                ),
                child: Center(
                  child: TextView(
                    text: widget.registerInput.isNotEmpty
                        ? widget.registerInput[0]
                        : "A",
                    color: widget.registerInput.isNotEmpty
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).hintColor,
                    fontSize: 16,
                    fontWeight: widget.registerInput.isNotEmpty
                        ? FontWeight.w500
                        : FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () async {
                await CustomBottomSheet.show(
                  context: context,
                  child: BottomSheetLetter(
                    type: "second",
                    onChange: widget.onChange,
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: widget.showError
                      ? Border.all(
                          color: Theme.of(context).colorScheme.error,
                          width: 1,
                        )
                      : Border.all(
                          color: Theme.of(context).colorScheme.onSurface,
                          width: 1.5,
                        ),
                ),
                child: Center(
                  child: TextView(
                    text: widget.registerInput.length > 1
                        ? widget.registerInput[1]
                        : "A",
                    color: widget.registerInput.length > 1
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).hintColor,
                    fontSize: 16,
                    fontWeight: widget.registerInput.length > 1
                        ? FontWeight.w500
                        : FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Input(
                controller: controller,
                hintText: AppLocalizations.of(context)!.validateRegisterHint,
                errorMessage: "",
                label: AppLocalizations.of(context)!.validateRegisterHint,
                isPhone: true,
                enabled: widget.registerInput.length >= 2,
                error: widget.showError,
              ),
            ),
          ],
        ),
        if (widget.showError &&
            widget.errorMessage != null &&
            widget.errorMessage!.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: TextView(
              text: widget.errorMessage!,
              fontSize: 12,
              color: Colors.red,
            ),
          ),
      ],
    );
  }
}

class BottomSheetLetter extends StatelessWidget {
  final String type;
  final Function(String type, String value) onChange;
  const BottomSheetLetter({
    Key? key,
    required this.type,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 0,
        bottom: MediaQuery.of(context).padding.bottom + 10,
        left: 15,
        right: 15,
      ),
      child: Wrap(
        spacing: 8.0,
        runSpacing: 4.0,
        children: [
          ...MongolianLetters.letters.map(
            (e) => LetterWidget(letter: e, type: type, onChange: onChange),
          ),
        ],
      ),
    );
  }
}

class LetterWidget extends StatelessWidget {
  final String letter;
  final String type;
  final Function(String type, String value) onChange;
  const LetterWidget({
    Key? key,
    required this.letter,
    required this.type,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChange(type, letter);
      },
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Theme.of(context).colorScheme.onSurface,
            width: 1.5,
          ),
        ),
        child: Center(
          child: TextView(
            text: letter,
            color: Theme.of(context).colorScheme.primary,

            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
