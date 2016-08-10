module MCollective
  module Agent
    class Deploy<RPC::Agent

      if Facts["osfamily"] == 'windows'
        $app_6000_path = 'C:\Program Files\App_6000\Code'
      else
        $app_6000_path = '/opt/app_6000/code_base'
      end
      activate_when do
        File.directory?($app_6000_path)
      end

      action "deploycode" do
        validate :hostname, String
        hostname = request[:hostname]

        validate :codebase, String
        validate :codebase, 'codebase_7000'
        codebase = request[:codebase]

        validate :codeversion, String
        validate :codeversion, /^((\blatest\b)|(\d+))$/
        codeversion = request[:codeversion]

        validate :localcodedir, String
        localcodedir = request[:localcodedir]

        reply[:result] = "Deployed #{codebase} v#{codeversion} from #{hostname} to #{localcodedir}"

        reply[:status] = run(
          "builder_5000_client #{hostname} #{codebase} #{codeversion} #{localcodedir}",
          :stdout => :out,
          :stderr => :err
        )
      end
    end
  end
end
