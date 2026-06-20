# Xuka Công Nợ — Claude Context

## Server / Deploy

| Key | Value |
|---|---|
| Server | `vmadmin@vps-pro3` |
| Deploy path | `/opt/dashboard-bot/data/bots/f4966e2d7c30ecb2` |
| Deploy trigger | Push to `main` → GitHub Actions (`deploy.yml`) rsync file lên server |

### Deploy thủ công
```bash
# Từ máy local sau khi SSH vào server:
rsync -vz --inplace index.html vmadmin@vps-pro3:/opt/dashboard-bot/data/bots/f4966e2d7c30ecb2/index.html
```

## Repo

- **GitHub**: `ngalinh/Xuka-Cong-No`
- **Main branch**: `main`

## Workflow

- **Auto merge**: Sau khi push xong, tự merge PR vào `main` luôn, không cần hỏi
- **Auto deploy**: Merge vào `main` → GitHub Actions tự rsync lên server (không cần làm gì thêm)

## App

- **Một file duy nhất**: `index.html` — tự detect thiết bị và hiển thị đúng UI
  - Desktop (>768px / non-touch): desktop SPA quản lý công nợ CK 3 bên
  - Mobile (≤768px hoặc touch+≤900px): mobile SPA với 7 màn hình, drawer navigation
- `mobile.html` — file gốc, giữ lại làm reference (không deploy riêng)
- localStorage key: `xuka_cn_v1` (ver 8), `xuka_users`, `xuka_mapping`
- Data model: `D = {sup:[], kh:[], ck:[], partners:[], khChars:[], ctr:1}`
