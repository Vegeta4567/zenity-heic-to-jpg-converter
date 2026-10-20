# 🖼️ **Zenity HEIC to JPG Converter**

[![GitHub License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![GitHub Stars](https://img.shields.io/github/stars/Vegeta4567/zenity-heic-to-jpg-converter?style=flat-square)](https://github.com/Vegeta4567/zenity-heic-to-jpg-converter/stargazers)
[![GitHub Issues](https://img.shields.io/github/issues/Vegeta4567/zenity-heic-to-jpg-converter)](https://github.com/Vegeta4567/zenity-heic-to-jpg-converter/issues)
[![GitHub Last Commit](https://img.shields.io/github/last-commit/Vegeta4567/zenity-heic-to-jpg-converter)](https://github.com/Vegeta4567/zenity-heic-to-jpg-converter/commits/main)

A **lightweight, user-friendly Bash script** to convert **HEIC/HEIF files to JPG** using a **graphical interface (Zenity)**. Designed for Linux users who want a simple, no-fuss way to batch-convert HEIC images to JPG format.

---

## ✨ **Features**

✅ **Graphical Interface** – Uses Zenity for file selection, progress tracking, and summaries.
✅ **Recursive Conversion** – Processes all `.heic`/`.HEIC` files in the selected directory **and its subdirectories**.
✅ **Real-Time Progress Bar** – Shows conversion progress and current file being processed.
✅ **Error Handling** – Tracks and reports failed conversions (e.g., corrupted files, permission issues).
✅ **Detailed Summary** – Displays a breakdown of converted, deleted, and failed files.
✅ **Lightweight** – Only requires `heif-convert` and `zenity`.

---

## 📥 **Requirements**
   Tool            | Purpose                          | Installation (Ubuntu)       |
 |-----------------|----------------------------------|------------------------------------|
 | **`heif-convert`** | Converts HEIC to JPG.            | `sudo apt install libheif-plugin-libde265 libheif-examples` |
 | **`zenity`**     | Provides GUI dialogs.            | `sudo apt install zenity`         |

> **Note**: `zenity` is usually pre-installed on most Linux distributions.
  
---
## 🚀 **Usage**

### Run the following commands in your terminal:
```bash
git clone https://github.com/Vegeta4567/zenity-heic-to-jpg-converter.git && \
cd zenity-heic-to-jpg-converter && \
chmod +x zenity-heic-to-jpg-converter.sh && \
./zenity-heic-to-jpg-converter.sh
