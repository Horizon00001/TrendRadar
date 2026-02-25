#!/bin/bash
# TrendRadar 备份脚本

# 检查是否有变更
if git diff-index --quiet HEAD --; then
    echo "没有变更需要提交"
    exit 0
fi

# 获取当前时间（使用下划线避免空格问题）
TIME=$(date "+%Y-%m-%d_%H:%M:%S")

# 执行 Git 操作
git add . && \
git commit -m "trendradar_backup_$TIME" && \
git push

# 检查操作是否成功
if [ $? -eq 0 ]; then
    echo "✅ TrendRadar 备份成功: $TIME"
else
    echo "❌ TrendRadar 备份失败"
    exit 1
fi