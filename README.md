📍 LocationTracker 

Bu proje, iOS için geliştirilmiş **konum takip** uygulamasıdır. 
Kullanıcı her **100 metre** yürüdüğünde haritaya otomatik olarak bir marker eklenir. Uygulama arka planda çalışabilir. 

🚀 Özellikler 

- Harita Üzerinde Konum Takibi (MKMapView) 
- 100 Metrede Bir Otomatik Marker Ekleme
- Başlat/Durdur (Start/Stop) Butonları
- Rotayı Sıfırlama (Reset)
- Arka Planda Konum Güncellemeleri
- RxSwift ile Reaktif Programlama
- SnapKit ile UI Layout

📄 Kullanım

- "Start Tracking" butonuna basarak konum takibini başlatın.
- Her 100 metrede bir yeni bir marker haritada belirecektir.
- "Reset Route" butonu ile haritadaki işaretçileri temizleyin.
- "Stop Tracking" ile takibi durdurabilirsiniz.

📸 Ekran Görüntüleri

![IMG_6666](https://github.com/user-attachments/assets/9a8e96f9-6967-46f4-9b2e-2c3316be237c)

![IMG_6667](https://github.com/user-attachments/assets/8625f04f-ed39-4e01-92e4-e5b3f387e7f4)

![IMG_6655](https://github.com/user-attachments/assets/337c5f01-cbd2-4d71-a26f-b56a965c2e7c)

![IMG_6658](https://github.com/user-attachments/assets/e070161b-d12e-4b5f-bb9a-cb0e9812fbea)

![IMG_6659](https://github.com/user-attachments/assets/d993a567-5d90-4b58-9b0f-4444405589e9)


🧪 Uygulama Test Senaryoları

**Konum Takibini Başlatma**
Test Adımları:

Uygulama açılır.
"Start Tracking" butonuna tıklanır.
Kullanıcıdan konum izni istenir.
Haritada kullanıcının mevcut konumu görüntülenir.
Kullanıcı hareket ettikçe harita güncellenir.
Beklenen Sonuç:

Kullanıcı hareket ettikçe haritada yeni marker'lar eklenmelidir.
Kullanıcıdan konum izni alınmalı ve reddettiğinde hata mesajı gösterilmelidir.
✅ PASSED

**1.Konum Takibini Durdurma**
Test Adımları:

"Start Tracking" butonuna basılarak konum takibi başlatılır.
"Stop Tracking" butonuna basılır.
Beklenen Sonuç:

Konum takibi durmalı ve yeni marker eklenmemelidir.
Start Tracking butonu tekrar tıklanırsa kaldığı yerden devam etmelidir.
✅ PASSED

**2.Haritada Marker Eklenmesi**
Test Adımları:

"Start Tracking" butonuna basılır.
Kullanıcı 100 metre yürür.
Haritada yeni bir marker eklenir.
Kullanıcı tekrar 100 metre yürür.
Beklenen Sonuç:

Her 100 metrede bir haritaya yeni marker eklenmelidir.
Marker konumları doğru olmalıdır.
✅ PASSED

**3.Haritanın Resetlenmesi**
Test Adımları:

"Start Tracking" butonuna basılır.
Kullanıcı birkaç metre hareket eder ve marker eklenir.
"Reset Route" butonuna basılır.
Beklenen Sonuç:

Harita üzerindeki tüm marker'lar temizlenmelidir.
Eğer kullanıcı hala takip modundaysa yeni konumlar eklenmeye devam etmelidir.
✅ PASSED

**4.Uygulamanın Arka Planda Çalışması**
Test Adımları:

"Start Tracking" butonuna basılır.
Uygulama arka plana alınır.
Kullanıcı yürümeye devam eder.
Uygulama tekrar açılır.
Beklenen Sonuç:

Arka planda çalışırken konum güncellemeleri alınmalı ve marker eklenmelidir.
Uygulama kapatılıp açıldığında en son konum verisi kaydedilmiş olmalıdır.
✅ PASSED

**5.Adres Bilgisi Gösterimi**
Test Adımları:

Kullanıcı haritada bir marker'a tıklar.
Adres bilgisi popup olarak gösterilir.
Beklenen Sonuç:

Adres bilgisi, konumun tersine coğrafi kodlamasıyla gösterilmelidir.
Hatalı veya eksik adreslerde "Adres Bulunamadı" mesajı gösterilmelidir.
✅ PASSED
