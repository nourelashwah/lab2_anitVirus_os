.PHONY:antivirus prepare restore
antivirus:prepare
	./antivirusd.sh scratch/testdir malicious_dir 5
prepare:
	mkdir -p malicious_dir
restore:
	./restore.sh restore_test_dir malicious_dir
