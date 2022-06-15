class SubscriptionDto {
  const SubscriptionDto(this.userId, this.idProvider, this.signatureDate, this.price, 
                        this.periodPayment, this.screens, this.maxResolution, this.content,
                        this.useTime, this.status);
  
  final int userId;
  final int idProvider;
  final String signatureDate;
  final String price;
  final String periodPayment;
  final String screens;
  final String maxResolution;
  final int content;
  final double useTime;
  final int status;
}
