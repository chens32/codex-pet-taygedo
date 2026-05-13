# Codex Agent Instructions / Codex 代理安装说明

This repository contains a ready-to-install custom Codex pet named `Taygedo`.

本仓库包含一个可直接安装的 Codex 自定义宠物：`Taygedo`。

## Agent Task / 代理任务

When a user asks Codex to install this pet, install the runtime pet files from this repository into the user's Codex pet directory.

当用户要求 Codex 安装这个宠物时，请把本仓库中的运行时宠物文件安装到用户的 Codex 宠物目录。

## Runtime Files / 运行时文件

Only these files are required by Codex at runtime:

Codex 运行时只需要以下文件：

```text
pet.json
spritesheet.png
```

Do not copy `.git`, `docs/`, `assets/`, or raw source frames into the runtime pet directory unless the user explicitly asks for them.

除非用户明确要求，不要把 `.git`、`docs/`、`assets/` 或原始帧图复制到运行时宠物目录。

## Install Target / 安装目标

Use this destination on Windows:

Windows 下使用这个目标目录：

```text
%USERPROFILE%\.codex\pets\taygedo
```

The folder name must remain `taygedo`, because Codex uses the custom pet folder name as the runtime custom pet id.

目录名必须保持为 `taygedo`，因为 Codex 会使用自定义宠物目录名作为运行时宠物 id。

## Preferred Install Command / 推荐安装命令

From the repository root, run:

在仓库根目录执行：

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1
```

The script validates `pet.json`, verifies that `spritesheet.png` is `1536 x 1872`, backs up any existing `taygedo` pet folder, and installs the current runtime files.

该脚本会校验 `pet.json`，确认 `spritesheet.png` 为 `1536 x 1872`，备份已有的 `taygedo` 宠物目录，然后安装当前运行时文件。

## Manual Fallback / 手动备用流程

If the script cannot be run, do this manually:

如果无法运行脚本，请手动执行：

1. Confirm the repository root contains `pet.json` and `spritesheet.png`.
2. Confirm `pet.json` has `"displayName": "Taygedo"` and `"spritesheetPath": "spritesheet.png"`.
3. Confirm `spritesheet.png` is `1536 x 1872`.
4. Create `%USERPROFILE%\.codex\pets` if it does not exist.
5. If `%USERPROFILE%\.codex\pets\taygedo` already exists, move it to a timestamped backup folder.
6. Create a fresh `%USERPROFILE%\.codex\pets\taygedo`.
7. Copy only `pet.json` and `spritesheet.png` into that folder.
8. Tell the user to refresh the Codex pet list or restart Codex.

手动流程：

1. 确认仓库根目录存在 `pet.json` 和 `spritesheet.png`。
2. 确认 `pet.json` 包含 `"displayName": "Taygedo"` 和 `"spritesheetPath": "spritesheet.png"`。
3. 确认 `spritesheet.png` 的尺寸为 `1536 x 1872`。
4. 如果 `%USERPROFILE%\.codex\pets` 不存在，先创建它。
5. 如果 `%USERPROFILE%\.codex\pets\taygedo` 已存在，先移动到带时间戳的备份目录。
6. 新建 `%USERPROFILE%\.codex\pets\taygedo`。
7. 只复制 `pet.json` 和 `spritesheet.png` 到该目录。
8. 告知用户刷新 Codex 宠物列表，或重启 Codex。

## Safety Rules / 安全规则

- Never delete the whole `%USERPROFILE%\.codex\pets` directory.
- Never overwrite an existing `taygedo` folder without creating a backup first.
- Keep the install scoped to the current user profile.
- Do not modify source art or generated assets during installation.

- 不要删除整个 `%USERPROFILE%\.codex\pets` 目录。
- 覆盖已有 `taygedo` 目录前必须先备份。
- 安装范围只限当前用户目录。
- 安装过程中不要修改源图或生成资源。
