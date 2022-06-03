import 'package:frontend/src/features/subscription/data/dto/provider_dto.dart';

class SubscriptionDto {
  const SubscriptionDto(this.provider, this.signatureDate, this.price, this.periodPayment, this.screens, this.maxResolution);
  
  final ProviderDto provider;
  final String signatureDate;
  final String price;
  final String periodPayment;
  final String screens;
  final String maxResolution;
}