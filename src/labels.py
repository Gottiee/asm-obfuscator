#!/bin/python3


import sys
import random
import pprint
from typing import Dict

def generate_random_label() -> str:
	len = random.randrange(5, 10)
	n_label:str = ''
	
	for i in len:
		n_label.join(random.SystemRandom().choice(str.ascii_letters + str.digits)) 
	return n_label

def label_found(line: str, labels) -> bool:
	for label in labels:
		if line == label:
			return (True)
	return (False)

def list_all_labels(file: str) -> dict[str, str]:
	labels: dict[str, str] = {}
	for line in file:
		line = line.lstrip()
		if not line:
			continue
		elif line[0] != '_' or line == "_start":
			continue 
		elif line[-1] == ':':
			labels.append(dict(line, generate_random_label()))
	return labels

def find_label_in_line(str: str, char: str) -> int:
	index = 0
	for c in str:
		if c == char[0]:
			return index
		index += 1
	return -1

def modify_labels(file: str) -> str:
	labels: dict[str, str] = list_all_labels(file)
	tmp_index: int = 0
	label: str = ""

	with open("asm/eliot.asm", "r") as file:
		print("Dans modify")
		for line in file:
			print("line -> ", line)
			tmp_index = strchr(line, "_")
			if tmp_index == -1:				# line contains a label
				continue
			print("A label was found in line ", line, " at index ", tmp_index)
			label = line[tmp_index:].split()[0]
			l_label = len(label)
			label = labels.get(label)
			if label is None:
				print("Label ", label, " not found in labels")
				continue
			if line is None:
				print("Line is None")
			if label is None:
				print("Label is None")
			line = line[:tmp_index] + label + line[tmp_index + l_label]
			print("New line -> ", line)
		
	return 