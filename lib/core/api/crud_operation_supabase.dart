import 'package:bazar_app/feature/home/data/models/books_model/books_model.dart';
import 'package:bazar_app/feature/home/data/models/vendors_model/vendor_model.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

class AuthorService {
  final SupabaseClient _supabase;

  AuthorService(this._supabase);

  Future<List<Map<String, dynamic>>> getPaginated({
    int page = 0,
    int size = 8,
    String orderBy = 'created_at',
    bool ascending = false,
  }) async {
    final int from = page * size;
    final int to = from + size - 1;
    return await _supabase
        .from('authors')
        .select('*')
        .order('created_at', ascending: ascending)
        .range(from, to);
  }

  Future<List<Map<String, dynamic>>> getAll() async {
    return await _supabase
        .from('authors')
        .select()
        .order('name', ascending: true);
  }

  Future<Map<String, dynamic>?> getById(String id) async {
    return await _supabase.from('authors').select().eq('id', id).maybeSingle();
  }
}

class VendorService {
  final SupabaseClient _supabase;

  VendorService(this._supabase);

  Future<List<VendorModel>> getAll() async {
    final List<Map<String, dynamic>> res = await _supabase
        .from('vendors')
        .select()
        .order('name', ascending: true);

    return res.map((e) => VendorModel.fromJson(e)).toList();
  }

  Future<VendorModel?> getById(String id) async {
    final Map<String, dynamic>? res = await _supabase
        .from('vendors')
        .select()
        .eq('id', id)
        .maybeSingle();

    if (res == null) return null;
    return VendorModel.fromJson(res);
  }

  Future<List<VendorModel>> getPaginated({
    int page = 0,
    int size = 8,
    String orderBy = 'name',
    bool ascending = false,
  }) async {
    final int from = page * size;
    final int to = from + size - 1;

    final List<Map<String, dynamic>> res = await _supabase
        .from('vendors')
        .select('*')
        .order(orderBy, ascending: ascending)
        .range(from, to);

    return res.map((e) => VendorModel.fromJson(e)).toList();
  }
}

class AddressService {
  final SupabaseClient _supabase;

  AddressService(this._supabase);

  Future<Map<String, dynamic>> create(
    String userId,
    Map<String, dynamic> address,
  ) async {
    final Map<String, dynamic> payload = {'profile_id': userId, ...address};

    final response = await _supabase
        .from('addresses')
        .insert(payload)
        .select()
        .single();

    return response;
  }

  Future<void> update(String id, Map<String, dynamic> updates) async {
    await _supabase.from('addresses').update(updates).eq('id', id);
  }

  Future<void> delete(String id) async {
    await _supabase.from('addresses').delete().eq('id', id);
  }

  Future<List<Map<String, dynamic>>> getAll(String userId) async {
    return await _supabase
        .from('addresses')
        .select()
        .eq('profile_id', userId)
        .order('created_at', ascending: false);
  }
}

class WishlistService {
  final SupabaseClient _supabase;

  WishlistService(this._supabase);

  Future<void> add(String userId, String? bookId, String? productId) async {
    final Map<String, dynamic> item = {
      'profile_id': userId,
      if (bookId != null) 'book_id': bookId,
      if (productId != null) 'product_id': productId,
    };

    await _supabase.from('wishlists').insert(item);
  }

  Future<void> remove(String userId, String? bookId, String? productId) async {
    final query = _supabase.from('wishlists').delete().eq('profile_id', userId);

    if (bookId != null) {
      await query.eq('book_id', bookId);
    } else if (productId != null) {
      await query.eq('product_id', productId);
    } else {
      throw ArgumentError(
        'Either bookId or productId must be provided to remove an item.',
      );
    }
  }

  Future<List<Map<String, dynamic>>> getAll(String userId) async {
    return await _supabase
        .from('wishlists')
        .select('*, book:books(*), product:products(*)')
        .eq('profile_id', userId);
  }
}

class OrderService {
  final SupabaseClient _supabase;

  OrderService(this._supabase);

  Future<String> createSimpleOrder({
    required String userId,
    required String addressId,
    required double totalAmount,
  }) async {
    final payload = {
      'profile_id': userId,
      'shipping_address_id': addressId,
      'total_amount': totalAmount,
      'status': 'pending',
    };

    final response = await _supabase
        .from('orders')
        .insert(payload)
        .select('id')
        .single();

    return response['id'] as String;
  }

  Future<List<Map<String, dynamic>>> getAll(String userId) async {
    return await _supabase
        .from('user_orders_summary')
        .select()
        .eq('profile_id', userId)
        .order('created_at', ascending: false);
  }

  Future<Map<String, dynamic>?> getOrderDetails(String orderId) async {
    return await _supabase
        .from('orders')
        .select('*, shipping_address_id:addresses(*), order_items(*)')
        .eq('id', orderId)
        .maybeSingle();
  }
}

class BookService {
  final SupabaseClient _client;

  BookService(this._client);

  static const String _bookSelect =
      '*, book_authors(author_id, authors:authors(id, name))';

  Future<BookModel?> getById(String id) async {
    final res = await _client
        .from('books')
        .select(_bookSelect)
        .eq('id', id)
        .maybeSingle();

    return res != null ? BookModel.fromJson(res) : null;
  }

  Future<List<BookModel>> getPaginated({
    int page = 0,
    int size = 8,
    String orderBy = 'created_at',
    bool ascending = false,
  }) async {
    final int from = page * size;
    final int to = from + size - 1;

    final List<Map<String, dynamic>> res = await _client
        .from('books')
        .select(_bookSelect)
        .order(orderBy, ascending: ascending)
        .range(from, to);

    return res.map((json) => BookModel.fromJson(json)).toList();
  }

  Future<List<BookModel>> getTop20() async {
    final List<Map<String, dynamic>> res = await _client
        .from('books')
        .select(_bookSelect)
        .order('avg_rating', ascending: false)
        .order('review_count', ascending: false)
        .limit(20);

    return res.map((json) => BookModel.fromJson(json)).toList();
  }

  Future<List<BookModel>> getAll() async {
    final List<Map<String, dynamic>> res = await _client
        .from('books')
        .select(_bookSelect)
        .order('created_at', ascending: false);

    return res.map((json) => BookModel.fromJson(json)).toList();
  }

  Future<List<BookModel>> getByAuthor(String authorId) async {
    final List<Map<String, dynamic>> res = await _client
        .from('book_authors')
        .select('book:books($_bookSelect)')
        .eq('author_id', authorId);

    return res
        .map((json) => BookModel.fromJson(json['book'] as Map<String, dynamic>))
        .toList();
  }

  Future<List<BookModel>> getByVendor(String vendorId) async {
    final List<Map<String, dynamic>> res = await _client
        .from('products')
        .select('book:books($_bookSelect)')
        .eq('vendor_id', vendorId)
        .not('book_id', 'is', null);

    return res
        .map((json) => BookModel.fromJson(json['book'] as Map<String, dynamic>))
        .toList();
  }

  Future<List<BookModel>> search({
    required String query,
    int page = 0,
    int size = 8,
  }) async {
    if (query.trim().isEmpty) {
      return getPaginated(page: page, size: size);
    }

    final int from = page * size;
    final int to = from + size - 1;

    final List<Map<String, dynamic>> res = await _client
        .from('books')
        .select(_bookSelect)
        .ilike('title', '%${query.trim()}%')
        .order('avg_rating', ascending: false)
        .range(from, to);

    return res.map((json) => BookModel.fromJson(json)).toList();
  }
}
