# Taygedo Codex Pet / Taygedo Codex 宠物

Custom Taygedo pet assets for Codex. This repository contains the installable pet manifest and spritesheet, plus the source frames, previews, and processing reports used to build the final asset.

这是一个用于 Codex 的自定义 Taygedo 宠物资源仓库。仓库包含可直接安装的宠物配置和精灵图，也保留了原始生成帧、处理后帧、预览图和处理报告。

![Taygedo preview](docs/processed-preview-normalized-contact-sheet.png)

## Install / 安装

Copy or clone this repository to:

将本仓库复制或克隆到：

```text
%USERPROFILE%\.codex\pets\taygedo
```

The required runtime files are:

Codex 运行时真正需要的文件是：

```text
pet.json
spritesheet.png
```

After installation, refresh the Codex pet list or restart Codex. The pet display name is `Taygedo`.

安装后刷新 Codex 的宠物列表，或重启 Codex。宠物显示名为 `Taygedo`。

## Format / 格式

- Spritesheet size / 精灵图尺寸：`1536 x 1872`
- Frame grid / 帧网格：`8 columns x 9 rows`
- Frame size / 单帧尺寸：`192 x 208`
- Image format / 图片格式：RGBA PNG with transparency / 带透明通道的 PNG

## Animation Rows / 动画行映射

| Row | State | 中文说明 |
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

## Repository Layout / 仓库结构

```text
.
├── pet.json
├── spritesheet.png
├── docs/
│   ├── generated-images-contact-sheet.png
│   ├── processed-preview-contact-sheet.png
│   ├── processed-preview-normalized-contact-sheet.png
│   ├── processing-report.json
│   └── normalization-report.json
└── assets/
    ├── spritesheet-before-normalize.png
    ├── spritesheet-normalized.png
    ├── raw-generated-frames/
    └── processed-frames/
```

## Notes / 说明

The final `spritesheet.png` has been normalized so the character size is more consistent between frames. The pre-normalized version is kept at `assets/spritesheet-before-normalize.png`.

最终版 `spritesheet.png` 已经过人物大小归一化处理，以减少动画播放时忽大忽小的问题。归一化前的版本保存在 `assets/spritesheet-before-normalize.png`。

The original generated frames are kept in `assets/raw-generated-frames/`. The transparent processed single frames are kept in `assets/processed-frames/`.

原始生成图保存在 `assets/raw-generated-frames/`，抠图并透明化后的单帧保存在 `assets/processed-frames/`。
