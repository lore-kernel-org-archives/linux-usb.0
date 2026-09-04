Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BE738B7B0
	for <linux-usb@vger.kernel.org>; Fri,  4 Sep 2026 11:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788522294; cv=none; b=BoF8+gEHLpNdBIbEVASD4GmxIHwa36CFiShY7RGYJQpl4MdD3g+Hkg3cBB3uEx4rS866+4cr2IPHjVU3fmXS12FpL1UOSSGKQaOIREwPTI/BWXavAAbnHN3NICG5xLqjII9Z2vFRowxizAvj1h6Nfvho/D9q1qWiNEk5qIagVGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788522294; c=relaxed/simple;
	bh=f0gT9nDAkrtabdRFcfGk0yhy1dGDAIe2OcfnU1Gwj7k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nyi10JyKxawuld5xyn0G/KDbCBtxLlzMp4Ayt+D8Xira70HzMRlh9mu04GqXw6yuETEEaDCopjtkZ/eZAqfH3zQtouKeGIBbA0HUxBiQl5etZwdofAD+Nj7PN8ICrEYCZUfhnFPfB/e2yuK/7pmfQ7XuQRKzO734/IORfWf5//A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eFh6XJZ4; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eFh6XJZ4"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38e58034d05so725405a91.2
        for <linux-usb@vger.kernel.org>; Fri, 04 Sep 2026 04:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788522291; x=1789127091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=06PWMy5fl2kbdYldsZe2uJjhuT9csZqhdJsz7hBsTC8=;
        b=eFh6XJZ41umfw7yYhKyQXetBknesNlupPYGvp1zWgfYf2QdfVYv6OF8Q18+FGdrSAC
         vZjnm6iniQmw6dqhp0Enou5DnnfCwG0ZafHZ9+zBjEgLZqe7PBsKSC6tuBtQWiqsvi2N
         0RT1qkiOz2P/Q9zDlTePHpOJhFTzZYxEvmAnsSoLEw4rIrGz0h5H4aACaAxeVSoE3adm
         ooZOFh4ruL1dFMiUtinRzlCP0pS6IsKli3lt4VDau9zvBYTvll3jp7hECWzAu4XDPT2I
         U+sAYoDSe1L6sSGP9i442t1nQSvlyRJ+TSLaos+zXztJ79/6Qqpjwulw+oBCGUxkosSS
         uTqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788522291; x=1789127091;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=06PWMy5fl2kbdYldsZe2uJjhuT9csZqhdJsz7hBsTC8=;
        b=bpDshMqWFHN5U3i6/2rqC/OoqkPhokcESzy6eWttf9F/NTVYc/JE9g2tRCDfde//l7
         17mAXtcShP7/+Vwf6ticjlr+D4Na4b2aOXtW3NhGJL+dshQ4JenvAmWTVHgmZFkJjs7+
         cYruJpTilwKw/uVx2vFoEEYb4ogC+CXwMxVLd6meQ5Xu12PhGgMUf5syyb09R1m/4+96
         0KVBI5sxXWTV39U2zrOPCny7gd36nR/IduP+wZ/gyTv5dVQi5pzZ8W1QCo8hgkB5BVXc
         Dw214O/pJo0r+VuAfz4hWKuXo+wQdJBYUBJKIpDW8Vc5MC8yeTH0j6Tvin0OARrO1N/w
         L9uA==
X-Forwarded-Encrypted: i=1; AKwUvBxeA8pqQiS9fJj6CBMUr5+rKRK/2+ahJ84Hsc8QmtLFVN3bBO7XbJPQW36vau829VcnQIO8rE30XyU=@vger.kernel.org
X-Gm-Message-State: AFuF++lbdq/ZLyTnevsz8oK4h2Fxfeaifd0v7dG3FlT6mHvps7yjGi6y
	FJNw+ostY+Cun8VbPscGA63Vi7ef3vSNZ4DjWD6dg6cyJa+spkvRN5oC
X-Gm-Gg: AYBFou1K+u5rgMx//3OFD/3WBAefyMRARvdfTaDF+EXcY+bmapPoEfwUaTgOceGGG08
	KPAGgfhnOJfuIZ2BWkTPM8OKk0c6s/Z/xrus79IGlkaiQ9KuRgv8q//7XDxmQNipx04+qXwBW3t
	tVcm46jP1gYRNhUAwhOMspqRsl5FJub34+6JJCBrVqM1GvBROgc7qQWM3zQe3kSPUrRCYGDK2GX
	LtGUQjt8x1y4NqqEWnqy3xyKw87aHyRRzxp5LpmS5Wgq5Kh7NaW8muaifzt9UL7uoTQ8zHF0RWv
	gAdz4IPIHgQHBvkf8UplmhHAX2tlVnttDpwlmWiiSGw0sDtAdZYVSPrViX3rFwLVrOpYeEyqQr0
	xcNaAaFkpCh8Mv5AuQBGPyFOV8bQJQDcUNBu+0PjZPakkLlMHjGJFdVzgzPZ6P284AQKy/flOCW
	1DgMX6eXdijeVkJ5df3P1zOGjuy0JrpU1dmcuZVsVQvA4AGstFaCNSl1zl48Dx3lMlCP46ole0c
	btDZETcInQigSI=
X-Received: by 2002:a17:90b:5606:b0:398:9be6:f997 with SMTP id 98e67ed59e1d1-39b262dfaeamr9192405a91.22.1788522291223;
        Fri, 04 Sep 2026 04:44:51 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bbf1feesm6289702eec.26.2026.09.04.04.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:44:50 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	=?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
	Bastien Nocera <hadess@hadess.net>,
	Stefan Achatz <erazor_de@users.sourceforge.net>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	=?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>,
	Oleg Makarenko <oleg@makarenk.ooo>
Cc: linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH] hid: fix typos in comments
Date: Fri,  4 Sep 2026 17:14:40 +0530
Message-ID: <20260904114444.28585-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/hid/hid-appleir.c                        | 2 +-
 drivers/hid/hid-logitech-dj.c                    | 2 +-
 drivers/hid/hid-logitech-hidpp.c                 | 4 ++--
 drivers/hid/hid-roccat-kone.c                    | 2 +-
 drivers/hid/hid-roccat-kone.h                    | 2 +-
 drivers/hid/hid-speedlink.c                      | 2 +-
 drivers/hid/intel-ish-hid/ishtp-hid-client.c     | 2 +-
 drivers/hid/intel-ish-hid/ishtp/client-buffers.c | 2 +-
 drivers/hid/usbhid/hid-pidff.c                   | 2 +-
 9 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/hid/hid-appleir.c b/drivers/hid/hid-appleir.c
index adaa44a858ed..649ee5d8fe1e 100644
--- a/drivers/hid/hid-appleir.c
+++ b/drivers/hid/hid-appleir.c
@@ -118,7 +118,7 @@ struct appleir {
 static int get_key(int data)
 {
 	/*
-	 * The key is coded accross bits 2..9:
+	 * The key is coded across bits 2..9:
 	 *
 	 * 0x00 or 0x01 (        )	key:  0		-> KEY_RESERVED
 	 * 0x02 or 0x03 (  menu  )	key:  1		-> KEY_MENU
diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
index 1d619d2345e1..51aaee2e29e3 100644
--- a/drivers/hid/hid-logitech-dj.c
+++ b/drivers/hid/hid-logitech-dj.c
@@ -620,7 +620,7 @@ static const char hidpp_descriptor[] = {
  *
  * Right now, RF report types have the same report types (or report id's)
  * than the hid report created from those RF reports. In the future
- * this doesnt have to be true.
+ * this doesn't have to be true.
  *
  * For instance, RF report type 0x01 which has a size of 8 bytes, corresponds
  * to hid report id 0x01, this is standard keyboard. Same thing applies to mice
diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 1504de32b1c8..5273a5a7e7a0 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -110,7 +110,7 @@ MODULE_PARM_DESC(disable_tap_to_click,
  * where as most newer devices use the FAP protocol. Both protocols are
  * compatible with the underlying transport, which could be usb, Unifiying, or
  * bluetooth. The message lengths are defined by the hid vendor specific report
- * descriptor for the HIDPP_SHORT report type (total message lenth 7 bytes) and
+ * descriptor for the HIDPP_SHORT report type (total message length 7 bytes) and
  * the HIDPP_LONG report type (total message length 20 bytes)
  *
  * The RAP protocol uses both report types, whereas the FAP only uses HIDPP_LONG
@@ -3354,7 +3354,7 @@ static int m560_input_mapping(struct hid_device *hdev, struct hid_input *hi,
 /*
  * The Logitech K400 keyboard has an embedded touchpad which is seen
  * as a mouse from the OS point of view. There is a hardware shortcut to disable
- * tap-to-click but the setting is not remembered accross reset, annoying some
+ * tap-to-click but the setting is not remembered across reset, annoying some
  * users.
  *
  * We can toggle this feature from the host by using the feature 0x6010:
diff --git a/drivers/hid/hid-roccat-kone.c b/drivers/hid/hid-roccat-kone.c
index 3dae9eaa0b6f..5b84435cbe8f 100644
--- a/drivers/hid/hid-roccat-kone.c
+++ b/drivers/hid/hid-roccat-kone.c
@@ -842,7 +842,7 @@ static void kone_report_to_chrdev(struct kone_device const *kone,
 
 /*
  * Is called for keyboard- and mousepart.
- * Only mousepart gets informations about special events in its extended event
+ * Only mousepart gets information about special events in its extended event
  * structure.
  */
 static int kone_raw_event(struct hid_device *hdev, struct hid_report *report,
diff --git a/drivers/hid/hid-roccat-kone.h b/drivers/hid/hid-roccat-kone.h
index 65c800e3addc..13de9f14dc1e 100644
--- a/drivers/hid/hid-roccat-kone.h
+++ b/drivers/hid/hid-roccat-kone.h
@@ -165,7 +165,7 @@ enum kone_mouse_events {
 	/* osd events are thought to be display on screen */
 	kone_mouse_event_osd_dpi = 0xa0,
 	kone_mouse_event_osd_profile = 0xb0,
-	/* TODO clarify meaning and occurence of kone_mouse_event_calibration */
+	/* TODO clarify meaning and occurrence of kone_mouse_event_calibration */
 	kone_mouse_event_calibration = 0xc0,
 	kone_mouse_event_call_overlong_macro = 0xe0,
 	kone_mouse_event_multimedia = 0xe1,
diff --git a/drivers/hid/hid-speedlink.c b/drivers/hid/hid-speedlink.c
index 22ee078c42c6..3196bb85ccc2 100644
--- a/drivers/hid/hid-speedlink.c
+++ b/drivers/hid/hid-speedlink.c
@@ -44,7 +44,7 @@ static int speedlink_event(struct hid_device *hdev, struct hid_field *field,
 {
 	/* No other conditions due to usage_table. */
 
-	/* This fixes the "jumpy" cursor occuring due to invalid events sent
+	/* This fixes the "jumpy" cursor occurring due to invalid events sent
 	 * by the device. Some devices only send them with value==+256, others
 	 * don't. However, catching abs(value)>=256 is restrictive enough not
 	 * to interfere with devices that were bug-free (has been tested).
diff --git a/drivers/hid/intel-ish-hid/ishtp-hid-client.c b/drivers/hid/intel-ish-hid/ishtp-hid-client.c
index ec5e8afe77bd..acfe25fd8b23 100644
--- a/drivers/hid/intel-ish-hid/ishtp-hid-client.c
+++ b/drivers/hid/intel-ish-hid/ishtp-hid-client.c
@@ -631,7 +631,7 @@ static int ishtp_get_report_descriptor(struct ishtp_cl *hid_ishtp_cl,
  * @hid_ishtp_cl:	ISHTP client instance
  * @reset:		true if called for init after reset
  *
- * This function complete the initializtion of the client. The summary of
+ * This function complete the initialization of the client. The summary of
  * processing:
  * - Send request to enumerate the hid clients
  *	Get the HID descriptor for each enumearated device
diff --git a/drivers/hid/intel-ish-hid/ishtp/client-buffers.c b/drivers/hid/intel-ish-hid/ishtp/client-buffers.c
index 45ddc9a047bc..6bac76249437 100644
--- a/drivers/hid/intel-ish-hid/ishtp/client-buffers.c
+++ b/drivers/hid/intel-ish-hid/ishtp/client-buffers.c
@@ -177,7 +177,7 @@ void ishtp_io_rb_free(struct ishtp_cl_rb *rb)
  *
  * Allocate and initialize request block
  *
- * Return: Allocted IO request block pointer
+ * Return: Allocated IO request block pointer
  */
 struct ishtp_cl_rb *ishtp_io_rb_init(struct ishtp_cl *cl)
 {
diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 22951b7ecd17..82150a72506b 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -20,7 +20,7 @@
 #define	PID_EFFECTS_MAX		64
 #define	PID_INFINITE		U16_MAX
 
-/* Linux Force Feedback API uses miliseconds as time unit */
+/* Linux Force Feedback API uses milliseconds as time unit */
 #define FF_TIME_EXPONENT	-3
 #define FF_INFINITE		0
 
-- 
2.48.1

