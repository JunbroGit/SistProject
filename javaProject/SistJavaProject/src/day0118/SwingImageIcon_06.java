package day0118;

import java.awt.Color;
import java.awt.Container;
import java.awt.GridBagLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;

public class SwingImageIcon_06 extends JFrame implements ActionListener{
	
	Container cp;
	
	//이미지 아이콘 가져온다
	ImageIcon icon1=new ImageIcon("C:\\sist0103\\image\\swingimage\\45-pandadog.gif");
	ImageIcon icon2=new ImageIcon("C:\\sist0103\\image\\swingimage\\ahiru_a001.gif");
	ImageIcon icon3=new ImageIcon("C:\\sist0103\\image\\swingimage\\ame9.gif");
	ImageIcon icon4=new ImageIcon("C:\\sist0103\\image\\swingimage\\an07.gif");
	ImageIcon icon5=new ImageIcon("C:\\sist0103\\image\\swingimage\\chick.gif");

	JButton btn1,btn2,btn3,btn4,btn5;
	
	public SwingImageIcon_06(String title) {
		super(title);
		
		cp=this.getContentPane();
		
		this.setBounds(300, 100, 300, 300);
		cp.setBackground(new Color(203,153,255));
		
		initDesign();
		this.setVisible(true);
	}
	
	public void initDesign()
	{
		//2행2열
		this.setLayout(new GridLayout(2, 2)); //버튼들을 2행2열로 만듬
		btn1=new JButton("Hello", icon1); //아이콘에 Hello를 같이 넣어줌
		btn1.setHorizontalTextPosition(JButton.CENTER); //텍스트 가로위치
		btn1.setVerticalTextPosition(JButton.BOTTOM); //텍스트 세로위치
		this.add(btn1);
		
		btn1.setRolloverIcon(icon2); //버튼위에 올려놓으면 icon2으로 변경됨
		btn1.setPressedIcon(icon3); //버튼클릭시 icon3으로 변경됨
		
		//버튼2
		btn2=new JButton(icon4);
		this.add(btn2);
		
		//버튼3
		btn3=new JButton("스윙버튼");
		this.add(btn3);
		
		//버튼4
		btn4=new JButton("안녕", icon5);
		this.add(btn4);
		
		//버튼에 이벤트 발생
		btn1.addActionListener(this);
		btn2.addActionListener(this);
		btn3.addActionListener(this);
		btn4.addActionListener(this);
	}
	
	@Override
	public void actionPerformed(ActionEvent e) {
		Object ob=e.getSource();
		
		if(ob==btn1)
			JOptionPane.showMessageDialog(this, "토끼(오리?)를 눌렀어요");
		else if(ob==btn2)
			JOptionPane.showMessageDialog(this, "비둘기를 눌렀어요");
		else if(ob==btn3)
			JOptionPane.showMessageDialog(this, "스윙버튼을 눌렀어요");
		else if(ob==btn4)
			JOptionPane.showMessageDialog(this, "오리를 눌렀어요");
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		new SwingImageIcon_06("이미지버튼_6");
	}

}
