import 'package:bazar_app/core/api/crud_operation_supabase.dart';
import 'package:bazar_app/feature/publishers/data/vendors_model/vendor_model.dart';

import '../../../books/data/books_model/books_model.dart';

class PublishersRepository {
  final VendorService _vendorService;
  final BookService _bookService;

  PublishersRepository(this._vendorService, this._bookService);

  Future<VendorModel?> getPublisherDetailsById(String publisherId) async {
    return await _vendorService.getById(publisherId);
  }

  Future<List<VendorModel>> getPaginatedPublishers({
    int page = 0,
    int size = 10,
  }) async {
    return await _vendorService.getPaginated(page: page, size: size);
  }

  Future<List<VendorModel>> getAllPublishers() async {
    return await _vendorService.getAll();
  }

  Future<List<BookModel>> getBooksByPublisher(String publisherId) async {
    return await _bookService.getByVendor(publisherId);
  }

  Future<List<VendorModel>> searchPublishers(String query) async {
    final allPublishers = await getAllPublishers();
    return allPublishers
        .where(
          (publisher) =>
              publisher.name.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
  }
}
