package TeamProject;

import java.awt.Canvas;
import java.awt.Color;
import java.awt.Container;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

import orcleDB.DbConnect;

//메인 인터페이스에서 클릭하면 나오는 화면
public class EmpMain extends JFrame implements ActionListener{

	DbConnect db = new DbConnect();
	Container cp;

	DefaultTableModel model;
	JTable table;
	JButton btnAdd, btnDel, btnUpdate, btnSearch;

	EmpAdd addForm = new EmpAdd("사원 추가");
	EmpUpdate updateForm = new EmpUpdate("사원 수정");

	String imageName;

	public EmpMain(String title){

		super(title);
		cp = this.getContentPane();
		this.setBounds(700, 220, 1200, 700);
		cp.setBackground(new Color(240,210,240));
		initDesign();
		//this.setVisible(true);

	}

	public void tableWrite() {

		model.setRowCount(0);

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from emp order by emp_id";
		conn = db.getOracle();

		try {

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while(rs.next()) {

				Vector<String> data = new Vector<String>();

				data.add(rs.getString("emp_id"));
				data.add(rs.getString("emp_name"));
				data.add(rs.getString("dept_id"));
				data.add(rs.getString("birth_date"));
				data.add(rs.getString("hire_date"));
				data.add(rs.getString("position"));
				data.add(rs.getString("salary"));
				data.add(rs.getString("email"));
				data.add(rs.getString("phone_number"));
				data.add(rs.getString("image"));

				model.addRow(data);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
	}

	//insert메서드
	public void insertData() {

		// 이름,생일,입사일,직급,월급,이메일,핸드폰,부서명 콤보박스
		String name = addForm.tfName.getText();
		String birth = addForm.tfBirth.getText();
		String hire = addForm.tfHire.getText();
		String dept_id = (String)addForm.cbDeptName.getSelectedItem();
		String position = (String)addForm.cbpositionName.getSelectedItem();
		String salary = addForm.tfSalary.getText();
		String email = addForm.tfEmail.getText();
		String phone = addForm.tfPhone.getText();
		String image = addForm.imageName;

		String sql = "insert into emp values(seq_empt.nextval,?,?,?,?,?,?,?,?,?)";

		Connection conn = db.getOracle();
		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, name);
			pstmt.setString(2, birth);
			pstmt.setString(3, hire);
			pstmt.setString(4, dept_id);
			pstmt.setString(5, position);
			pstmt.setString(6, salary);
			pstmt.setString(7, email);
			pstmt.setString(8, phone);
			pstmt.setString(9, image);

			pstmt.execute();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}


	//delete메서드
	public void deleteData(String num) {

		String sql = "delete from emp where emp_id ="+num;

		Connection conn = db.getOracle();
		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement(sql);

			int a = pstmt.executeUpdate();

			if(a==1) {
				JOptionPane.showMessageDialog(this, "삭제가 성공했습니다.");
				tableWrite();
			}else {
				JOptionPane.showMessageDialog(this, "없는 시퀀스 번호입니다.");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}


	//update메서드
	public void updateData() {

		String num = updateForm.num;

		String name = addForm.tfName.getText();
		String birth = addForm.tfBirth.getText();
		String hire = addForm.tfHire.getText();
		String dept_id = (String)addForm.cbDeptName.getSelectedItem();
		String position = (String)addForm.cbpositionName.getSelectedItem();
		String salary = addForm.tfSalary.getText();
		String email = addForm.tfEmail.getText();
		String phone = addForm.tfPhone.getText();
		String image = addForm.imageName;
		//String image = updateForm.imageName;

		String sql = "update emp set emp_name=?, birth_date=?, hire_date=?, dept_id=?, position=?, salary=?, email=?, phone_number=? where emp_id=?";

		Connection conn = db.getOracle();
		PreparedStatement pstmt = null;

		try {

			pstmt = conn.prepareStatement(sql);

			//?차례대로 바인딩
			pstmt.setString(1, name);
			pstmt.setString(2, birth);
			pstmt.setString(3, hire);
			pstmt.setString(4, dept_id);
			pstmt.setString(5, position);
			pstmt.setString(6, salary);
			pstmt.setString(7, email);
			pstmt.setString(8, phone);
			pstmt.setString(9, num);
			//pstmt.setString(10,image);

			//업데이트
			pstmt.execute();

		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}

		updateForm.setVisible(false);
	}

	// 검색메서드
	public void searchData(String name) {
		model.setRowCount(0);

		Connection conn = db.getOracle();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from emp where emp_name like '%" + name + "%'";

		try {
			pstmt = conn.prepareStatement(sql);
			//pstmt.setString(1, "%"+name+"%");
			System.out.println(sql);

			rs = pstmt.executeQuery();


			while(rs.next()) {
				Vector<String> data = new Vector<String>();


				data.add(rs.getString("emp_id"));
				data.add(rs.getString("emp_name"));
				data.add(rs.getString("dept_id"));
				data.add(rs.getString("birth_date"));
				data.add(rs.getString("hire_date"));
				data.add(rs.getString("position"));
				data.add(rs.getString("salary"));
				data.add(rs.getString("email"));
				data.add(rs.getString("phone_number"));
				data.add(rs.getString("image"));

				model.addRow(data);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}

	}

	public void initDesign() {

		String [] title = {"사원번호","이름","부서명","생년월일","입사일","직급","월급","이메일","휴대폰번호","이미지URL"};

		model = new DefaultTableModel(title,0);
		table = new JTable(model);
		this.add( "Center", new JScrollPane(table));

		//테이블에 DB데이터 출력
		tableWrite();		

		JPanel pTop = new JPanel();
		pTop.setBounds(100, 100, 1000, 100);
		this.add("North",pTop);

		//추가버튼
		btnAdd = new JButton("추가");
		btnAdd.setBounds(10, 70, 90, 30);
		btnAdd.addActionListener(this);
		pTop.add(btnAdd);
		//추가폼에 있는 추가버튼에 액션을 추가
		addForm.btnInsert.addActionListener(this);

		//삭제버튼
		btnDel = new JButton("삭제");
		btnDel.setBounds(10, 100, 90, 30);
		btnDel.addActionListener(this);
		pTop.add(btnDel);

		//수정버튼		
		btnUpdate = new JButton("수정");
		btnUpdate.setBounds(10, 130, 90, 30);
		btnUpdate.addActionListener(this);
		pTop.add(btnUpdate);
		//수정폼에 있는 수정버튼에 액션을 추가
		updateForm.btnUpdate.addActionListener(this);

		//검색버튼
		btnSearch = new JButton("검색");
		btnSearch.setBounds(10, 100, 90, 30);
		btnSearch.addActionListener(this);
		pTop.add(btnSearch);

	}

	//버튼 클릭하면 액션 발생시키는 메서드
	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub

		Object ob = e.getSource();

		if(ob==btnAdd) {

			addForm.setVisible(true);

		}else if(ob == addForm.btnInsert) {

			insertData();

			this.tableWrite();

			addForm.tfName.setText("");
			addForm.tfBirth.setText("");
			addForm.tfHire.setText("");
			addForm.tfSalary.setText("");
			addForm.tfEmail.setText("");
			addForm.tfPhone.setText("");

			addForm.setVisible(false);

		}else if(ob == btnDel) {

			String num = JOptionPane.showInputDialog("삭제할 시퀀스는?");

			deleteData(num);

			this.tableWrite();

		}else if(ob == btnUpdate) {

			String num = JOptionPane.showInputDialog("수정할 시퀀스는?");

			String sql = "select * from emp where emp_id = "+num;

			Connection conn = db.getOracle();
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();

				if(rs.next()) {
					updateForm.num = num;

					updateForm.tfName.setText(rs.getString("emp_name"));
					updateForm.tfBirth.setText(rs.getString("birth_date"));
					updateForm.tfHire.setText(rs.getString("hire_date"));
					updateForm.cbDeptName.setSelectedItem(rs.getString("dept_id"));
					updateForm.tfPosition.setText(rs.getString("position"));
					updateForm.tfSalary.setText(rs.getString("salary"));
					updateForm.tfEmail.setText(rs.getString("email"));
					updateForm.tfPhone.setText(rs.getString("phone_number"));

					updateForm.setVisible(true);

				}else {
					JOptionPane.showMessageDialog(this, "존재하지 않는 데이터입니다.");
				}

			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}finally {
				db.dbClose(rs, pstmt, conn);
			}

		}
		else if(ob == updateForm.btnUpdate) {
			updateData();
			this.tableWrite();
		}else if(ob==btnSearch) {
			// 검색
			String name = JOptionPane.showInputDialog("검색할 이름은?");

			//메서드 호출
			searchData(name);

		}
		//테이블 다시 출력
		//this.tableWrite();
	}


	//내부클래스
	class ImageDraw extends Canvas{

		@Override
		public void paint(Graphics g) {
			// TODO Auto-generated method stub
			super.paint(g);

			if(addForm.imageName != null) {
				Image image = new ImageIcon(addForm.imageName).getImage();
				g.drawImage(image, 0, 0, 200, 200, this);
			}
		}
	}

}