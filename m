Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792687907;
	b=juC0JsifrkTLU0HvP1CJnImYfklSYPYPCoyiGGkkkbYtmyfM3VrnX3mC0Xrzlqai71+Z
	 XMa8zgTzDfTxfCBFPPYWtvOb9m7gN2OL1MWW2HOcNC2Qz8YgFCAyabSBIQbS5Fhntjbel
	 fDcf07xZwvysAIAFvgGSuKT4OVbGOSRjRJxH/HVNFkqOicsslVtD2fNRdDG+ga2TBMehm
	 MjHxVsHXDycQj8ZvQs4oxXGtqsO92TP1gzpo3Gl0x9eyGarWQSOLeBXQ0y7ZPYy6DovtW
	 h+FjVD2D7eCx6SnZcxX5eETvWHJylZZ4NoIx7WbABsJv8izUrl98volTlgBYmolRB2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792687907;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MDRQGAeJLdbef9dVZwQAv7nGIbRRq1DpVqeg51obZuA=;
	b=o4ZGfzBCJZSc4yPNaNeF8DwwdZ5oDRQcr08kF6qR0IEziZVBQ/AoEAWYNhfosu7Z6oNZ
	 JARZL6dsPL8nk3TBFDshV6fFqls7TI5DuGKwX80CBbkcWsoztQKNb29tPBdfkbUx1RB2g
	 B9fe6Rt33g/XMD5EnT9lDVKKrP203qRt1tY7RrYN7YD3oCm2VGH7flki7scUO3TVpkN6M
	 lIWxMMrDJsEpSXlDaJN2fI+TShJPG7gcc9ZTJsQIC2CnHso4MNngwp0FCAn7Ap8VQ5LJF
	 bHZkRZ7xzMuQZtkumYtrGfJO3NFdh5GK5agwFglEWy+5SXUbAZcELQvJAwz+QMXnNiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KBp3mBBV;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D972D606A31D
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 16:51:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D972D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KBp3mBBV
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-18cdcfc05ffso2335084c88.1
        for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 09:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792687906; x=1793292706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MDRQGAeJLdbef9dVZwQAv7nGIbRRq1DpVqeg51obZuA=;
        b=KBp3mBBVD8mfQPf1xPzMq78aeOa7OjwZrfrkFTLv2MOomwMfKo99PpbcsyR98PDW6g
         tlLlCzCxgP+Il1BNJNs21b8d88NZyIipvWgy701LcDZjekp2TPyi5kfoqZfNifcoLnQv
         pCVLLkfC4iJTo11uUocrgB6P+bNIQhMrcr3Cv9WAYYPQZkoL0MmkkQ7cBgqIb1s5+SD/
         LdLxXBZC6br+p7I05cm4zZ1V/+dSp/OcLLSiBU5OkH5QNaEfFB4qR6ZPQX1+MzBum8nj
         vJ8XEp1KCdtY9mQCDytv2jub6UXE3/+3BsU17StIu8Qf4QJpxIAuxzHzaPZxmwuEzTC1
         UUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792687906; x=1793292706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MDRQGAeJLdbef9dVZwQAv7nGIbRRq1DpVqeg51obZuA=;
        b=mV+p82oVosdIXwKMV8VUoZ34n2jLtlC3RAB9AHg2g/jVfW52l7+blHo+KPNfwzJgk7
         jw+spZW8y/4V/Yk/ia4CclL6DKHFy9+Yso8mIvLDebz1M5oB/89VAEmyEilj7hMfl2rv
         wTju1fAngqhPjL27vaHPg8REIjo4GBcjtvcc13P46EiTLJ4JewzDzXKhrY7WL0W4yHE7
         RUT+kSO7pTerqfE+1uFgARODtm9ppPXVEdrYiLON9tkU4GMT+NCgJN3TRkMrRe1URSA4
         v8Q55Mv85fIsemAEq6FARm7scy6C1GRFbHwViHkAKaqq5sN8kWwcOShGkNLfwUfTY7pQ
         acMA==
X-Forwarded-Encrypted: i=1; AKwUvBxso31XYnGCCgBXeO2Pdet8bgzgHmgKdvba+E10ayj04StUVc9XvrhE2JAj1S1YCXJ3BJgTe2xCFJQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJFs7NUuLH+wZipcIq6W4T+HRHozwM2iQbjGS2LQ6U/DlLKPYMy
	UEMMgOAN923e4RxXDS2VjPtGzVSdwcaesPeTt+LDXupbKhyHyRHmmEWGH2Mv3S92vQCJyQ==
X-Gm-Gg: AYBFou0Iy7qmkjAF/mhqF8xBGubCxeBjSKzsGuyBN4EZdLrFgJaHC1OKPzoCvkc51Ek
	Yvxnh8bPOO5G0DprKvdDaSvTkxBkq4PGorGHxYOb6J+ierS096iH5annQcph82jNtndIZaLeCcL
	UxwrvnDd5n/aQ7yMc8h4PpFa1XJlkjkRYArEjzvo12XiO39DpfZAFTfG4oLgbt2shgJMwXL7CBQ
	t+rTTRR91zqc6r8io8KQFqd9W74uQz5s/Qyz/6AlI33Drnu9l6GC1g8fHMa83m9ePoXBms2nAMo
	MMjQYDrRbWwce8H10iJ0VATuZwkU7jsn9MFLN1QTMXa5zs0JfQFb6+l/yUjXpjlVqLsLn/evYPS
	ZKZtjqsGVJbE93oFxOxqpnr3R2kvfwPDdhtNoC+toYK0Xq+1dEDhBv1gswScPH0AeLQq1OONZBP
	U2HgIZrMv0QU7Xe5/swEjAe56MVcTSqZs/4H5euCrjrxQ+4Jc4TiXuzOVWLUQ0+Lc/ESbS2Q2/m
	UQk1Ok/cJau/g4Oo/IjVnCH9XkH9OT91cL8rUlSXX1R+wZWCBXSRK5igl2N7fqNsUtt2XY=
X-Received: by 2002:a05:701b:42d4:20b0:191:444:425 with SMTP id a92af1059eb24-19104440440mr6489634c88.2.1792687905761;
        Thu, 22 Oct 2026 09:51:45 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1959dd144aasm46566c88.0.2026.10.22.09.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 09:51:44 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: neil.armstrong@linaro.org,
	linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: typec: mux: fsa4480: Keep the USB 2.0 switch on in DP-only modes
Date: Fri, 23 Oct 2026 01:51:43 +0900
Message-ID: <20261022165143.1327-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DisplayPort pin assignments C and E give all four SuperSpeed lanes to
DisplayPort, but the USB 2.0 D+/D- pair is not part of the pin
assignment and stays available. The FSA4480 sits on that pair, and in
these modes the driver turns its USB switch off, so a USB 2.0 hub or
device behind a DisplayPort sink is disconnected as soon as the
DisplayPort mode is set.

Configure the USB switch the same way in all DisplayPort modes.

Fixes: c7054c31c1c9 ("usb: typec: fsa4480: rework mux & switch setup to handle more states")
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
Tested on a Lenovo Y700 Gen 5 (TB323FU, Kaanapali; out-of-tree board
support) with a USB-C monitor in pin assignment C: its USB 2.0 hub was
disconnected when the mux was set; with this change the hub and the
keyboard behind it stay connected.

 drivers/usb/typec/mux/fsa4480.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/usb/typec/mux/fsa4480.c b/drivers/usb/typec/mux/fsa4480.c
index bea0c1deec94..e05ab3c10c81 100644
--- a/drivers/usb/typec/mux/fsa4480.c
+++ b/drivers/usb/typec/mux/fsa4480.c
@@ -93,16 +93,9 @@ static int fsa4480_set(struct fsa4480 *fsa)
 		sel = FSA4480_SEL_USB;
 	} else if (fsa->svid) {
 		switch (fsa->mode) {
-		/* DP Only */
 		case TYPEC_DP_STATE_C:
-		case TYPEC_DP_STATE_E:
-			enable |= FSA4480_ENABLE_SBU;
-			if (reverse)
-				sel = FSA4480_SEL_SBU_REVERSE;
-			break;
-
-		/* DP + USB */
 		case TYPEC_DP_STATE_D:
+		case TYPEC_DP_STATE_E:
 		case TYPEC_DP_STATE_F:
 			enable |= FSA4480_ENABLE_USB | FSA4480_ENABLE_SBU;
 			sel = FSA4480_SEL_USB;

base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
-- 
2.43.0

