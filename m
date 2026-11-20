Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168759;
	b=5D5mRvAzMkscsOh2UIv5B87fl3NhU2L52madmtirtu7zmHnpkIDo5kw6AFaGY/Ppe+2Y
	 XP5J1RV6Yn5NVq2cPauOP9CR31O+hUsA4218JxRHKkEijw2Q+YD2h8rB50b/OeBPUMveY
	 9POnj3Dz0TAcHZ42NmdzH/KUhOuvRbi23fJmX/04K+o+jJxOSozUGM+rIXMmuEQjWR+IB
	 qt02ieHGNl3bl1/DVbuRpd3M+vfvnkoj5M5y+KLo4mJ1a1F6eMuPkPu7cLj+PFJ7FPZ3s
	 Z60h7hSc2Zrs31mVsRjwuKC+LUDfBBcOHjZSyECF2f7Jvy1RpcjhoeWS9TfBT/EvugQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168759;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=YQsJq/FSSWJsWIKtYTnvrioHFCDV5M+DcY30TZhnpn8=;
	b=Eu3eY4HIad8jgwZ38+Mov07iCd82BKpJPz45eu2OLqbBZlLsirTf63uqe46PjVhZIC4X
	 FCxZx2b+vGcTQN6BgJiuBZCSdX6jVP+HrRwds2frpl+ESwuySA8l4uwnJICMG1tdOXaAW
	 HbwzgDS+WCczOD4yEmJEd+tA610xs6MulzD+9FuZ9cXywdjEozWHSH7FxVlaR8JmTMBh9
	 y7DjIlqS+S/QL0hPr4YALw4z3q6cogH4gj97DxTOD10YxLQzAPVIQ2JGYcQVq0wbhicRi
	 oK3lt5dfbrgJwCyrBfEDeVU+ZKSbmia1ULgu4qZVGcGdh1l3k0r3Cus9dBp15pI4Ztw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=P0qAZivq;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE25606A33D
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 09:59:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AE25606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=P0qAZivq
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4a5024b3c28so1231264f8f.0
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 01:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795168758; x=1795773558; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YQsJq/FSSWJsWIKtYTnvrioHFCDV5M+DcY30TZhnpn8=;
        b=P0qAZivqb3WPPvy8tkzNnrzvUKJJ5bDSrPjMqJn8iM8HeAKOtniZJT4qgeDp5RXgEg
         1UCOkzaXGT995cfyXt6LHOn3T07sjM2vAzlrVYCDWPkP/4eT9KiTZyMr9tMHVaeEWwK1
         tC4yqbrBbN/Qh2LYkR9NgZjps32gBLIqYkASnKkqjAJ2VDss5V8Dt4iBPCeK0fYOrMrl
         EztivwmDFH/rLTcz26jbQ1l4s+HjnFWB+mSMntGmO8QGCw+Z4AS5Aa2gRPhH7adqSgPL
         MCCR8sAQgBHFsFifzf7mTgMHwV176FsE7cCB4fHNOYXCekgHQVv1oDy8VVXIo36GGfSf
         Y5cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795168758; x=1795773558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YQsJq/FSSWJsWIKtYTnvrioHFCDV5M+DcY30TZhnpn8=;
        b=pmnip+O+0aSSjZw30MrK3HL43ar8F1zOutabgdjh5I3++LIK1yEMeuhjROcgLunZdi
         q0kAV8ueD4m+hY9RcSLY/OEtqeRIXZc4Tm+C+kWnwDvkyyLOVJQDJA+Xa5Qt9ggJaYv/
         jaKD4539oRUy55jkFMaWzGMpf0MhAWYKkVVtJtnVKAttBTj7xMDWz7xoq2PgHugzryeO
         jzOn627qTpPXY1rjKiEvj2NWz7a9ypmjJe5P+iFv1+vu2cNvQmrfDi+bLW0gj2vNyElL
         wxFhDuj+T6ikzv1d/X+nf5iy+h7E3xTOK7wnc1e2/qfPsOXJnU40KQdpPWi8RaBrRnEE
         274A==
X-Forwarded-Encrypted: i=1; AL+hErEWM/Vlxs1aA/KbnC+GJexjoJL4cft3gZX0oxuGWBueiTLF8muLWvOc8y1toIdI1hAOxsxQQ9RD9E8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/l7S7jzXS4ohpEUZpZM4X/zBSRWS7ozB7XL2Cz948Dcl6kBpja
	dBKctemyNXaYqYhnI5/dXDyYXCjV+ADgr1Q2XRdrjk0OXCQ8/llDeDE4Gr9L6ghfycw=
X-Gm-Gg: AYBFou3mxMI9h36qffS1BOOffIG2VTwFqlWcO89LBDshWDEjAAB4DhGTwgLo6AZxmyI
	gxGFcuuvZx7nt7c4AZVt417VSGA35maNJw/KcebElmcuXfgCd7CRrD7vwvdIGbBKoQSORUjkDXF
	BHpMynk0twZkEzbtrQmeodisExG7qgEvy85rsZGuzVfZTp+MFuGxVEHBU1vHRYRRnnqz3+hE4cY
	Nitx8CQ1fI0knVnCSUpPkt46EN22JuQiEmSESLyWdYxqIiSYuOsX18WfzPGpbtSXy7/FdZjJwu0
	QAcXs/pavcq4MztnlFYyCAiYxeUgG7Lv5BLVpnF7atNmbn/N9mpgKilYfuxHge473oKLiKQh9cH
	Z9HSx5alatZ/VAJrNIdRdkv8U0rpnnCdQMNueTkzjrEVGCxGDzzJLnt5DN52uLlKOT0nlAQZu7z
	2Dp/fxDcK9W4EpARVwHNVQ+PEVXHVdlSf7Kp8wIwsQzAxH7x9tyky0sJzeT9l9G8RLx4Pj6EWW/
	+L60BWZQ/VHH/dXuaWZxQK+ivGM/5S7Kb4xMQZKF1fwwPARgbyL3AR1npsZ2BpCGh5pqPW2en1U
	hRZDUzk2B0oBT/T2val/wH3oYQK681++ZbfYZ4VPq28OXlpBQCG0
X-Received: by 2002:a05:600c:848a:b0:4a2:1960:6fa with SMTP id 5b1f17b1804b1-4bb887fb678mr52171355e9.4.1795168757359;
        Fri, 20 Nov 2026 01:59:17 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865b1sm70741515e9.5.2026.11.20.01.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:59:17 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 20 Nov 2026 10:59:13 +0100
Subject: [PATCH 1/2] usb: typec: qcom-pmic-typec: pdphy: disable the PD PHY
 on stop
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-topic-tcpm-qcom-fixes-v1-1-9a152f906fba@linaro.org>
References: <20261120-topic-tcpm-qcom-fixes-v1-0-9a152f906fba@linaro.org>
In-Reply-To: <20261120-topic-tcpm-qcom-fixes-v1-0-9a152f906fba@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1107;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=r4F3ViWmH1EQsOWd90pSS0X8y6pla3zxcN3gi7HiY/o=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrABnzlAPZ75cpFfKXAOz8Uw6uMsZ6N0swaaL0wsIs
 RzFOTjqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawAZ8wAKCRB33NvayMhJ0S6REA
 C4WhhEmr3xHhyIOliQPOLAwE/TeaAid0t0+8tc92gW+29PQLsihtPcWdpsF5VRJdM8sQPlsme3V7Ia
 NBYvhZTzsmfBL7Q+EP6FVhPVn+r87OJbcCnpxqwG8KF9PGYyIcZ+sTvrAcYbN9l2/mxSPx5T1hwl0f
 Ox3IUO9+r9bp7okUFMEctjlYEJoVvT+1SlB2GvlqaLRPJJ88Mm8r3FID5YVMx+lKXg1S/3IwCN7+Yw
 W5JL3sn06DOrGd/FHu0M4mvDU+B8HcWyZHsac826LKrfdfwlujWkQiMQFYcY50IvRq3IMFCCuM/xRc
 a1nFDrmCarGNJdLuzXO3VFKdPaT0UeacWcN3bMy2HDD/slzdPDmcUkRr6FwVCrYpyQwvbx5u5mCM3F
 YufD8ldgjmwxcw58iY6V5dM7ol839k594riQX4J0mFf4u8mLHX0PeXpycCwGVqZn+T0IRK2YORiQMq
 seejwxhlBh8VnazDvRjq9NYFdO85/md4JOePlOMEKyEC++Bm/SArRbpBcLbn3ftcs4rVnsEwVKuWu4
 SyuEYscH7YT0rCtu6orUpTWDTJCiGs2m0RKoiJc8Vm6WiPdzCeOkutrcvcveNDr4kcLx6hDNizt7qU
 S8B8mRsi6Fj4YOr5GXWTTlSx1kC01xUScEGZSJtnwIo7IJPHeQ0VFZjmWL2w==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

qcom_pmic_typec_pdphy_stop() only terminates the ongoing transmission and
clears the RX frame filter, the PD PHY itself stays enabled.

Use qcom_pmic_typec_pdphy_disable() so the PD PHY is also turned off
before its supply is released, leaving it in the same state as before
qcom_pmic_typec_pdphy_start().

Assisted-by: LLM
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
index 435e07659d65..08cf65951796 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
@@ -545,7 +545,7 @@ static void qcom_pmic_typec_pdphy_stop(struct pmic_typec *tcpm)
 
 	cancel_work_sync(&pmic_typec_pdphy->reset_work);
 
-	qcom_pmic_typec_pdphy_reset_on(pmic_typec_pdphy);
+	qcom_pmic_typec_pdphy_disable(pmic_typec_pdphy);
 
 	regulator_disable(pmic_typec_pdphy->vdd_pdphy);
 }

-- 
2.34.1

