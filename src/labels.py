#!/bin/python3


import sys
import random
import string

def generate_random_label() -> string:
	len = random.randrange(5, 10)
	n_label:string = ''
	
	for i in len:
		n_label.join(random.SystemRandom().choice(string.ascii_letters + string.digits)) 
	return n_label

def label_found(line: string, labels) -> bool:
	for label in labels:
		if line == label:
			return (True)
	return (False)

def list_all_labels(file: string):
	labels = {}
	for line in file:
		line = line.trim()
		if line[0] != '_' or line == "_start":
			continue 
		elif line[-1] == ':':
			labels.append(dict(line, generate_random_label()))
	return labels

def modify_labels(file: string) -> string:
	labels = list_all_labels(file)
	tmp_index:int = 0

	for line in file:
		tmp_index = line.index('_')
		if tmp_index != -1:
			
			
	return 