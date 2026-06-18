Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7403EEAC2
	for <linux-usb@vger.kernel.org>; Thu, 18 Jun 2026 10:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781779603; cv=none; b=sTLCJRaTHfqWccU+rMfSYSMvyS39okBp9+9EcRATmUBPFdX1ipJ0GBHCeZNXYYTqVvJi06xU5HRGKcA+UGTTYpWTlfI537Ep3nyrmYgCJexS+o3iVDXRt2bmiMWxXlm7b0spg/CJnHGRr3erhG1sCdh9qqyLZnsBrNW+4vBu6I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781779603; c=relaxed/simple;
	bh=Ghj47it56rTGliAjOb39kwvDwxEuirBwNhZJr4HXjnY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bAHy6bN+boNzLdbZq5IqUeUwfX0GWkYxKCQjBon9ryAMEvdr59lw++DoZA+3SAVWIZc0ki8TjgUjQoIOCNYY7qSupxcNxovJQdROggA7Gbm1hVHpljt1fw17Tf6d3itphqTZgdv6+LWX+Fd0lB0b8EWdb8OsrhuqzUZCHMkLEKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lCnLO+6L; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lCnLO+6L"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c85a297d2d2so581917a12.0
        for <linux-usb@vger.kernel.org>; Thu, 18 Jun 2026 03:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781779599; x=1782384399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ov8oT9CR8+rUw2WWELI6NS00pAxh4046pPVTwZYrfaY=;
        b=lCnLO+6LVJRw4gEBucymOn+zd+Z+bs6oxxLB7BYDg7kyQ3R0FLolAdU1+LUuA/RwsF
         KbFGD6SumTMU7ANTwuWor3h6uObx2I86kAy8O3xLarPN81Z0OBzPbSjZsR3S+LYhOGSp
         PILnSzhFrDp+FmamzIIg8hSWELvE9GTrnIq3OG9464WZfw9m9OiDXulVMu8p0SzMlonJ
         2/C1hXrArI/GMFWcmh41KY3/eu4lcGAqf6Ok8lC50YBWLGaOEkRKueDG7kaWMmL707nZ
         3kpMZ7/n8M4oQtQupj8VwiVfDp0msEsFqSPnfZIbMOJei9WpQ3n8YPXe7eryDpXF8gLb
         3QJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781779599; x=1782384399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ov8oT9CR8+rUw2WWELI6NS00pAxh4046pPVTwZYrfaY=;
        b=rMpqJapelpms7eKPHB6UU2W6A/GncgZb2otFvz1K1Dpd1jB9TBEAahxVDzxykJm1XG
         G+zqx+4FJdkjz19YjrPjnaC6jLcBW4P93GJgR8P0Xpa1/OCfAm5avCI+wd/Wv4B62LzM
         /UG9XXVcRwRdM2VO/GDmLnpxsKKQdvbyxTSDD57agGS914IFNHCnMADqsNivItSzkkMR
         s+Lx+G36cwyECUGRCPbRxJLeq5xYjSiozuzK9yyICZ70+MAu5+RNOthaC2am8UG3BFC0
         5c3rVJAg3Ia/kLS4Ug7RF9OJMkGg0W4kANmXLEEzVILb6Ww0frVWA2s2QjDGSS31a48/
         im3w==
X-Gm-Message-State: AOJu0Yzk/YbWHmyA6ztmJiqf3VYpLyEwo4LXxm8aKhM1P7iPF5KMBEic
	AlnelvxPYXiCv6r/qDolxX1AVTaquhK28iB+zw7FhedcE9uKdE5CRoZV
X-Gm-Gg: AfdE7cmU2sRfW0GvoNuqNBmRLJQTNhVAydQ8+T1dp+b/Har6l8yBHZ7nrn4rmwTWTbu
	T5KW07BgxwtzuoQzel48fDN8+pwoWTU07s3Iec2FbL6Wf8XaR6keDSHnZq4hiBURX/iCkhB+xKf
	VzJ6pDBrat/8xsvURvXgVgDlwmoCDZxHE7bvNBPFGAObBdbBOBwLbglMSvxuyNl+zI9CnrOTW/r
	t++1iWcuAEYK105ndQOvUfxRuPyJfvaDtaWVQmaESimsSgp23cZnnGTPttOCmjOhuVA16bl56WT
	34NYPB5sQSUToLDhY9A8xPPdZfTirS9ER9jV7clvsVCOL7HvgxLiAXNR70LXuDvdIreZJ7IaLOK
	R+Y3ikbwnljcA0GQDkNclI5wzFVpexw4A23YNgdQg7J5mT7szIdqPAcROnkaR4SPCL/ZOn7VzDb
	e9Tn2Mq2A=
X-Received: by 2002:a05:6a21:4688:b0:3a2:ebfc:6bee with SMTP id adf61e73a8af0-3b8b80ef09cmr8763169637.41.1781779599528;
        Thu, 18 Jun 2026 03:46:39 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8665186b53sm17135937a12.20.2026.06.18.03.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 03:46:39 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH] usb: misc: usbio: fix disconnect UAF in client teardown
Date: Thu, 18 Jun 2026 18:46:33 +0800
Message-Id: <20260618104633.3405705-1-zzzccc427@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

usbio_disconnect() walks usbio->cli_list in reverse while each
auxiliary_device_uninit() can drop the last device reference and run
usbio_auxdev_release(). If that happens, the current struct usbio_client is
freed before list_for_each_entry_reverse() advances by reading
client->link.prev.

Use list_for_each_entry_safe_reverse() and delete the list node before
uninitializing the auxiliary device. The next cursor is then captured before
the put_device() path can free the current client, and cli_list does not retain
stale nodes during teardown.

Validation reproduced this kernel report:
KASAN slab-use-after-free in usbio_disconnect+0x12e/0x150
Workqueue: usb_hub_wq hub_event
Read of size 8
Call trace:
  dump_stack_lvl+0x66/0xa0
  print_report+0xce/0x630
  usbio_disconnect+0x12e/0x150 (drivers/usb/misc/usbio.c:518)
  srso_alias_return_thunk+0x5/0xfbef5
  __virt_addr_valid+0x188/0x320
  kasan_report+0xe0/0x110
  usb_unbind_interface+0xf3/0x400
  __device_attach_driver+0xf1/0x1a0
  bus_for_each_drv+0xf9/0x160
  trace_hardirqs_on+0x18/0x130
  _raw_spin_unlock_irqrestore+0x44/0x60
  __device_attach+0x133/0x2a0
  do_raw_spin_unlock+0x9a/0x100
  device_add+0x9b9/0xc10
  lockdep_hardirqs_on_prepare+0xea/0x1a0
  usb_enable_lpm+0x3c/0x260
  usb_set_configuration+0xb64/0xf20
  add_device_randomness+0xb7/0xf0
  usb_new_device+0x492/0x870
  hub_event+0x1b10/0x29c0
  lock_acquire+0x187/0x300
  process_one_work+0x475/0xb90 (kernel/workqueue.c:3200)
  lock_release+0xc8/0x290
  process_one_work+0x4d7/0xb90 (kernel/workqueue.c:3200)
  __list_add_valid_or_report+0x37/0xf0
  worker_thread+0x2d8/0x570
  kthread+0x1ad/0x1f0
  ret_from_fork+0x3c9/0x540
  __switch_to+0x2e9/0x730
  ret_from_fork_asm+0x1a/0x30

Fixes: 121a0f839dbb ("usb: misc: Add Intel USBIO bridge driver")
Assisted-by: Codex:gpt-5.5
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 drivers/usb/misc/usbio.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/misc/usbio.c b/drivers/usb/misc/usbio.c
index 02d1e0760f0c..7dc44bbcafd2 100644
--- a/drivers/usb/misc/usbio.c
+++ b/drivers/usb/misc/usbio.c
@@ -518,7 +518,7 @@ static int usbio_resume(struct usb_interface *intf)
 static void usbio_disconnect(struct usb_interface *intf)
 {
 	struct usbio_device *usbio = usb_get_intfdata(intf);
-	struct usbio_client *client;
+	struct usbio_client *client, *next;
 
 	/* Wakeup any clients waiting for a reply */
 	usbio->rxdat_len = 0;
@@ -535,7 +535,8 @@ static void usbio_disconnect(struct usb_interface *intf)
 	usb_kill_urb(usbio->urb);
 	usb_free_urb(usbio->urb);
 
-	list_for_each_entry_reverse(client, &usbio->cli_list, link) {
+	list_for_each_entry_safe_reverse(client, next, &usbio->cli_list, link) {
+		list_del_init(&client->link);
 		auxiliary_device_delete(&client->auxdev);
 		auxiliary_device_uninit(&client->auxdev);
 	}
-- 
2.43.0

