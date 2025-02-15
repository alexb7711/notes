Understanding deep learning requires familiarity with many simple mathematical concepts: tensors, tensor operations, differentiation, and gradient descent, etc.

# A First Look At A Neural Network

You can think of “solving” MNIST as the “Hello World” of deep learning—it’s what you do to verify that your algorithms are working as expected. 

Besides having the training/test data and labels and having created the structure of our neural net, to make the model ready for training, we need to pick three things as part of the compilation step:

- *An optimizer (gradient descent method)* —The mechanism through which the model will update itself based on the training data it sees, so as to improve its performance.
- *A loss function (objective function)* — How the model will be able to measure its performance on the training data, and thus how it will be able to steer itself in the right direction.
- *Metrics to monitor during training and testing (track how the overall system is doing)* — Here, we’ll only care about accuracy (the fraction of the images that were correctly classified).

# Data Representations For Neural Networks

In general, all current machine learning systems use tensors as their basic structure. Tensors are a generalization of matrices to an arbitrary number of dimensions (a matrix is a tensor of rank 2).

## The Gears Of Neural Networks: Tensor Operations

Recall the dense layer created previously

```Python
keras.layers.Dense(512, activation="relu")
```

This layer can be interpreted as a function which takes in a matrix and outputs a matrix. Let `W` be a matrix `b` be a vector. The output of the dense layer created above is of the form $\\text{relu}(\\text{input} \\cdot W + b)$. In Python that translates to

```Python
output = relu(dot(input,W) + b
```

Note `relu` stands for "rectified linear unit" and is defined as $\\text{max}(x,0)$.

### Geometric Interpretation of Tensor Operations

This section actually has a really good set of visuals for understanding different types of transforms.

### A Geometric Interpretation of Deep Learning

You can interpret a neural network as a very complex geometric transformation in a high-dimensional space, implemented via a series of simple steps. Deep learning finds neat representations for complex , highly folded data manifolds in high-dimensional spaces (a manifold is a continuous surface).

## The Engine Of Neural Networks: Gradient-Based Optimization

In the example

```Python
 output = relu(dot(input,W) + b
```

`W` and `b` are trainable parameters know as the kernel and bias attributes, respectively. Lets say that the current value of W is W0. To begin minimizing `W` by taking a "step" , you would follow `W1 = W0 - step * grad(f(W0), W0)`\[^1\].  Where `f(W0) = loss_value`.

### Stochastic Gradient Descent

While the above operation is possible to complete, when you increase the number of parameters are never less than a few thousand, things begin to slow down. Rather than including the entire data set, you can speed things up by batching. That is, you can follow the steps above using a random sample of data. Because you are dealing with a differentiable function, you can compute the gradient. The algorithm, called a mini-batch stochastic gradient, is defined as follows:

1. Draw a  batch of training samples, `x` , and corresponding targets `y_true`,
2. Run the model on `x` to obtain predictions `y_pred` (forward pass),
3. Compute the loss on the batch,
4. Compute the gradient of the loss with regard to the model's parameters (backward pass), and
5. Move the parameters a little in the opposite direction of the gradient `W -= learning_rate * gradient`

What was described is a single method of optimization, there are many others such as: SGD with momentum, Adagram, RMSprop, etc.

### Chaining Derivatives: The Backpropagation Algorithm

Up to now we casually assumed that because a function is differentiable, we can compute its gradient. But is that true? How wan we compute the gradient of complex expressions in practice? This is where the Backpropagation algorithm comes in.

#### The Chain Rule

Recalling the neural net created earlier that had two layers, the model can be expressed as W1, b1, W2, and b2 which has operations acting on each layer. The loss value can be expressed as:

```Python
loss_value = loss(y_true, softmax(dot(relu(dot(inputs,W1) + b1), W2) + b2))
```

Which we can see is a composition of function calls such as $f(g(x))$. We can explicitly write this composition as a python function

```Python
def fg(x):
	x1 = g(x)
	y = f(x1)
	return y
```

If we want to take the gradient of $f(g(x))$, using the notation from the code above we can write `grad(y,x) == grad(y,x1) * grad(x1,x)`. This pattern continues as you further encase functions in other functions. Applying the chain rule to the computation of the gradient  values of neural network gives rise to the algorithm called backpropagation.

#### Automatic Differentiation With Computational Graphs

The figures in this section are invaluable. I'm just going to reference this section of the chapter and tell you to go look at it until I can recreate the images or something.

### The Gradient Tape In Tenserflow

The API which you can leverage `TenserFlow`'s automatic differentiation is by using `GradientTape`. `GradientTape` effectively records the tensor operations occurring inside of its scope.

```python
import tensorflow as tf
x = tf.Variable(0.)                      
with tf.GradientTape() as tape:          
    y = 2 * x + 3                        
grad_of_y_wrt_x = tape.gradient(y, x)
```

## Summary

- Deep learning models consist of chains of simple tensor operations, parameterized by *weights*, which are themselves tensors. The weights of a model are where its “knowledge” is stored.
- *Learning* means finding a set of values for the model’s weights that minimizes a *loss function* for a given set of training data samples and their corresponding targets.
- Learning happens by drawing random batches of data samples and their targets, and computing the gradient of the model parameters with respect to the loss on the batch. The model parameters are then moved a bit (the magnitude of the move is defined by the learning rate) in the opposite direction from the gradient. This is called *mini-batch stochastic gradient descent*.
- The entire learning process is made possible by the fact that all tensor operations in neural networks are differentiable, and thus it’s possible to apply the chain rule of derivation to find the gradient function mapping the current parameters and current batch of data to a gradient value. This is called *backpropagation*.
- Two key concepts you’ll see frequently in future chapters are *loss* and *optimizers*. These are the two things you need to define before you begin feeding data into a model.
  - The *loss* is the quantity you’ll attempt to minimize during training, so it should represent a measure of success for the task you’re trying to solve.
  - The *optimizer* specifies the exact way in which the gradient of the loss will be used to update parameters: for instance, it could be the RMSProp optimizer, SGD with momentum, and so on.

\[^1\]: <https://www.khanacademy.org/math/multivariable-calculus/multivariable-derivatives/gradient-and-directional-derivatives/v/why-the-gradient-is-the-direction-of-steepest-ascent>