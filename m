Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5385A31064B
	for <linux-usb@vger.kernel.org>; Sun, 26 Jul 2026 06:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785047113; cv=none; b=n92ci6woQN7B18qfBsYqPZbba92q/KNLaZ2BMyLVbNW5CF1mBdD4aH8So95Qhtgs4bV70qUeNH/29A7QOX5CZu6JvO7f6t53iDVt0QVCMZ7RfpFArqwJlZi2CtiLiWHLKcepndrMd+ENbsIFohI5YwCF28D5jVaOtEtc40a3ukA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785047113; c=relaxed/simple;
	bh=9KIBvI9e9BJH7kOPdDUXmd8ePdl1sXg9lviGVkexrbE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tC1bKL0KOb3iIa0KrPGjWrDS9Pb3pn/5iNa2eX0pYnhmk+KWvmO7SIQzxYT0X7s3cEFxK7dNsDaHqCDkJYwgZqqsT6t5v1EsLGjiNonw/Je/hGwjkSTfNkYz5z4IdvExxlwkXkPMaJs5BL8G9xpvQF8obta+vnAjKd++odlr/xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xbow.com; spf=pass smtp.mailfrom=xbow.com; dkim=pass (2048-bit key) header.d=xbow.com header.i=@xbow.com header.b=NFtZFDVd; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xbow.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xbow.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xbow.com header.i=@xbow.com header.b="NFtZFDVd"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so1203223a91.2
        for <linux-usb@vger.kernel.org>; Sat, 25 Jul 2026 23:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xbow.com; s=google; t=1785047111; x=1785651911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mCbkuQVGzcCFhRBKkTVpatHenyH8ahAXgWyxZhPWtms=;
        b=NFtZFDVd9n9v8PL95VIkH0nlvuNp61j/Gf6QMeO+bC2q28gMvqDncD2gy3isfPFLIh
         4XkBhJMpT0AAj5dPKADMdBcwG03w4jkDLMWsLqfjaDWgMmPAGRel5365vxNhNyWBCa/M
         7VJF5LsL51lb2EQOJiIjVF+j2+ESWk5WV9ElQMz/wZv1IpmTte+Z4VNKtANCdwEf5DJF
         L8Oxn5KvtGaVmC4CW0+ZFgk0RDNlkAa1o7mZZ5OPRANjwJ4jInxOj9rpPCSTqTkl13rH
         LuOmCh1WZJAwWDccMvj0186cufbrzSIvybaqKwwNt/VAp7tmI+YFNxkXmKl5XMbiiLxC
         nuKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785047111; x=1785651911;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mCbkuQVGzcCFhRBKkTVpatHenyH8ahAXgWyxZhPWtms=;
        b=HYXFMYjIs1BocbO5kXuF4XxXARbUVYi9Uw5A8ZWYtYyzGtBRpXpfmIbl4ySelzoFPV
         FK+nt6j7xiXRtpp83YlgwXClZA4nH8353FyykZK/0dSeJBqnf90pxVlM6hFy8INhirCb
         qcp03zhd3lGa6nTQOH9zhvgZZlzR1QSxz6bXhrGDgUg3rwhj0eVWPYtwfKcAa4c+O/6G
         SveS/0v68ccYPHdg312NO/tISGbzkRhZEKkAyo1sKplFULVRoKo7VXB+XCqM1LEg2vdl
         YO2nBnp7okOTJkgRWTJJe1LyeGKXT58KX07aVhAOU4lJFNGugvF7WLnwhsUsJYjBZLrR
         4waw==
X-Forwarded-Encrypted: i=1; AHgh+Rrk6cZyUMh7d+oxOLwyxcSLr9jgjRaxu02O/pG9HdqCIBWXIBpFETq15OUipzWPlFYnsXX5GC+C+MM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxndniSAXxFa/RcO1IoLLUFyRLFyPabVLmIIgEeCvilZxp+AaS
	d3m9HSRd1LUIKZ54e9rJKVn74j/zKTeN/UvTI0zaJtE6tf2S5UV2Le0nh7p7Q61+Sg4=
X-Gm-Gg: AR+sD12YAxhZX2yt738RWg2hhmbJjB8vswqBgAyt+PnJs96EdWbdEW/Lm6Ox9JOHpYQ
	DWA78+NTNRofJkfVQM6/RZRcRq1t9hulMSetb1CySl9ILb4Y516ZEBSjxt3PoSFMTE9EOYsounZ
	AkXpTH/1Mlh3RJeSYdbglchDjRV+9KJEXTZ90pjtxGZl7VxoO6AyZE6cInD57whqmU6kV7wLtfL
	FHFSVn6dRJm2LPXryuNOO2TxsOaMpJ6XmwxRgNN9IbuKscc/zWNv46kueAsshPigMJ8Q2TjHR8s
	2MsDvM9+hjj2juYUltT3+o53FTpKnXEewRDw3Ic/5TFnewMZ7ogWqRoP4fALI6IZTYSRegW4rL8
	RswoZRXijPWXM8YwjlAYNEJzH5Kh5qqwxBFZLUfwWhWFhx1mag6inK2aMLfzkdoCLa9iMIsXYq5
	RvZt6ca2GvIY+a3anwyN/SUiYa+hpbl3BoD4cWfHX3VK6y1g7qmn1UGUpEp5As
X-Received: by 2002:a17:90b:1a8b:b0:380:21b7:e727 with SMTP id 98e67ed59e1d1-38f294e9658mr4439487a91.14.1785047111496;
        Sat, 25 Jul 2026 23:25:11 -0700 (PDT)
Received: from localhost.localdomain ([125.128.148.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03adb20esm3467229a91.3.2026.07.25.23.25.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 25 Jul 2026 23:25:10 -0700 (PDT)
From: Baul Lee <baul.lee@xbow.com>
To: linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: tomasz.pakula.oficjalny@gmail.com,
	oleg@makarenk.ooo,
	jikos@kernel.org,
	bentiss@kernel.org,
	federico.kirschbaum@xbow.com,
	Baul Lee <baul.lee@xbow.com>,
	stable@vger.kernel.org
Subject: [PATCH] HID: pidff: fix OOB write when hid->inputs is empty
Date: Sun, 26 Jul 2026 15:25:03 +0900
Message-ID: <20260726062503.43717-1-baul.lee@xbow.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hid_pidff_init_with_quirks() derives its input_dev from

	list_entry(hid->inputs.next, struct hid_input, list)

without first checking that hid->inputs is non-empty.  The list member
of struct hid_input is at offset 0, so on an empty list list_entry()
yields &hid->inputs itself and the following hidinput->input load reads
an unrelated member of struct hid_device.  dev is then a type-confused
pointer, and force-feedback init writes through it: each
set_bit(FF_*, dev->ffbit) stores 8 bytes at dev + 192, past the end of
the object dev actually aliases, and input_ff_create() adds further
writes of a heap pointer and two function pointers.

Until hid-universal-pidff the only caller was hid_pidff_init() from
usbhid, which runs under HID_CLAIMED_INPUT and therefore always has at
least one hid_input.  universal_pidff_probe() starts the device with
HID_CONNECT_DEFAULT & ~HID_CONNECT_FF and then calls
hid_pidff_init_with_quirks() directly whenever the descriptor carries a
PID usage page, bypassing that gate.  A report descriptor whose only
application collection is on HID_UP_PID leaves hid->inputs empty while
hid_connect() still succeeds through the hidraw claim, so probe reaches
the unguarded list_entry().

The write happens in the USB probe path, on the hotplug workqueue, so
plugging in a malicious device is enough to trigger it; no attacker
software and no logged-in user are required.  KASAN reports an 8-byte
out-of-bounds write in hid_pidff_init_with_quirks() reached from
universal_pidff_probe().

Check for an empty list before deriving dev and return -ENODEV, as the
other HID force-feedback drivers already do.  universal_pidff_probe()
propagates the error and unwinds.

Discovered by XBOW, triaged by Baul Lee <baul.lee@xbow.com>

Fixes: f06bf8d94fff ("HID: Add hid-universal-pidff driver and supported device ids")
Reported-by: Federico Kirschbaum <federico.kirschbaum@xbow.com>
Reported-by: Baul Lee <baul.lee@xbow.com>
Cc: stable@vger.kernel.org
Signed-off-by: Baul Lee <baul.lee@xbow.com>
---
 drivers/hid/usbhid/hid-pidff.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 5f4395f7c645..22951b7ecd17 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -1539,13 +1539,20 @@ static int pidff_check_autocenter(struct pidff_device *pidff,
 int hid_pidff_init_with_quirks(struct hid_device *hid, u32 initial_quirks)
 {
 	struct pidff_device *pidff;
-	struct hid_input *hidinput =
-		list_entry(hid->inputs.next, struct hid_input, list);
-	struct input_dev *dev = hidinput->input;
+	struct hid_input *hidinput;
+	struct input_dev *dev;
 	struct ff_device *ff;
 	int max_effects;
 	int error;
 
+	if (list_empty(&hid->inputs)) {
+		hid_err(hid, "no inputs found\n");
+		return -ENODEV;
+	}
+
+	hidinput = list_first_entry(&hid->inputs, struct hid_input, list);
+	dev = hidinput->input;
+
 	hid_dbg(hid, "starting pid init\n");
 
 	if (list_empty(&hid->report_enum[HID_OUTPUT_REPORT].report_list)) {
-- 
2.50.1 (Apple Git-155)

