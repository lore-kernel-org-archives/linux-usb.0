Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8C333A9F8
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 14:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786026317; cv=none; b=ko+MCW5d2TopQrPcSbBDuGraxgzOaUq5xN9c8u+HhM1zbQpn28GKhihAucxm4ntVW8QZldp6/hGwPpoN8fUZu5WptMj2VmmxwRIBDR5DTRvr0oXmrWvcf2NpVHEWuQ1VKnM2N/MsFd4OZ/1yJrQw5Hhq3XhnEpU3Bsk1FIq3emI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786026317; c=relaxed/simple;
	bh=AvjA1M5b99YYhvvLAZYS047Vqnyc3DiDJbzlTqcxLRQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NTzhZ3iV5x79MlWLXBRiKMNQkPNsCIJBpNJZX8pJe5UkrKwkZE7s9nOqsKFgWxwrnFkx5nPduubdfxbU/HGsD281VU2ma9Ho2vsuUev44En68s/hvNSYlTM4IplhjSiZwmzvqsgE2tSqRDw6RUplqthG/l3fj5OXn3cdIHCKTrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--nogikh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FNcRyUFB; arc=none smtp.client-ip=209.85.128.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nogikh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FNcRyUFB"
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-492488f8583so19850325e9.2
        for <linux-usb@vger.kernel.org>; Thu, 06 Aug 2026 07:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786026315; x=1786631115; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2QH/vyaXc9mQlWmLqa26CL98fda7tXqOOXhnKxF4DxQ=;
        b=FNcRyUFBg1HzjaS2pAbPJt0cd/vuQjtPB5bH4DEFHPMFCc1ir0WmsOUG/jZBrYOm4c
         +0PTUkZnhKLXT54JlxygaPoFp5GgqX66tlfIAIbc83y8fSHNWVwHFyAkC6apOFT4Qj/g
         +dc6IgktrAFkLuzi05jH+xCs42bSMkk52Nc49DS+iSMPGps6Cmrgyszmkvmca0eLZEq6
         oX3b8TUJx/FnttbRBnQ2HY/oFU421nrA38F8NTzkKH34YpHcbmDdXu6dNAZGqzxJkNN4
         RPE8rnfr/q3e3xH/+HUBfgceYhthxMuRQSiJ/PiAYT0W2fOFaB3oFu9ZX4nOIO2aLtBV
         BGFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786026315; x=1786631115;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2QH/vyaXc9mQlWmLqa26CL98fda7tXqOOXhnKxF4DxQ=;
        b=ZKnk9U17sWDasiFxv13pKSUinnUtsajDLJPrbXvF4eJWsXN00HYaZm5Lv1pcK8r3C7
         Bw/MrxKqp/A4NpOw7g+tMr0Y4nuXXRoYkhrkYVSbzksWCB7O7v+rmy1HbxICLGyMoZYp
         45r7jOMgX6TVLPFFFQRHpiWnGhq05FG/WJGw3BxhY93gaoJaJ0pDExuJ/3NPHImZIgZY
         RFuFwjf/63z7MlmU18CVk/RozDz9oCS10F9kTy9MDWVdXnd7W9zcxtABS9rIXbowqjan
         c8qa9ygXVbqFq/DRiVAf1tk88pkkBVlgJ9jxoG3j1vjjYaWI9Fxo6VqsZ4QM4rkAFfys
         jtzQ==
X-Forwarded-Encrypted: i=1; AHgh+RqrRc8NqcVS5D8LggBJu64JBhJppG6lNoaFj6J913y2DNs7mOkG0faZ30ta483DNDt1n9CbkmQaC/4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz57iqdgKY+bg1QqUA1I/osCHvVFxDVZKorb/NmPRZKg48LpPV
	TrCRGFQmGa+Sj5DuV3wwDe4ig2HUbvtuSlBxRWFVBIUskW0snIRfMqyrLTKHlbkv/RSNalhVJeL
	/2mS4eA==
X-Received: from wmix24-n2.prod.google.com ([2002:a05:600c:e558:20b0:495:3d1b:2bc5])
 (user=nogikh job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:840f:b0:496:c1f3:e8fb
 with SMTP id 5b1f17b1804b1-4994e71ffafmr198271475e9.8.1786026314072; Thu, 06
 Aug 2026 07:25:14 -0700 (PDT)
Date: Thu,  6 Aug 2026 14:25:11 +0000
In-Reply-To: <2026080322-obsessed-daringly-e6df@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <2026080322-obsessed-daringly-e6df@gregkh>
X-Mailer: git-send-email 2.55.0.654.g21b8a5bc05-goog
Message-ID: <20260806142511.2337081-1-nogikh@google.com>
Subject: [PATCH v2] usb: usbtest: disable dynamic ID support
From: Aleksandr Nogikh <nogikh@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>, syzbot@lists.linux.dev, 
	syzbot+7e1e5911f9eac50bedc7@syzkaller.appspotmail.com, 
	Aleksandr Nogikh <nogikh@google.com>
Content-Type: text/plain; charset="UTF-8"

The usbtest driver relies on the driver_info field of struct usb_device_id
to point to a valid struct usbtest_info descriptor. This structure contains
essential test configurations, such as endpoint addresses and test modes,
which are required during probe.

When a user dynamically adds a new device ID via the sysfs new_id
interface without specifying a reference device, the USB core initializes
driver_info to 0 (NULL). When a matching device is subsequently probed,
usbtest_probe() unconditionally casts driver_info to a struct usbtest_info
pointer and dereferences it, leading to a NULL pointer dereference crash:

  Oops: general protection fault, probably for non-canonical address
  0xdffffc0000000001: 0000 [#1] SMP KASAN NOPTI
  KASAN: null-ptr-deref in range [0x0000000000000008-0x000000000000000f]
  RIP: 0010:usbtest_probe+0x3b9/0x1280 drivers/usb/misc/usbtest.c:2822

Because usbtest strictly requires pre-defined usbtest_info descriptors
to function, dynamic ID binding via sysfs is fundamentally unsupported
for this driver.

Fix this by setting .no_dynamic_id = 1 on usbtest_driver. This instructs
the USB core to skip creating the new_id and remove_id sysfs interfaces
for usbtest, preventing invalid dynamic ID entries from being created.

Reported-by: syzbot+7e1e5911f9eac50bedc7@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=7e1e5911f9eac50bedc7
Signed-off-by: Aleksandr Nogikh <nogikh@google.com>
---
Changes in v2:
- Disable dynamic IDs via .no_dynamic_id = 1 instead of adding a runtime NULL
  check in probe().
- Link to v1: https://lore.kernel.org/r/2650cf0f-26f9-48b5-b198-e4cb67c59cf0@mail.kernel.org

 drivers/usb/misc/usbtest.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/misc/usbtest.c b/drivers/usb/misc/usbtest.c
index 98071b25ac076..8759df49be287 100644
--- a/drivers/usb/misc/usbtest.c
+++ b/drivers/usb/misc/usbtest.c
@@ -3054,6 +3054,7 @@ static struct usb_driver usbtest_driver = {
 	.disconnect =	usbtest_disconnect,
 	.suspend =	usbtest_suspend,
 	.resume =	usbtest_resume,
+	.no_dynamic_id = 1,
 };
 
 /*-------------------------------------------------------------------------*/
-- 
base-commit: 48a5a7ab8d6ab7090564339e039c421f315de912
-- 
2.55.0.654.g21b8a5bc05-goog
