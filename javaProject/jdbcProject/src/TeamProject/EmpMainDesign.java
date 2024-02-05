package TeamProject;

import java.awt.Container;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JLayeredPane;
import javax.swing.JOptionPane;
import javax.swing.JPanel;

import orcleDB.DbConnect;

public class EmpMainDesign extends JFrame implements ActionListener{

	DbConnect db=new DbConnect();
	Container cp;
	BufferedImage img=null;
	
	JButton connbtn;
	JLabel lblMain;
	
	EmpMain main=new EmpMain("인사관리 시스템");
	
	public EmpMainDesign() {
		setTitle("인사관리 시스템");
		
		JLayeredPane layeredPane=new JLayeredPane();
		layeredPane.setSize(1200, 700);
		layeredPane.setLayout(null);
		
		try {
			img=ImageIO.read(new File("C:\\sist0103\\image\\project\\emp.jpg"));
		} catch (IOException e) {
			JOptionPane.showMessageDialog(null, "이미지 불러오기 실패");
			System.exit(0);
		}
		
		myPanel panel=new myPanel();
		panel.setSize(1200,700);
		layeredPane.add(panel);
		
		setLayout(null);
		
		add(layeredPane);
		
		initDesign();
		
		setBounds(700, 220, 1200, 700);
		setVisible(true);
		setResizable(false);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
	}
	
	public void initDesign()
	{
		this.setLayout(null);
		
		connbtn = new JButton("실행");
		Font customFont = new Font("바탕체",Font.BOLD, 26);
		connbtn.setFont(customFont);
		connbtn.setBounds(550, 500, 100, 50);
		connbtn.addActionListener(this);
		this.add(connbtn);
	}
	
	class myPanel extends JPanel{
		@Override
		public void paint(Graphics g) {
			g.drawImage(img, 0, 0, null);
		}
	}
	
	@Override
	public void paint(Graphics g) {
		// TODO Auto-generated method stub
		g.drawImage(img, 0, 0, null);
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		Object ob=e.getSource();
		
		if(ob==connbtn) {
<<<<<<< HEAD
			EmpMain add=new EmpMain("");
=======
			EmpMain add=new EmpMain("인사관리 시스템");
>>>>>>> 717a9e3db25d37c5e102c9c0828bd2a094579ba7
			main.setVisible(true);
			this.setVisible(false);
		}
	}
   
	public static void main(String[] args) {
		new EmpMainDesign();
	}
    
}