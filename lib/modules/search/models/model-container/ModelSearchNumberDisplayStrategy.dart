import 'package:json_annotation/json_annotation.dart'; 
  
part 'ModelSearchNumberDisplayStrategy.g.dart';

@JsonSerializable()
class ModelSearchNumberDisplayStrategy extends Object {

	@JsonKey(name: 'apply_scenario_flag')
	int applyScenarioFlag;

	@JsonKey(name: 'display_text_min_number')
	int displayTextMinNumber;

	@JsonKey(name: 'display_text')
	String displayText;

	ModelSearchNumberDisplayStrategy(this.applyScenarioFlag,this.displayTextMinNumber,this.displayText,);

	factory ModelSearchNumberDisplayStrategy.fromJson(Map<String, dynamic> srcJson) => _$ModelSearchNumberDisplayStrategyFromJson(srcJson);

	Map<String, dynamic> toJson() => _$ModelSearchNumberDisplayStrategyToJson(this);

}