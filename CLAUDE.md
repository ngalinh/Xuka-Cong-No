# Xuka Công Nợ — Claude Context

## Server / Deploy

| Key | Value |
|---|---|
| Server | `vmadmin@vps-pro3` |
| Deploy path | `/opt/dashboard-bot/data/bots/f4966e2d7c30ecb2` |
| Deploy trigger | Push to `main` → GitHub Actions (`deploy.yml`) rsync file lên server |

### Tạo file mới trên server (one-time)
```bash
sudo touch /opt/dashboard-bot/data/bots/f4966e2d7c30ecb2/mobile.html
sudo chown vmadmin /opt/dashboard-bot/data/bots/f4966e2d7c30ecb2/mobile.html
```

### Deploy thủ công
```bash
# Từ máy local sau khi SSH vào server:
rsync -vz --inplace index.html vmadmin@vps-pro3:/opt/dashboard-bot/data/bots/f4966e2d7c30ecb2/index.html
rsync -vz --inplace mobile.html vmadmin@vps-pro3:/opt/dashboard-bot/data/bots/f4966e2d7c30ecb2/mobile.html
```

## Repo

- **GitHub**: `ngalinh/Xuka-Cong-No`
- **Main branch**: `main`
- **Feature branch hiện tại**: `claude/cool-hamilton-h1denu` (PR #14)

## Workflow

- **Auto merge**: Sau khi push xong, tự merge PR vào `main` luôn, không cần hỏi
- **Auto deploy**: Merge vào `main` → GitHub Actions tự rsync lên server (không cần làm gì thêm)

## App

- Desktop: `index.html` — SPA quản lý công nợ CK 3 bên
- Mobile: `mobile.html` — 10 màn hình theo design handoff
- localStorage key: `xuka_cn_v1` (ver 8), `xuka_users`, `xuka_mapping`
- Data model: `D = {sup:[], kh:[], ck:[], partners:[], khChars:[], ctr:1}`
