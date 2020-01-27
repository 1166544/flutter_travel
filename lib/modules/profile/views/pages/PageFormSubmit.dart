import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';  

/// 表单提交
class PageFormSubmit extends StatefulWidget {    
	@override    
	_PageFormSubmitState createState() => _PageFormSubmitState();    
}    
     
class _PageFormSubmitState extends State<PageFormSubmit> {    
	var data;    
	bool autoValidate = true;    
	bool readOnly = false;    
	bool showSegmentedControl = true;    
	final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();    
     
 	@override    
	Widget build(BuildContext context) {    
		return Scaffold(    
			appBar: AppBar(    
			title: Text("Flutter Form Validation"),    
			),    
			body: Padding(    
			padding: EdgeInsets.all(10),    
			child: SingleChildScrollView(    
				child: Column(    
				children: <Widget>[    
					FormBuilder(    
					key: _fbKey,    
					initialValue: {    
						'date': DateTime.now(),    
						'accept_terms': false,    
					},    
					autovalidate: true,    
					child: Column(    
						children: <Widget>[    
						FormBuilderTextField(    
							attribute: 'text',    
							validators: [FormBuilderValidators.required()],    
							decoration: InputDecoration(labelText: "Full Name"),    
						),    
						FormBuilderDateTimePicker(    
							attribute: "date",    
							inputType: InputType.date,    
							validators: [FormBuilderValidators.required()],    
							format: DateFormat("dd-MM-yyyy"),    
							decoration: InputDecoration(labelText: "Date of Birth"),    
						),    
						FormBuilderDropdown(    
							attribute: "gender",    
							decoration: InputDecoration(labelText: "Gender"),    
							// initialValue: 'Male',    
							hint: Text('Select Gender'),    
							validators: [FormBuilderValidators.required()],    
							items: ['Male', 'Female', 'Other']    
								.map((gender) => DropdownMenuItem(    
									value: gender, child: Text("$gender")))    
								.toList(),    
						),    
						FormBuilderTextField(    
							attribute: "age",    
							decoration: InputDecoration(labelText: "Age"),    
							keyboardType: TextInputType.number,    
							validators: [    
							FormBuilderValidators.numeric(),    
							FormBuilderValidators.max(70),    
							],    
						),    
						FormBuilderSlider(    
							attribute: "slider",    
							validators: [FormBuilderValidators.min(6)],    
							min: 0.0,    
							max: 10.0,    
							initialValue: 1.0,    
							divisions: 20,    
							decoration: InputDecoration(    
								labelText: "Number of Family Members"),    
						),    
						FormBuilderSegmentedControl(    
							decoration: InputDecoration(labelText: "Rating"),    
							attribute: "movie_rating",    
							options: List.generate(5, (i) => i + 1)    
								.map(    
									(number) => FormBuilderFieldOption(value: number))    
								.toList(),    
						),    
						FormBuilderStepper(    
							decoration: InputDecoration(labelText: "Stepper"),    
							attribute: "stepper",    
							initialValue: 10,    
							step: 1,    
						),    
						FormBuilderCheckboxList(    
							decoration:    
								InputDecoration(labelText: "Languages you know"),    
							attribute: "languages",    
							initialValue: ["English"],    
							options: [    
							FormBuilderFieldOption(value: "English"),    
							FormBuilderFieldOption(value: "Hindi"),    
							FormBuilderFieldOption(value: "Other")    
							],    
						),    
						FormBuilderSignaturePad(    
							decoration: InputDecoration(labelText: "Signature"),    
							attribute: "signature",    
							height: 100,    
						),    
						FormBuilderRate(    
							decoration: InputDecoration(labelText: "Rate this site"),    
							attribute: "rate",    
							iconSize: 32.0,    
							initialValue: 1,    
							max: 5,    
						),    
						FormBuilderCheckbox(    
							attribute: 'accept_terms',    
							label: Text(    
								"I have read and agree to the terms and conditions"),    
							validators: [    
							FormBuilderValidators.requiredTrue(    
								errorText:    
									"You must accept terms and conditions to continue",    
							),    
							],    
						),    
						],    
					),    
					),    
					Row(    
					children: <Widget>[    
						MaterialButton(    
						child: Text("Submit"),    
						onPressed: () {    
							_fbKey.currentState.save();    
							if (_fbKey.currentState.validate()) {    
							print(_fbKey.currentState.value);    
							}    
						},    
						),    
						MaterialButton(    
						child: Text("Reset"),    
						onPressed: () {    
							_fbKey.currentState.reset();    
						},    
						),    
					],    
					)    
				],    
				),    
			),    
			),    
		);    
	}    
}