Received: from mail-dl1-f74.google.com (mail-dl1-f74.google.com [74.125.82.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD253379980
	for <linux-usb@vger.kernel.org>; Mon, 22 Jun 2026 22:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782166100; cv=none; b=Uq03JymXO8K7QQ020WAeceh05ivW0PYRampdy4ox6Z2p5b2qbH+7lFg/QfqG88j85tMR1JcdKJwfEICCYFE+7fBQgbaUbgeF9dxFvkiCDDzYREk36yEWq1EBvi7EBMNFE0RGnkf3HyQcLmrofjG+W0yTY5N7tW2VsMcdxtjhYZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782166100; c=relaxed/simple;
	bh=gtoZ3+8Rgife3T2ykHMgjoCmnfMDfwH5a1KX3OmxMbU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=F4LCM1Yu6WzTuSA2JYzt8Ap8ncfSn650eesGFJ8/zcSpWP273MJBxYHD/P+jJjN3jihfoF0Gc4U+lP0GdpYTbEgEcCwOwlI7c3M3E4bWNBu4A9nnIyl37TKWWY9H8XtKUFRgrz3yRyjwMFvshMTDzUxy20lrp3Y2QenXxP7PnyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--badhri.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TviACZLb; arc=none smtp.client-ip=74.125.82.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--badhri.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TviACZLb"
Received: by mail-dl1-f74.google.com with SMTP id a92af1059eb24-139b74d67e0so6617938c88.1
        for <linux-usb@vger.kernel.org>; Mon, 22 Jun 2026 15:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782166097; x=1782770897; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7YgVxJJLb1a5N4KPK+tUPVQZqGOEaMSSQ6ahe+ZpFIk=;
        b=TviACZLb0J6KKPDyboQrGhBqHwKL2b4wsJECLlPF40aeN1d2wnPyUoi+H4uVGgj4iO
         wgC+LnfjiVfbXkbI/rLBZ57IXsmTWPREcEDcvtGGMoUrhnZ08J7q5d0mT6elLMa/hVCZ
         Cnn+EklsIB7v0n87wNM95Qor915lVW/6xWqiy++Ug9/kHaRxXu2vCuBxYQxIhZRBxA1e
         QbD2mtzvGAjxJOiYmbmrp/LISEewwUnCEzRQPbBpkRVp7DQm9e2vmOTQnVpSHTfZ+aHP
         bFGkhfkKq6cRzR/FjN6R8V2iu54h9WK8+MbT8BkVhl4n+SSu8GH1836cmOFZn+B/la/N
         L2jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782166097; x=1782770897;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7YgVxJJLb1a5N4KPK+tUPVQZqGOEaMSSQ6ahe+ZpFIk=;
        b=f3U7YgcI3v3uru2ZLEkhUy+CNEdym3pVjyyeUSW0MmRQdGgTcxBUg/QFM2WttNloPa
         +OKqYSVDUoD5ZEbUTTvHmdYQyUSDY5rcp1G1jPximmZ45yNixv+jaeC7m/SCfvpsl7WT
         KwOMB++P/N+YXlFzXJ2bMfLFSRE7Zj148IJ7UeB1wZPiv/pePdWLdntwEJ3sDz9EOE+d
         BxcdJ0PSq4sP2kk76rLFNJKJ/rHGX2ggXPvB6mF8bomI9nJXbo10Z9XJC0/It54Q10Kn
         yPx1kc3rvId6Adhln9OOPBUQK2iuLRg0Zr77kNG8QsjFlswqFJx93ZvLI6PvgfedyTvl
         cZcw==
X-Forwarded-Encrypted: i=1; AFNElJ9Vq7mr+7jkhZFVtOo38rTyLuEoLmBPHnO/XoWAGKu80tMQR2BuWY+q9CMyBcDzKt80NfjNGWCjW8k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYsFKNNIsx8w5J7BXXqIQOEzyGodAW09C9E5Eg8jWdw6V5rY8o
	2hj0A78Wktb+MeIv9VyHu96fSBK8waRPp1/xFto5QqF9c4xaJfdrwgpY26zKfJUIoj/ZIAitjYC
	Djai71A==
X-Received: from dled15-n1.prod.google.com ([2002:a05:701b:42cf:10b0:138:15e3:14ab])
 (user=badhri job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:911:b0:135:3025:be5c
 with SMTP id a92af1059eb24-139ad7113e7mr7552036c88.27.1782166096347; Mon, 22
 Jun 2026 15:08:16 -0700 (PDT)
Date: Mon, 22 Jun 2026 22:08:03 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.rc0.786.g65d90a0328-goog
Message-ID: <20260622220803.305750-1-badhri@google.com>
Subject: [PATCH v1] usb: typec: tcpm: Validate SVID index in svdm_consume_modes()
From: Badhri Jagan Sridharan <badhri@google.com>
To: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org, 
	badhri@google.com
Cc: amitsd@google.com, kyletso@google.com, rdbabiera@google.com, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	stable <stable@kernel.org>
Content-Type: text/plain; charset="UTF-8"

In svdm_consume_modes(), the SVID value is read from pmdata->svids using
pmdata->svid_index as an array index without bounds validation:

    paltmode->svid = pmdata->svids[pmdata->svid_index];

If pmdata->svid_index is driven beyond SVID_DISCOVERY_MAX (16), it results
in an out-of-bounds read of the pmdata->svids array. Because pd_mode_data
is embedded inside struct tcpm_port, indexing past svids reads into
adjacent fields. In particular:
- At index 16, it reads the altmodes count.
- At index 18 and beyond, it reads into altmode_desc[], which contains
  partner-supplied SVDM Discovery Modes VDOs.

By injecting a chosen SVID into altmode_desc[0].vdo and driving svid_index
to 20, the partner can force paltmode->svid to be loaded with an arbitrary,
partner- chosen SVID, which is then registered via
typec_partner_register_altmode().

Fix this by validating that pmdata->svid_index is non-negative and strictly
less than pmdata->nsvids before accessing the pmdata->svids array inside
svdm_consume_modes().

Assisted-by: Antigravity:gemini-3.5-flash
Fixes: 4ab8c18d4d67 ("usb: typec: Register a device for every mode")
Cc: stable <stable@kernel.org>
Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
Reviewed-by: RD Babiera <rdbabiera@google.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 7ef746a90a17..bc531923b1ca 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -2000,6 +2000,11 @@ static void svdm_consume_modes(struct tcpm_port *port, const u32 *p, int cnt,
 		return;
 	}
 
+	if (pmdata->svid_index < 0 || pmdata->svid_index >= pmdata->nsvids) {
+		tcpm_log(port, "Invalid SVID index %d", pmdata->svid_index);
+		return;
+	}
+
 	for (i = 1; i < cnt; i++) {
 		if (pmdata->altmodes >= ALTMODE_DISCOVERY_MAX) {
 			/* Already logged in svdm_consume_svids() */

base-commit: 1c2b66a7d7257d2652aa41f9a860ecb96dde27dd
-- 
2.55.0.rc0.786.g65d90a0328-goog

