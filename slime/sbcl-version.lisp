
*features*

(sb-ext:assert-version->= 2 5 10)

so where is 

--------------------------------------------------------------------------------

(describe 'sb-ext:assert-version->=)

--------------------------------------------------------------------------------

SB-EXT:ASSERT-VERSION->=
  [symbol]

ASSERT-VERSION->= names a compiled function:
  Lambda-list: (&REST SUBVERSIONS)
  Derived type: (FUNCTION * (VALUES NULL &OPTIONAL))
  Documentation:
    Asserts that the current SBCL is of version equal to or greater than
    the version specified in the arguments.  A continuable error is signaled
    otherwise.
    
    The arguments specify a sequence of subversion numbers in big endian order.
    They are compared lexicographically with the runtime version, and versions
    are treated as though trailed by an unbounded number of 0s.
    
    For example, (assert-version->= 1 1 4) asserts that the current SBCL is
    version 1.1.4[.0.0...] or greater, and (assert-version->= 1) that it is
    version 1[.0.0...] or greater.
  Source file: SYS:SRC;CODE;TARGET-MISC.LISP
					; No value

--------------------------------------------------------------------------------
SBCL 2.5.9 is too old for this program (version 2.5.10 or later is required).
   [Condition of type SIMPLE-ERROR]

Restarts:
 0: [CONTINUE] Disregard this version requirement.
 1: [RETRY] Retry SLIME interactive evaluation request.
 2: [*ABORT] Return to SLIME's top level.
 3: [ABORT] abort thread (#<THREAD tid=979844 "worker" RUNNING {12019E5F23}>)

Backtrace:
  0: (SB-INT:SIMPLE-EVAL-IN-LEXENV (ASSERT-VERSION->= 2 5 10) #<NULL-LEXENV>)
  1: (EVAL (ASSERT-VERSION->= 2 5 10))
  2: ((LAMBDA NIL :IN SWANK:INTERACTIVE-EVAL))
 --more--
