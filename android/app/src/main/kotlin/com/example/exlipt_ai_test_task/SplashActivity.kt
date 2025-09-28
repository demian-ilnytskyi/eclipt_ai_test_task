package com.example.exlipt_ai_test_task

import android.content.Intent
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.app.Activity

class SplashActivity : Activity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        window.statusBarColor = android.graphics.Color.WHITE
        window.navigationBarColor = android.graphics.Color.WHITE

        setContentView(R.layout.activity_splash)

        Handler(Looper.getMainLooper()).postDelayed({
            val intent = Intent(this, MainActivity::class.java)
            startActivity(intent)
            finish()
        }, 3000)
    }
}
