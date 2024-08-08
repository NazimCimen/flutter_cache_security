import 'package:cache_security/cache/cache_manager/encrypted_cache_manager.dart';
import 'package:cache_security/cache/cache_manager/base_cache_manager.dart';
import 'package:cache_security/cache/cache_manager/standart_cache_manager.dart';
import 'package:cache_security/cache/encryption/secure_encryption_key_manager.dart';
import 'package:cache_security/cache/encryption/encryption_service.dart';
import 'package:cache_security/cache_model.dart/person.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(PersonAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NewWidget(),
    );
  }
}

class NewWidget extends StatefulWidget {
  const NewWidget({
    super.key,
  });

  @override
  State<NewWidget> createState() => _NewWidgetState();
}

class _NewWidgetState extends State<NewWidget> {
  bool _absorbPage = true;
  final String _dataString = '12345678';
  final Person _dataModel = Person(age: 21, name: 'name');
  late BaseCacheManager<Person> _cacheManager;
  late BaseCacheManager<String> _enctyptCacheManager;
  void changeAbsorbPage() {
    setState(() {
      _absorbPage = false;
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        _cacheManager = StandartCacheManager(
          boxName: 'boxName',
          keyName: 'keyName',
        );
        _enctyptCacheManager = EncryptedCacheManager(
            boxName: 'boxName2',
            keyName: 'keyName2',
            encryptionService:
                AESEncryptionService(SecureEncryptionKeyManager()));

        changeAbsorbPage();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cache Security'),
      ),
      body: AbsorbPointer(
        absorbing: _absorbPage,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('data: $_dataString'),
            Text('data: $_dataModel'),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  await _cacheManager.saveData(data: _dataModel);
                  await _enctyptCacheManager.saveData(data: _dataString);
                },
                child: const Text('S A V E'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  final data = await _cacheManager.getData();
                  print(data.toString());
                },
                child: const Text('G E T'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
