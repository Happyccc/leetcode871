import java.util.ArrayList;

public class countPrimes{
	public static int[] findPrime(final int max){
		int[] prime = new int[max + 1];
		ArrayList list = new ArrayList();

		for (int j = 2;j * j <= max; j++){
			for (int k = 2*j; k <= max; k++){
				if (k % j == 0){
					//不是质数的赋值为1
					prime[k] = 1;
				}
			}
		}

		// 数组转list
		for (int i = 2; i < max; i++){
			if (prime[i] == 0){
				list.add(new Integer(i));
			}
		}

		// list转数组
		int[] p = new int[list.size()];
		for (int i = 0; i < list.size(); i++){
			p[i] = (Integer) list.get(i);
		}

		return p;
	}

	public static void main(String[] args){
		int[] prime = countPrimes.findPrime(1000);
		for (int i = 0; i < prime.length; i++){
			System.out.print(prime[i] + " ");
		}
	}
}