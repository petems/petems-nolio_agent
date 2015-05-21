require 'spec_helper'

describe 'nolio_agent' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "nolio_agent class without any parameters" do
          let(:params) {{ }}

          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('nolio_agent::params') }
          it { is_expected.to contain_class('nolio_agent::install').that_comes_before('nolio_agent::config') }
          it { is_expected.to contain_class('nolio_agent::config') }
          it { is_expected.to contain_class('nolio_agent::service').that_subscribes_to('nolio_agent::config') }

          it { is_expected.to contain_service('nolio_agent') }
          it { is_expected.to contain_package('nolio_agent').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'nolio_agent class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { is_expected.to contain_package('nolio_agent') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
