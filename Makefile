SUFFIXES=.java .class .g

all: Engine.class DomEngine.class RtfLexer.class RtfParser.class Convert.class Main.class
	mkdir -p out
	jar cvfm out/Rtf2Htm.jar manifest.txt *.class 

%.class: %.java
	javac $<

RtfLexer.java: Rtf.g
	java org.antlr.Tool $<

RtfParser.java: Rtf.g

Convert.java: Convert.g
	java org.antlr.Tool $<

run: all
	java Main test.rtf > out.html 

clean:
	/bin/rm -f *.class
	/bin/rm -f Convert.java
	/bin/rm -f Rtf*.java
	/bin/rm -f *.tokens
