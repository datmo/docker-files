import numpy
import theano.tensor as T
from theano import function

x = T.dscalar('x')
y = T.dscalar('y')
z = x + y
f = function([x, y], z)
f(2, 3)
numpy.allclose(f(16.3, 12.1), 28.4)
