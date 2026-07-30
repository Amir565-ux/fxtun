# 🔥 FXTUN Port Forwarding Tool

> **One-Line Install:**  
> ```bash
> bash <(curl -s https://raw.githubusercontent.com/Amir565-ux/fxtun/refs/heads/main/run.sh)
> ```

---

## 📌 What is this?

FXTUN Port Forwarding Tool ek **simple script** hai jo port forwarding ko easy banata hai. Isme 3 simple steps hain:

1. **Install** – FXTUN download karein
2. **Auth** – API Token add karein
3. **Forward** – Port forward karein (HTTP/TCP/UDP)

---

## 🚀 Features

| Feature | Description |
|---------|-------------|
| ✅ One-Line Install | Direct run from GitHub |
| ✅ Auto-Download | FXTUN automatically install |
| ✅ Token Auth | Secure API login |
| ✅ HTTP/TCP/UDP | All protocols supported |
| ✅ Subdomain | HTTP ke liye subdomain option |
| ✅ Auto-Return | Har action ke baad home screen |
| ✅ Clean UI | White theme, easy to read |
| ✅ Works Everywhere | Linux, macOS, Termux, WSL |

---

## 📦 How to Use

### 1. Run the Script
```bash
bash <(curl -s https://raw.githubusercontent.com/Amir565-ux/fxtun/refs/heads/main/run.sh)
```

### 2. Menu Options
```
[1] Install FXTUN
[2] Authenticate (API Token)
[3] Start Tunneling
[4] Exit
```

### 3. Get Token
- Go to: https://fxtun.ru/dashboard
- Copy your token
- Paste in Option 2

### 4. Start Forwarding
- Select protocol (HTTP/TCP/UDP)
- Enter port number
- For HTTP: add subdomain (optional)
- Done! 🚀

---

## 📡 Manual Commands

```bash
# HTTP
fxtunnel --token YOUR_TOKEN http 8080

# HTTP with subdomain
fxtunnel --token YOUR_TOKEN http 8080 --subdomain api

# TCP
fxtunnel --token YOUR_TOKEN tcp 22

# UDP
fxtunnel --token YOUR_TOKEN udp 53
```

---

## 🛠️ Requirements

- `curl` or `wget`
- Internet connection
- Linux/macOS/Termux/WSL

---

## ❓ Common Issues

### "Command not found"
```bash
export PATH="$HOME/.local/bin:$PATH"
```

### "Authentication failed"
- Check token at https://fxtun.ru/dashboard
- Re-enter in Option 2

### "Port already in use"
- Use a different port number

---

## 📺 Credits

**Created by:** CODINGBOYZ  
**YouTube:** [CodingBoyz](https://youtube.com/@CodingBoyz)  
**GitHub:** [Amir565-ux](https://github.com/Amir565-ux)

> ⭐ **Don't forget to Subscribe to CodingBoyz!**

---

## 📄 License

Free to use. Give credits to CODINGBOYZ.

---

**Enjoy!** 🚀
