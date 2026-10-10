# UTS Praktikum Pemrograman Perangkat Bergerak

**Nama:** PUTRI FITRIANI
**NIM:** 362558302028
**Tanggal:** 05 Oktober 2026
**Program Studi:** 2D D4 Teknologi Rekayasa Perangkat Lunak
**Semester:** 3

---

## Jawaban Teori Soal 1-5

### Soal 1: Daftar Tugas dan UI Responsif (KAD-1)

Aplikasi menampilkan daftar tugas dalam bentuk kartu berisi judul, mata kuliah, dan badge status. Ringkasan jumlah tugas tampil di atas.

Responsif:
- Menggunakan LayoutBuilder untuk deteksi lebar layar
- Lebar < 700 px -> crossAxisCount: 1 (layout telepon)
- Lebar >= 700 px -> crossAxisCount: 2 (layout tablet, kartu 2 kolom)
- Empty state muncul saat data kosong

### Soal 2: Form, Validasi, dan Navigasi (KAD-2)

Validasi:
- Cek v == null || v.trim().isEmpty untuk judul & mata kuliah
- Pesan: "Judul wajib diisi" / "Mata kuliah wajib diisi"
- trim() membuang spasi awal/akhir

Navigasi:
- Buka form: Navigator.push
- Simpan: Navigator.pop(context, newTask)
- Batal: Navigator.pop(context) tanpa data

### Soal 3: State dan Interaksi Daftar (KAD-3)

- Menggunakan setState()
- Tugas baru masuk via _tasks.insert(0, newTask)
- Toggle: copyWith(isDone: !task.isDone)
- Ringkasan otomatis update

### Soal 4: Operasi Asynchronous dan State UI (KAD-4)

- initState -> _loadTasks()
- Loading indicator pakai CircularProgressIndicator
- Error state: ikon + pesan + tombol "Coba Lagi"
- Kontrol simulasi error di menu titik tiga (⋮)

### Soal 5: Penyimpanan Lokal dan Verifikasi (KAD-5)

- Task.toJson() dan Task.fromJson()
- Simpan: prefs.setString(_key, jsonEncode(tasks))
- Baca: jsonDecode(prefs.getString(_key))
- Data persist setelah refresh/buka ulang

---

## Cara Menjalankan

1. flutter pub get
2. flutter run -d chrome

---

## Acceptance Criteria

- [x] A. Telepon 360px tidak overflow
- [x] B. Tablet 700px kartu 2 kolom
- [x] C. Validasi form berfungsi
- [x] D. Navigasi push/pop benar
- [x] E. State update real-time
- [x] F. Async loading/error/retry
- [x] G. Persistence SharedPreferences
- [x] H. flutter analyze: No issues found!

---

## Ringkasan Alur Kode

1. main.dart -> runApp(TugasApp())
2. app/tugas_app.dart -> MaterialApp tema pink soft -> TaskListScreen
3. task_list_screen.dart:
   - initState -> _loadTasks() baca SharedPreferences
   - Tombol + -> Navigator.push(TaskFormScreen)
   - Simpan -> Navigator.pop(task) -> setState insert + persist
   - Toggle -> setState copyWith + persist
4. task_form_screen.dart -> validasi + Navigator.pop
5. task_storage.dart -> saveTasks + loadTasks via SharedPreferences

---

## Screenshot Bukti

lek amu pengen nampilne gambare sisan ndek github gae iki:
## Screenshot Bukti

### Kriteria A - Phone
![Phone](Bukti%20Screenshot/screenshot_phone.png)
![Phone 2 tugas](Bukti%20Screenshot/screenshot_phone%202%20tugas.png)

### Kriteria B - Tablet
![Tablet](Bukti%20Screenshot/screenshot_tablet.png)
![Tablet 2 tugas](Bukti%20Screenshot/screenshot_tablet%202%20tugas.png)

### Kriteria C - Form
![Form](Bukti%20Screenshot/screenshot_form.png)

### Kriteria E - Toggle
![Toggle](Bukti%20Screenshot/screenshot_toggle.png)

### Kriteria F - Error
![Error](Bukti%20Screenshot/screenshot_error.png)

---

## Error yang Tersisa

Tidak ada. flutter analyze: No issues found!