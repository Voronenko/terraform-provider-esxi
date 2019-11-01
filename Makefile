get-go: #https://github.com/travis-ci/gimme
	gimme 1.11.5

build:
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -ldflags '-w -extldflags "-static"' -o terraform-provider-esxi_`cat version`

deploy:
	rm -f /home/slavko/personal/DEVOPS_EXPERIMENTS/cichosza/providers/esxi/terraform.d/plugins/linux_amd64/terraform-provider-esxi
	cp ./terraform-provider-esxi_`cat version` /home/slavko/personal/DEVOPS_EXPERIMENTS/cichosza/providers/esxi/terraform.d/plugins/linux_amd64/
	mv /home/slavko/personal/DEVOPS_EXPERIMENTS/cichosza/providers/esxi/terraform.d/plugins/linux_amd64/terraform-provider-esxi_`cat version` /home/slavko/personal/DEVOPS_EXPERIMENTS/cichosza/providers/esxi/terraform.d/plugins/linux_amd64/terraform-provider-esxi
