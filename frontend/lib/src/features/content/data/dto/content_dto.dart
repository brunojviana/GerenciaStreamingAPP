class ContentDto {
  const ContentDto(
    this.id, 
    this.subscriptionId, 
    this.name, 
    this.category,
    this.startDate,
    this.lastAccess,
    this.status,
    );
  
  final int id;
  final int subscriptionId;
  final String name;
  final String category;
  final DateTime startDate;
  final DateTime lastAccess;
  final int status;
}