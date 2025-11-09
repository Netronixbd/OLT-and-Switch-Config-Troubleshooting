<h1 align="center">🖧 GPON-OLT Configuration & Troubleshooting Guide</h1>

<p align="center">
A complete reference for managing, configuring, and troubleshooting network switches.<br>
Designed & maintained by <a href="https://github.com/Netronixbd">Amir Hosan</a>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/status-Active-success?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/device-Olt-blue?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/network-LAN%20%7C%20VLAN%20%7C%20Trunk-orange?style=for-the-badge"/>
</p>

# 🌐 Understanding GPON (Gigabit Passive Optical Network)

---

## 📘 Overview

**GPON (Gigabit Passive Optical Network)** is an advanced fiber-optic communication technology defined by the **ITU-T G.984** standard.  
It delivers **high-speed internet, voice (VoIP), and video (IPTV)** services from a **central office (OLT)** to multiple users (**ONTs/ONUs**) using a **single optical fiber** shared through a **passive splitter**.

---

## ⚙️ How GPON Works

GPON uses a **point-to-multipoint (P2MP)** architecture that connects one **Optical Line Terminal (OLT)** to multiple **Optical Network Terminals (ONTs)** via **passive optical splitters**.

### 🔹 Basic Operation Steps:
1. **Downstream Transmission (OLT → ONT):**
   - OLT broadcasts data to all ONTs at **2.5 Gbps** downstream speed.
   - Each ONT extracts only the data meant for it using encryption keys.

2. **Upstream Transmission (ONT → OLT):**
   - Multiple ONTs send data at **1.25 Gbps** using **TDMA (Time Division Multiple Access)**.
   - The OLT assigns unique time slots to each ONT to prevent collisions.

3. **Passive Splitter:**
   - Splits a single optical signal into multiple paths (1:8, 1:16, 1:32, etc.) without using electrical power.

---

## 🧩 Key Components

| Component | Description |
|------------|-------------|
| **OLT (Optical Line Terminal)** | Located at ISP’s central office; controls bandwidth, manages ONTs, and handles authentication. |
| **ONT / ONU (Optical Network Terminal / Unit)** | Installed at customer end; converts optical signals to Ethernet for user devices. |
| **ODN (Optical Distribution Network)** | Includes optical fiber, connectors, and splitters connecting OLT to ONTs. |

---

## ⚡ GPON vs EPON (Quick Comparison)

| Feature | **GPON** | **EPON** |
|----------|-----------|-----------|
| Standard | ITU-T G.984 | IEEE 802.3ah |
| Protocol | ATM + GEM | Ethernet |
| Downstream Speed | 2.5 Gbps | 1.25 Gbps |
| Upstream Speed | 1.25 Gbps | 1.25 Gbps |
| Encapsulation | GEM (GPON Encapsulation Method) | Pure Ethernet |
| Split Ratio | Up to 1:128 | Typically 1:64 |
| QoS Support | Advanced (Multiple T-CONTs) | Basic |
| Cost | Slightly Higher | Lower |
| Efficiency | High for Mixed Services | High for Data Services |

---

## 🚀 Advantages of GPON

✅ Supports **Triple-Play** (Internet, IPTV, VoIP)  
✅ **High bandwidth efficiency** and QoS (Quality of Service)  
✅ **Longer distance support** (up to 20 km)  
✅ **Secure data transmission** with AES encryption  
✅ **Scalable architecture** with high split ratios  
✅ Ideal for **FTTH/FTTB/FTTO** deployments  

---

## 🧱 Typical GPON Network Topology


---

## 🔐 Security Features

- **AES 128-bit Encryption** on downstream data  
- **Authentication** via Serial Number or LOID (Line ID)  
- **Access Control Lists (ACLs)** for network protection  
- **Isolated user traffic**, ensuring privacy between ONTs  

---

## 📄 Summary

**GPON** is a **high-performance, carrier-grade optical access technology** designed for delivering multi-service broadband efficiently over fiber.  
It provides **superior bandwidth, security, and scalability**, making it the preferred choice for **modern ISPs, data centers, and large enterprise networks**.

---

