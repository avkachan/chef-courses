require 'serverspec'
require 'net/http'
set :backend, :exec

describe "Packages are installed" do
	it "Nginx, Git, Jenkins and Java are installed" do
		expect(package('nginx')).to be_installed
		expect(package('jenkins')).to be_installed
		expect(package('java-1.7.0-openjdk-devel')).to be_installed
		expect(package('git')).to be_installed
	end
end
describe "Services:" do
	it "Nginx,Tomcat and Jenkins services are running" do
		expect(service("nginx")).to be_enabled
		expect(service("jenkins")).to be_running
		expect(service("tomcat")).to be_running
	end
	it "Nginx, Tomcat and Jenkins ports are listening" do
		expect(port(8080)).to be_listening
		expect(port(9090)).to be_listening
		expect(port(10100)).to be_listening
		expect(port(22)).to be_listening
	end
end


describe 'Deploying application is' do
  it 'deploying' do
     url = URI("http://localhost:8080/mnt-lab")
     status_response = Net::HTTP.get_response(url)
     expect status_response.kind_of? Net::HTTPSuccess
  end
end

