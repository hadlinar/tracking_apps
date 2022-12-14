import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LogoutBlocEvent{}

class LogoutEvent extends LogoutBlocEvent{}