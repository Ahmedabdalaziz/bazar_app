import 'package:supabase_auth_ui/supabase_auth_ui.dart';

class VendorService {
  final SupabaseClient _supabase;

  VendorService(this._supabase);

  Future<List<Map<String, dynamic>>> getAll() async {
    return await _supabase.from('vendors').select();
  }
}

class AuthorService {
  final SupabaseClient _supabase;

  AuthorService(this._supabase);

  Future<List<Map<String, dynamic>>> getAll() async {
    return await _supabase.from('authors').select();
  }
}

//TODO : عايز اظبط حتة البايمنت معاها
class OrderService {
  final SupabaseClient _supabase;

  OrderService(this._supabase);

  Future<String> create({
    required String userId,
    required String addressId,
    required List<Map<String, dynamic>> items,
  }) async {
    final total = items.fold(0.0, (sum, item) => sum + item['total']);

    final order = await _supabase
        .from('orders')
        .insert({
      'profile_id': userId,
      'shipping_address_id': addressId,
      'total_amount': total,
      'status': 'pending',
    })
        .select()
        .single();

    final orderItems =
    items.map((i) => {...i, 'order_id': order['id']}).toList();

    await _supabase.from('order_items').insert(orderItems);

    return order['id'];
  }

  Future<List<Map<String, dynamic>>> getAll(String userId) async {
    return await _supabase
        .from('user_orders_summary')
        .select()
        .eq('profile_id', userId)
        .order('created_at', ascending: false);
  }
}

class AddressService {
  final SupabaseClient _supabase;

  AddressService(this._supabase);

  Future<List<Map<String, dynamic>>> getAll(String userId) async {
    return await _supabase.from('addresses').select().eq('profile_id', userId);
  }

  Future<Map<String, dynamic>> create(
      String userId,
      Map<String, dynamic> address,
      ) async {
    return await _supabase
        .from('addresses')
        .insert({...address, 'profile_id': userId})
        .select()
        .single();
  }

  Future<void> update(String id, Map<String, dynamic> updates) async {
    await _supabase.from('addresses').update(updates).eq('id', id);
  }

  Future<void> delete(String id) async {
    await _supabase.from('addresses').delete().eq('id', id);
  }
}

class WishlistService {
  final SupabaseClient _supabase;

  WishlistService(this._supabase);

  Future<void> add(String userId, String bookId) async {
    await _supabase.from('wishlists').upsert({
      'profile_id': userId,
      'book_id': bookId,
    }, onConflict: 'profile_id,book_id');
  }

  Future<void> remove(String userId, String bookId) async {
    await _supabase
        .from('wishlists')
        .delete()
        .eq('profile_id', userId)
        .eq('book_id', bookId);
  }

  Future<List<Map<String, dynamic>>> getAll(String userId) async {
    return await _supabase
        .from('wishlists')
        .select('books(*)')
        .eq('profile_id', userId);
  }
}

class BookService {
  final SupabaseClient _supabase;

  BookService(this._supabase);

  Future<Map<String, dynamic>?> getById(String bookId) async {
    return await _supabase
        .from('books')
        .select('''
          id,
          title,
          cover_url,
          price,
          description,
          publisher,
          language,
          pages,
          avg_rating,
          review_count,
          created_at,
          updated_at,
          book_authors!inner(
            author_id,
            authors(id, name)
          )
        ''')
        .eq('id', bookId)
        .maybeSingle();
  }

  Future<List<Map<String, dynamic>>> getPaginated({
    int page = 0,
    int pageSize = 8,
  }) async {
    final start = page * pageSize;
    final end = start + pageSize - 1;

    return await _supabase
        .from('books')
        .select('''
          id,
          title,
          cover_url,
          price,
          description,
          publisher,
          language,
          pages,
          avg_rating,
          review_count,
          created_at,
          updated_at,
          author_id,
          author_name,
          book_authors!inner(
            author_id,
            authors(id, name)
          )
        ''')
        .range(start, end)
        .order('created_at', ascending: false);
  }

  Future<List<Map<String, dynamic>>> getTop20() async {
    return await _supabase
        .from('books')
        .select('''
          id,
          title,
          cover_url,
          price,
          description,
          publisher,
          language,
          pages,
          avg_rating,
          review_count,
          created_at,
          updated_at,
          book_authors!inner(
            author_id,
            authors(id, name)
          )
        ''')
        .limit(20)
        .order('avg_rating', ascending: false)
        .order('review_count', ascending: false);
  }

  Future<List<Map<String, dynamic>>> getAll() async {
    return await _supabase
        .from('books')
        .select('''
          id,
          title,
          cover_url,
          price,
          description,
          publisher,
          language,
          pages,
          avg_rating,
          review_count,
          created_at,
          updated_at,
          book_authors!inner(
            author_id,
            authors(id, name)
          )
        ''')
        .order('created_at', ascending: false);
  }

  Future<List<Map<String, dynamic>>> search(String query) async {
    if (query.trim().isEmpty) return [];

    return await _supabase
        .from('books')
        .select('''
          id,
          title,
          cover_url,
          price,
          description,
          publisher,
          language,
          pages,
          avg_rating,
          review_count,
          created_at,
          updated_at,
          book_authors!inner(
            author_id,
            authors(id, name)
          )
        ''')
        .or('title.ilike.%$query%, book_authors.authors.name.ilike.%$query%')
        .order('avg_rating', ascending: false);
  }
}
