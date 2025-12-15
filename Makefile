MODULES = 01

default: index.html syllabus.pdf acknowledge.html rubric_homework.html

include rules.mk

.fresh:
	for module in $(MODULES); do (cd $$module && $(MAKE) fresh); done

fresh: .fresh

