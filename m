Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6295474E
	for <linux-usb@vger.kernel.org>; Sat, 15 Aug 2026 00:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786755450; cv=none; b=UjCZoYA3+aT8FUA4J951yPqtJpgBXwVw5m3tWeiAkZ6ZJm5/RqueC27U9G3Ncs8UGIBI7Pgvxgb0qVTx4Q1w4eRjb3fJcx1GRvcN9/+QLVZkv54D/9v8TMmYVTI3b9m/jMu5LtGer0+hzM6MxdvTMEybi17cWC9izrdn5OG3hFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786755450; c=relaxed/simple;
	bh=ZUb16aZBEo+U7zydNqDue3JDXWLc9OnpyLTWhZgGNnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OcIbelz6IfT7N9IUOSHvfk+BUmEEeOlgV4GKCqSj3RDbEfIQeDfa6ioiUEEw43PTM1oev5Ujqx3uqbJLmLTSleMjvLjjlZypIrIyC8x8vurCze9B5StMAccgXWVoS9GMF23Qmi7/kUwTVg4hwOM/HOJbWkdsptqmrjiPbfXIKAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riff.dk; spf=none smtp.mailfrom=riff.dk; dkim=pass (2048-bit key) header.d=riff-dk.20251104.gappssmtp.com header.i=@riff-dk.20251104.gappssmtp.com header.b=jUVkgUuY; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riff.dk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=riff.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riff-dk.20251104.gappssmtp.com header.i=@riff-dk.20251104.gappssmtp.com header.b="jUVkgUuY"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ce7d2adef4so27269835ad.3
        for <linux-usb@vger.kernel.org>; Fri, 14 Aug 2026 17:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riff-dk.20251104.gappssmtp.com; s=20251104; t=1786755446; x=1787360246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xDLvVTv77VbLvLIlBHyGFXLEvMF7Z3UgTz+IRfS7NEw=;
        b=jUVkgUuY5Rp4GNsmMFLX1N9IpmXX8fPHlA2cmey3F02+RGpRGaa3UXDLJ6DqEJSS8i
         mktbiYnuI0sirJ5/uiZnYJQ7XbpnUD7JmnKt0enLlvLnL8AgNfa+i6sBWppoZ5DLuFZP
         9DkeEATC2KCgdOuNRzrVqgG8kIcdEWwbifOzy4ZFqpdLPWVG1qg3paLFTJjeZX+0oqT7
         DWKwr2yVTNCuXno+2rBkZMda39A7ADDZazJQrsPOEStjdd9eLfY5goOSz9mThccPecsH
         FqgPL3AZhYyTgPUJzSnwfKbJb5lA7ycEoUJklzxeVG01jF8V3SZKKAfPbtoeXHGCmVwk
         3EtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786755446; x=1787360246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xDLvVTv77VbLvLIlBHyGFXLEvMF7Z3UgTz+IRfS7NEw=;
        b=AWt+aUvkl175g+bNa3y0ijeyqYLqq8e8Ny3iV+LJQmW+7Cxex6hgYIm1ezgOqf+4Dh
         +6GUXJ/3VLx4fJjvutNDtA2qqc+ONSkJfaIfnrJUif7lPB43sHVYyeAC1fzL5q2RM+cP
         7Uixzf93W57yq5b1DSNW4LZLJgXIumsmh3nFrsCzGuMv/iTDFDCdfbOkJT1DNmikcJkc
         LZ3XArJP2myeu1GMmrlnLdB824vzV8Ao/4dhvwbfEGPC25OFy0W5Ri+Z7HcULt5JTa1l
         RP5AsRjaYKb541XMIkdzcwZnDuAHXXIfcRqGlS/aQ3jPo2yUJ8vc9nibcsNpFZxSOfqc
         NgyA==
X-Gm-Message-State: AOJu0YxvUEM+/rn9qNI+0w4W9V4Li541FHOEARrMOGPSwVG21tDbEc6w
	+WP4AI8IfeLTVx5emVO78Zu5vG/SPYFiNr4YRm/SnuYgIuOzdg82alE70q1+zfVwjkU=
X-Gm-Gg: AR+sD12XuaZrTJv6XqGMvSsTEBIzQVMhRifxbFFrkdL/RlGj30Cd8+AWpuX4p6Z+v23
	DYD8Nylw8K4MOuf/lE+Dkj8ForsyoqtFuYd+sdjHTvtyd6bhmNJ/WISWfeMo8qDKjU5kALdrO/w
	lz37aTMvOcYAEilkkeg+DiE+5L2uTn8ZAKrDZMplIP9w91hGl0a/Q+IxqoMy8og/+e5efheRTUJ
	rDndyz2eh3KNeMTMxwuRWUijh1CPoyIXe0yhJ+n9OFOD8Rho+fZqyA1FiT34o5SMu+MfI3vn5wK
	Z5K36AcyuKA6o41OnP9C3p1n8vrB4v4Rd3BzHmtmes+Q6IkafTgWF2+lZip+0bTDe/0ELgYpRl7
	zH7LLPkuNGQF5aVLZ6qodXsdUnFRfDpwDql+FSB7sOLW7X9vwQTK5z5fajNffxcFRyQoNsPUfdO
	KzR4SfZUjP1QSiJazm5fZ3ezZKqsq/yo/IxHii9KpEOuPBaVZa4hc2FotKgZdtJTcuNcp1flR4y
	zFdWEkWEA==
X-Received: by 2002:a17:90b:134c:b0:38d:ef48:b04 with SMTP id 98e67ed59e1d1-3933b8721a1mr10924586a91.10.1786755445942;
        Fri, 14 Aug 2026 17:57:25 -0700 (PDT)
Received: from jrx1.tailbfbe03.ts.net ([2603:8000:8e00:53bb:8213:16ff:feeb:336d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d61e1cccsm8160893eec.8.2026.08.14.17.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 17:57:25 -0700 (PDT)
From: Jacob Riff <jacob@riff.dk>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Huang Wei <huangwei@kylinos.cn>,
	Jacob Riff <jacob@riff.dk>
Subject: [RFC PATCH] usb: typec: ucsi: retry init when the PPM answers early commands incorrectly
Date: Fri, 14 Aug 2026 17:57:24 -0700
Message-ID: <20260815005724.8741-1-jacob@riff.dk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CAAw_mu=c96SYR2QGtoE=EoVRu+iGDo7x=vDjDYP4nc2yfkMnvw@mail.gmail.com>
References: <CAAw_mu=c96SYR2QGtoE=EoVRu+iGDo7x=vDjDYP4nc2yfkMnvw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On some platforms the PPM is not ready to answer commands correctly
for a short window during boot. On the Lenovo ThinkPad X1 Carbon
Gen 14 (21V7, tested on BIOS 1.12 and 1.14) roughly half of all boots
fail ucsi_init() with either -ENODEV (GET_CAPABILITY completes but
reports zero connectors) or -EINVAL (a standard command is rejected,
logged as "possible UCSI driver bug"). The failure is not a timeout:
increasing the sync command completion wait does not change the rate.

Since ucsi_init_work() only requeues on -EPROBE_DEFER, a single bad
answer during that window leaves UCSI dead for the whole session, so
Type-C events are never handled again; most visibly, the machine
silently never resumes charging after the charger is replugged.
Manually reloading ucsi_acpi a few seconds later has succeeded on
every attempt observed, which suggests simply retrying is enough.

Retry -ENODEV and -EINVAL the same way as the role switch wait, log
the retries at debug level, keep the loud report for the case where
the retries are exhausted, and note when init only succeeded after
retrying.

Tested on the affected machine: across 8 consecutive boots with this
patch, 5 hit the failure (matching the historical ~50-60% rate) and
all 5 recovered on the first retry ("PPM init succeeded after 2
attempts"). 0 of 8 boots ended with UCSI unusable, where ~5 of 8
would have without the patch.

Signed-off-by: Jacob Riff <jacob@riff.dk>
---
This is the failure previously reported in the thread
"ucsi_acpi: intermittent PPM init failed at boot is never retried"
and reproduces on the latest firmware for the machine. Happy to test
alternative approaches on this hardware.

--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -2211,18 +2211,36 @@
 	int ret;
 
 	ret = ucsi_init(ucsi);
-	if (ret)
-		dev_err_probe(ucsi->dev, ret, "PPM init failed\n");
+	if (!ret) {
+		if (ucsi->work_count)
+			dev_info(ucsi->dev,
+				 "PPM init succeeded after %u attempts\n",
+				 ucsi->work_count + 1);
+		return;
+	}
 
-	if (ret == -EPROBE_DEFER) {
-		if (ucsi->work_count++ > UCSI_ROLE_SWITCH_WAIT_COUNT) {
-			dev_err(ucsi->dev, "PPM init failed, stop trying\n");
+	/*
+	 * On some platforms the PPM is not ready to answer commands
+	 * correctly for a short window during boot: standard commands are
+	 * rejected or GET_CAPABILITY reports zero connectors, seen as
+	 * -EINVAL or -ENODEV from ucsi_init(), and a retry moments later
+	 * succeeds (observed on Lenovo ThinkPad X1 Carbon Gen 14, where
+	 * this affects roughly half of all boots). Retry those like the
+	 * USB role switch wait instead of giving up on the first attempt.
+	 */
+	if (ret == -EPROBE_DEFER || ret == -ENODEV || ret == -EINVAL) {
+		if (ucsi->work_count++ < UCSI_ROLE_SWITCH_WAIT_COUNT) {
+			dev_dbg(ucsi->dev, "PPM init failed (%pe), retrying\n",
+				ERR_PTR(ret));
+			queue_delayed_work(system_dfl_long_wq, &ucsi->work,
+					   UCSI_ROLE_SWITCH_INTERVAL);
 			return;
 		}
-
-		queue_delayed_work(system_dfl_long_wq, &ucsi->work,
-				   UCSI_ROLE_SWITCH_INTERVAL);
+		dev_err(ucsi->dev, "PPM init failed, stop trying\n");
+		return;
 	}
+
+	dev_err_probe(ucsi->dev, ret, "PPM init failed\n");
 }
 
 /**
