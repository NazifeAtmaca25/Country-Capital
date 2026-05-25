# Ülke & Başkent Quiz (Country & Capital Quiz)

Bu proje, Flutter kullanılarak geliştirilmiş eğlenceli ve eğitici bir bilgi yarışması uygulamasıdır. Kullanıcılara rastgele ülkelerin başkentlerini sorarak coğrafya bilgilerini test etmelerini sağlar. Uygulama, gerçek zamanlı ülke verilerini çekmek için bir dış API kullanır.

## 🌟 Özellikler

- **Dinamik Soru Üretimi:** Sorular ve şıklar API'den çekilen verilerle rastgele ve benzersiz olarak oluşturulur.
- **Anında Geri Bildirim:** Kullanıcı bir cevap seçtiğinde anında görsel olarak doğru veya yanlış cevabı görebilir.
- **Sonuç Ekranı:** Test bitiminde doğru ve yanlış sayılarını içeren bir sonuç sayfası gösterilir.
- **Modern Arayüz:** Gradyan renkler, gölgelendirmeler ve animasyonlu geçişlerle desteklenmiş modern bir tasarıma sahiptir.

## 🚀 Kullanılan Teknolojiler ve Paketler

- **Flutter / Dart:** Mobil uygulama geliştirme çerçevesi.
- **[Dio](https://pub.dev/packages/dio):** HTTP isteklerini yönetmek ve API'den veri çekmek için.
- **[flutter_dotenv](https://pub.dev/packages/flutter_dotenv):** API anahtarı gibi hassas verileri `.env` dosyasında güvenli bir şekilde saklamak için.
- **[step_progress_indicator](https://pub.dev/packages/step_progress_indicator):** Soru ilerleyişini görselleştirmek için.
- **[google_fonts](https://pub.dev/packages/google_fonts):** Uygulama içi modern tipografi için.

## 📁 Proje Yapısı

```
lib/
│
├── const/              
│   ├── app_color.dart
│   ├── app_style.dart
│   ├── app_text_style.dart
│   └── status.dart
│
├── model/              
│   ├── coutry_model.dart
│   └── quiz_question.dart
│
├── screen/             
│   ├── homepage.dart
│   ├── quiz_page.dart
│   └── result_page.dart
│
├── services/          
│   ├── country_services.dart
│   └── quiz_generator.dart
│
└── main.dart         
```

## ⚙️ Kurulum ve Çalıştırma

Projeyi yerel ortamınızda çalıştırmak için aşağıdaki adımları izleyin:

1. **Repoyu Klonlayın:**
   ```bash
   git clone <repo-url>
   ```

2. **Bağımlılıkları Yükleyin:**
   Proje dizinine gidin ve gerekli paketleri indirin:
   ```bash
   cd bayrak_baskent
   flutter pub get
   ```

3. **API Anahtarını Ayarlayın:**
   Projenin kök dizininde bir `.env` dosyası oluşturun ve içerisine [countrylayer API](https://countrylayer.com/) anahtarınızı ekleyin:
   ```env
   API_KEY=sizin_api_anahtariniz_buraya
   ```
   *(Not: Uygulama API olarak `https://api.countrylayer.com/v2/all` adresini kullanmaktadır.)*

4. **Uygulamayı Çalıştırın:**
   ```bash
   flutter run
   ```

## 🌐 API Entegrasyonu
Proje, ülke ve başkent bilgilerini almak için **Countrylayer API** kullanmaktadır. `services/country_services.dart` dosyası içinde `Dio` kullanılarak API isteği atılır ve veriler `CountryModel`'e dönüştürülür. Daha sonra `quiz_generator.dart` yardımıyla bu veriler içerisinden 1 doğru ve 3 yanlış şık olacak şekilde sorular hazırlanır.
