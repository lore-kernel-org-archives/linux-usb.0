Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7FF3845B7
	for <linux-usb@vger.kernel.org>; Wed, 19 Aug 2026 15:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787152846; cv=none; b=IMrs0QeP1lEtwCXbGvsBq9UTeZ683Ahh4tAz0wum/qSeSOvBHzOjRiORXIm9Md8pKP7NgsMQlT5hlhaQDgiq+zfka7y/JaXwHlW/UYH9LSB2aA9z6zYYe3a7LWGt6EAK3a2EoYZmuigd/+hPyVecIeQ8TRrBaeRQcEZwPBKAoRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787152846; c=relaxed/simple;
	bh=NktYR13aQGEZKI3EO5FCbGzBjpVy+3k0GIvRZjmI+vY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d1/EHnl1NNSf1CI2YdOP6Rhd5p8aOl94eNZh75RjhwVZkgnyLj9IScDlrb+OBsErVu2feTLOKgiMVBc8+hQFTKBjkBYZ34jjbIJlBxxTwbemOmPhKEcr+W7q3Kjzu6zzeQOBZF20uQdP+NNLqLeCPiKMqaA30bLYkSalP19BXUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dd6iIWOz; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dd6iIWOz"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cf6d65d8a7so13544615ad.0
        for <linux-usb@vger.kernel.org>; Wed, 19 Aug 2026 08:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787152845; x=1787757645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OWrkfvF0AtjljV0m6J5emA4PqOIDBL9kVxpQPrwf6n0=;
        b=Dd6iIWOzy3GbggjuL47hl2sDCZumb4GQnaXyWMYEOvVlcEu+3b+/G+/jTz7EOE7T6Z
         7XHQFcQGqvAJxq7zUFbOSUfyQvNXTXlnOIdpTCCYe8/XDIrD179TQp/1uItGVDm5G0VU
         yjcC+rI8JjhFpRoiozaq9+EX5/EcUTGKtbalbnNGLi8g9ciV5NtCzp1VUj4SAB+Ow44R
         w3/ZVmlTawrvTDnFyi8KtY6w+2+GMtysUMpSdfpFfJvy2eDdUGquI4rdIAeERtaM3Jdy
         2aLIvTBbVXVsC6KB8tob9hH0NRazxltYp/O+hB2W85uS/NhTRnS3p1QaCGTJPrqOdvs7
         Sxew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787152845; x=1787757645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OWrkfvF0AtjljV0m6J5emA4PqOIDBL9kVxpQPrwf6n0=;
        b=pKMZ3NYNGtQs/mBKW30KgA6TXO+RwN793qivRKtqp1iaVzwCUe+zxI5oC/9WMDxFrw
         +J8lsA9Vhock1l0VxKhZU78oND7RauDrBS7Y689k91IdpU/qa2ZwwsGcALyrwRTN5Fdq
         DIf7/I4Aov18Ne7i+kKzZSHt+nT5cK1kcBfSUFcYZVVf8mdhj/Ib9vXZrC5M+NX8RCGi
         GmrsdkPDo0Nk4YMkSEzHRgCzqqA8ECM0Zd/FNviEw7Lj4ru5or2Bb+eTVPKiw8aQg35S
         hEg1gV2Wd3Kd52mgxIHOqBFAHnoaGpB7w79uSl/IHkuDxeV0oUs4dFWIiwCAvGKosyJs
         7Hpw==
X-Forwarded-Encrypted: i=1; AHgh+RqlgvTain+HQ9SS/Z3tgRhw7K0Q7w5j0pA73iW+G7Zzhp4oRZp2OYo0C/UfTSnaEdVatDG6Jgfkc6c=@vger.kernel.org
X-Gm-Message-State: AFuF++krJhLHrb/KkJD4J6sP9aRk0QKu7wtVsYRjFgmdD3Xvie7hBDYM
	H1Yt5xkitYDB1F944HDro+af7yNDUSPYANPnYMa7V9/oASMhkD+SwDOp
X-Gm-Gg: AR+sD12XnyUmi08QC2E0O5248prjCFVEPGhY0PciXfmlbiH/4uCbAntf/IJ48wsQdH/
	lXPOTFN9g912GE8Z8vdpV3g3wYblfOssp/R2tScMMealQK7Hyohb0feWYhyRiIEUDfNpTkRd5XZ
	tvpyjH2CcBiJMkOI9Yjun5mQYHq6SKLwCrCBl6xu05/qr5WfjPaPM0ie/bBDBayoA2UbO1x/YDB
	Qemu+4NJS6Tlk18+aDKOBmSZFJhrmXJ5C31q13W+eVUgk+eMfRvoOx8jtsoHAfRonDcKAhR3wxO
	Si2/ih5zuuGcAEYFRVD1eSHg66bWSxCUkYFvYvst3mIdKi2gP84XLyiVSLbSZijY44Ul8jZ888h
	i6hqVOBD++eQPNp2bUcMHes1gLjQi2lVgnGw14mmTKOeSVJCmYTDs4mhN3MFV47/5oVRibMkdFT
	EMgqpTJg+zRhQrSAQfnbCtZ41Tcityh2n+pmWLa7x4pcl1wPKLQtY4XPoL8atH40R6x7tQglOKr
	yqNOA==
X-Received: by 2002:a17:903:1987:b0:2ca:61bc:317c with SMTP id d9443c01a7336-2d601a8baf8mr98123875ad.13.1787152843091;
        Wed, 19 Aug 2026 08:20:43 -0700 (PDT)
Received: from localhost.localdomain ([188.253.118.67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5c1ecb1c1sm27294945ad.66.2026.08.19.08.20.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 19 Aug 2026 08:20:42 -0700 (PDT)
From: Chang Wu <kunjinkao.jp@gmail.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jan Remmet <j.remmet@phytec.de>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chang Wu <kunjinkao.jp@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] usb: typec: hd3ss3220: track VBUS enable state per consumer
Date: Wed, 19 Aug 2026 23:20:27 +0800
Message-ID: <20260819152027.90994-1-kunjinkao.jp@gmail.com>
X-Mailer: git-send-email 2.48.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

regulator_is_enabled() reports the aggregate regulator state, not
whether this consumer holds an enable reference. If another consumer
enables VBUS first, the driver can skip its own regulator_enable() call
and later attempt to drop a reference it never acquired, triggering an
unbalanced regulator disable warning.

Track successful enable and disable calls locally. Keep the state
unchanged when an operation fails so a later role or ID notification
retries the operation while this consumer keeps balanced references.

Fixes: b3f9d6e491fd ("usb: typec: hd3ss3220: Check if regulator needs to be switched")
Cc: stable@vger.kernel.org
Link: https://github.com/qualcomm-linux/kernel/issues/472
Signed-off-by: Chang Wu <kunjinkao.jp@gmail.com>
---
Testing:
- scripts/checkpatch.pl --strict: passed
- Qualcomm CI checkpatch, sparse, DT and UAPI checks: passed
- Not tested on hardware

 drivers/usb/typec/hd3ss3220.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
index d0de5a2488f9..4eec90c82bae 100644
--- a/drivers/usb/typec/hd3ss3220.c
+++ b/drivers/usb/typec/hd3ss3220.c
@@ -62,6 +62,7 @@ struct hd3ss3220 {
 	int id_irq;
 
 	struct regulator *vbus;
+	bool vbus_enabled;
 };
 
 static int hd3ss3220_set_power_opmode(struct hd3ss3220 *hd3ss3220, int power_opmode)
@@ -208,7 +209,7 @@ static void hd3ss3220_regulator_control(struct hd3ss3220 *hd3ss3220, bool on)
 {
 	int ret;
 
-	if (regulator_is_enabled(hd3ss3220->vbus) == on)
+	if (hd3ss3220->vbus_enabled == on)
 		return;
 
 	if (on)
@@ -216,9 +217,13 @@ static void hd3ss3220_regulator_control(struct hd3ss3220 *hd3ss3220, bool on)
 	else
 		ret = regulator_disable(hd3ss3220->vbus);
 
-	if (ret)
+	if (ret) {
 		dev_err(hd3ss3220->dev,
 			"vbus regulator %s failed: %d\n", on ? "enable" : "disable", ret);
+		return;
+	}
+
+	hd3ss3220->vbus_enabled = on;
 }
 
 static void hd3ss3220_set_role(struct hd3ss3220 *hd3ss3220)

base-commit: e1e6e541c5c9cf548e9fdc35fc26808c82074440
-- 
2.48.0
