# Dobot

**Dobot** adalah bot Telegram untuk [deskripsi singkat fungsi proyek, misal: jualan produk digital / otomasi VPS]. Bot ini dapat dijalankan **24 jam nonstop** di VPS menggunakan `systemd`.

---

## 🔧 Fitur

- Menjalankan bot Telegram 24 jam nonstop  
- Auto restart jika crash atau VPS reboot  
- Instalasi otomatis via `install.sh`  
- Mudah dikonfigurasi dan dijalankan  

---

## 💻 Persyaratan

- VPS Linux (Debian/Ubuntu direkomendasikan)  
- Python 3.x  
- Akses root  

---

## 🛠 Instalasi

### Cara cepat:

Jalankan perintah ini di VPS:

```bash
curl -sSL https://raw.githubusercontent.com/virasinah/dobot/main/install.sh | bash
