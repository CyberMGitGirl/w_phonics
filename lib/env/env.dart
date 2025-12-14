import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env', obfuscate: true)
abstract class Env {
    @EnviedField(varName: 'SUPABASE_URL')
    static String supabaseUrl = _Env.supabaseUrl;
    
    @EnviedField(varName: 'SUPABASE_PUB_KEY')
    static String supabasePubKey = _Env.supabasePubKey;
    
}  