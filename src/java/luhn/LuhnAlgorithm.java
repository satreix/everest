package luhn;

public class LuhnAlgorithm {
    public static boolean check(long n) {
        String str = Long.toString(n);
        int checksum = 0;
        boolean even = false;

        for (int i = str.length() - 1; i >= 0; i--) {
            int digit = Character.getNumericValue(str.charAt(i));
            if (even) {
                digit *= 2;
                if (digit > 9) {
                    digit -= 9;
                }
            }
            checksum += digit;
            even = !even;
        }

        return checksum % 10 == 0;
    }
}
