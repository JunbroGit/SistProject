package day0112;

import java.util.Scanner;

/*
 * 콘솔창의 결과물 한장만 카톡으로 보낼것!!
 * 클래스명은 QuizMain으로 만들어주세요
 * 멤버클래스명은 Quiz 라고 만드세요
 * 메인메서드에서 학교이름 입력받아 schoolName에 넣고  인원수 입력받아서 인원수만큼 
 * 이름,Java,Oracle,Html 점수를 입력한후 
 * 총점,평균,평가 메서드를 만들어 구현하세요
 * getTotal(),getAverge(),getPyungga() 
 * 평가는 90점이상: 장학생   80점이상: 합격  80점미만:불합격임
 * 
 * 다음과 같이 구현할것
 * 
 * 학교명: 쌍용교육센터
 * 이름	 JAVA	ORACLE  HTML  총점	평균		평가
 * =============================================
 * 홍현희	  90     80	    70	  240	80      합격
 * 남현희	  80     60	    50	  190	63.5   불합격
 */
class QuizMain {
    // 멤버 클래스 Quiz 정의
    static class Quiz {
        String name;
        int javaScore;
        int oracleScore;
        int htmlScore;

        // 생성자
        public Quiz(String name, int javaScore, int oracleScore, int htmlScore) {
            this.name = name;
            this.javaScore = javaScore;
            this.oracleScore = oracleScore;
            this.htmlScore = htmlScore;
        }
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // 학교명 입력 받기
        System.out.print("학교명: ");
        String schoolName = scanner.nextLine();

        // 인원수 입력 받기
        System.out.print("인원수: ");
        int numOfStudents = scanner.nextInt();

        // Quiz 객체 배열 생성
        Quiz[] quizzes = new Quiz[numOfStudents];

        // 학생 정보 입력 받기
        for (int i = 0; i < numOfStudents; i++) {
            System.out.println("학생 " + (i + 1) + " 정보 입력:");
            System.out.print("이름: ");
            String name = scanner.next();
            System.out.print("Java 점수: ");
            int javaScore = scanner.nextInt();
            System.out.print("Oracle 점수: ");
            int oracleScore = scanner.nextInt();
            System.out.print("HTML 점수: ");
            int htmlScore = scanner.nextInt();

            // Quiz 객체 생성 및 배열에 저장
            quizzes[i] = new Quiz(name, javaScore, oracleScore, htmlScore);
        }

        // 결과 출력
        System.out.println("=============================================");
        System.out.printf("%-5s %-5s %-5s %-5s %-5s %-5s\n", "이름", "JAVA", "ORACLE", "HTML", "총점", "평균", "평가");
        System.out.println("=============================================");

        for (Quiz quiz : quizzes) {
            int total = getTotal(quiz);
            double average = getAverage(total);
            String evaluation = getEvaluation(average);

            System.out.printf("%-5s %-5d %-7d %-5d %-7d %-5.1f %-5s\n",
                    quiz.name, quiz.javaScore, quiz.oracleScore, quiz.htmlScore, total, average, evaluation);
        }

        scanner.close();
    }

    // 총점 계산 메서드
    private static int getTotal(Quiz quiz) {
        return quiz.javaScore + quiz.oracleScore + quiz.htmlScore;
    }

    // 평균 계산 메서드
    private static double getAverage(int total) {
        return total / 3.0;
    }

    // 평가 메서드
    private static String getEvaluation(double average) {
        if (average >= 90) {
            return "장학생";
        } else if (average >= 80) {
            return "합격";
        } else {
            return "불합격";
        }
    }
}