local M = {}

function M.setup(config)
  config.ssh_domains = {
    {
      name = 'vps-hetzner',
      remote_address = 'hetzner',
    },
  }
end

return M
