# include Chef::Mixin::Shellout
::Chef::Recipe.send(:include, Chef::Mixin::ShellOut)

log 'Creating OpenTSDB HBase tables. '

execute "create OpenTSDB hbase tables" do
	cwd "#{node['opentsdb']['tsdb_installdir']}/opentsdb/tools"
	command "./create_table.sh >> /var/log/hbase.create_tsdb_tables.log 2>&1"
	environment ({'HBASE_HOME' => "#{node['opentsdb']['hbase_home']}", "COMPRESSION" => "none"})
end
