require 'spec_helper'

describe 'ocsinventory', :type => :class do
  let (:pre_condition) { '$concat_basedir = "/tmp"' }
  let (:facts) { centos_facts }
  let (:params) {
    {
      :config_dir => '/etc/ocsinventory'
    }
  }

  describe 'without parameters' do
    it { should create_class('ocsinventory') }
    it { should contain_class('ocsinventory::install') }
    it { should contain_class('ocsinventory::config') }

    it { should contain_package('ocsinventory-agent').with_ensure('present') }
    it { should contain_file('/etc/ocsinventory').with_ensure('directory') }
  end

  describe 'with parameter: agent' do
    let (:params) { { :agent => true } }

    it {
      should contain_package('ocsinventory-agent').with(
        'ensure' => 'present'
      )

      should contain_file('/etc/ocsinventory/ocsinventory-agent.cfg').with(
        'ensure' => 'present'
      )
    }
  end

  describe 'with parameter: agent_ocs_mode' do
    let (:params) { { :agent_ocs_mode => '_VALUE_' } }

    it { should contain_file('/etc/sysconfig/ocsinventory-agent').with(
        'content' => /OCSMODE.*_VALUE_/
      )
    }
  end

  describe 'with parameter: agent_ocs_pause' do
    let (:params) { { :agent_ocs_pause => '_VALUE_' } }

    it { should contain_file('/etc/sysconfig/ocsinventory-agent').with(
        'content' => /OCSPAUSE.*_VALUE_/
      )
    }
  end

  describe 'with parameter: agent_ocs_server' do
    let (:params) { { :agent_ocs_server => '_VALUE_' } }

    it { should contain_file('/etc/sysconfig/ocsinventory-agent').with(
        'content' => /OCSSERVER.*_VALUE_/
      )
    }
  end

  describe 'with parameter: agent_ocs_tag' do
    let (:params) { { :agent_ocs_tag => '_VALUE_' } }

    it { should contain_file('/etc/sysconfig/ocsinventory-agent').with(
        'content' => /OCSTAG.*_VALUE_/
      )
    }
  end

  describe 'with parameter: config_dir' do
    let (:params) { { :config_dir => '/_VALUE_' } }

    it {
      should contain_file('/_VALUE_').with(
        'ensure' => 'directory'
      )
    }
  end

  describe 'with parameter: config_dir_mode' do
    let (:params) {
      {
        :config_dir => '/_VALUE_',
        :config_dir_mode => '0777'
      }
    }

    it {
      should contain_file('/_VALUE_').with(
        'mode' => '0777'
      )
    }
  end

  describe 'with parameter: config_dir_recurse' do
    let (:params) {
      {
        :config_dir => '/_VALUE_',
        :config_dir_recurse => '_VALUE_'
      }
    }

    it {
      should contain_file('/_VALUE_').with(
        'recurse' => '_VALUE_'
      )
    }
  end

  describe 'with parameter: config_file_mode' do
    let (:params) { { :config_file_mode => '_VALUE_' } }

    it {
      should contain_file('/etc/sysconfig/ocsinventory-agent').with(
        'mode' => '_VALUE_'
      )
    }
  end

  describe 'with parameter: config_group' do
    let (:params) { { :config_group => '_VALUE_' } }

    it {
      should contain_file('/etc/sysconfig/ocsinventory-agent').with(
        'group' => '_VALUE_'
      )
    }
  end

  describe 'with parameter: config_user' do
    let (:params) { { :config_user => '_VALUE_' } }

    it {
      should contain_file('/etc/sysconfig/ocsinventory-agent').with(
        'owner' => '_VALUE_'
      )
    }
  end

  describe 'with parameter: log_dir_agent' do
    let (:params) { { :log_dir_agent => '/_VALUE_' } }

    it {
      should contain_file('/_VALUE_').with(
        'ensure' => 'directory'
      )
    }
  end

  describe 'with parameter: log_dir_server' do
    let (:params) {
      {
        :log_dir_server => '/_VALUE_',
        :server => true
      }
    }

    it {
      should contain_file('/_VALUE_').with(
        'ensure' => 'directory'
      )
    }
  end

  describe 'with parameter: pkg_agent_ensure' do
    let (:params) { { :pkg_agent_ensure => '_VALUE_' } }

    it {
      should contain_package('ocsinventory-agent').with(
        'ensure' => '_VALUE_'
      )
    }
  end

  describe 'with parameter: pkg_server_ensure' do
    let (:params) {
      {
        :pkg_server_ensure => '_VALUE_',
        :server => true
      }
    }

    it {
      should contain_package('ocsinventory-server').with(
        'ensure' => '_VALUE_'
      )
    }
  end

  describe 'with parameter: pkg_list_agent' do
    let (:params) { { :pkg_list_agent => '_VALUE_' } }

    it {
      should contain_package('_VALUE_')
    }
  end

  describe 'with parameter: pkg_list_server' do
    let (:params) {
      {
        :pkg_list_server => '_VALUE_',
        :server => true
      }
    }

    it {
      should contain_package('_VALUE_')
    }
  end

  describe 'with parameter: server' do
    let (:params) { { :server => true } }

    it {
      should contain_package('ocsinventory-server').with(
        'ensure' => 'present'
      )

      should contain_file('/etc/ocsinventory/ocsinventory-server').with(
        'ensure' => 'directory'
      )
    }
  end
end
