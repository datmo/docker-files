from spacy.en import English

nlp = English()

doc3 = nlp(u"this is spacy lemmatize testing. programming books are more better than others")

for token in doc3:
    print (token, token.lemma, token.lemma_)