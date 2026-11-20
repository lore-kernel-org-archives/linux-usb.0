Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168582;
	b=GbP37UYUXjANjGNDPP6Ggi/EabaLjmhpxPJJVitwBokK5l2x9e+VEh/9AIuW/ch+4loG
	 uBvjM5Jfq8HFEWnPkHYeWq/VMMFJ9m1VSqQMngWBEru2TuHxqtmHQ/jV6DqoiVr+MjKeY
	 p9iMxJ5caJ/Alq1E12BgujWGye/lSIctPpErebJU55U1IPdnogjQplDfZma7Vv4oraxY/
	 kHGrnwkiAUWLKmh+EywMseThQGzQeBN6VYMI7NJ9I8+V9FTZFpYgXNI5ei95f79JUTy6w
	 cOhJC10g1sFq+lXSDhknHq8kMCGOn1rhQJHdzFsIExP6mSb5b1NgVYIT0qESRQtb2gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168582;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=G88ceLyh4AUnlGhVt6bK2ePXMzrBkJbu90gp7HX3iVE=;
	b=p0t42c/9zEs2GZYri5/9VsXvcJPw3fJ0+3+hmHnGSH7K4PjyZG4jHciI3dTEGQDedxJL
	 yYLIsYtAgjZmEEnCzv4CY78hhYAfHd2eKJ7+Ig+fMVRNAG+ZCP/iiyQ3/pmwtH0XJE3hC
	 mO/qoVuaA3rhoCgovKZqeaIZ443zl8VsbLdArFt37Q5BIXgCe0zTPd9Ji+/JQZVPBrz/L
	 Ec7lriXJtMHDcBB5mtcIA3u5w1a9R1uFCXq3SU58eyB+0R2VQ6r8mxClhwnEERnpmL3LG
	 Mjl53R2TdoMgVsMXxBRVljyLnQnIY0PFLktXcXO3hLQ7EvCKwaJNU/0a0CzqpBOugwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sMOLWRKu;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDCB606A33A
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 09:56:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CDCB606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sMOLWRKu
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso7445645e9.1
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 01:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795168581; x=1795773381; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G88ceLyh4AUnlGhVt6bK2ePXMzrBkJbu90gp7HX3iVE=;
        b=sMOLWRKutcZH17ajz5//Y4jABX+TbtrV5UIADABOPpPKhC+FEbw9wEPBbp8+ObkgE4
         8q7iDTaj1xqaWB0XFxV6D5d2BcKknlLPq3xLO6AmdZVprEr+6kI66JJuPRK1FTHf7bQl
         VwPl/XG5YSXCRzDQ9gamS8pDjR3Yh6zKlWwLu3vM+wiVOEYi3ymXIFR22Qbp7zQ4WUtT
         R85PBqnmIapf1w1lHI84+n/N+KXvUfDpbZMonNLGBhlV5i0L6FK3OiA4KEe3VkuIQm96
         oGTpIxu7RUY/Xjty2STwB31L2ze9j7wvKLIrad0Jmk7Iyt7AYyaM4E6KJ8ZYtMskTeg/
         ObLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795168581; x=1795773381;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G88ceLyh4AUnlGhVt6bK2ePXMzrBkJbu90gp7HX3iVE=;
        b=GAgv7Ml+TuAKNL2g4rwnmAtqEDcpp7Njq3ObgvNr/U+BptgcJ68NPy6oKpUXphGAS5
         /FBJbyqxJVkrlHGSXZnON/dT3QU2GGC6ffeGkSTZctXplV0Ym8afHY1m9SpgHLN1wKFC
         3+PWJJiTZvZjmjiHyjlrxDF8OeS7et0xjn7L0wFlKvQsbic4KV4uJifpQ3EWFWu1Yljt
         OXY2Xvyko1C8t8Dw6PLkKtWoxtoS7m8Wur+HuohErHzWmRfN0lPxdlRB+jRSp38tFFDn
         DyXHXoQlkXVlLoG4UMBbwq0kPBfVC+fPeLobG8HOr7wzxHg+wSJ8S0COF/lyN+k1DMWf
         jYFA==
X-Gm-Message-State: APuU4Z9vx+1z3tRX6aJy97JYVbxabvP5QtO8ETYpvaXHyO6LOEID7KsT
	0Ss6xdn3YPL8ge/cr1SzpN8jLMWn7dhe1hfvJxzjTltSFCMMvFgv0NJ1ojIBa1PO3UeL0J+TaAn
	kv4RYHhs=
X-Gm-Gg: AYBFou2YKD6WRbbDAMN6e3aama2uuWMMJ5UsfC/RcPndFKdEp8V2l+UScybPqJ6zhRV
	b3D8kUSwULW2LqHp0kYGmdM+WDNg1MH4EU4eaG7nytFsp6oSIe737BvYaSr1hBffUTyNvM/Dil4
	1h2JC3jpxdpEe8EyrRtb5wI/yB7glH1qSyaVzQfYwKDEgdFr1xETnRRjT1tlV7oQwzRm7YMV+7g
	XT+aLxqfNctcyf5yUssXyLxoFCT+K/TovIvD0St40fASOlHXBkakAir8ikQRSK785Qfd8PFrzpN
	2tU8Z43YSfs35xlRkvxNrXCpnqfiUS2b3ZcG61aHoeazMGsFE6kAdcO4mMWEXX5aFnQsLb0YzDp
	lGfvaqOLAlleYT2W4iazFD16WZSNPsCz0KEmfHdRA/a+e2RmkiTLQ9YKnGb0foLALdt40q8ZIB3
	KiJZBuwcLyUlDx0ZYkGWdrFMWFF6MvItyepXjI4kW+0uEOKeCneQjD0gRpSj6ecHeUqwC1zT8ln
	52uZ5pIC3fppJpSKu3SzJtTdCk1vwPGvm+3O6IN3fC7m/OiHS0WC9Lb80soRGFgpn1hNoDIoniz
	IC9t0xKSODSCLBM7EbKj0mJYIZzcQKufvV3l3Kd3LgwiPH6mmx96yK3E4PSRLfa76x3oxCsN
X-Received: by 2002:a05:600c:4f50:b0:4a2:1612:637a with SMTP id 5b1f17b1804b1-4bb888063f3mr62182745e9.16.1795168580504;
        Fri, 20 Nov 2026 01:56:20 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b2437sm149124555e9.13.2026.11.20.01.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:56:20 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 20 Nov 2026 10:56:16 +0100
Subject: [PATCH 1/2] usb: typec: tcpm: unregister partner altmodes before
 re-discovery
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
Message-Id: <20261120-topic-tcpm-core-fixes-v1-1-c753d1d286bb@linaro.org>
References: <20261120-topic-tcpm-core-fixes-v1-0-c753d1d286bb@linaro.org>
In-Reply-To: <20261120-topic-tcpm-core-fixes-v1-0-c753d1d286bb@linaro.org>
To: Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Guenter Roeck <groeck@chromium.org>
Cc: linux-usb@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2417;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=uSmAwwX1348iaIOry0wnOTbMLtmEstD0Q59oLCpeRw8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrABlCAuAo95PwvlksXSsBKzGKPlpEKRrkNN9/qRWD
 ERrShHaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawAZQgAKCRB33NvayMhJ0cGED/
 9mRnbAO+37956QNMV/b5pIL9o8Wf4AZcFRo/Djvk5g/UcQq3sIKSdeiOLJ9ovKF380xVwJBsbDiYn1
 PWkLkoBWya5pwhBaiy+T9y1o4oXnsyVNsulkQenPfQfJnfCb9J3pYD07ZsU5xT1sGLcD5DFtY0NH74
 dW/oaVC0eO+LTZkrOEfm7aRjlVSrEyK9JhGQ+mg84XAWQ7sAkxuDZnP7aNVQ2/gzkNw9dBAeHwvtx8
 VXBx8qUOoaeqNXMtv2Mcd/wLSxwLd4kFP7xtipsHfFiBqfipDqZ5MSyDdUqlq2C6WRcVn7Tdr4TyJ9
 zJia9GAdbaM1s/VPeXTvBwxl7GvFWA//+gJ5NtXmbi/JJpAgfs7mjhb//q7Kcj8IeMMOw4+fHKimra
 s7pqxSqr9WFQaXoyAFWJabh4+Htuv44RuJCTGtH4zTPcq2D7565RD5AvVaHuEmnymxMxHlaQxNsB/E
 LV5t516Tc0+Uk4Dcu/aVOLTQD4Fz9Rvs61c/3TIuWp7dqf7HiJ6BtmEKg3wlW+mdjg4AJSHNHD2LTl
 9HcK2jH5HMS4xMs34wOBnPhoXA3P+9LyXNbjr7f/bHwh+v/KMt6JkVp+Lu/7eHduJfdxXYhGBnYuvB
 thzmdWx8pY6pAvjpkrQOfdjmEkA5X7T95OmN9y8XT6MnGheUN0Kcsuwf66Tw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

svdm_consume_identity() clears port->mode_data when a Discover Identity
ACK is received. mode_data.altmodes is also the count used to walk
port->partner_altmode[] when unregistering the partner alternate modes,
so if the partner altmodes from an earlier discovery are still
registered, clearing it leaks them and the following Discover Modes
round registers a second set for the same partner.

Unregister the partner altmodes before clearing mode_data, and reuse
the new helper in tcpm_unregister_altmodes().

Cc: stable@vger.kernel.org
Fixes: f0690a25a140 ("staging: typec: USB Type-C Port Manager (tcpm)")
Assisted-by: LLM
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/usb/typec/tcpm/tcpm.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index bb90211660ca..1d007e59a2bf 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -2060,6 +2060,17 @@ static int tcpm_queue_vdm_unlocked(struct tcpm_port *port, const u32 header,
 	return ret;
 }
 
+static void tcpm_unregister_partner_altmodes(struct tcpm_port *port)
+{
+	struct pd_mode_data *modep = &port->mode_data;
+	int i;
+
+	for (i = 0; i < modep->altmodes && i < ALTMODE_DISCOVERY_MAX; i++) {
+		typec_unregister_altmode(port->partner_altmode[i]);
+		port->partner_altmode[i] = NULL;
+	}
+}
+
 static void svdm_consume_identity(struct tcpm_port *port, const u32 *p, int cnt)
 {
 	u32 vdo = p[VDO_INDEX_IDH];
@@ -2068,6 +2079,7 @@ static void svdm_consume_identity(struct tcpm_port *port, const u32 *p, int cnt)
 	if (cnt <= VDO_INDEX_PRODUCT)
 		return;
 
+	tcpm_unregister_partner_altmodes(port);
 	memset(&port->mode_data, 0, sizeof(port->mode_data));
 
 	port->partner_ident.id_header = vdo;
@@ -5129,10 +5141,7 @@ static void tcpm_unregister_altmodes(struct tcpm_port *port)
 	struct pd_mode_data *modep_prime = &port->mode_data_prime;
 	int i;
 
-	for (i = 0; i < modep->altmodes && i < ALTMODE_DISCOVERY_MAX; i++) {
-		typec_unregister_altmode(port->partner_altmode[i]);
-		port->partner_altmode[i] = NULL;
-	}
+	tcpm_unregister_partner_altmodes(port);
 	for (i = 0; i < modep_prime->altmodes && i < ALTMODE_DISCOVERY_MAX; i++) {
 		typec_unregister_altmode(port->plug_prime_altmode[i]);
 		port->plug_prime_altmode[i] = NULL;

-- 
2.34.1

