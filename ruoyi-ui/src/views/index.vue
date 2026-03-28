<template>
  <div class="app-container home">
    <el-card class="readme-card">
      <div slot="header" class="clearfix">
        <span>README</span>
      </div>
      <div class="readme-content">
        <h1>来源于若依前后端分离版，现在为魔改版</h1>
        
        <h2>更新日志</h2>
        
        <h3>2026-03-28 13:43:37</h3>
        <ul>
          <li>新增根目录 <code>.gitignore</code> 文件，配置 Git 忽略规则</li>
          <li>忽略内容：<code>target/</code>、<code>node_modules/</code>、<code>dist/</code>、<code>.idea/</code>、<code>*.jar</code>、<code>*.log</code> 等</li>
          <li>保留 <code>apache-maven-3.8.1/</code> 目录纳入 Git 管理</li>
        </ul>
        
        <h3>2026-03-28 13:36:54</h3>
        <ul>
          <li>优化 <code>bin/start-all.bat</code>：移除硬编码 Java 路径，改用动态查找</li>
          <li>优化 <code>bin/start-all.bat</code>：添加 Java 版本检查，确保 >= JDK 17</li>
        </ul>
        
        <h3>2026-03-28 13:29:12</h3>
        <ul>
          <li>修改首页内容为 README.md 内容展示</li>
          <li>修改 GitHub 图标链接为 <code>https://github.com/zestquest/ruoyi-zest</code></li>
          <li>删除导航栏"文档地址"按钮</li>
        </ul>
        
        <h3>2026-03-28 12:46:15</h3>
        <ul>
          <li>优化 <code>bin/start-all.bat</code>：优先使用 JAVA_HOME 环境变量查找 Java，解决双击运行时找不到 Java 的问题</li>
          <li>优化 <code>bin/start-all.bat</code>：自动安装前端依赖，无需手动运行 npm install</li>
        </ul>
      </div>
    </el-card>
  </div>
</template>

<script>
export default {
  name: 'Index',
  data() {
    return {}
  },
  methods: {}
}
</script>

<style scoped lang="scss">
.home {
  padding: 20px;
  
  .readme-card {
    max-width: 900px;
    margin: 0 auto;
  }
  
  .readme-content {
    h1 {
      font-size: 24px;
      margin-bottom: 20px;
      color: #303133;
    }
    
    h2 {
      font-size: 20px;
      margin-top: 30px;
      margin-bottom: 15px;
      color: #303133;
      border-bottom: 1px solid #ebeef5;
      padding-bottom: 10px;
    }
    
    h3 {
      font-size: 16px;
      margin-top: 20px;
      margin-bottom: 10px;
      color: #606266;
    }
    
    ul {
      list-style-type: disc;
      padding-left: 20px;
      
      li {
        margin: 8px 0;
        line-height: 1.6;
        color: #606266;
        
        code {
          background-color: #f5f7fa;
          padding: 2px 6px;
          border-radius: 4px;
          font-family: Consolas, Monaco, monospace;
          color: #e6a23c;
        }
      }
    }
  }
}
</style>
