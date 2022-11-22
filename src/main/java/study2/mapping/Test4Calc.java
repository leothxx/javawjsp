package study2.mapping;

public class Test4Calc {
	public int getCalc(int su1, int su2, String opt) {
		int answer=0;
		if(opt.equals("+")) answer = su1 + su2;
		else if(opt.equals("-")) answer = su1 - su2;
		else if(opt.equals("*")) answer = su1 * su2;
		else if(opt.equals("/")) answer = su1 / su2;
		else answer = su1 % su2;
		return answer;
	}
}
