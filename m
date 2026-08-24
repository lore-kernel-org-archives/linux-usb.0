Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23892222D0
	for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 17:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787592944; cv=none; b=AbT6+CrtJFIkHTxXMUpzMEftB94NIL0tCzGYgpBA75U62SAlDTCMOfF9DC6h3Tm5I3uJl/t9gB3GdZMx02xh78CiD1AQdXCKm2YhnYdrlvHsBXAD7ZynOJ4mkuWWffgJVdoG88W0aZ1CTSMqJOJChNnNaGCLH5miGmWe9kjHE/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787592944; c=relaxed/simple;
	bh=Nw0DRedBYzolQ7WXd/SeuzHQmuqN21p0vRotfK3j6Ag=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ji4KRRBLwolQdiNSLrmztcSKxS3WwEq7CGrweXPqB8YYoDzbJ2IRgl+WBdn/MByyRIxcYeM9tOJFn4L2uYg8mqeJgcuB00Keo/epcfrtGq4PfBeExo8FngjbH3MrEGY24c2X0H3JoFvce7OKUM9UYMQt/ZhZQtBNpvwFpxlWD1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riff.dk; spf=none smtp.mailfrom=riff.dk; dkim=pass (2048-bit key) header.d=riff-dk.20251104.gappssmtp.com header.i=@riff-dk.20251104.gappssmtp.com header.b=Q0p4629j; arc=none smtp.client-ip=209.85.215.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riff.dk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=riff.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riff-dk.20251104.gappssmtp.com header.i=@riff-dk.20251104.gappssmtp.com header.b="Q0p4629j"
Received: by mail-pg1-f194.google.com with SMTP id 41be03b00d2f7-ca80d708489so129915a12.1
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 10:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riff-dk.20251104.gappssmtp.com; s=20251104; t=1787592939; x=1788197739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UAEjNZe/XuL6CzRDuKZSmqtfFizitJQ3K/rinr4JC6s=;
        b=Q0p4629jVSwZj5kIOeBtapb52h+LKCsxnJ4bfQgsvx1b/Hck2bETmFHp5EXpcnrtbi
         6qGju91ml/Sn3F+/eAQmecnLtbmXev7MvZ1yNwjMNtZfrS3TaMdYkLzUdYhl5YmNrOMz
         +nQGfMtb1rpZoP9D7MLMXnD0c/SI5WczhtEkHypLqK7qQxZ8QXSIQ3HnnnY7PgF/mpPq
         k+ee+5lVv/+joD4SiCigHu7n3NPX8WR0kOPsAbofrEXOEklxN9Ihauc37yUsKc+IROf3
         nEJKNndzRyw4mICDAk14tY86Zl3UB92i59R1SWlOd65i1kaiHPU9M54uvo4QQsdby6Ry
         2eMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787592939; x=1788197739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UAEjNZe/XuL6CzRDuKZSmqtfFizitJQ3K/rinr4JC6s=;
        b=feBAqVZ/loMMrNihkrndN5tayY4AlSPbw079IqALzKgn+NUh5pQl5Qz5NLMYjFnHQC
         UKbVEhiXw8v18nk9hZ2YT8ysnP1+uQKDfPDJBRrMgHHPZWfvicgheUCnsXPZ2qKgf1tF
         dgL6ZGAi1u2pmwjwJAXYxLIzteiSwATSQy+aOl5B2z9PRMQw4ArB775VTNqoj0p5C0ah
         UiGvKlBT0zAkDnxqBJjnAateJ9Q7OHVPoQgpdVLtEKlU8VHGlnznbRLQpiA4QqWAHldY
         cxZmrorTOPmC5I3x2SBavsgl9sC0MYfG8T4pM3V0/N7HZbUTsBHIs4k86HLVyeuYeMsn
         deZQ==
X-Gm-Message-State: AFuF++nh4xdnBx9n71A7pKXAvgOCRJLx37NuKlf32xabgv3XnxxhA1Uz
	AgnveQJBB49jP/hp7x7Jkrw1Zo9RafAoRjSfuThYXMitlmsShQPoFK3ErLCrtqJywuH75ti1dTy
	z8yEfbvQFZ+l5
X-Gm-Gg: AR+sD12xEe/HolfPDGQ9QntxvKoMFsbxPunWkuw7DkT9NEV9VEmk98lU1TsYvQyh66o
	6o7olXS/HAcj1Nd3xmHykNNi+mdpNYuQ1oVJUNqeMJ08vB4hYGO+lO0Vwq2Vk8O2UCthJ8IPFjy
	ADGjEf3Rd2VWrb3cqTVkOFRzWUWfeEouvD4iwmPWniLj+HPO2PYIZDAHgl53/y4UVFgYmGhHyCX
	T1nyVps0JFUHLPFsh4mnTWNzfyw89BI498KtOHjTXLXumb3YUnXSFBjZGqfX+V8LXLLMD6RbxCl
	juzJYj25euucjrasobRbXB6K+l3iV0LhnF95t4fdZASe2RkqriwQ7j8GDg+/kTI2+U1avbKIWdN
	MvFToJZvLmKhfYVoApb2hk9RBmIPsKy2rSoG6QV0AFKHAuxyShI7i7TNHVX25bwmQST82gvovGh
	lXMQ3FzcMWu9Uw6uDUwUmNBkCs6L6ykeWGaiYQ7ruJVimSLyyazSWLcJriOk8/HUtYmyLkPPI=
X-Received: by 2002:a17:90b:2e0f:b0:37e:1620:dabc with SMTP id 98e67ed59e1d1-3964543b889mr1183666a91.0.1787592938925;
        Mon, 24 Aug 2026 10:35:38 -0700 (PDT)
Received: from jrx1.tailbfbe03.ts.net ([2603:8000:8e00:53bb:97c9:95f6:460d:335])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d36f9sm41328033eec.16.2026.08.24.10.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 10:35:38 -0700 (PDT)
From: Jacob Riff <jacob@riff.dk>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Huang Wei <huangwei@kylinos.cn>
Subject: [PATCH v2] usb: typec: ucsi: retry init when the PPM answers early commands incorrectly
Date: Mon, 24 Aug 2026 10:35:36 -0700
Message-ID: <20260824173536.2395830-1-jacob@riff.dk>
X-Mailer: git-send-email 2.55.0
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
v2: no functional change; resent without the RFC tag.
  - Rebased on usb-next; applies unchanged.
  - Discussion on v1: Huang Wei asked whether the -EINVAL retry should
    distinguish a not-ready PPM from a genuine driver bug, since
    ucsi_read_error() maps UCSI_ERROR_INVALID_CON_NUM /
    UNREGONIZED_CMD / INVALID_CMD_ARGUMENT to -EINVAL. The two cases
    are indistinguishable by error code here, so the patch relies on
    context and persistence instead: the retry exists only in the
    ucsi_init_work() path, it is bounded, and the dev_err() in
    ucsi_read_error() is untouched and still fires on the first
    occurrence. No code change resulted.

v1: https://lore.kernel.org/linux-usb/20260815005724.8741-1-jacob@riff.dk/

--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -2212,18 +2212,36 @@
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

base-commit: e1e6e541c5c9cf548e9fdc35fc26808c82074440
