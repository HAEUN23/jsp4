package test;

public class test2 {

	public static void main(String[] args) {
		String s="1a23";
		int a=0;
		try {
			a=Integer.parseInt(s);
		}
		catch(Exception e) {
			System.out.println(e);
			System.out.println("숫자를 넣으세요.");
		}
		System.out.println(s);

	}

}
