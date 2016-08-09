metadata :name        => 'deploy',
         :description => 'Deploy app_6000',
         :author      => 'Kalen Peterson',
         :license     => 'Apache 2.0',
         :version     => '0.1',
         :url         => 'https://github.com/kalenpeterson-fs/puppe-app_6000',
         :timeout     => 60

action 'deploycode', :description => 'Deploy the app_6000 code' do
    display :always

    input :hostname,
          :prompt      => 'Hostname',
          :description => 'Hostname of Builder_5000',
          :type        => :string,
          :validation  => '.*',
          :optional    => false,
          :maxlength   => 1024

    input :codebase,
          :prompt      => 'Codebase',
          :description => 'Codebase Name to Deploy',
          :type        => :string,
          :validation  => 'codebase_7000',
          :optional    => false,
          :maxlength   => 1024

    input :codeversion,
          :prompt      => 'CodeVersion',
          :description => 'Version of Code to Deploy',
          :type        => :string,
          :validation  => '^((\blatest\b)|(\d+))$',
          :optional    => false,
          :maxlength   => 1024

    input :localcodedir,
          :prompt      => 'LocalCodeDir',
          :description => 'Local Directory to Deploy Code to',
          :type        => :string,
          :validation  => '.*',
          :optional    => false,
          :maxlength   => 1024

    output :result,
            :description => 'The Deploy Result',
            :display_as  => 'DeployResult',
            :default     => ''
end
