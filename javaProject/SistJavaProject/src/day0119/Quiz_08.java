package day0119;

import java.awt.Color;
import java.awt.Container;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ButtonGroup;
import javax.swing.JCheckBox;
import javax.swing.JFrame;
import javax.swing.JRadioButton;
import javax.swing.JTextArea;

public class Quiz_08 extends JFrame {

    private JCheckBox maleCheckbox;
    private JRadioButton color1, color2, color3;
    private JCheckBox italyCheckbox, usaCheckbox, koreaCheckbox, japanCheckbox;
    private JTextArea resultArea;

    public Quiz_08(String title) {
        super(title);

        Container container = getContentPane();
        container.setLayout(null);

        // 체크박스 - 남자
        maleCheckbox = new JCheckBox("남자");
        maleCheckbox.setBounds(50, 20, 100, 30);
        container.add(maleCheckbox);

        // 라디오버튼 - 색상
        ButtonGroup colorGroup = new ButtonGroup();

        color1 = new JRadioButton("빨강");
        color2 = new JRadioButton("초록");
        color3 = new JRadioButton("파랑");

        color1.setBounds(50, 60, 80, 30);
        color2.setBounds(140, 60, 80, 30);
        color3.setBounds(230, 60, 80, 30);

        colorGroup.add(color1);
        colorGroup.add(color2);
        colorGroup.add(color3);

        container.add(color1);
        container.add(color2);
        container.add(color3);

        // 체크박스 - 나라
        italyCheckbox = new JCheckBox("이탈리아");
        usaCheckbox = new JCheckBox("미국");
        koreaCheckbox = new JCheckBox("한국");
        japanCheckbox = new JCheckBox("일본");

        italyCheckbox.setBounds(50, 100, 100, 30);
        usaCheckbox.setBounds(150, 100, 100, 30);
        koreaCheckbox.setBounds(250, 100, 100, 30);
        japanCheckbox.setBounds(350, 100, 100, 30);

        container.add(italyCheckbox);
        container.add(usaCheckbox);
        container.add(koreaCheckbox);
        container.add(japanCheckbox);

        // 결과 영역
        resultArea = new JTextArea();
        resultArea.setBounds(50, 150, 400, 100);
        container.add(resultArea);

        // 이벤트 처리
        maleCheckbox.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                updateResult();
            }
        });

        ActionListener colorListener = new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                updateResult();
            }
        };

        color1.addActionListener(colorListener);
        color2.addActionListener(colorListener);
        color3.addActionListener(colorListener);

        ActionListener countryListener = new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                updateResult();
            }
        };

        italyCheckbox.addActionListener(countryListener);
        usaCheckbox.addActionListener(countryListener);
        koreaCheckbox.addActionListener(countryListener);
        japanCheckbox.addActionListener(countryListener);

        // 프레임 설정
        setSize(500, 300);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);
        setVisible(true);
    }

    private void updateResult() {
        StringBuilder result = new StringBuilder();

        if (maleCheckbox.isSelected()) {
            result.append("남자입니다. ");
        } else {
            result.append("여자입니다. ");
        }

        if (color1.isSelected()) {
            resultArea.setBackground(Color.RED);
        } else if (color2.isSelected()) {
            resultArea.setBackground(Color.GREEN);
        } else if (color3.isSelected()) {
            resultArea.setBackground(Color.BLUE);
        } else {
            resultArea.setBackground(null);
        }



        if (italyCheckbox.isSelected() || usaCheckbox.isSelected() || koreaCheckbox.isSelected() || japanCheckbox.isSelected()) {
            result.append("내가 가본 나라는 [");

            if (italyCheckbox.isSelected()) {
                result.append("이탈리아");
            }
            if (usaCheckbox.isSelected()) {
                if (result.length() > 12) result.append(", ");
                result.append("미국");
            }
            if (koreaCheckbox.isSelected()) {
                if (result.length() > 12) result.append(", ");
                result.append("한국");
            }
            if (japanCheckbox.isSelected()) {
                if (result.length() > 12) result.append(", ");
                result.append("일본");
            }

            result.append("] 입니다.");
        } else {
            result.append("가본 나라는 없습니다.");
        }

        resultArea.setText(result.toString());
    }

    public static void main(String[] args) {
        new Quiz_08("체크박스와 라디오버튼");
    }
}