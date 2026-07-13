Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A2D3B9D91
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 08:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783932219; cv=none; b=ripv+syMN5D8iiiAf8X63uu5lWQNGmetvvR3EP+XTngt776kjVdSs8477Ot5irq0eX1/7d4OBWXrbwLbsi2NP261dl6xVB2bPUx9KkieWvJJJkiJ49EKuHcS2uR5Gz40+J+/9dfkQAxGaCVzM/9eU/tBENkn+P/kR9EGRBJuFok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783932219; c=relaxed/simple;
	bh=ICOZsyEGwZCTA9L3q7C65uuVPVLW9hoxigfXr5Zj32A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r2h0Ahq5wPEn0VmanicwGI7Da99Z8Yre8QsPNmnbNb0vZLa3FfXmT4PnGbbd0DFUc0P1ESien35c++K5KS5XznlAHiYMo232E6doKni9fMIVVMQKo6DKdtrB08BgMIz4qqmNUbstZ5RDtyL/jjXjNjAFd7g54Xpku3fsImGeNY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aZRykKSo; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aZRykKSo"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-848479c9bd5so1425051b3a.3
        for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 01:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783932217; x=1784537017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HLvdDGRQf151GznkrG1JNojgtuMjVxHxehUwm2F90DY=;
        b=aZRykKSoFhQOpKvNt5pp/2h58mNKvHyixkZRfnIGamVpmW0t0WCio6S/ULyJZ6N0V0
         q5eQGPNyQw7XHde4wKVVkuunzH3B2E/PqLRpcZH95Q4OPax997QntVykw4AARELXoWCo
         2Tj5UeupR/5ErCuFISq/4V+xgy1Ffov1LAEWPNfxl9CBBG4iFfnsD713+XxRSGYCtqrJ
         1TPwoYRs+ygENkV/aBAMMFPO7+UFXNqlZbTEEfbMxSma5CLJ07m9i/95F7QbhhybC8EW
         SzezeLgonbMHwdCQ85DS+H1zz3N/1UXcw8++kwQzLMnSToCteMaQR+mZXgefBItWVrzM
         xtWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783932217; x=1784537017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HLvdDGRQf151GznkrG1JNojgtuMjVxHxehUwm2F90DY=;
        b=CpfZPEHP20rqgEmfCE5O4XILM44bBrK3PYJ68KUYmQJpMDMx58UpEiHCqbFuO0D+c8
         NnfMEYlaxCIrVbpbKy3+Z0hVby/cbfcEDF3dHsT2Q0GYrYh/U6aYj5uDgqmBlI5vwUW+
         JuFGfe7EtiURF+SpKWX2mEGq/luuKL74bGcTnRqCTgTEds+3KVTT6QlCIcTsCNzJK1f8
         csg0B/wX3ao03drf6reHjRx6Mmnz4dYp/n5jl8Rn2hQ2OebRfF8G929k0dboTnXQxAnC
         Sd4zJDzuCZPJL+dMnX0drY9J7cTD+ZhY813XkQ0shchH42Qg5KtZDN6Y/jJnatnrIPHg
         jYlA==
X-Gm-Message-State: AOJu0YxIg/wVeYyxzan9hVxhVAwyQFF6lK2Qt7oPD3TwPfL2FOkr5tVE
	fTfVKejsLg73bsN2cmDl0CAuCPnnr4OOhHkd9z0KzgzuCBw8xQVv6Md0
X-Gm-Gg: AfdE7cknM1HR4hjD1wnBtFwyVB0DtfZinbA1brtXjcvUaPSZ7KbkEHn0Ux9Ahv2DN4P
	4wwXf9o7UzNTAzZLVzwRJDmtJnn6etjUibTR5ri3sFhUyfsYNcn6YlAQCcKRRYRSjxEqESCf3oF
	omUMH3SmiatokWCKehCnniZo9pn83qh3J8+9Ye2Z9b02VjPiDXPGk72N8uFU7uhCa2JH+ZU8uAt
	zNiLC9Jy9+K6ooH9XobbGhju+74DxblPeJX4n1WTH8hjEGKjlBJH1wr1lLDia5PQSlSPUCOnQDK
	dWhc1aPNP6wEqIq/83udKGBly01iwzzXnezIe5OI1bKPO5fFwgEqHzrQcEtjLxKJ9XjQ5EUhokC
	bDcsEvkOGSVE8JCfcjWnVuqRpsWD5ZKpv/EobU0S6vhF8znBA5ehd6qhbWmkz4FYqweD6hcHlJm
	IbOOb1aq7trI+WaCPDNXStdG+fLONVIDsF5/L9Gsdy9j8PJrANQlYQ
X-Received: by 2002:a05:6a00:23c9:b0:848:8829:8585 with SMTP id d2e1a72fcca58-848896c548emr7302716b3a.8.1783932216650;
        Mon, 13 Jul 2026 01:43:36 -0700 (PDT)
Received: from localhost (211-75-139-220.hinet-ip.hinet.net. [211.75.139.220])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84909673e32sm2837537b3a.56.2026.07.13.01.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 01:43:36 -0700 (PDT)
Sender: AceLan Kao <acelan@gmail.com>
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Johan Hovold <johan@kernel.org>,
	Jameson Thies <jthies@google.com>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 3/3] usb: typec: ucsi: yoga_c630: Remove redundant duplicate altmode handling
Date: Mon, 13 Jul 2026 16:43:23 +0800
Message-ID: <20260713084323.287516-3-acelan.kao@canonical.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260713084323.287516-1-acelan.kao@canonical.com>
References: <20260713084323.287516-1-acelan.kao@canonical.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit e0c48e42d818 ("usb: typec: ucsi: yoga-c630: remove
duplicate AltModes").

The yoga_c630 driver previously implemented its own duplicate altmode
detection in yoga_c630_ucsi_update_altmodes() to work around buggy EC
firmware that returns duplicate AltModes instead of empty ones.

With the introduction of the common ucsi_altmode_is_duplicate() helper
in both the standard and nvidia registration paths, duplicate detection
is now handled automatically in the core UCSI code. This makes the
yoga_c630-specific implementation added in commit e0c48e42d818 ("usb:
typec: ucsi: yoga-c630: remove duplicate AltModes") redundant.

Remove yoga_c630_ucsi_update_altmodes() and its callback to eliminate
code duplication and simplify the driver. Note that this causes the
driver to switch back from the nvidia registration path to the standard
path, which is the original behavior before commit e0c48e42d818 ("usb:
typec: ucsi: yoga-c630: remove duplicate AltModes"). Both paths now
include duplicate detection, ensuring the firmware bug is still properly
handled.

Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
---
 drivers/usb/typec/ucsi/ucsi_yoga_c630.c | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
index 1be18d101842..bb7b09bc7c1c 100644
--- a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
+++ b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
@@ -139,28 +139,6 @@ static int yoga_c630_ucsi_sync_control(struct ucsi *ucsi,
 	return ret;
 }
 
-static bool yoga_c630_ucsi_update_altmodes(struct ucsi *ucsi,
-					   u8 recipient,
-					   struct ucsi_altmode *orig,
-					   struct ucsi_altmode *updated)
-{
-	int i;
-
-	if (orig[0].svid == 0 || recipient != UCSI_RECIPIENT_SOP)
-		return false;
-
-	/* EC is nice and repeats altmodes again and again. Ignore copies. */
-	for (i = 1; i < UCSI_MAX_ALTMODES; i++) {
-		if (orig[i].svid == orig[0].svid) {
-			dev_dbg(ucsi->dev, "Found duplicate altmodes, starting from %d\n", i);
-			memset(&orig[i], 0, (UCSI_MAX_ALTMODES - i) * sizeof(*orig));
-			break;
-		}
-	}
-
-	return false;
-}
-
 static void yoga_c630_ucsi_update_connector(struct ucsi_connector *con)
 {
 	if (con->num == 1)
@@ -174,7 +152,6 @@ static const struct ucsi_operations yoga_c630_ucsi_ops = {
 	.read_message_in = yoga_c630_ucsi_read_message_in,
 	.sync_control = yoga_c630_ucsi_sync_control,
 	.async_control = yoga_c630_ucsi_async_control,
-	.update_altmodes = yoga_c630_ucsi_update_altmodes,
 	.update_connector = yoga_c630_ucsi_update_connector,
 };
 
-- 
2.53.0

