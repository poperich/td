import jenkins

server = jenkins.Jenkins('http://localhost:8080', username='admin', password='admin')
user = server.get_whoami()
version = server.get_version()
print('Hello %s from Jenkins %s' % (user['fullName'], version))
server_job = server.get_jobs()
#print(server_job)
job_list = ["TestSistemas-build","TestSistemas-deploy"]
for job_name in job_list:
    if job_name not in [sjob["name"] for sjob in server_job]:
        print("adding job {}".format(job_name))
        server.create_job(job_name, jenkins.EMPTY_CONFIG_XML)
        server.create_job("PRO-{}".format(job_name), jenkins.EMPTY_CONFIG_XML)
server_job = server.get_jobs()
#print(server_job)
