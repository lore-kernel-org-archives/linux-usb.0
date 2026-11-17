Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794883145;
	b=sYGBLQBH7/GtpiK4uLEQWjC6njbG0YeqwkGpMqobCVw+/NjJ7GLKnM6L2khZ+t2rS2dX
	 sJYQTiucWvjSncuafab+/jW1f2TcxG8IRtyiae6h1qvJDHC1iki96YL/C4JmQ7Tyrj6eP
	 EpCgyW2xpi75/0IGOgtW8j5RnCPHft+7gMCEWyiDc9LpeMvxH7Iq+JQJLi2Cwj31lqLMl
	 DJ/CFExfpKdN+rW7K4viSlauCMZkP32ZgpcJB1gHd4cZVCRfN+/LtLvbEhgRmO3euz43Y
	 HHahBJbCjJGWrQZfZeDxHGhX3kZmm+eTorgu3w2CwfZAXpmUdOjErK++AkgJY9OpERQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794883145;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HdCX2eKHFheobxtuMzZjzcGr4wPSCvTHwjJG3rP/J2E=;
	b=3ADmLxFRTLy83uNgtODlTFSk0wlgRz6voDEaF8LzNqoZvSlF52HvQAf9OVrM8z7L0tG1
	 7i6bmWc6L/xj9NYiwpsfm5/ZL5gZVflpNxprC25f1g4EPEOQgSJBnPfaFYGif8rtQvYSJ
	 4cgw7OiUvSI8XtXkDC58mw7HBMdq3Zwm8+AAQ3sqHf1w6wNAbWAe1XhPk1zeaaB6LJNXd
	 /Qi3FPPC7P1BYleLxBAo2GpnsVpyDqx0LlZZXowfcFtNnszKt/vOcxqXdmD2fUz6u5T/+
	 PCXZ+0FiU/+OX4X53CgAUzsJzShE9NBEUp99pkKSVorTDP6EfZuokaQg97AueMu3/CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OD9T7S7h;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7613D606A31C
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 02:39:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7613D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OD9T7S7h
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso5052250eec.0
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 18:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794883144; x=1795487944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HdCX2eKHFheobxtuMzZjzcGr4wPSCvTHwjJG3rP/J2E=;
        b=OD9T7S7hJOK2PPTs4+UDjk213M8qL9EOXcUHEhvQZCjY/aKK5URT0HaA8Wvoo+WdC0
         CuH/7hog0J6sPGsVM9tdLW0IRfA46XlcAT3AkJnLuikmSYcpdOCmMU9OHaTq3OMpS8/R
         /3U+6Zhvm7mdbhV6K4qm7QfKqG7cIUFRq5Ldp+FQzNWXH4TJWlfpVheI7Kel+JoGdirA
         wWqh3sL0ahYu8lHd4sSoj89Lbw1WELTJ2h4HaIt0T6a2tBzD2KGQ41gxf1xDKagdOD0C
         +eYaf6k5VVsX6JcDDzGEPyHBmvar8tdlPlut7O0C3JhSLc155qr0CUVPhbPMaSYwc5Z0
         0agA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794883144; x=1795487944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HdCX2eKHFheobxtuMzZjzcGr4wPSCvTHwjJG3rP/J2E=;
        b=MhzMRvn6MpW2wPSw1shIS9SHhkJgJi8yb4jUs8cQOitdR0Z3YwM1Bt6qQuOB55cAoH
         LWqfY98+vpJ65N3MXgoDgBrPabGE8RQVsRstTMBuSLVEBJpReGh9YHMI5srs9xd4LS9p
         UHk+Kk1M41y5WGn8M2Es7t8MBErzkDkY5UNghmC7NYe16W7/Ss0EIUjaoCnDTlqIyr/y
         2UJecFblJvt4pNHj5ssrWwJGL3PMJdC1dMCY0oMEY6WYNj3NwLJ1MX3iaBZR92hcEYP8
         10nMt74a04IyxXDtPX1eDH73QTnTHYE9wVopUuqXSpXbmIFRCTRmhYlPZqLfaDlWrJ+K
         M/Pg==
X-Forwarded-Encrypted: i=1; AL+hErHNQAA7x1WGyIpULvZjyfGFMKLSAte/0epT4NUB2pDUEESYu97Wqln/2oRLS8yCOljeKrvdrF0W3RY=@vger.kernel.org
X-Gm-Message-State: APuU4Z86OOv5JQc0wor0nQdZ422YS8nFpIv7X2kKojcZ+iJpkIpbo2kb
	0P6bYZSMqGgUsXG7u+QWvGMKl++LisyBy556+LMF17glZn0PSnt9uKEn
X-Gm-Gg: AZFdTZdhNx6CPmRFrjm4Wt+WnkrWNEViKZI2gBioIU7Oqi2uCisXp6kY1hu8XyzkOS7
	P+E3cj8JDXCd9/SurMViwycd1uZlHERqMcfa5SwjgKmAyqtMZedfKVVQTIx/mndNNQMlHrBtBwa
	6h4Cj9WoXfbN7sADlnTePjcLwKinNRPOKQutizKxrF5lv/HEp/cWdMQ9GOcZhCen1s/4uDmAyHv
	MI1DDH8WKVk6VzHvLSoJnml2g9XC+1lFK4ezGn9tldl91FRm4s6v5bHF9acMWMyfBaR6cXlCEHX
	3bSafP0ctXFs8h9kyUMvamQGmG5A1YZ0b6gQLtt+CuJphB3ovJJbiTuSkxS5+3chiVsF8nJujvo
	PIrxIr+TmvTNz3shlK1tqwvSMZlXn9La9pJPag/Zvk4b+7CfJ+7yCh/OvPtY7Ov5EvHsOQxp1jF
	jbQcdBLZUygLl+k99xWFVX+xxdq2YWuKvoV07LOeO+KMLVYgMoXQQ2VNptmeHZVr7smYjYvBiXF
	XbNwaVRtfKKVmQX/NxqDCytAC9ziCZvwKjGDbB4sWpVhfJWIfZoo0BwMLwSdiqxh9nB2RwpC9BP
	YEj9+CdA921NN6y+SKIdPPzVC2ifMZQ4MnPSr03i9/hQo4+M2+08p8yYzg0/L9LhrUBX
X-Received: by 2002:a05:7301:92b:b0:37c:6001:8757 with SMTP id 5a478bee46e88-37c60018931mr6407784eec.4.1794883143534;
        Mon, 16 Nov 2026 18:39:03 -0800 (PST)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0c40sm40651048eec.28.2026.11.16.18.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 18:39:02 -0800 (PST)
From: Cheng Yongkang <teel4res@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] usb: usbfs: reject SETINTERFACE while suspend is allowed
Date: Mon, 16 Nov 2026 18:38:58 -0800
Message-Id: <20261117023858.467683-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <a7e6b6f9-9926-404a-b185-c9fcab5c9d10@rowland.harvard.edu>
References: <20261115163709.226641-1-teel4res@gmail.com> <36240a2c-0ecb-4b26-824d-84d782dc706e@rowland.harvard.edu> <20261116060549.370140-1-teel4res@gmail.com> <a7e6b6f9-9926-404a-b185-c9fcab5c9d10@rowland.harvard.edu>
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

After USBDEVFS_ALLOW_SUSPEND, a usbfs file no longer holds a runtime PM
reference and the device can be runtime suspended. When it is resumed
through reset-resume, finish_port_resume() sets USB_STATE_CONFIGURED
before usb_reset_and_verify_device() restores the altsettings. The
restore loop also runs when a driver bound to another interface calls
usb_reset_device() from its resume handler. The resume path does not
take the device lock, so a SETINTERFACE issued in that window passes
checkintf() and its usb_set_interface() runs concurrently with the
usb_set_interface() calls of the restore loop.

Fail SETINTERFACE with -EHOSTUNREACH while suspend is allowed. A
program has to call USBDEVFS_FORBID_SUSPEND or USBDEVFS_WAIT_FOR_RESUME
first, which resumes the device and keeps it from suspending until the
file allows suspend again.

Fixes: 7794f486ed0b ("usbfs: Add ioctls for runtime power management")
Suggested-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
---
Changes in v2:
- Move the check before copy_from_user() and add a comment (Alan).

v1: https://lore.kernel.org/linux-usb/20261116060549.370140-1-teel4res@gmail.com/

 drivers/usb/core/devio.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
index 101cb9425480..8a032f4b547b 100644
--- a/drivers/usb/core/devio.c
+++ b/drivers/usb/core/devio.c
@@ -1531,6 +1531,13 @@ static int proc_setintf(struct usb_dev_state *ps, void __user *arg)
 	struct usbdevfs_setinterface setintf;
 	int ret;
 
+	/*
+	 * Avoid racing with a reset during device resume, which restores
+	 * the altsettings without holding the device lock. The device can
+	 * only be suspended while suspend is allowed.
+	 */
+	if (ps->suspend_allowed)
+		return -EHOSTUNREACH;
 	if (copy_from_user(&setintf, arg, sizeof(setintf)))
 		return -EFAULT;
 	ret = checkintf(ps, setintf.interface);

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.34.1

