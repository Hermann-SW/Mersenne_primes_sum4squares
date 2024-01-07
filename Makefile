
demo:
	@echo
	time -f %E\\n  gp -q < validate.gp
	time -f %E\\n  python validate.py

clean:
	rm -rf __pycache__
