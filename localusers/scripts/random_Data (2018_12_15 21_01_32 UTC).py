#!/usr/bin/env python

class NoSoRandom(object):
	def seed(self, a=3):
		""" Seed the world's most mysterious random num generator. """
		self.seedval = a
	def random(self):
		""" Look, random numbers!"""
		self.seedval = (self.seedval * 3) % 19
		return self.seedval

_inst = NoSoRandom()
seed = _inst.seed
random = _inst.random

