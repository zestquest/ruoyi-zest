来源于若依前后端分离版，现在为魔改版

## 更新日志

### 2026-03-28 13:43:37
- 新增根目录 `.gitignore` 文件，配置 Git 忽略规则
- 忽略内容：`target/`、`node_modules/`、`dist/`、`.idea/`、`*.jar`、`*.log` 等
- 保留 `apache-maven-3.8.1/` 目录纳入 Git 管理

### 2026-03-28 13:36:54
- 优化 `bin/start-all.bat`：移除硬编码 Java 路径，改用动态查找
- 优化 `bin/start-all.bat`：添加 Java 版本检查，确保 >= JDK 17

### 2026-03-28 13:29:12
- 修改首页内容为 README.md 内容展示
- 修改 GitHub 图标链接为 `https://github.com/zestquest/ruoyi-zest`
- 删除导航栏"文档地址"按钮

### 2026-03-28 12:46:15
- 优化 `bin/start-all.bat`：优先使用 JAVA_HOME 环境变量查找 Java，解决双击运行时找不到 Java 的问题
- 优化 `bin/start-all.bat`：自动安装前端依赖，无需手动运行 npm install
