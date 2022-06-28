class ContentDto {
  const ContentDto(
    this.subscriptionId, 
    this.name, 
    this.category,
    this.startDate,
    this.lastAccess,
    this.status,
    );
  
  final int subscriptionId;
  final String name;
  final String category;
  final String startDate;
  final String lastAccess;
  final int status;
}