# Taygedo Codex 宠物

语言：[English](README.md) | 简体中文

这是一个用于 Codex 的自定义 Taygedo 宠物资源仓库。仓库包含可直接安装的宠物配置和精灵图，也保留了原始生成帧、处理后帧、预览图和处理报告。

![Taygedo 预览](docs/processed-preview-normalized-contact-sheet.png)

## 使用 Codex 代理安装

在 Codex 中打开本仓库后，可以直接说：

```text
请按照 AGENTS.md 帮我安装这个 Taygedo Codex pet。
```

Codex 应按照 [AGENTS.md](AGENTS.md) 执行。推荐安装命令是：

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1
```

脚本会在安装前备份已有的 `taygedo` 宠物目录。

## 手动安装

也可以手动复制或克隆到：

```text
%USERPROFILE%\.codex\pets\taygedo
```

Codex 运行时真正需要的文件是：

```text
pet.json
spritesheet.png
```

安装后刷新 Codex 的宠物列表，或重启 Codex。宠物显示名为 `Taygedo`。

## 格式

- 精灵图尺寸：`1536 x 1872`
- 帧网格：`8 columns x 9 rows`
- 单帧尺寸：`192 x 208`
- 图片格式：带透明通道的 RGBA PNG

## 动画行映射

| 行 | 状态 | 说明 |
| --- | --- | --- |
| 0 | idle | 待机 |
| 1 | running-right | 向右移动 |
| 2 | running-left | 向左移动 |
| 3 | waving | 挥手 |
| 4 | jumping | 跳跃 |
| 5 | failed | 失败 / 错误 |
| 6 | waiting | 等待 / 思考 |
| 7 | running | 工作中 |
| 8 | review | 成功 / 审阅 |

## 仓库结构

```text
.
|-- AGENTS.md
|-- README.md
|-- README.zh-CN.md
|-- pet.json
|-- spritesheet.png
|-- scripts/
|   `-- install.ps1
|-- docs/
|   |-- generated-images-contact-sheet.png
|   |-- processed-preview-contact-sheet.png
|   |-- processed-preview-normalized-contact-sheet.png
|   |-- processing-report.json
|   `-- normalization-report.json
`-- assets/
    |-- spritesheet-before-normalize.png
    |-- spritesheet-normalized.png
    |-- raw-generated-frames/
    `-- processed-frames/
```

## 说明

最终版 `spritesheet.png` 已经过人物大小归一化处理，以减少动画播放时忽大忽小的问题。归一化前的版本保存在 `assets/spritesheet-before-normalize.png`。

原始生成图保存在 `assets/raw-generated-frames/`，抠图并透明化后的单帧保存在 `assets/processed-frames/`。
