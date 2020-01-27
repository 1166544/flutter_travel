import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_travel/core/navigation/NavigationTabCore.dart';
import 'package:flutter_travel/core/navigation/NavigationTabItem.dart';
import 'package:flutter_travel/modules/common/CommonNavigator.dart';
import 'package:intl/intl.dart';  

/// 表单提交
class PageFormSubmit extends StatefulWidget {    
	@override    
	_PageFormSubmitState createState() => _PageFormSubmitState();    
}    
     
class _PageFormSubmitState extends State<PageFormSubmit> with CommonNavigator {    
	var data;    
	bool autoValidate = true;    
	bool readOnly = false;    
	bool showSegmentedControl = true;    
	final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();    
     
 	@override    
	Widget build(BuildContext context) {    
		return Scaffold(    
			appBar: AppBar(    
				title: Text("个人信息编辑", style: TextStyle(color: Colors.white),),
				backgroundColor: Color(0xFF45489e),  
				leading: IconButton(
					icon: Icon(Icons.arrow_back_ios),
					color: Colors.white,
					onPressed: () {
						// 返回个人信息页
            			Navigator.of(context).pushAndRemoveUntil(
							MaterialPageRoute(builder:(context) => NavigationTabCore(selecteItem: NavigationTabItem.Profile)),
							(route) => route == null
						);
					},
				),
			),    
			body: Padding(    
			padding: EdgeInsets.all(10),    
			child: SingleChildScrollView(    
				child: Column(    
					children: <Widget>[ 
						this.getSaveItem(),   
						this.getFormBuilder(),
						this.getSubmitItem()
					],    
				),    
			),    
			),    
		);    
	}

	/// 顶部保存
	Widget getSaveItem() {
		return Row(
			mainAxisAlignment: MainAxisAlignment.end,
			children: <Widget>[
				IconButton(
					icon: Icon(Icons.close, size: 35.0, color: Colors.grey,),
					onPressed: this.cancelInfo,
				),
				SizedBox(width: 10.0),
				IconButton(
					icon: Icon(Icons.check, size: 35.0,),
					onPressed: this.submitInfo,
				)
			],
		);
	}

	/// 底部保存
	Widget getSubmitItem() {
		return Container(
			padding: EdgeInsets.all(20.0),
			child: Row(  
				mainAxisAlignment: MainAxisAlignment.center,  
				children: <Widget>[    
					CupertinoButton(    
						padding: EdgeInsets.fromLTRB(40.0, 5.0, 40.0, 5.0),
						child: Text("重置", style: TextStyle(color: Colors.white)),  
						color: Color(0xFF45489e),  
						onPressed: this.cancelInfo,    
					), 
					SizedBox(width: 20.0),   
					CupertinoButton(
						padding: EdgeInsets.fromLTRB(40.0, 5.0, 40.0, 5.0),
						child: Text("提交", style: TextStyle(color: Colors.white)),  
						color: Color(0xFF45489e),  
						onPressed: this.submitInfo,    
					),    
				],    
			),
		);
	}

	/// 取消提交
	void cancelInfo() {    
		_fbKey.currentState.reset();    
	}

	/// 提交
	void submitInfo() {
		_fbKey.currentState.save();    
		if (_fbKey.currentState.validate()) {    
			print(_fbKey.currentState.value);    
		} 
	}

	Widget getFullNameItem() {
		return FormBuilderTextField( 
			attribute: 'text', 
			cursorColor: Colors.white,   
			validators: [FormBuilderValidators.required()],    
			decoration: InputDecoration(labelText: "姓名"),    
		);
	}

	/// 表单区
	Widget getFormBuilder() {
		return FormBuilder(    
			key: _fbKey,    
			initialValue: {    
				'date': DateTime.now(),    
				'accept_terms': false,    
			},    
			autovalidate: true,    
			child: Column(    
				children: <Widget>[    
					this.getFullNameItem(),    
					SizedBox(height: 20.0),
					FormBuilderDateTimePicker(    
						attribute: "date",    
						inputType: InputType.date,    
						validators: [FormBuilderValidators.required()],    
						format: DateFormat("yyyy-MM-dd"),    
						decoration: InputDecoration(labelText: "生日"),    
					),  
					SizedBox(height: 20.0),  
					FormBuilderDropdown(    
						attribute: "gender",    
						decoration: InputDecoration(labelText: "姓别"),    
						// initialValue: 'Male',    
						hint: Text('请选择'),    
						validators: [FormBuilderValidators.required()],    
						items: ['男', '女']    
							.map((gender) => DropdownMenuItem(    
								value: gender, child: Text("$gender")))    
							.toList(),    
					),    
					SizedBox(height: 20.0),
					FormBuilderTextField(    
						attribute: "age",    
						decoration: InputDecoration(labelText: "年龄"),    
						keyboardType: TextInputType.number,    
						validators: [    
							FormBuilderValidators.numeric(),    
							FormBuilderValidators.max(120),    
						],    
					),    
					SizedBox(height: 20.0),
					FormBuilderSlider(    
						attribute: "slider",    
						validators: [FormBuilderValidators.min(1)],    
						min: 0.0,    
						max: 10.0,    
						initialValue: 1.0,    
						divisions: 20,    
						activeColor: Color(0xFF45489e),
						inactiveColor: Colors.grey,
						decoration: InputDecoration(    
							labelText: "家庭成员数量"),    
					),
					SizedBox(height: 20.0),    
					// FormBuilderSegmentedControl(    
					// 	decoration: InputDecoration(labelText: "Rating"),    
					// 	attribute: "movie_rating",    
					// 	options: List.generate(5, (i) => i + 1)    
					// 		.map(    
					// 			(number) => FormBuilderFieldOption(value: number))    
					// 		.toList(),    
					// ),    
					FormBuilderStepper(    
						decoration: InputDecoration(labelText: "步长计数"),    
						attribute: "stepper",    
						initialValue: 10,    
						step: 1,    
					),    
					SizedBox(height: 20.0),
					FormBuilderCheckboxList(    
						activeColor: Color(0xFF45489e),
						decoration:    
							InputDecoration(labelText: "外语水平"),    
						attribute: "languages",    
						initialValue: ["English"],    
						options: [    
							FormBuilderFieldOption(value: "English"),    
							FormBuilderFieldOption(value: "Chinese"),    
							FormBuilderFieldOption(value: "Other")    
						],    
					),    
					SizedBox(height: 20.0),
					FormBuilderSignaturePad(    
						decoration: InputDecoration(labelText: "其它信息"),    
						attribute: "signature",    
						height: 100,    
						clearButtonText: '清除',
					),   
					SizedBox(height: 20.0), 
					FormBuilderRate(    
						decoration: InputDecoration(labelText: "评分"),    
						attribute: "rate",
						icon: Icons.star_border,    
						iconSize: 32.0,    
						initialValue: 1,    
						max: 5,    
					), 
					SizedBox(height: 20.0),   
					FormBuilderCheckbox( 
						activeColor: Color(0xFF45489e),   
						attribute: 'accept_terms',    
						label: Text("我已阅读并同意以上描述条款"),    
						validators: [    
						FormBuilderValidators.requiredTrue(    
							errorText: "请勾选同意条款",    
						),    
						],    
					),
					SizedBox(height: 20.0),    
				],    
			),    
		) ;
	}    
}