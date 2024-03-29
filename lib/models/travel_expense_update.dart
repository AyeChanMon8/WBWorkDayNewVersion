import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:winbrother_hr_app/models/travel_expense/create/travel_line_model.dart';

class TravelExpenseUpdateModel {
  int id;
  String date;
  int mobile_user_id;
  int employee_id;
  int company_id;
  int travel_id;
  double advanced_money;
  List<TravelLineModel> travel_line;
  String number;

  TravelExpenseUpdateModel({
    this.id,
    this.date,
    this.mobile_user_id,
    this.employee_id,
    this.company_id,
    this.travel_id,
    this.advanced_money,
    this.travel_line,
    this.number,
  });

  TravelExpenseUpdateModel copyWith({
    int id,
    String date,
    int mobile_user_id,
    int employee_id,
    int company_id,
    int travel_id,
    double advanced_money,
    List<TravelLineModel> travel_line,
  }) {
    return TravelExpenseUpdateModel(
        id: id ?? this.id,
        date: date ?? this.date,
        mobile_user_id: mobile_user_id ?? this.mobile_user_id,
        employee_id: employee_id ?? this.employee_id,
        company_id: company_id ?? this.company_id,
        travel_id: travel_id ?? this.travel_id,
        advanced_money: advanced_money ?? this.advanced_money,
        travel_line: travel_line ?? this.travel_line,
        number: number ?? this.number);
  }

  Map<String, dynamic> toMap() {
    return {
      'parent_id': id,
      'travel_lines': travel_line?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory TravelExpenseUpdateModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return TravelExpenseUpdateModel(
      id: map['id'],
      date: map['date'],
      mobile_user_id: map['mobile_user_id'],
      employee_id: map['employee_id'],
      company_id: map['company_id'],
      travel_id: map['travel_id'],
      advanced_money: map['advanced_money'],
      travel_line: List<TravelLineModel>.from(
          map['travel_line']?.map((x) => TravelLineModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory TravelExpenseUpdateModel.fromJson(String source) =>
      TravelExpenseUpdateModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TravelExpenseUpdateModel(id: $id, date: $date, employee_id: $employee_id, company_id: $company_id, travel_id: $travel_id, advanced_money: $advanced_money, travel_line: $travel_line)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is TravelExpenseUpdateModel &&
        o.id == id &&
        o.date == date &&
        o.employee_id == employee_id &&
        o.company_id == company_id &&
        o.travel_id == travel_id &&
        o.advanced_money == advanced_money &&
        listEquals(o.travel_line, travel_line);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        date.hashCode ^
        employee_id.hashCode ^
        company_id.hashCode ^
        travel_id.hashCode ^
        advanced_money.hashCode ^
        travel_line.hashCode;
  }
}
