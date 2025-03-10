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

![IMG_6666](https://github.com/user-attachments/assets/69f57f65-9bb6-42a8-ae80-9a2ac79c02da)

![IMG_6668](https://github.com/user-attachments/assets/5b2aac48-21cb-4094-b7a1-b93191768f33)

![IMG_6667](https://github.com/user-attachments/assets/3661a1da-f3b9-4882-ad07-b372e29e88ec)

![IMG_6655](https://github.com/user-attachments/assets/e34f45a0-94b9-495d-a033-33314b533836)

![IMG_6658](https://github.com/user-attachments/assets/944cce9a-6cda-4791-a6d8-d031843daad9)

![IMG_6659](https://github.com/user-attachments/assets/1f5de0e7-54f3-4454-a3d3-29e76debf21c)


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
Kullanıcıdan konum izni alınmalı ve izin verdiğinde konum takibi başlamalıdır.

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

Adres bilgisi gösterilmelidir.

✅ PASSED
