// Copyright 2013 Bill Campbell, Swami Iyer and Bahar Akbal-Delibas

package jminusminus;

/**
 * An enum of token kinds. Each entry in this enum represents the kind of a
 * token along with its image (string representation).
 * 
 * When you add a new token to the scanner, you must also add an entry to this
 * enum specifying the kind and image of the new token.
 */

enum TokenKind {
    EOF("<EOF>"), ABSTRACT("abstract"), BOOLEAN("boolean"), CHAR("char"), CLASS(
            "class"), ELSE("else"), EXTENDS("extends"), FALSE("false"), IF("if"), IMPORT(
            "import"), INSTANCEOF("instanceof"), INT("int"), NEW("new"), NULL(
            "null"), PACKAGE("package"), PRIVATE("private"), PROTECTED(
            "protected"), PUBLIC("public"), RETURN("return"), STATIC("static"), SUPER(
            "super"), THIS("this"), TRUE("true"), VOID("void"), WHILE("while"), PLUS(
            "+"), ASSIGN("="), DEC("--"), EQUAL("=="), GT(">"), INC("++"), LAND(
            "&&"), LE("<="), LNOT("!"), MINUS("-"), PLUS_ASSIGN("+="), STAR("*"), DIV("/"), MOD("%"), LPAREN(
            "("), RPAREN(")"), LCURLY("{"), RCURLY("}"), LBRACK("["), RBRACK(
            "]"), SEMI(";"), COMMA(","), DOT("."), IDENTIFIER("<IDENTIFIER>"), INT_LITERAL(
            "<INT_LITERAL>"), CHAR_LITERAL("<CHAR_LITERAL>"), STRING_LITERAL(
            "<STRING_LITERAL>"), COLON(":"),
			
			/*New token operators added by me
			  HW2 CS451 */
			//Added for hw2
			NOTEQUAL("!="),		//not equal
			GTE	(">="),			//greater than or equal to
			LT 	("<"),			//less than
			OR	("||"),			//conditional or
			QUEST("?"),			//question mark
			TERNARY("?:"),		//ternary operator
			BITCOMP("~"	),		//unary bitwise complement
			LSHIFT("<<"	),		//signed left shift
			RSHIFT(">>"),		//signed right shift
			URSHIFT(">>>"),		//unsigned right shift
			BITAND("&"),		//bitwise and
			BEXOR("^"),			//bitwise exclusive or
			BINOR("|"),			//bitwise inclusive or
			SUB_ASSIGN("-="),	//bitwise inclusive or
			MULT_ASSIGN("*="),		//bitwise inclusive or
			DIV_ASSIGN("/="),		//bitwise inclusive or
			MOD_ASSIGN("%="),		//bitwise inclusive or
			LSHIFT_ASSIGN("<<="),		//bitwise inclusive or
			RSHIFT_ASSIGN(">>="),	//bitwise inclusive or
			URSHIFT_ASSIGN(">>>="), //bitwise assign
			BITAND_ASSIGN("&="),	//bitwise inclusive or
			BEXOR_ASSIGN("^="),	//bitwise inclusive or
			BINOR_ASSIGN("|="),		//bitwise inclusive or
			
			/*New reserved words added by me
			  HW2 CS451 */
			//Added for hw2
			FOR("for"),						//reserved word for
			SWITCH("switch"),				//reserved word switch
			ASSERT("assert"),				//reserved word assert
			DEFAULT("default"),				//reserved word default
			GOTO("goto"),					//reserved word goto
			SYNCHRONIZED("synchronized"),	//reserved word synchronized
			DO("do"	),						//reserved word do
			BREAK("break"),					//reserved word break
			BYTE("byte"),					//reserved word byte
			CASE("case"),					//reserved word case
			ENUM("enum"),					//reserved word enum
			TRANSIENT("transient"),		//reserved word transient
			CATCH("catch"),					//reserved word catch
			TRY("try"),						//reserved word try
			FINAL("final"),					//reserved word final
			INTERFACE("interface"),			//reserved word interface
			FINALLY("finally"),				//reserved word finally
			LONG("long"),					//reserved word long
			STRICTFP("strictfp"),			//reserved word strictfp
			VOLATILE("volatile"),			//reserved word volatile
			FLOAT("float"),					//reserved word float
			DOUBLE("double"),				//reserved word double
			NATIVE("native"),				//reserved word native
			CONTINUE("continue"),			//reserved word continue
			IMPLEMENTS("implements"),
			
			//hw2 literals
			DOUBLE_LITERAL("<DOUBLE_LITERAL>"),
			FLOAT_LITERAL("<FLOAT_LITERAL>"),
			LONG_LITERAL("<LONG_LITERAL>"),
			HEXADECIMAL_LITERAL("<HEXADECIMAL_LITERAL>"),
			OCTALDECIMAL_LITERAL("<OCTALDECIMAL_LITERAL>");
    /** The token's string representation. */
    private String image;

    /**
     * Construct an instance TokenKind given its string representation.
     * 
     * @param image
     *            string representation of the token.
     */

    private TokenKind(String image) {
        this.image = image;
    }

    /**
     * Return the image of the token.
     * 
     * @return the token's image.
     */

    public String image() {
        return image;
    }

    /**
     * Return the string representation of the token.
     * 
     * @return the token's string representation.
     */

    public String toString() {
        return image;
    }

}

/**
 * A representation of tokens returned by the lexical analyzer method,
 * getNextToken(). A token has a kind identifying what kind of token it is, an
 * image for providing any semantic text, and the line in which it occurred in
 * the source file.
 */

class TokenInfo {

    /** Token kind. */
    private TokenKind kind;

    /**
     * Semantic text (if any). For example, the identifier name when the token
     * kind is IDENTIFIER. For tokens without a semantic text, it is simply its
     * string representation. For example, "+=" when the token kind is
     * PLUS_ASSIGN.
     */
    private String image;

    /** Line in which the token occurs in the source file. */
    private int line;

    /**
     * Construct a TokenInfo from its kind, the semantic text forming the token,
     * and its line number.
     * 
     * @param kind
     *            the token's kind.
     * @param image
     *            the semantic text comprising the token.
     * @param line
     *            the line in which the token occurs in the source file.
     */

    public TokenInfo(TokenKind kind, String image, int line) {
        this.kind = kind;
        this.image = image;
        this.line = line;
    }

    /**
     * Construct a TokenInfo from its kind, and its line number. Its image is
     * simply its string representation.
     * 
     * @param kind
     *            the token's identifying number.
     * @param line
     *            identifying the line on which the token was found.
     */

    public TokenInfo(TokenKind kind, int line) {
        this(kind, kind.toString(), line);
    }

    /**
     * Return the token's string representation.
     * 
     * @return the string representation.
     */

    public String tokenRep() {
        return kind.toString();
    }

    /**
     * Return the semantic text associated with the token.
     * 
     * @return the semantic text.
     */

    public String image() {
        return image;
    }

    /**
     * Return the line number associated with the token.
     * 
     * @return the line number.
     */

    public int line() {
        return line;
    }

    /**
     * Return the token's kind.
     * 
     * @return the kind.
     */

    public TokenKind kind() {
        return kind;
    }

    /**
     * Return the token's image.
     * 
     * @return the image.
     */

    public String toString() {
        return image;
    }

}
