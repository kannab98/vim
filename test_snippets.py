#!/usr/bin/env python
# -*- coding: utf-8 -*-
import matplotlib.pyplot as plt
import numpy as np

x = np.linspace(0,100,100)
y = np.sin(x)

plt.plot(x,y)
plt.savefig('test')
plt.show()
