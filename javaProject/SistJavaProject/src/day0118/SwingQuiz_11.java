package day0118;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Container;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.border.LineBorder;

public class SwingQuiz_11 extends JFrame implements ActionListener{

	Container cp;
	JLabel hello;
	JButton [] btn=new JButton[5];
	String [] btnLabel= {"Red","Green","Blue","Magenta","Yellow"};
	Color [] btnColors= {Color.RED,Color.GREEN,Color.BLUE,Color.MAGENTA,Color.YELLOW};

	public SwingQuiz_11(String title) {
		super(title);

		cp=this.getContentPane();

		this.setBounds(300, 100, 500, 300);
		cp.setBackground(new Color(203,153,255));
		initDesign();
		this.setVisible(true);
	}

	public void initDesign()
	{
		JPanel panel=new JPanel();
		panel.setBackground(Color.BLUE);
		this.add(panel, BorderLayout.NORTH);
	
		hello=new JLabel("안녕하세요", JLabel.CENTER);
		hello.setBounds(100, 100, 50, 50);
		this.add(hello);
		
		for(int i=0;i<btn.length;i++)
		{
			btn[i]=new JButton(btnLabel[i]);
			btn[i].setBackground(btnColors[i]);
			btn[i].addActionListener(this);
			
			
			panel.add(btn[i]);
		}
	}
	
	@Override
    public void actionPerformed(ActionEvent e) {
        Object ob=e.getSource();

        for (int i=0;i<btn.length;i++) 
        {
            if (ob==btn[i]) 
            {
                // 해당버튼의 색상으로 "안녕하세요" 레이블의 색상을 변경
                hello.setForeground(btnColors[i]);
            }
        }
    }
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		new SwingQuiz_11("스윙퀴즈_11");
	}

}
