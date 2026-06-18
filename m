Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF29301474
	for <linux-usb@vger.kernel.org>; Thu, 18 Jun 2026 12:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781786438; cv=none; b=RQfmD4Iha1d5rw15oscljLezQAH3mbuwjPx15gDeIOIuF0gL8/24pFJPmO3IlI7YE74sFO7Lv2l1henKiT6a8sgFJGz1DxrBfr098gIsC82l1U4v6QooBJIegg+SOkcSGE6nswJg4rfbU1gLcA/1uwFRULpsVub1oIGyMkkCs60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781786438; c=relaxed/simple;
	bh=26V5SDUbDp8lGf2dtZE0/EVVRB0FC6Q8kCIxc65KvfM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZAvd1f4M7oExs8gJOAbGmptGugk3DUQ3ZHXXgMtL4ZtpLA/ih45ebfVKbbijtDgWuxD2Ycx4BIRj8Z2Yx1SSOOMH90bIu10Klz6LIgfep6nPua+fo0+pc4KJIHaDPwGaaz/MTQ0EWAC8Mgi0V8QJheiqh6zmIAOy+IdHD6CF2D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LiVTzSeu; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LiVTzSeu"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-37ce68a54f8so363787a91.0
        for <linux-usb@vger.kernel.org>; Thu, 18 Jun 2026 05:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781786436; x=1782391236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Em4soZVbEstplz9Ebabbr+wHmpAw7PoPCOmv3WbAhgg=;
        b=LiVTzSeu++DarUmG+kEZbOACnzjhyd2JU9FrE4MK9CjUilwOvcLJJP+2leGdtD4geq
         Njtr4Gso3xE1ujvRxIy3l1JY+zImSzssWQmomjNq5oKxzFzi3/3qDpBinUlfuDwLw+ti
         9lBD27u4Ex69CmyaOIGuKfSVx7+A8K/Psi3gLnxBopYuyFbb2ZzuVRXA3ighK2rdpQKQ
         WSZqSXf30oUHlSa+1yeB3hdQfrKnz5itDuySDloViqYQn7gjmyjtoRqxchyPLgZ1CcqT
         izVxvDstvof+sq7AFoamP4/3F9b7wk28TziVyA1iwWfdnaZ4gJ1l5oswIucqFnPnR43Q
         IGEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781786436; x=1782391236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Em4soZVbEstplz9Ebabbr+wHmpAw7PoPCOmv3WbAhgg=;
        b=dO0DnJPrih0cwNPaOCRxppOfvvi5w5fN4sZakc/TCFOKOiticGLev3AFPMjdW8zpJZ
         KFVEf0h9Zsy9mo4PKr9ZJ5a/FhCuxq8hGl+CXDSG4+yvajQ10ux6dSkC6p0Ot/fywVGQ
         OBvRTLqaT47aSiOt2Ml0eUc6ZX6aIeA579xeICgrHuU00d5FmgCuoP3/PJXzOopxUB28
         JNb2EBksofI0fa9b52+vFQk09IuUn2cAmsRwGcEZ7gwCNiZXuM4F8zSlgJMiOa1W5XdL
         //+2aKghPryYsPRcbW5YH4sxLWvxnyY3Vem9dCLOkUwjftP9X2ZUN/T73MV+B+EFjfM7
         AZGg==
X-Gm-Message-State: AOJu0Yz5hxOSDfZcZ7RiWE1VLKc+f5iHwQDnl/SH7DANxRSnEz04fJhJ
	37ybJhv/WZejj1HflPocSpIDNdgSRH3/Yg/xwwdON3x7jDLpM5nwWfpthcuFLzXawtQ=
X-Gm-Gg: AfdE7clnvWfEt7LS8CDSi9YXlz7mLsKMW8uuJDexnmQF4kTJ2kC/F5Rp9g6rFmQWhA/
	08cRCYrCEPs+n5GmdcOs4nTZxjb3Rf2i0AyPYnynYBa9EXS2uPIYsMOMq2w+mBc4immSyoyo3zK
	BFKoj1id7MoO/3VjkrZFq6RMlQLtU0WY4LzrvteQMAZuUHqUq6jRbw3Je4Mszr9TCcduV57elSi
	kusLl1Fi2R9qeaO7mtsB78Kd2erIijZZY2U67LVIKkLspvuA/qku1Kr28CWruzXONVyu5cPJ5F2
	MkNwXWoi9Rw2sO9DenaP9qqCmOeXdO8VC3GQmN+UeWESHDa6XfpgXQU5pJZKiuY48A3Sh33ihWL
	Y1Ny9YhUWqyaqoGLcF8JEfU44QTYdlnYfJIFbBioi1P4pfuXbhp6BvFDpGOT0fjy4cLfVUE09Rl
	V+CIlSBGs=
X-Received: by 2002:a17:90b:1a8e:b0:37c:63fc:b2fb with SMTP id 98e67ed59e1d1-37c9ebe9457mr8374915a91.22.1781786435944;
        Thu, 18 Jun 2026 05:40:35 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c52092ee3sm9765839a91.0.2026.06.18.05.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 05:40:35 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v2] usb: misc: usbio: fix disconnect UAF in client teardown
Date: Thu, 18 Jun 2026 20:40:29 +0800
Message-Id: <20260618124029.3704089-1-zzzccc427@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

usbio_disconnect() walks usbio->cli_list in reverse and uninitializes each
auxiliary device. auxiliary_device_uninit() drops the device reference, and
for an unbound child that can run usbio_auxdev_release() and free the
containing struct usbio_client.

list_for_each_entry_reverse() advances after the loop body by reading
client->link.prev. If the current client is freed by
auxiliary_device_uninit(), the iterator dereferences freed memory.

Use list_for_each_entry_safe_reverse() so the previous client is
cached before the body can drop the final reference. This preserves
reverse teardown order while keeping the next iterator cursor independent
of the current client's lifetime.

Validation reproduced this kernel report:
BUG: KASAN: slab-use-after-free in usbio_disconnect+0x12e/0x150

Call Trace:
 <TASK>
 dump_stack_lvl+0x66/0xa0
 print_report+0xce/0x630
 ? usbio_disconnect+0x12e/0x150
 ? srso_alias_return_thunk+0x5/0xfbef5
 ? __virt_addr_valid+0x188/0x320
 ? usbio_disconnect+0x12e/0x150
 kasan_report+0xe0/0x110
 ? usbio_disconnect+0x12e/0x150
 usbio_disconnect+0x12e/0x150
 usb_unbind_interface+0xf3/0x400
 really_probe+0x316/0x660
 __driver_probe_device+0x106/0x240
 driver_probe_device+0x4a/0x110
 __device_attach_driver+0xf1/0x1a0
 ? __pfx___device_attach_driver+0x10/0x10
 bus_for_each_drv+0xf9/0x160
 ? __pfx_bus_for_each_drv+0x10/0x10
 ? srso_alias_return_thunk+0x5/0xfbef5
 ? trace_hardirqs_on+0x18/0x130
 ? srso_alias_return_thunk+0x5/0xfbef5
 ? _raw_spin_unlock_irqrestore+0x44/0x60
 __device_attach+0x133/0x2a0
 ? __pfx___device_attach+0x10/0x10
 ? srso_alias_return_thunk+0x5/0xfbef5
 ? do_raw_spin_unlock+0x9a/0x100
 ? srso_alias_return_thunk+0x5/0xfbef5
 device_initial_probe+0x55/0x70
 bus_probe_device+0x4a/0xd0
 device_add+0x9b9/0xc10
 ? __pfx_device_add+0x10/0x10
 ? _raw_spin_unlock_irqrestore+0x44/0x60
 ? srso_alias_return_thunk+0x5/0xfbef5
 ? lockdep_hardirqs_on_prepare+0xea/0x1a0
 ? srso_alias_return_thunk+0x5/0xfbef5
 ? usb_enable_lpm+0x3c/0x260
 usb_set_configuration+0xb64/0xf20
 usb_generic_driver_probe+0x5f/0x90
 usb_probe_device+0x71/0x1b0
 really_probe+0x46b/0x660
 __driver_probe_device+0x106/0x240
 driver_probe_device+0x4a/0x110
 __device_attach_driver+0xf1/0x1a0
 ? __pfx___device_attach_driver+0x10/0x10
 bus_for_each_drv+0xf9/0x160
 ? __pfx_bus_for_each_drv+0x10/0x10
 ? srso_alias_return_thunk+0x5/0xfbef5
 ? trace_hardirqs_on+0x18/0x130
 ? srso_alias_return_thunk+0x5/0xfbef5
 ? _raw_spin_unlock_irqrestore+0x44/0x60
 __device_attach+0x133/0x2a0
 ? __pfx___device_attach+0x10/0x10
 ? srso_alias_return_thunk+0x5/0xfbef5
 ? do_raw_spin_unlock+0x9a/0x100
 ? srso_alias_return_thunk+0x5/0xfbef5
 device_initial_probe+0x55/0x70
 bus_probe_device+0x4a/0xd0
 device_add+0x9b9/0xc10
 ? __pfx_device_add+0x10/0x10
 ? srso_alias_return_thunk+0x5/0xfbef5
 ? add_device_randomness+0xb7/0xf0
 usb_new_device+0x492/0x870
 hub_event+0x1b10/0x29c0
 ? __pfx_hub_event+0x10/0x10
 ? srso_alias_return_thunk+0x5/0xfbef5
 ? lock_acquire+0x187/0x300
 ? process_one_work+0x475/0xb90
 ? srso_alias_return_thunk+0x5/0xfbef5
 ? lock_release+0xc8/0x290
 ? srso_alias_return_thunk+0x5/0xfbef5
 process_one_work+0x4d7/0xb90
 ? __pfx_process_one_work+0x10/0x10
 ? srso_alias_return_thunk+0x5/0xfbef5
 ? srso_alias_return_thunk+0x5/0xfbef5
 ? __list_add_valid_or_report+0x37/0xf0
 ? __pfx_hub_event+0x10/0x10
 ? srso_alias_return_thunk+0x5/0xfbef5
 worker_thread+0x2d8/0x570
 ? __pfx_worker_thread+0x10/0x10
 kthread+0x1ad/0x1f0
 ? __pfx_kthread+0x10/0x10
 ret_from_fork+0x3c9/0x540
 ? __pfx_ret_from_fork+0x10/0x10
 ? srso_alias_return_thunk+0x5/0xfbef5
 ? __switch_to+0x2e9/0x730
 ? __pfx_kthread+0x10/0x10
 ret_from_fork_asm+0x1a/0x30
 </TASK>

Fixes: 121a0f839dbb ("usb: misc: Add Intel USBIO bridge driver")
Assisted-by: Codex:gpt-5.5
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
v2:
Drop the unnecessary list_del_init() per Hans de Goede; the safe reverse
iterator is sufficient.

 drivers/usb/misc/usbio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/misc/usbio.c b/drivers/usb/misc/usbio.c
index 02d1e0760f0c..0e5ccd2f04d8 100644
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
@@ -535,7 +535,7 @@ static void usbio_disconnect(struct usb_interface *intf)
 	usb_kill_urb(usbio->urb);
 	usb_free_urb(usbio->urb);
 
-	list_for_each_entry_reverse(client, &usbio->cli_list, link) {
+	list_for_each_entry_safe_reverse(client, next, &usbio->cli_list, link) {
 		auxiliary_device_delete(&client->auxdev);
 		auxiliary_device_uninit(&client->auxdev);
 	}
-- 
2.43.0

