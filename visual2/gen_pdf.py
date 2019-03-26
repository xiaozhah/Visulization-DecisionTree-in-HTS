import os
for mdl in ['mdl1','mdl3','mdl5']:
	print 'Execute inf2dot.pl... now in %s' % mdl
	os.system('perl inf2dot.pl ./{0}/tree_sd_cmp.inf ./{0}/Tree'.format(mdl))

os.system('wolframscript -file ChangeColor.wl')

for mdl in ['mdl1','mdl3','mdl5']:
	for file in os.listdir(mdl):
		file_type = os.path.splitext(file)
		if  file_type[1] == '.dot':
			cmd = 'dot -Tpdf ./{0}/{1}.dot -o ./{0}/{1}.pdf'.format(mdl,file_type[0])
			print cmd
			os.system(cmd)
	os.system('rm -rf ./%s/*.dot' % mdl)
