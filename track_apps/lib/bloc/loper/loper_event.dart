import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LoperEvent{}

class GetLoperEvent extends LoperEvent{}

class LogoutEvent extends LoperEvent{}