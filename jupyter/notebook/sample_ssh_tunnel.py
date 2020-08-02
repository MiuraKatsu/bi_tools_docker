import sshtunnel
import socket
hostname = socket.gethostname()
ip_address = socket.gethostbyname(hostname)

bastion = sshtunnel.SSHTunnelForwarder(
    ('x.x.x.x',22),
    ssh_host_key = None,
    ssh_username = 'ec2-user',
    ssh_password = None,
    ssh_pkey     = '~/.ssh/your_bastions.pem',
    local_bind_address = (ip_address,33336),
    remote_bind_address = ('your-rds-cluster.rds.amazonaws.com',3306)
)
bastion.start()

#bastion.close()
