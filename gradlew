package com.theindianappguy.dot7.Pages;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.LinearLayout;

import androidx.appcompat.app.AppCompatActivity;

import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.theindianappguy.dot7.CustomClasses.UpdatesClass;
import com.theindianappguy.dot7.HelpingClass.SessionManagement;
import com.theindianappguy.dot7.R;

import static com.theindianappguy.dot7.HelpingClass.Functions.contactOnWhatsAppUrlGenerator;

public class EnquiryFormActivity extends AppCompatActivity {

    /*UI Elements*/
    LinearLayout whatsappEnquiryBtn, mailEnquiryBtn;
    EditText nameEt, emailEt, phoneNumberEt, descEt;
    LinearLayout enquiryBtn;

    /*Variables*/
    SessionManagement cookie;
    String subject, desc;
    String from;
    DatabaseReference databaseReference;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_enquiry_form);

        from = getIntent().getStringExtra("from");
        cookie = new SessionManagement(EnquiryFormActivity.this);

        whatsappEnquiryBtn = findViewById(R.id.whatsappEnquiryBtn);
        mailEnquiryBtn = findViewById(R.id.mailEnquiryBtn);
        enquiryBtn = findViewById(R.id.enquiryBtn);
        descEt = findViewById(R.id.descEt);
        nameEt = findViewById(R.id.nameEt);
        phoneNumberEt = findViewById(R.id.phoneNumberEt);
        emailEt = findViewById(R.id.email);

        databaseReference = FirebaseDatabase.getInstance().getReference();

        nameEt.setText(cookie.getName());
        emailEt.setText(cookie.getEmail());
        if(!cookie.getPhonenumber().equals("")){
            phoneNumberEt.setText(cookie.getPhonenumber());
        }

        enquiryBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                databaseReference.child()
                UpdatesClass updatesClass = new UpdatesClass();
                updatesClass.setTitle("Enquiry!!");
                updatesClass.setDesc("Interested in "+from+" ,"+descEt.getText().toString());
                updatesClass.setSeen(false);
                updatesClass.setAgentId(cookie.getUserKey());
                updatesClass.setHaveButtons(true);
                updatesClass.setPositiveButtontxt("Show More");
                updatesClass.setSideButtonText("Dismiss");


            }
        });

        whatsappEnquiryBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                contactOnWhatsAppUrlGenerator("918139879266","");
            }
        });

        mailEnquiryBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(Intent.ACTION_SENDTO, Uri.fromParts(
                        "mailto","dreamontime1@email.com", null));
                intent.putExtra(Intent.EXTRA_SUBJECT, "");
                intent.putExtra(Intent.EXTRA_TEXT, "");
                startActivity(Intent.createChooser(intent, "Choose an Email client :"));
            }
        });
    }
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                