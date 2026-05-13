import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:ui_biosci_faa_proj/core/notifiers/drop_down_notifier.dart';
import 'package:ui_biosci_faa_proj/core/notifiers/test_card_notifier.dart';
import 'package:ui_biosci_faa_proj/core/shared_models/drop_downs_memory.dart';
import 'package:ui_biosci_faa_proj/core/widgets/MyReactiveDropDown.dart';
import 'package:ui_biosci_faa_proj/core/widgets/MyReactiveTextField.dart';
import 'package:ui_biosci_faa_proj/core/widgets/custom_table.dart';
import 'package:ui_biosci_faa_proj/features/test/data/test_service_provider.dart';
import 'package:ui_biosci_faa_proj/features/test/form/parameter_form.dart';
import 'package:ui_biosci_faa_proj/generated/test/test.pb.dart';
import 'package:ui_biosci_faa_proj/generated/test/test.pbjson.dart';
import '../data/reference_range.dart';
import 'reference_range_form_dialog.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditParameter extends ConsumerStatefulWidget {
  final testID;

  const EditParameter(this.testID, {super.key});

  @override
  ConsumerState<EditParameter> createState() => _EditParameterState();
}

class _EditParameterState extends ConsumerState<EditParameter> {
  // List to hold reference ranges
  List<ReferenceRange> referenceRanges = [
    ReferenceRange(
      gender: 'Male',
      ageStart: '0',
      ageEnd: '10',
      ageUnit: 'Years',
      value: '5-10',
    ),
    ReferenceRange(
      gender: 'Female',
      ageStart: '11',
      ageEnd: '20',
      ageUnit: 'Years',
      value: '10-15',
    ),
  ]; // Ensure initialization as an empty list
  // 1. Define the nested Form Data Tree
  late FormGroup form;
  bool isEditing = false; // Add isEditing state
  bool isLoading = true; // Add loading state
  List<DropDownListItem> blankTypeDropDown = [];
  List<DropDownListItem> methodDropDown = [];
  List<DropDownListItem> filterDropDown = [
    DropDownListItem(value: 0, text: '--'),
  ];
  List<DropDownListItem> unitDropDown = [
    DropDownListItem(value: 0, text: '--'),
  ];
  List<DropDownListItem> directionDropDown = [];
  List<DropDownListItem> stirrerSpeedDropDown = [];

  Future<void> _fetchDropDowns() async {
    // final testService = ref.read(testServiceProvider);
    // final response = await testService.getAllDropDowns(DropDownRequest());
    // setState(() {
    //   blankTypeDropDown.addAll(
    //     dropDownsMemory.blankTypes,
    //   );
    //   methodDropDown.addAll(
    //     dropDownsMemory.methods
    //   );
    //   filterDropDown.addAll(
    //     // response.dropDowns['Filter']?.items as List<DropDownListItem>,
    //     dropDownsMemory.filters
    //   );
    //   unitDropDown.addAll(
    //     dropDownsMemory.units
    //     // response.dropDowns['Unit']?.items as List<DropDownListItem>,
    //   );
    //   directionDropDown.addAll(
    //     dropDownsMemory.directions
    //     // response.dropDowns['ReactionDirection']?.items
    //     // as List<DropDownListItem>,
    //   );
    //   stirrerSpeedDropDown.addAll(
    //     // response.dropDowns['StirrerSpeed']?.items as List<DropDownListItem>,
    //     dropDownsMemory.stirrerSpeeds
    //   );
    // });
  }

  TextStyle get uniformStyle =>
      Theme.of(context).textTheme.bodyMedium ?? const TextStyle(fontSize: 16);

  Future<void> _fetchParameterData() async {
    // Simulate fetching data from gRPC and populating the form
    // await Future.delayed(const Duration(seconds: 1)); // Simulate network delay

    // Example of how you might populate the form with fetched data:
    final testService = ref.read(testServiceProvider);

    final request = TestRequest()..testID = widget.testID;
    final testResponse = await testService.getTest(
      request,
    ); // Replace with actual request parameters
    final response = testResponse.test;
    form.control('testID').value = response.testID;
    form.control('testCode').value = response.testCode;
    form.control('testName').value = response.testName;
    form.control('testCode').value = response.testCode;
    form.control('testUnit').value = response.testUnit;
    form.control('reagents').value = response.reagents;
    form.control('blankType').value = response.blankType;
    form.control('testMethod').value = response.testMethod;
    form.control('primaryFilter').value = response.primaryFilter;
    form.control('secondaryFilter').value = response.secondaryFilter;
    form.control('decimals').value = response.decimals;
    form.control('incubationTime').value = response.incubationTime;
    form.control('readingTime').value = response.readingTime;
    form.control('sampleVolume').value = response.sampleVolume;
    form.control('r1Volume').value = response.r1Volume;
    form.control('r2Volume').value = response.r2Volume;
    form.control('autoDilutionRatio').value = response.autoDilutionRatio;
    form.control('stirrerSpeedSample').value = response.stirrerSpeedSample;
    form.control('stirrerSpeedR2').value = response.stirrerSpeedR2;
    form.control('lastReagentBlank').value = response.lastReagentBlank;
    form.control('reagentBlankLow').value = response.reagentBlankLow;
    form.control('reagentBlankHigh').value = response.reagentBlankHigh;
    form.control('corelationA').value = response.corelationA;
    form.control('corelationB').value = response.corelationB;
    form.control('direction').value = response.direction;
    form.control('linearity').value = response.linearity;
    form.control('substrateDepletion').value = response.substrateDepletion;
    // form.control('runSpecs.extraRun1').value = response.runSpecs.extraRun1;
    // form.control('runSpecs.extraRun2').value = response.runSpecs.extraRun2;

    // Populate referenceRanges list from response
    // referenceRanges = response.referenceRanges.map((range) => ReferenceRange(
    // Set loading to false after data is fetched
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    isLoading = true; // Start in loading state
    _fetchDropDowns();
    form = ParameterForm().getForm();
    _fetchParameterData();
  }

  void _initializeReferenceRanges() {
    final referenceRangesArray = form.control('referenceRanges') as FormArray;
    for (var range in referenceRanges) {
      referenceRangesArray.add(
        fb.group({
          'gender': FormControl<String>(value: range.gender),
          'ageStart': FormControl<String>(value: range.ageStart),
          'ageEnd': FormControl<String>(value: range.ageEnd),
          'ageUnit': FormControl<String>(value: range.ageUnit),
          'value': FormControl<String>(value: range.value),
        }),
      );
    }
  }

  void _addReferenceRange(ReferenceRange range) {
    setState(() {
      referenceRanges.add(range);
      final referenceRangesArray = form.control('referenceRanges') as FormArray;
      referenceRangesArray.add(
        fb.group({
          'gender': FormControl<String>(value: range.gender),
          'ageStart': FormControl<String>(value: range.ageStart),
          'ageEnd': FormControl<String>(value: range.ageEnd),
          'ageUnit': FormControl<String>(value: range.ageUnit),
          'value': FormControl<String>(value: range.value),
        }),
      );
    });
  }

  void _toggleEditing() {
    setState(() {
      isEditing = !isEditing;
    });
  }

  void _clearForm() {
    form.reset(
      value: {
        'testID': 0,
        'testCode': '',
        'testName': '',
        'testUnit': 0,
        'reagents': 1,
        'decimals': 0, // Very important! Keeps it as an int, not null.
        'blankType': 0,
        'primaryFilter': 1,
        'secondaryFilter': 0,
        'lastReagentBlank': 0.0,
        'reagentBlankLow': 0.0,
        'reagentBlankHigh': 0.0,
      },
    );

    // 2. Enable fields that might have been disabled during editing
    // (Assuming a new entry requires the user to type a new test code and use dropdowns)
    form.control('testCode').markAsEnabled();
    form.control('lastReagentBlank').value = 0.0;
    form.control('lastReagentBlank').markAsDisabled();
    setState(() {
      isEditing = true;
    });
  }

  void _submitForm() async {
    // 1. Get the entire form structure as a JSON-like Map
    final formValues = form.rawValue as Map<String, dynamic>? ?? {};

    final testData = TestData()..mergeFromProto3Json(formValues);

    final testResponseData = new TestResponse()
      ..requestSuccess = true
      ..test = testData;

    final testService = ref.read(testServiceProvider);
    testService.updateTest(testResponseData).then((response) {
      final mes = response.message;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(response.message),
          behavior: SnackBarBehavior.floating,
          // Makes it float above the bottom edge
          duration: Duration(
            seconds: 2,
          ), // Controls how long it stays on screen
        ),
      );

      ref.read(allTestProvider.notifier).addTestLocally(response.newTest);
    });
  }

  @override
  Widget build(BuildContext context) {
    final dropDownsMemory = ref.watch(dropdownMemoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: isLoading
            ? const Text('Loading...')
            : Text(form.control('testName').value),
        actions: [
          IconButton(icon: Icon(Icons.add_box_outlined), onPressed: _clearForm),
          IconButton(
            icon: Icon(isEditing ? Icons.lock_open : Icons.lock),
            onPressed: _toggleEditing,
          ),
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(),
            color: Colors.red,
          ),
        ],
      ),
      body: ReactiveForm(
        formGroup: form,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 800, maxWidth: 2000),
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                _buildKitDetailsGroup(dropDownsMemory),
                const SizedBox(height: 16),
                _buildRunSpecsGroup(dropDownsMemory),
                const SizedBox(height: 16),
                // _buildReferenceRangesGroup(),
                const SizedBox(height: 32),
                Row(
                  children: [
                    Spacer(flex: 1),
                    ReactiveFormConsumer(
                      builder: (context, formGroup, child) {
                        final canSubmit =
                            formGroup.valid && isEditing && form.dirty;
                        if (!form.valid) {
                          print('--- FORM VALIDATION ERRORS ---');
                          form.controls.forEach((key, control) {
                            if (control.invalid) {
                              print(
                                'Field "$key" is INVALID. Reason: ${control.errors}',
                              );
                            }
                          });
                          print('------------------------------');
                        }
                        return ElevatedButton(
                          onPressed: canSubmit
                              ? () {
                                  if (form.valid) {
                                    _submitForm();
                                  } else {
                                    form.markAllAsTouched();
                                  }
                                }
                              : null, // Disable submit button if not editing
                          child: const Text('Submit Form'),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- UI GROUP 1: Kit Details ---
  Widget _buildKitDetailsGroup(DropDownsMemory dropDowns) {
    return Card(
      elevation: 10,
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: isLoading
              ? [const CircularProgressIndicator()]
              : [
                  Text(
                    'Kit Details',
                    style:
                        Theme.of(context).textTheme.headlineMedium ??
                        TextStyle(fontSize: 4),
                  ),
                  const Divider(),
                  Row(
                    children: [
                      Expanded(
                        flex: 10,
                        child: MyReactiveTextField(
                          formControlName: 'testCode',
                          labelText: 'Test Code',
                          isEditable: !isEditing,
                        ),
                      ),
                      Spacer(flex: 1),
                      Expanded(
                        flex: 10,
                        child: MyReactiveTextField(
                          formControlName: 'testName',
                          labelText: 'Test Name',
                          isEditable: !isEditing,
                          toolTipMessage: 'This is tooltip for testname',
                          prefixIcon: Icon(
                            Icons.drive_file_rename_outline_rounded,
                          ),
                        ),
                      ),
                      Spacer(flex: 1),
                      Expanded(
                        flex: 10,
                        child: MyReactiveDropDown(
                          formControlName: 'testUnit',
                          labelText: 'Units',
                          isEditable: !isEditing,
                          dropDownItems: dropDowns.units,
                          prefixIcon: Icon(Icons.scale),
                        ),
                      ),
                      Spacer(flex: 1),
                      Expanded(
                        flex: 10,
                        child: MyReactiveTextField(
                          formControlName: 'reagents',
                          labelText: 'Reagent',
                          isEditable: !isEditing,
                          prefixIcon: Icon(Icons.science_outlined),
                        ),
                      ),
                      Spacer(flex: 1),
                      Expanded(
                        flex: 10,
                        child: MyReactiveTextField(
                          formControlName: 'decimals',
                          labelText: 'decimals',
                          isEditable: !isEditing,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        flex: 10,
                        child: MyReactiveDropDown(
                          formControlName: 'testMethod',
                          labelText: 'Test Method',
                          isEditable: !isEditing,
                          dropDownItems: dropDowns.methods,
                        ),
                      ),
                      Spacer(flex: 1),
                      Expanded(
                        flex: 10,
                        child: MyReactiveDropDown(
                          formControlName: 'blankType',
                          labelText: 'Blank Type',
                          isEditable: !isEditing,
                          dropDownItems: dropDowns.blankTypes,
                        ),
                      ),
                      Spacer(flex: 1),
                      Expanded(
                        flex: 10,
                        child: MyReactiveDropDown(
                          formControlName: 'direction',
                          labelText: 'Reaction Direction',
                          isEditable: !isEditing,
                          dropDownItems: dropDowns.directions,
                        ),
                      ),
                      Spacer(flex: 1),
                      Expanded(
                        flex: 10,
                        child: MyReactiveTextField<double>(
                          formControlName: 'linearity',
                          isEditable: !isEditing,
                          labelText: 'Linearity',
                        ),
                      ),
                      Spacer(flex: 1),
                      Expanded(
                        flex: 10,
                        child: MyReactiveTextField<double>(
                          formControlName: 'substrateDepletion',
                          labelText: 'Substrate Depletion',
                          isEditable: !isEditing,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 10,
                        child: MyReactiveTextField<double>(
                          formControlName: 'reagentBlankLow',
                          isEditable: !isEditing,
                          labelText: 'Reagent Blank Low',
                        ),
                      ),
                      Spacer(flex: 1),
                      Expanded(
                        flex: 10,
                        child: MyReactiveTextField<double>(
                          formControlName: 'reagentBlankHigh',
                          labelText: 'Reagent Blank High',
                          isEditable: !isEditing,
                        ),
                      ),
                      Spacer(flex: 1),
                      Expanded(
                        flex: 10,
                        child: MyReactiveTextField<double>(
                          formControlName: 'lastReagentBlank',
                          labelText: 'Last Reagent Blank',
                          isEditable: !isEditing,
                          valueAccessor: DoubleValueAccessor(fractionDigits: 4),
                        ),
                      ),
                    ],
                  ),
                ],
        ),
      ),
    );
  }

  // --- UI GROUP 2: Run Specs ---
  Widget _buildRunSpecsGroup(DropDownsMemory dropDowns) {
    return Card(
      elevation: 10,
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: isLoading
              ? [const CircularProgressIndicator()]
              : [
                  Text(
                    "Run Specifications",
                    style:
                        Theme.of(context).textTheme.headlineMedium ??
                        TextStyle(fontSize: 4),
                  ),
                  const Divider(),
                  Row(
                    children: [
                      Expanded(
                        flex: 10,
                        child: MyReactiveDropDown(
                          formControlName: 'primaryFilter',
                          labelText: 'Primary Filter',
                          isEditable: !isEditing,
                          dropDownItems: dropDowns.filters,
                          validationMessages: {
                            'required': (error) => 'This field is required',
                            'min': (error) =>
                                'Primary Filter must be at least 340',
                          },
                        ),
                      ),
                      Spacer(flex: 1),
                      Expanded(
                        flex: 10,
                        child: MyReactiveDropDown(
                          formControlName: 'secondaryFilter',
                          labelText: 'Secondary Filter',
                          isEditable: !isEditing,
                          dropDownItems: dropDowns.filters,
                        ),
                      ),
                      Spacer(flex: 1),
                      Expanded(
                        flex: 10,
                        child: MyReactiveTextField<int>(
                          formControlName: 'incubationTime',
                          labelText: 'Incubation Time',
                          isEditable: !isEditing,
                        ),
                      ),
                      Spacer(flex: 1),
                      Expanded(
                        flex: 10,
                        child: MyReactiveTextField<int>(
                          formControlName: 'readingTime',
                          labelText: 'Reading Time',
                          isEditable: !isEditing,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        flex: 10,
                        child: MyReactiveTextField<int>(
                          formControlName: 'r1Volume',
                          labelText: 'R1 Volume',
                          isEditable: !isEditing,
                        ),
                      ),
                      Spacer(flex: 1),
                      Expanded(
                        flex: 10,
                        child: MyReactiveTextField<int>(
                          formControlName: 'r2Volume',
                          labelText: 'R2 Volume',
                          isEditable: !isEditing,
                        ),
                      ),
                      Spacer(flex: 1),
                      Expanded(
                        flex: 10,
                        child: MyReactiveTextField<double>(
                          formControlName: 'sampleVolume',
                          labelText: 'Sample Volume',
                          isEditable: !isEditing,
                        ),
                      ),
                      Spacer(flex: 1),
                      Expanded(
                        flex: 10,
                        child: MyReactiveTextField<int>(
                          formControlName: 'autoDilutionRatio',
                          labelText: 'Auto Dilution Ratio',
                          isEditable: !isEditing,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        flex: 10,
                        child: MyReactiveDropDown(
                          formControlName: 'stirrerSpeedSample',
                          labelText: 'Stirrer Speed Sample',
                          isEditable: !isEditing,
                          dropDownItems: dropDowns.stirrerSpeeds,
                        ),
                      ),
                      Spacer(flex: 1),
                      Expanded(
                        flex: 10,
                        child: MyReactiveDropDown(
                          formControlName: 'stirrerSpeedR2',
                          labelText: 'Stirrer Speed R2',
                          isEditable: !isEditing,
                          dropDownItems: dropDowns.stirrerSpeeds,
                        ),
                      ),
                      Spacer(flex: 1),
                      Expanded(
                        flex: 10,
                        child: MyReactiveTextField<double>(
                          formControlName: 'corelationA',
                          labelText: 'Corelation A',
                          isEditable: !isEditing,
                        ),
                      ),
                      Spacer(flex: 1),
                      Expanded(
                        flex: 10,
                        child: MyReactiveTextField<double>(
                          formControlName: 'corelationB',
                          labelText: 'Corelation B',
                          isEditable: !isEditing,
                        ),
                      ),
                    ],
                  ),
                ],
        ),
      ),
    );
  }

  // --- UI GROUP 3: Reference Ranges ---
  Widget _buildReferenceRangesGroup() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Reference Ranges',
                  style:
                      Theme.of(context).textTheme.bodyMedium ??
                      TextStyle(fontSize: 19),
                ),
                const Spacer(),
                ElevatedButton.icon(
                  onPressed: isEditing
                      ? () async {
                          final newRange = await showDialog<ReferenceRange>(
                            context: context,
                            builder: (_) => ReferenceRangeFormDialog(),
                          );
                          if (newRange != null) {
                            _addReferenceRange(newRange);
                          }
                        }
                      : null, // Disable button when not editing
                  label: const Text('Add Reference Range'),
                  icon: const Icon(Icons.add_circle_outline),
                ),
              ],
            ),
            const Divider(),
            // Reusable Data Table for reference ranges
            SizedBox(
              height: 300,
              // Provides a bounded height for PlutoGrid inside the ListView
              child: ReusableDataTable(
                columns: [
                  PlutoColumn(
                    title: 'Gender',
                    field: 'gender',
                    type: PlutoColumnType.text(),
                  ),
                  PlutoColumn(
                    title: 'Age Range',
                    field: 'ageRange',
                    type: PlutoColumnType.text(),
                  ),
                  PlutoColumn(
                    title: 'Reference Range',
                    field: 'value',
                    type: PlutoColumnType.text(),
                  ),
                ],

                rows: referenceRanges.map((range) {
                  return PlutoRow(
                    cells: {
                      'gender': PlutoCell(value: range.gender),
                      'ageRange': PlutoCell(
                        value:
                            '${range.ageStart} - ${range.ageEnd} ${range.ageUnit}',
                      ),
                      'value': PlutoCell(value: range.value),
                      'delete': PlutoCell(
                        value: 1,
                      ), // Dummy cell for delete button
                    },
                  );
                }).toList(),
                onDeletePressed: isEditing ? _deletePopupBuilder() : null,
                showFilter: false,
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  PopupBuilder _deletePopupBuilder() {
    return (
      BuildContext context,
      PlutoRow row,
      PlutoGridStateManager stateManager,
    ) {
      return AlertDialog(
        title: const Text('Confirm Delete'),
        content: const Text(
          'Are you sure you want to delete this reference range?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              // Find the index of the row to be removed from the grid's state.
              final rowIdx = stateManager.rows.indexOf(row);
              if (rowIdx != -1) {
                setState(() {
                  // 1. Remove from the local list that builds the table UI.
                  // This is the crucial step to make the UI update.
                  referenceRanges.removeAt(rowIdx);

                  // 2. Also remove the corresponding group from the reactive form array.
                  final referenceRangesArray =
                      form.control('referenceRanges') as FormArray;
                  referenceRangesArray.removeAt(rowIdx);
                });
              }

              Navigator.of(context).pop();
            },
            child: const Text('Delete'),
          ),
        ],
      );
    };
  }
}
