# AWS Cloud App Deployment (Terraform + Docker + CI/CD)

## Overview

Project ini aku buat untuk latihan sekaligus membuktikan kemampuan dalam membangun dan deploy aplikasi di cloud environment secara end-to-end.

Di project ini, aku tidak hanya deploy aplikasi, tapi juga:

* setup infrastructure pakai Terraform
* containerize aplikasi pakai Docker
* setup CI/CD sederhana
* dan monitoring basic menggunakan AWS

Tujuannya biar lebih mendekati real-world scenario, bukan sekadar project latihan biasa.

---

## What I Built

* Provision EC2 instance di AWS menggunakan Terraform
* Setup security group (SSH, HTTP, HTTPS)
* Deploy aplikasi ke EC2 menggunakan Docker
* Konfigurasi Nginx sebagai reverse proxy
* Setup CI/CD sederhana dengan GitHub Actions
* Monitoring basic menggunakan AWS CloudWatch

---

## Architecture (Simple View)

```text id="0f5yfa"
User → EC2 → Nginx → Docker Container (App)
             ↓
        CloudWatch
             ↑
      GitHub Actions
```

---

## Tech Stack

* AWS EC2
* Terraform
* Docker
* Nginx
* GitHub Actions
* CloudWatch

---

## How It Works

Secara garis besar flow-nya seperti ini:

1. Infrastructure dibuat pakai Terraform (EC2 + security group)
2. Aplikasi di-containerize menggunakan Docker
3. EC2 dikonfigurasi untuk menjalankan container
4. Nginx digunakan untuk handle request dari user
5. Setiap ada update ke repo, GitHub Actions akan trigger deployment ke server

---

## CI/CD Flow

Setiap kali ada perubahan di branch utama:

* GitHub Actions jalan otomatis
* Build Docker image
* SSH ke EC2
* Replace container lama dengan yang baru

Ini bikin proses deploy jadi lebih cepat dan konsisten.

---

## Live Demo

Aplikasi bisa diakses di:

http://16.79.31.234
AWS-Cloud-APP
---

## Project Structure

```id="1rclhn"
.
├── app/
├── docker/
├── nginx/
├── terraform/
├── .github/workflows/
└── README.md
```

---

## Challenges

Beberapa hal yang sempat jadi kendala waktu ngerjain project ini:

* Gagal SSH ke EC2 karena belum attach key pair
* Beberapa error waktu setup Docker di instance
* Harus trial & error untuk setup CI/CD supaya bisa deploy otomatis
* Adaptasi dengan Terraform terutama saat pertama kali apply/destroy resource

Tapi dari situ justru jadi lebih paham flow-nya secara keseluruhan.

---

## What I Learned

Dari project ini, aku jadi lebih paham:

* Cara provisioning infrastructure pakai Terraform
* Cara deploy aplikasi ke cloud (AWS EC2)
* Konsep containerization dengan Docker
* Flow CI/CD sederhana dari GitHub ke server
* Basic monitoring menggunakan CloudWatch

---

## Next Improvement

Kalau dikembangkan lagi, aku ingin:

* Tambah HTTPS (SSL)
* Gunakan domain sendiri
* Tambah Terraform module biar lebih scalable
* Tambah monitoring yang lebih advanced (Prometheus/Grafana)

---

## Author

Muhammad Iqbaal Hibatullah
GitHub: https://github.com/EvoVincere
LinkedIn: https://linkedin.com/in/muhammad-iqbaal-hibatullah

---
