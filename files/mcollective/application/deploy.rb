class MCollective::Application::Deploy<MCollective::Application
  description "Deploy app_6000"

   option :hostname,
          :description    => "Hostname of Builder_5000",
          :arguments      => ["-h", "--hostname HOSTNAME"],
          :type           => String,
          :required       => true
  option :codebase,
          :description    => "Codebase Name to Deploy",
          :arguments      => ["-c", "--codebase CODEBASE"],
          :type           => String,
          :required       => true

  option :codeversion,
         :description    => "Version of Code to Deploy",
         :arguments      => ["-v", "--codeversion CODEVERSION"],
         :type           => String,
         :required       => true

  option :localcodedir,
         :description    => "Local Directory to Deploy Code to",
         :arguments      => ["-d", "--localcodedir LOCALCODEDIR"],
         :type           => String,
         :required       => true

   def main
      deployclient  = rpcclient("deploy")
      puppetclient  = rpcclient("puppet")

      # Deploy New Code
      printrpc deployclient.deploycode(
        :hostname     => configuration[:hostname],
        :codebase     => configuration[:codebase],
        :codeversion  => configuration[:codeversion],
        :localcodedir => configuration[:localcodedir]
      )

      # Invoke a puppet run
      printrpc puppetclient.runonce()

      printrpcstats
   end
end
