# AWS Cloud App Deployment (Terraform + Docker + CI/CD + Monitoring)

## Overview

Project ini aku buat sebagai latihan untuk benar-benar ngerasain gimana proses deploy aplikasi di cloud dari awal sampai bisa diakses publik.

Jadi bukan cuma deploy app aja, tapi sekalian nyentuh beberapa hal yang sering dipakai di real-world:

* Infrastructure as Code pakai Terraform
* Containerization pakai Docker
* CI/CD sederhana pakai GitHub Actions
* Setup domain + DNS pakai Cloudflare
* Monitoring pakai Prometheus & Grafana

---

## Live Demo

https://iqbaalcloudporto.site

---

## What I Built

Di project ini aku setup:

* Provision EC2 di AWS pakai Terraform
* Setup security group (SSH, HTTP, dll)
* Deploy aplikasi (React static) pakai Docker + Nginx
* Setup CI/CD sederhana (auto deploy dari GitHub)
* Hubungkan domain ke server via Cloudflare
* Tambahin monitoring pakai Prometheus & Grafana

---

## Architecture (Simple View)

```text
User → Cloudflare → EC2
                      ├── Docker (Nginx + App)
                      ├── Prometheus
                      └── Grafana
```

---

## Tech Stack

* AWS EC2
* Terraform
* Docker
* Nginx
* GitHub Actions
* Cloudflare
* Prometheus
* Grafana

---

## How It Works

Flow-nya kurang lebih seperti ini:

1. Infrastructure dibuat pakai Terraform (EC2 + security group)
2. Aplikasi di-build dan dijalankan dalam Docker container
3. Nginx digunakan untuk serve static file
4. Domain diarahkan ke server lewat Cloudflare
5. Setiap ada update di repo, GitHub Actions akan deploy ulang ke EC2
6. Prometheus collect metrics, Grafana digunakan untuk visualisasi

---

## CI/CD Flow

Setiap ada perubahan di branch utama:

* GitHub Actions akan jalan otomatis
* Build & deploy ke EC2 via SSH
* Container lama diganti dengan yang baru

Tujuannya biar deploy lebih cepat dan konsisten tanpa manual step.

---

## Monitoring

Untuk monitoring, aku pakai:

* Prometheus → untuk collect metrics dari server
* Grafana → untuk visualisasi (CPU, RAM, dll)

Masih basic, tapi sudah cukup buat lihat kondisi server secara real-time.

---

## Project Structure

```
.
├── app/
├── docker/
├── nginx/
├── terraform/
├── monitoring/
├── .github/workflows/
└── README.md
```

---

## Challenges

Beberapa kendala yang sempat aku temui:

* Issue SSH karena key pair belum ke-attach
* Error Docker karena resource EC2 terbatas
* Setup CI/CD yang sempat trial & error
* DNS propagation waktu setup domain di Cloudflare
* Container tidak auto start saat instance restart

Tapi justru dari situ jadi lebih ngerti flow-nya end-to-end.

---

## What I Learned

Dari project ini aku jadi lebih paham:

* Provisioning infrastructure pakai Terraform
* Deploy aplikasi ke AWS EC2
* Cara kerja Docker dalam production sederhana
* Flow CI/CD dari GitHub ke server
* Basic monitoring dengan Prometheus & Grafana
* Konsep DNS & routing lewat Cloudflare

---

## Next Improvement

Kalau dikembangkan lagi, aku ingin:

* Setup HTTPS full (end-to-end SSL)
* Tambah alerting di Grafana
* Monitoring container (bukan cuma server)
* Improve security (restrict access ke Grafana)
* Refactor Terraform jadi module

---

## Author

Muhammad Iqbaal Hibatullah
GitHub: https://github.com/EvoVincere
LinkedIn: https://linkedin.com/in/muhammad-iqbaal-hibatullah

---
