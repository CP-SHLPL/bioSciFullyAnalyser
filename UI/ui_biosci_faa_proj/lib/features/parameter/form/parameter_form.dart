import 'package:reactive_forms/reactive_forms.dart';

class ParameterForm {
  final form = fb.group({
    'testID': FormControl<int>(
      value: 0,
      disabled: true,
      validators: [Validators.required],
    ),
    'testCode': FormControl<String>(
      value: '',
      disabled: true,
      validators: [Validators.required],
    ),
    'testName': FormControl<String>(
      value: '',
      disabled: false,
      validators: [Validators.required],
    ),
    'testUnit': FormControl<int>(
      value: 0,
      disabled: false,
      validators: [Validators.required],
    ),
    'reagents': FormControl<int>(
      value: 0,
      disabled: false,
      validators: [Validators.required, Validators.max(2), Validators.min(1)],
    ),
    'decimals': FormControl<int>(
      value: 0,
      disabled: false,
      validators: [Validators.required, Validators.max(4)],
    ),
    'direction': FormControl<int>(
      value: 0,
      disabled: false,
      validators: [Validators.required],
    ),
    'blankType': FormControl<int>(
      value: 0,
      disabled: false,
      validators: [Validators.required],
    ),
    'testMethod': FormControl<int>(
      value: 0,
      disabled: false,
      validators: [Validators.required],
    ),
    'primaryFilter': FormControl<int>(
      value: 0,
      disabled: false,
      validators: [Validators.required, Validators.min(1)],
    ),
    'secondaryFilter': FormControl<int>(
      value: 0,
      disabled: false,
      validators: [Validators.required],
    ),
    'incubationTime': FormControl<int>(
      value: 0,
      disabled: false,
      validators: [Validators.required],
    ),
    'readingTime': FormControl<int>(
      value: 0,
      disabled: false,
      validators: [Validators.required],
    ),
    'sampleVolume': FormControl<double>(
      value: 0,
      disabled: false,
      validators: [Validators.required],
    ),
    'r1Volume': FormControl<int>(
      value: 0,
      disabled: false,
      validators: [Validators.required],
    ),
    'r2Volume': FormControl<int>(
      value: 0,
      disabled: false,
      validators: [Validators.required],
    ),
    'autoDilutionRatio': FormControl<int>(
      value: 0,
      disabled: false,
      validators: [Validators.required],
    ),
    'stirrerSpeedSample': FormControl<int>(
      value: 0,
      disabled: false,
      validators: [Validators.required],
    ),
    'stirrerSpeedR2': FormControl<int>(
      value: 0,
      disabled: false,
      validators: [Validators.required],
    ),
    'lastReagentBlank': FormControl<double>(
      value: 0,
      disabled: true,
      validators: [Validators.required],
    ),
    'reagentBlankLow': FormControl<double>(
      value: 0,
      disabled: false,
      validators: [Validators.required],
    ),
    'reagentBlankHigh': FormControl<double>(
      value: 0,
      disabled: false,
      validators: [Validators.required],
    ),
    'corelationA': FormControl<double>(
      value: 0,
      disabled: false,
      validators: [Validators.required],
    ),
    'corelationB': FormControl<double>(
      value: 0,
      disabled: false,
      validators: [Validators.required],
    ),
    'linearity': FormControl<double>(
      value: 0,
      disabled: false,
      validators: [Validators.required],
    ),
    'substrateDepletion': FormControl<double>(
      value: 0,
      disabled: false,
      validators: [Validators.required],
    ),
  });

  void SetFormBehaviour() {
    form.control('reagents').valueChanges.listen((value) {
      final isTwoReagents = value == 2;
      final dependentControls = [
        form.control('r2Volume'),
        form.control('stirrerSpeedR2'),
      ];
      for (var control in dependentControls) {
        if (isTwoReagents) {
          control.markAsEnabled();
        } else {
          control.markAsDisabled();
          // control.value = 0;
        }
      }
    });

    form.control('testMethod').valueChanges.listen((value) {
      final methodValue = value;

      switch (methodValue) {
        case 1: //EndPoint
          form.control('substrateDepletion').value = 0.0;
          form.control('substrateDepletion').markAsDisabled();

          form.control('blankType').markAsEnabled();
          break;
        case 2: //Two=Point
        case 3: //Kinetic
          form.control('blankType').value = 1; // Reset As No Blank
          form.control('blankType').markAsDisabled();
          break;
      }
    });

    form.control('blankType').valueChanges.listen((value) {
      switch (value) {
        case 2: // For No blank this should be enabled.
          form.control('reagentBlankLow').markAsEnabled();
          form.control('reagentBlankHigh').markAsEnabled();
          break;
        case 1: //No Blank
        case 3: //Sample Blank
          form.control('reagentBlankLow').markAsDisabled();
          form.control('reagentBlankHigh').markAsDisabled();
      }
    });
  }

  FormGroup getForm() {
    SetFormBehaviour();
    return form;
  }
}
