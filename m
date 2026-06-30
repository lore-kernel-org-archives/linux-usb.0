Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A1A322B7B
	for <linux-usb@vger.kernel.org>; Tue, 30 Jun 2026 21:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782854336; cv=none; b=YLmIUdW0Rkybb7pjA4DkjNlC7ck2Taa2yC6BROS3WTUhrQHEewT9Z86u7MgWPN74P9U0lFdZ87hSQhPyhvNNGcgEynAI9kaNE7ezLXHBvSKjcKXlKTHTAt9qsCegbEjr0Wigfdi3zFKiwRnQvX9yz585T9lVZ72B53rNZf/LzFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782854336; c=relaxed/simple;
	bh=DshD1xcus9VBsfM6T66t/GzdDGQc3tUVa5lbo0BqehY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XtKi+95JhFYdbnTu+DzWh1OMa0+6tjfQ7Cc5Iyx1xwTtgUJyo2+oXPC3Ypl3c0wIdfxRiOCZjMzjsDhf2Hsknx6fgSHpOALfPmXzMFL0ishNy2QWJtUvFz7Aj/8maQ3PGSRZQJTQcafrsu7dfhTnroKwwoFlfpBUU20ew/u43bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ieyX/ZCc; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ieyX/ZCc"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7fe36f1be74so58120527b3.2
        for <linux-usb@vger.kernel.org>; Tue, 30 Jun 2026 14:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782854334; x=1783459134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P55DR2iwBeqXLU63WwWlW1zNXbu/+RdUBxWvsdNCu8w=;
        b=ieyX/ZCcUeNE+5bltBJ6gjY9hnhcfDfBXZ4s4sWBw5q741ANcrWT4Q1ftfjkK41SKh
         gqyJjJO3vHWc8hsJ9giNKnhyL32/ht0n7N9fpEA5DHEY4JSLMUod/5HwVv/EFZfAEG9R
         xjMdyapPa9Okp1cFewi0hMVI1I85TnWvm9qaUpVYN3GZGD+eKg8VJ3DqU2ORXz+Xz7hn
         ufPZCCocZPHzGNWgGZOsiOUrg9tlNDzapsnP9ku6n/ER2hvdYFdxZZ5xv3gfguctRIpO
         on7jSfqqmjq49oZCnTFSuCkUv1zeoOpz6SoIUWdrN2jUTbIM2Guqw+sXCD7tUBsSJki+
         7wFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782854334; x=1783459134;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P55DR2iwBeqXLU63WwWlW1zNXbu/+RdUBxWvsdNCu8w=;
        b=dwuby71pnxJ1klvmqyTqunSBqN3r0klnPrn5xJm2nlnrbq2v0wPXosyIJZYGLaK4zh
         Hsb9XcH6g3aCqfFp6YQqHyxTCKQnmpMMnwgnTse5tFYlgR60U0gxBRdPJYAsLScwG0pk
         IHc+rq+PRYFauGyxmMyagunWWmJT5rEbbdbY6CUU7WJwz1ihKKiJPKogPygHB6DOdmxc
         g7m/IHM3P2IRQJuf7O9JLHOn4Pn7y1KvwyIIfhDsiUcBlSEwIQDKeNx6FgEPFycHjTAk
         rER4oAuV9ZhLlpnyr0+/CQdyfZPsHcDB1UWwGH8ZT4elJML0c7gOju6m0WiPWrlhZquB
         llvw==
X-Gm-Message-State: AOJu0Yxh2gIeOCmrM5cDPGzHUTlmrzJyj8JDtDkBHiqt+m3T0Pt4+HwR
	fIRD9NDgwoPvqSCg+5CTUB1yfj+9WYwRe7VDGyZu/JBAn94y8eJKgQet
X-Gm-Gg: AfdE7cm/PsyBhv1m+PzmAzUu77Z4TQbUCm7YboXrUlXVtcqksjU2ez5gdg7ffV9pQK/
	ympm6SnDVWeQPmjTWskHf1O/7M8e+J5ihuEAjjkfi2F7PlNMDAn1kz7aqziS6CC65N83YiSNRWG
	uJ05PMY2YckqLAHViPe7Hns+yI3ZCYWrq3wrF3Wrl5fYvLX6Mcy/wIDZO6ldBOY5VZ6uLvJqdtY
	r3DTHo3ePhXwdF1qVMcHIz21LIEWGKTI+gkQ4JbplVmhR+AytkIciLajAuzRlyT18KjbY3IvkpA
	2S6oLmx7ed++uYAPR+plvIIQgAoGXn1nwq+GoV1HqiIHKZTW5rByewOE/0VB1Dgn7VDgw58ud9/
	7bw2UTge5ss6ocTdDQ4+CDS1kT3aSRrF2RhWLe5wQ7GFx7Cz4OU1nt8lEKK99OiHV8uJi4wEEX4
	0Gl+OqNO5VPfA/uxQoq/Ug0u1Jtg==
X-Received: by 2002:a05:690c:6905:b0:80c:76fd:f74c with SMTP id 00721157ae682-810d8ce9c56mr57247127b3.22.1782854333639;
        Tue, 30 Jun 2026 14:18:53 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8128ce56ecasm33737b3.31.2026.06.30.14.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 14:18:53 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-usb@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH] HID: hiddev: set report-init policy before device registration
Date: Tue, 30 Jun 2026 23:18:45 +0200
Message-ID: <20260630211845.50511-1-alhouseenyousef@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

usb_register_dev() publishes the hiddev character device before
hiddev_connect() initializes the report policy. A process that opens the
new node immediately can issue a usage ioctl while initialized is still
false and trigger usbhid_init_reports(), bypassing
HID_QUIRK_NO_INIT_REPORTS.

Set initialized before registering the character device so every opener
observes the quirk-selected policy.

Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
 drivers/hid/usbhid/hiddev.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/usbhid/hiddev.c b/drivers/hid/usbhid/hiddev.c
index 6378801b22c6..c822e7dee8b7 100644
--- a/drivers/hid/usbhid/hiddev.c
+++ b/drivers/hid/usbhid/hiddev.c
@@ -900,6 +900,8 @@ int hiddev_connect(struct hid_device *hid, unsigned int force)
 	hid->hiddev = hiddev;
 	hiddev->hid = hid;
 	hiddev->exist = 1;
+	/* Honor NO_INIT_REPORTS before the character device becomes visible. */
+	hiddev->initialized = hid->quirks & HID_QUIRK_NO_INIT_REPORTS;
 	retval = usb_register_dev(usbhid->intf, &hiddev_class);
 	if (retval) {
 		hid_err(hid, "Not able to get a minor for this device\n");
@@ -908,12 +910,6 @@ int hiddev_connect(struct hid_device *hid, unsigned int force)
 		return retval;
 	}
 
-	/*
-	 * If HID_QUIRK_NO_INIT_REPORTS is set, make sure we don't initialize
-	 * the reports.
-	 */
-	hiddev->initialized = hid->quirks & HID_QUIRK_NO_INIT_REPORTS;
-
 	hiddev->minor = usbhid->intf->minor;
 
 	return 0;
-- 
2.55.0

