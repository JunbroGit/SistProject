package day0118;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Container;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;

public class SwingArrEvent_08 extends JFrame implements ActionListener{

	Container cp;
	JButton [] btn=new JButton[6];
	String [] btnLabel= {"Red","Green","Blue","Magenta","Gray","Yellow"};
	Color [] btnColors= {Color.RED,Color.GREEN,Color.BLUE,Color.MAGENTA,Color.GRAY,Color.YELLOW};

	public SwingArrEvent_08(String title) {
		super(title);

		cp=this.getContentPane();

		this.setBounds(300, 100, 600, 300);
		cp.setBackground(new Color(203,153,255));

		initDesign();
		this.setVisible(true);
	}

	public void initDesign()
	{
		//Panel은 기본이 FlowLayout
		JPanel panel=new JPanel();
		panel.setBackground(Color.ORANGE);

		this.add(panel, BorderLayout.NORTH); //프레임의 상단에 패널배치

		//버튼생성
		for(int i=0;i<btn.length;i++)
		{
			//버튼 6개 생성
			btn[i]=new JButton(btnLabel[i]);
			//버튼 6개에 각각의 버튼색상변경(btnColors)
			btn[i].setBackground(btnColors[i]);
			//버튼 6개에 이벤트 추가
			btn[i].addActionListener(this);
			//paneldp 버튼6개 추가
			panel.add(btn[i]);

		}
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		Object ob=e.getSource();

		for(int i=0;i<btn.length;i++)
		{
			if(ob==btn[i])
			{
				//각각의 버튼을 누르면 프레임의 배경색 변경
				cp.setBackground(this.btnColors[i]);
				//창제목 변경 (Color: Red)
				this.setTitle("Color: "+btnLabel[i]);
			}
		}

	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		new SwingArrEvent_08("배열버튼 이벤트_8");
	}

}
