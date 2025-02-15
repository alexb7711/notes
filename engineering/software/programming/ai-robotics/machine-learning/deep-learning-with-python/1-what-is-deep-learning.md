# Artificial Intelligence, Machine Learning, And Deep Learning

## Artificial Intelligence

> AI can be described as the effort to automate intellectual tasks normally performed by humans. As such, AI is a
> general field that encompasses machine learning and deep learning, but that also includes many more approaches that
> may not involve any learning.

Traditional AI from the 1980s included what is known as symbolic AI which believed that if an agent had a large enough
pool of hand crafted rules, then true artificial intelligence could be achieved.

## Machine Learning

Machine learning turns this around: the machine looks at the input data and the corresponding answers, and figures out
what the rules should be. That is to the say, the system is trained rather than programmed.

Machine learning, and especially deep learning, exhibits comparatively little mathematical theory—maybe too little—and
is fundamentally an engineering discipline. Unlike theoretical physics or mathematics, machine learning is a very
hands-on field driven by empirical findings and deeply reliant on advances in software and hardware.

## Learning Rules And Representations From Data

To do machine learning, we need three things:

- Input data points—For instance, if the task is speech recognition, these data points could be sound files of people speaking. If the task is image tagging, they could be pictures.
- Examples of the expected output—In a speech-recognition task, these could be human-generated transcripts of sound files. In an image task, expected outputs could be tags such as “dog,” “cat,” and so on.
- A way to measure whether the algorithm is doing a good job—This is necessary in order to determine the distance between the algorithm’s current output and its expected output. The measurement is used as a feedback signal to adjust the way the algorithm works. This adjustment step is what we call learning.

From this we can make a blanket statement that the central problem for machine learning and deep learning is to
meaningfully transform data, in other words, to learn useful representations of the input data.

So that’s what machine learning is, concisely: searching for useful representations and rules over some input data,
within a predefined space of possibilities, using guidance from a feedback signal. This simple idea allows for solving a
remarkably broad range of intellectual tasks, from speech recognition to autonomous driving.

### The "Deep" In "Deep Learning"

Deep learning is a subfield of machine learning that puts an emphasis on learning successive layers of increasingly
meaningful representations. How many layers contribute to the model of the data is called the depth of the model.

Deep learning is done with models called neural networks. These layers can be thought of as a multistage information
distillation process, where information goes through successive filters and comes out increasingly purified.

### Understanding How Deep Learning Works

The core of deep learning is to parameterize each node in the neural net, i.e. give each node a value. These gains, when
appropriately set, will be able to appropriately output the desired information based on the input given.

To set the gains, a set of training data is provided along with an objective function. The objective function is
designed to indicate how far off the output of the neural net was as compared to its true representation. Feeding this
information back into the neural net to adjust the gains then becomes the main name of the game. As we iterate through
this process, the neural net (theoretically) becomes more accurate.

### What Deep Learning has Achieved So Far

In particular, deep learning has enabled the following breakthroughs, all in historically difficult areas of machine learning:

- Near-human-level image classification
- Near-human-level speech transcription
- Near-human-level handwriting transcription
- Dramatically improved machine translation
- Dramatically improved text-to-speech conversion
- Digital assistants such as Google Assistant and Amazon Alexa
- Near-human-level autonomous driving
- Improved ad targeting, as used by Google, Baidu, or Bing
- Improved search results on the web
- Ability to answer natural language questions
- Superhuman Go playing

## The Modern Machine Learning Landscape

### Algorithms

Until the late 2000s, we were missing a reliable way to train very deep neural networks. In 2009-2010 the advent of better activation functions, better weight initialization schemes, and better optimization schemes allowed for deeper neural nets to flourish.