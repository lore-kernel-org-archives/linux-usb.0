Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4050122579E
	for <linux-usb@vger.kernel.org>; Fri,  7 Aug 2026 20:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786134851; cv=none; b=Ke7zn9/YtV/qC4SiNGDtWIIHI1SxgHiZfnoEfGkSfXwV0t3B3qn0tAPXsINs38jMWNRYheSSN/uuTWifRfQjWssQHa7yVYQA4tF8wvJTI5xgcHdaad1+Uuta1BVXcZlfgTgb0ITAEg/SBXKLpFC3KXNDbw9QpYlmTolKhqbTiFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786134851; c=relaxed/simple;
	bh=4bKtNy1m3ugf3oupJKxYZLQ3iwlmRNaacUKow8NU8kc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b5osgZryNiMWU8sZcWJGnnQHL36VuU9jq8uzTIyhDyaFnjorYxkqWRFPsKJUrQHVPkMPIjbpDe+/6F/WnHaZr3safOC0VuVz0MEdrmBXXG95NDHyYVuISO7y5NDQV/zyoUaoT+Cib7bZknMblw4qoRxpMD19arHiFyK4QllD6vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jqsSh7oc; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jqsSh7oc"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8ee43b3e5abso26113966d6.3
        for <linux-usb@vger.kernel.org>; Fri, 07 Aug 2026 13:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786134849; x=1786739649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6IowxHDF4Drb1gFfxYtPR+reAwuJtDGOMbAUhoGrbyA=;
        b=jqsSh7ocphShw+6OSjf+rojoSJIdFPYSOnSvHNeodsjqKdjCedgeOZsvt93x6kLEfW
         XkkSZyMFB3pD5yEt9sCLwvJcWP0g5zN/njWuiHVqqkfkm7xM/ryzsP5cj1gxT+ih4onl
         qNHWQc8fgc8BimEFrMa1nsZph/NlBTYm1TF6hUrSfy/5udrKdUeIOO8CNkQtGXCiqAR+
         J2ZShl1o+Dy9sl8rJxRWyJdal1Z68VyItncv+8j5di0fxdUR3TjBbALVWlTWlKzX96nd
         0guwmxX8S8WjTP7zfYtqAEMeVxd5MlkmNneHMGCk4FkIlOfgJs3ZrPs0XkoanbEov1/Y
         UKAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786134849; x=1786739649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6IowxHDF4Drb1gFfxYtPR+reAwuJtDGOMbAUhoGrbyA=;
        b=dOIFLJ3OszfMaJLCqGVGWL26VmsJSCfQYbb5AY/gj7/uMqjBa924knFFHpKvgFzJz3
         W06ZXuxZQb5HfCcCmaDsxndZsgpK8Wv+TxsbbK3m1ckXzEjMjNP4XJiEWEroxLOQhiS7
         XmiTm/moOT7KlDVaZPV/w0u6e1elBT15UNSQcebwP5XCkFqUBQYOntz+GHnzfZgUUdKn
         bgEv/j6LHLJjRVDl3t0cAvdwaBTieVJq91KnOxsNl9YNfA4Nqp1rovtNJnSLwDckXGKQ
         W4/HR8nLxivn/ZUyIB4Ao76/qAjPem8ugY1R/lWsxE9HPAmHF2aw5zA9sIaKz2xY80uT
         jlkQ==
X-Forwarded-Encrypted: i=1; AHgh+RpCCjyk8TgerwJIwwtEM9UmRn09l/WqyFeoK9UfHin4M0C734MnzmHqayrMQRTuYRiTYvdr/Up7K+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqay40xy0hOuWeOCCLKKvNVNJqf9LZutQCJR6EsRe3sXKUqUyp
	OQ/qiEv/g4D9foslmKWYfm9oU+WHGytYQDNBtqukzi6OG1uZF1B+anZG
X-Gm-Gg: AR+sD11Vpkx1CiXCfPrx4VglGbNwbl1v1jMZUyDee1O6V6LUvx0cPf5Z/Z9kmNfUjVX
	9/emLsGqge7qpBfwNYTsgcJzLsKQigpautfOUCgcWpvaP0jJb/PWzhTWofCLZG61Dfj5yu/g0kr
	M9NwkNIxvohViaKBRhmiOhkMh5UYRdRU6EQieVVBEJ/mErgA6/VKiBb/xCyENP4mm4BjQ+0hwUy
	DyIn7fII62v1RJQYvtk8jMDeSQ4S6BvHS6m84HPdtw+sJKVbnCHEN/AH5UyFGIsr1S27Td77uw9
	odHSlxZYi05+bVfkt00FpjdHxwT01UEp4X8A40S8mkQ6PI41qIoo9hFyMdgcvcEgI5p5bMWOedj
	SgqhbKdtmqIKFcoFQ7n9yLYGG2MwCNiU9Ymip223qnN1mFGZ53AU0e9Au1vJgBU5kinWc+pm6fw
	XmFeBe5nT8G0JmOSndsh9FYeXCIIPi/KK9HxonXmQyzM1aeoNUvNnuSPhHixNwNLdc+oNgPZ+YB
	BeVNisfg65jDPUCLbsYRJGOeMZ18betFYZl4XG/GZViG4ezZELZNT9oNnHOmis=
X-Received: by 2002:a05:6214:252d:b0:8fd:7913:b345 with SMTP id 6a1803df08f44-9088126f465mr296889346d6.22.1786134848955;
        Fri, 07 Aug 2026 13:34:08 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908a918dc65sm16676826d6.6.2026.08.07.13.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 13:34:08 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: heikki.krogerus@linux.intel.com
Cc: gregkh@linuxfoundation.org,
	sebastian.reichel@collabora.com,
	tglx@kernel.org,
	alchark@flipper.net,
	u.kleine-koenig@baylibre.com,
	ustc.gu@gmail.com,
	bigeasy@linutronix.de,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] usb: typec: fusb302: Free log buffers on exit
Date: Fri,  7 Aug 2026 16:34:03 -0400
Message-ID: <20260807203403.1011343-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fusb302_log() lazily allocates entries in chip->logbuffer[], but
fusb302_debugfs_exit() only removes the debugfs directory. The buffers are
not part of the devm-managed chip allocation, so they leak when the driver
is removed or probe fails after logging.

Free all log buffer entries during debugfs teardown.

Fixes: c034a43e72dd ("staging: typec: Fairchild FUSB302 Type-c chip driver")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 drivers/usb/typec/tcpm/fusb302.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
index 3319f6a2b0c9..67ccbbd64caf 100644
--- a/drivers/usb/typec/tcpm/fusb302.c
+++ b/drivers/usb/typec/tcpm/fusb302.c
@@ -223,7 +223,16 @@ static void fusb302_debugfs_init(struct fusb302_chip *chip)
 
 static void fusb302_debugfs_exit(struct fusb302_chip *chip)
 {
+	int i;
+
 	debugfs_remove(chip->dentry);
+
+	mutex_lock(&chip->logbuffer_lock);
+	for (i = 0; i < LOG_BUFFER_ENTRIES; i++) {
+		kfree(chip->logbuffer[i]);
+		chip->logbuffer[i] = NULL;
+	}
+	mutex_unlock(&chip->logbuffer_lock);
 }
 
 #else
@@ -1784,8 +1793,8 @@ static int fusb302_probe(struct i2c_client *client)
 fwnode_put:
 	fwnode_handle_put(chip->tcpc_dev.fwnode);
 destroy_workqueue:
-	fusb302_debugfs_exit(chip);
 	destroy_workqueue(chip->wq);
+	fusb302_debugfs_exit(chip);
 
 	return ret;
 }
-- 
2.43.0

