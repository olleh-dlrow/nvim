local plugin_cfgs = require("global_configs").plugins

-- 自动安装 Packer.nvim
-- 插件安装目录
-- ~/.local/share/nvim/site/pack/packer/
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local packer_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
  vim.notify("正在安装Pakcer.nvim，请稍后...")
  packer_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    -- "https://gitcode.net/mirrors/wbthomason/packer.nvim",
    install_path,
  })

  -- https://github.com/wbthomason/packer.nvim/issues/750
  local rtp_addition = vim.fn.stdpath("data") .. "/site/pack/*/start/*"
  if not string.find(vim.o.runtimepath, rtp_addition) then
    vim.o.runtimepath = rtp_addition .. "," .. vim.o.runtimepath
  end
  vim.notify("Pakcer.nvim 安装完毕")
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("没有安装 packer.nvim")
  return
end

packer.init({
    -- 关于snapshot的使用：
    -- PackerSnapshot v1.json 用于为当前的插件生成commits备份
    -- 当更新遇到bug时，可以使用PackerSnapshotRollback v1.json来进行恢复

    -- 锁定插件版本在snapshots目录
    snapshot_path = require("packer.util").join_paths(vim.fn.stdpath("config"), "snapshots"),
    -- 这里锁定插件版本在v1，不会继续更新插件
    snapshot = "v1.json",

    -- snapshot = require("packer.util").join_paths(vim.fn.stdpath("config"), "snapshots") .. "/v1",

    -- 最大并发数
    max_jobs = 10,
    -- 自定义源
    git = {
      -- default_url_format = "https://hub.fastgit.xyz/%s",
      -- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
      -- default_url_format = "https://gitcode.net/mirrors/%s",
      -- default_url_format = "https://gitclone.com/github.com/%s",
    },
    display = {
    -- 使用浮动窗口显示
      open_fn = function()
        return require("packer.util").float({ border = "single" })
      end,
    },
    -- 预览哪些插件需要更新
    preview_updates = true,
})

packer.startup({
  function(use)
    -- Packer 可以升级自己
    use("wbthomason/packer.nvim")
    -------------------------- plugins -------------------------------------------

    for _, cfg in pairs(plugin_cfgs) do
        if cfg.uninstall then
            return
        end

        use({
            cfg.rel_url,
            requires = cfg.req_tbl,
        })
    end

    if packer_bootstrap then
      packer.sync()
    end
  end,
})

for _, cfg in pairs(plugin_cfgs) do
    if cfg.enable and cfg.cfg_lua ~= nil then
        require("plugin-config." .. cfg.cfg_lua)
    end
end
