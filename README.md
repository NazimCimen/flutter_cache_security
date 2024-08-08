# Cache Security Flutter 

## About the Project

This project includes a data management system developed with Flutter and uses AES encryption to ensure data security. There are two types of data management classes in the project: one includes encryption operations (`EncryptedCacheManager`), and the other handles standard data management (`StandardCacheManager`).

## Features

- **BaseCacheManager**: Defines all data management operations.
- **EncryptedCacheManager**: Data management class that includes encryption operations.
- **StandardCacheManagerImpl**: Standard data management class that does not perform encryption.
- **AESEncryptionService**: Service class that performs AES encryption and decryption operations.
- **SecureEncryptionKeyManager**: Class that securely manages the encryption key.
- **BaseModel**: Base class for data models.
- **Person**: Example data model extending `BaseModel`.

## Used Packages

- **hive_flutter**: A fast and simple database for Flutter.
- **flutter_secure_storage**: Package for secure data storage operations.
- **encrypt**: Package for encryption operations.

## Contributing
-  If you want to contribute, please create an issue or send a pull request. I welcome all contributions!

## Installation

1. **Install Dependencies**

   ```bash
   flutter pub get
