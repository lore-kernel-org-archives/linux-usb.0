Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F01F47AF66
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 15:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786030020; cv=none; b=Ft+cK4v/G6Bv92ApWVO/vl5dzeOsLwjDnAUt4k69r8LO3bI0N/bnZ6pUCvEol1E234lBpRsPA3Nhjq2EK/iu22DvO5PTLg1VPNJewIq+gLOzjpM4XldpLgssQotA+mmf7mi0By0FUx1Fa36tauSw6CZUw2GmpCo2NIzTig0iHHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786030020; c=relaxed/simple;
	bh=R1E/w+AxsfP4UPOWvTWTrQQ9pq/bK7zQxikSG96an4o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AyF0aAV3h2s3xE08O8WsJGOwAuw/yVvKQfWttlOm7cPX/Kb63Kc66VfGyh3npiZqN91Sujv44Unwha6gqGS2nQzgrZiCr1FNVS/wiItCkc3H9lRZn7BgC1pIBjYrFtDZlD0gxilTXyqzv9bQ+Z8ozhdbeGAoBgVzlEiHEaY2EQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--nogikh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YXb3cw0p; arc=none smtp.client-ip=209.85.221.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nogikh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YXb3cw0p"
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-473ac08a6a4so1625589f8f.0
        for <linux-usb@vger.kernel.org>; Thu, 06 Aug 2026 08:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786030016; x=1786634816; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K+S1QP0FhvyNfqeqWumDjuFSyxYhfuXzC6OVTs+0PE4=;
        b=YXb3cw0piNylFShcrGbbnBgmuQTPKplvpK8YodMBiBryZWrwdfY8vEFcCy80SjbWtE
         /SlJTXpxCWcDtof77lmZl5F5E3B+fGXbg73pSQGcxStMD1BIgqTe9r3hyaLfhW/bs1t/
         oCfqy3zi+OIgJAOFiGg6RbrimUinkmCFu8YbiAoozqW1MEmrKHANjbwxh4+eMredOSG5
         Ko92h0RqKqZDBb7YbyxKp6gZZokjZw40Ox8yOQn9tZl/H3plYgE5i0yYKqZu9yL/DKOq
         /QDwvWj+Jv2DETV5lymbFCXp5FiwfT0+IH8wE+xt+npr/L934ctguH6NpluGOEwTewod
         ySjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786030016; x=1786634816;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K+S1QP0FhvyNfqeqWumDjuFSyxYhfuXzC6OVTs+0PE4=;
        b=GorcJ/drFWM9Vt3L+mqdNtUK9kGYjuwVZnmVSWefNC4uI0CRxlgDl72+Yv2XpX1nkU
         DRvLTkkP90nBIzqjv1BhYrCwyDXNVlelwlzg3v8tFMF1nPgIqkEtaWJw4e3xJGHySHGT
         erKfQ2yiEE5bbqasIW19CHuBG0blVgDCysGzU5shVr1y/1CpdGWQw40Tv7UKytZi7YcP
         U77sQdK7pQY3BmXyjOaugIX6SsNbFaOpvSNMgvmB3iYl0rJXR0cYby2V1gAGGYpoN8Nb
         FFhSg92b+eaT/sHF3e64K/p8SwnpmNgymVsGuZvBIanip87CKYVut9hnp8xdqFr2FpTD
         xPjw==
X-Forwarded-Encrypted: i=1; AHgh+RrI0i6rZWdEzV13HwW+Jqrqi1LmMarAgFM0zmBFo1QDNYZ8B9sBZlNdmIbzw1DiZzjtVDIB3uxVexI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2l6gY7drlCpAVJgYwQpD4EgApJdS2EVBV0TZaOPfOOjazOUzn
	VXLxWtISero6RHz0tJOXDHJ/UFO2JgzkHJR+RVJaxvwFwbUcIefnq/SF60nbzsfYKVp1Qr46Ykp
	kKB3D3g==
X-Received: from wrmj16.prod.google.com ([2002:adf:e510:0:b0:45e:9abb:86db])
 (user=nogikh job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:4021:b0:47f:f828:9f35
 with SMTP id ffacd0b85a97d-47ff828a369mr8592226f8f.17.1786030016055; Thu, 06
 Aug 2026 08:26:56 -0700 (PDT)
Date: Thu,  6 Aug 2026 15:26:51 +0000
In-Reply-To: <2026080322-obsessed-daringly-e6df@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <2026080322-obsessed-daringly-e6df@gregkh>
X-Mailer: git-send-email 2.55.0.654.g21b8a5bc05-goog
Message-ID: <20260806152651.2370795-1-nogikh@google.com>
Subject: [PATCH v3] usb: usbtest: disable dynamic ID support
From: Aleksandr Nogikh <nogikh@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>, syzbot@lists.linux.dev, 
	syzbot+7e1e5911f9eac50bedc7@syzkaller.appspotmail.com, 
	Aleksandr Nogikh <nogikh@google.com>, stable@vger.kernel.org
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

Cc: stable@vger.kernel.org
Reported-by: syzbot+7e1e5911f9eac50bedc7@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=7e1e5911f9eac50bedc7
Signed-off-by: Aleksandr Nogikh <nogikh@google.com>
---
Changes in v3:
- Cc stable.
- Link to v2: https://lore.kernel.org/r/20260806142511.2337081-1-nogikh@google.com

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
