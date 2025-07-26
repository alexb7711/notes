This chapter is meant to give you everything you need to start doing deep learning in practice.

# Whats TensorFlow?
TensorFlow is a Python-based, free, open source machine learning platform, developed primarily by Google. Much like
NumPy, the primary purpose of TensorFlow is to enable engineers and researchers to manipulate mathematical expressions
over numerical tensors. But TensorFlow goes far beyond the scope of NumPy in the following ways:


- It can automatically compute the gradient of any differentiable expression (as you saw in chapter 2), making it highly
  suitable for machine learning.
- It can run not only on CPUs, but also on GPUs and TPUs, highly parallel hardware accelerators.
- Computation defined in TensorFlow can be easily distributed across many machines.

TensorFlow programs can be exported to other runtimes, such as C++, JavaScript (for browser-based applications), or
TensorFlow Lite (for applications running on mobile devices or embedded devices), etc. This makes TensorFlow
applications easy to deploy in practical settings.

# What's Keras?
Keras is a deep learning AIP for Python, built on top of TenserFlow, that provides a convenient way to define and train
any kind of deep learning model.

Keras is known for prioritizing the developer experience. It’s an API for human beings, not machines. It follows best
practices for reducing cognitive load: it offers consistent and simple workflows, it minimizes the number of actions
required for common use cases, and it provides clear and actionable feedback upon user error. This makes Keras easy to
learn for a beginner, and highly productive to use for an expert.

# First Steps With TensorFlow
A significant difference between NumPy and TensorFlow is that TensorFlow tensors are not assignable, they are constant.
To update the value of a tensor, you have to use the assign method:

```python
v.assign(tf.ones((3, 1)))
v[0, 0].assign(3.)
```

## A Second Look At The GradientTape API
We established earlier that although NumPy and TensorFlow have a lot of similar operations, one thing that NumPy can't
do is take the gradient of the result with respect to the inputs:

```python
input_var = tf.Variable(initial_value=3.)
with tf.GradientTape() as tape:
   result = tf.square(input_var)
gradient = tape.gradient(result, input_var)
```

Gradient tape is also able to compute second-order gradients:

```python
time = tf.Variable(0.)
with tf.GradientTape() as outer_tape:
    with tf.GradientTape() as inner_tape:
        position =  4.9 * time ** 2
    speed = inner_tape.gradient(position, time)
acceleration = outer_tape.gradient(speed, time)
```

## An End-To-End Example: A Linear Classifier In Pure TenserFlow
```python
import matplotlib.pyplot as plt

learning_rate = 0.1

def model(inputs):
    """Forward pass function"""
    return tf.matmul(inputs, W) + b

def square_loss(targets, predictions):
    """Mean squared error loss function"""
    per_sample_losses = tf.square(targets - predictions)
    return tf.reduce_mean(per_sample_losses)

def training_step(inputs, targets):
    """One step when training the linear classifier variables"""
    with tf.GradientTape() as tape:
        predictions = model(inputs)
        loss = square_loss(predictions, targets)
    grad_loss_wrt_W, grad_loss_wrt_b = tape.gradient(loss, [W, b])
    W.assign_sub(grad_loss_wrt_W * learning_rate)
    b.assign_sub(grad_loss_wrt_b * learning_rate)
    return loss

num_samples_per_class = 1000
negative_samples = np.random.multivariate_normal(
    mean=[0, 3],
    cov=[[1, 0.5],[0.5, 1]],
    size=num_samples_per_class)
positive_samples = np.random.multivariate_normal(
    mean=[3, 0],
    cov=[[1, 0.5],[0.5, 1]],
    size=num_samples_per_class)

# Serialize the data
inputs = np.vstack((negative_samples, positive_samples)).astype(np.float32)

# Used to apply labels in a data set to distingnuish data types
targets = np.vstack((np.zeros((num_samples_per_class, 1), dtype="float32"),
                     np.ones((num_samples_per_class, 1), dtype="float32")))

plt.scatter(inputs[:, 0], inputs[:, 1], c=targets[:, 0])
plt.show()

# Begin creating the linear classifier variables
input_dim = 2
output_dim = 1
W = tf.Variable(initial_value=tf.random.uniform(shape=(input_dim, output_dim)))
b = tf.Variable(initial_value=tf.zeros(shape=(output_dim,)))

# Batch training loop
for step in range(40):
    loss = training_step(inputs, targets)
    print(f"Loss at step {step}: {loss:.4f}")

# Plot the results
predictions = model(inputs)
plt.scatter(inputs[:, 0], inputs[:, 1], c=predictions[:, 0] > 0.5)
```

# Anatomy Of A Neural Network: Understanding Core Keras APIs
