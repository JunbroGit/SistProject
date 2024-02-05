package day0118;

import java.awt.Color;
import java.awt.Container;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;
import javax.swing.border.TitledBorder;
import javax.swing.plaf.FontUIResource;

//2개의 텍스트필드에 숫자를 넣고 버튼을 만든후 클릭하면 라벨에 2+3=5 <== 이렇게 출력해보자

public class SwingTextF_10 extends JFrame{

	Container cp;
	JTextField tfnum1,tfnum2;
	JButton btn1,btn2,btn3,btn4;
	JLabel lblNum1,lblNum2,lblResult;

	public SwingTextF_10(String title) {
		super(title);

		cp=this.getContentPane();

		this.setBounds(300, 100, 300, 300);
		cp.setBackground(new Color(203,153,255));
		setDesign();
		this.setVisible(true);
	}

	public void setDesign()
	{
		this.setLayout(null);
		lblNum1=new JLabel("숫자1");
		lblNum2=new JLabel("숫자2");

		lblNum1.setBounds(20, 20, 50, 30);
		this.add(lblNum1);

		lblNum2.setBounds(20, 60, 50, 30);
		this.add(lblNum2);

		tfnum1=new JTextField();
		tfnum1.setBounds(80, 20, 60, 30);
		this.add(tfnum1);

		tfnum2=new JTextField();
		tfnum2.setBounds(80, 60, 60, 30);
		this.add(tfnum2);

		btn1=new JButton("+");
		btn1.setBounds(30, 110, 50, 40);
		this.add(btn1);

		btn2=new JButton("-");
		btn2.setBounds(90, 110, 50, 40);
		this.add(btn2);

		btn3=new JButton("*");
		btn3.setBounds(150, 110, 50, 40);
		this.add(btn3);

		btn4=new JButton("/");
		btn4.setBounds(210, 110, 50, 40);
		this.add(btn4);

		lblResult=new JLabel("결과나오는곳...");
		lblResult.setBounds(20, 170, 250, 60);
		lblResult.setBorder(new TitledBorder("결과확인"));
		lblResult.setFont(new FontUIResource("", Font.BOLD, 25)); //글꼴변경
		this.add(lblResult);

		//익명내부클래스
		btn1.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				int num1=Integer.parseInt(tfnum1.getText().trim());
				int num2=Integer.parseInt(tfnum2.getText().trim());

				int sum=num1+num2;

				String s=num1+"+"+num2+"="+sum;
				lblResult.setText(s);


			}
		});

		btn2.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				int num1=Integer.parseInt(tfnum1.getText().trim());
				int num2=Integer.parseInt(tfnum2.getText().trim());

				int sum=num1-num2;

				String s=num1+"-"+num2+"="+sum;
				lblResult.setText(s);


			}
		});

		btn3.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				int num1=Integer.parseInt(tfnum1.getText().trim());
				int num2=Integer.parseInt(tfnum2.getText().trim());

				int sum=num1*num2;

				String s=num1+"*"+num2+"="+sum;
				lblResult.setText(s);


			}
		});

		btn4.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				int num1 = Integer.parseInt(tfnum1.getText().trim());
				int num2 = Integer.parseInt(tfnum2.getText().trim());

				//num2가 0이 아닌지 확인하여 0으로 나누는 오류를 방지
				if (num2 != 0) {
					double result = (double) num1 / num2;

					//결과를 소수점 둘째자리까지 표시하도록 서식을 지정
					String s = String.format("%d/%d=%.2f", num1, num2, result);
					lblResult.setText(s);
				} else {
					lblResult.setText("0으로 나눌 수 없습니다.");
				}
			}
		});

	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		new SwingTextF_10("텍스트필드_10");
	}

}
