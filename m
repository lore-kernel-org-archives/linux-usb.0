Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCBC37E5E5
	for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 06:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786428499; cv=none; b=UxtYBvEzn9s1MLPR4Ezqk29MI2LS9T3D/T3orDPATsEZYQSmWh/1h6h3J/a1eQ1ta3gxT+rHIIT4emWlzXjAkeY/7lJGTOsjRLnSx3+l9zrHLsgMIJkcUerQ96SnEPsBXEgKYhCmst0gmUZBx9e6ilQcE1jbZD82S7EuZ4E6gH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786428499; c=relaxed/simple;
	bh=LRVTw6UVPk4ak8Vq4dEY9x515efog92c99hQpyDs3tI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qxGa+Kz+Vk/AQJfKw7iv+f7l8kWZvXqjS7mlWm9TSbHXUrhKg3GPTySN+hIMwlTKUnMZsKqNr8khrqwn1NY+j6JSwDjpVahj6Za4Tw7g1seP1l7xmv4woGX7OWSX5C+E1XiM1QHxLcqSKK+hC1qwxWorTSjZv6zDfFoqaTn2KYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kPihsSCp; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kPihsSCp"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38f0f132f56so574012a91.0
        for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 23:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786428495; x=1787033295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vR52uawzwZ8pAdqGTT5PA/Xi2oVkVf3Ut5OWPXZVNig=;
        b=kPihsSCpj5TTYS1ibdWNCwatyzq27sPhgSopn9+NKUGFKjS6Zm0LsxEJSL5Ry7Sysz
         zc2IV8zDpQK/Ed/BLV1BYUVC2s/dDVAJBFIfFi+6mAgSmeXU2I81uNw7XfDY1IsYN/lB
         qUb9+148O8FCGq2mokUksEiGCsvN1UR1nAzQef9qKVPm8W0XSMRZTVKjUGlPd2GD5/IE
         UZzjDysf0+Ay26wO4kFeU4Evt4q2OZLzr6E0X5EuE3GBh5E+EHiabXpjbh3UrQ6INK8J
         +7rPMAV7Zb894me/Smmh4mSLtgLA8MMuRjh0aQ7hM53AIS/Gs7vp1J9aSFTE6intYiY/
         aS/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786428495; x=1787033295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vR52uawzwZ8pAdqGTT5PA/Xi2oVkVf3Ut5OWPXZVNig=;
        b=jceVNnwUbAjbbU/Ny+M5SsNHwjF10e+HdqAmsnDAdV84+Sqpn5+p7SBMxb0i8GNq0N
         kCA0ViFfmOylV/OHoQz1GzYU0cLmobE/DJ7c4JtPil/r35z69xoy0SxspBRqb63ksrdq
         0sfm8wQN5Dna0mpTJDB2166hmhkpDSbb2BHPODZFpx70U3i4iSIU2KfsLWTUYwlfmQAJ
         dJ33iQYmH9rurA9oL1e4hgqh+Q0MBs1Wb2TleQl+dMRm9NYEEFbMyMcJ5KV1RD7ox16E
         x/cuY5IE5nE/tdieuxKHzruag7BM7t6WpKRgTaiaIabKBTq8Xb5M3S+8PB9/AN5Oq3rO
         Dp8g==
X-Gm-Message-State: AOJu0YxdKXdgEp33aXoaMDMQYHr7Ln2rxKHqrwMXx4eYxv4tvEjaIclx
	t7XPsYVKgp5bZEiu513K2thCzmCKZ/fKXAM6u+6ajuoufqHQ/acSqd7U
X-Gm-Gg: AR+sD1343s2sWR8hUczHzAtTIICNxbu681Qvj00kuJBfxUoDWoYeeTn1UvuyoD/PzGw
	wS0IbtJyw8HCt4KzSR1XrIysZ8k65o8ub3xeqvD4WqTTGmprly/TBff4UCvEkhsDWWJiJylrDm6
	yKzvFuCmx8q+VC0dLLL6CB6RfskSDA+SWUqJtsUZT118+LrEK3z6TV2EU2VP9hknW9+wr99mppa
	n8VFgBsAQ1FpeHbae3pA0agIWey7JOKxenSLdSq9FkNgFaEFR6E14Nrmhy0mM7t3Aqiuvv5eU/G
	HxL2VMQh4EP9UUs+1Sb9LQusWPacLDUJnmKwoegTDh6yf/EzU3VJXInarC8Z+OfvDBegcfkE8DG
	4PIFjoL43y8SrPaqJIKCkiDrOWr8/cM7R8m/NmF1Vp5K41JDvowrkMlxAD1tUUcqxgUbMtt/BIm
	ekri9yF2Op2MwdPv8CFvzn4Zuw7Xi0UXlYLugb2TTH3Lo7MfT2NZeol2VS/KbBF4z3VosLCXhPN
	e4nCbx5fKmtGPkMCU00muGd
X-Received: by 2002:a17:90b:3805:b0:38e:9784:dd47 with SMTP id 98e67ed59e1d1-392ed01a8b1mr419591a91.1.1786428495466;
        Mon, 10 Aug 2026 23:08:15 -0700 (PDT)
Received: from ML-GYSUBT565.ECARX.COM.CN ([101.47.164.95])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14120460574sm1750218c88.15.2026.08.10.23.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 23:08:14 -0700 (PDT)
From: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+8496ab5e117502750445@syzkaller.appspotmail.com
Subject: [PATCH] usb: gadget: fix refcount underflow in gadgetfs_bind() error path
Date: Tue, 11 Aug 2026 14:08:10 +0800
Message-Id: <20260811060810.295666-1-khiemtranzo532001@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gadgetfs_bind() calls get_dev() only on the success path, but
gadgetfs_unbind() called from the enomem error label unconditionally
calls put_dev().  When bind fails (e.g. ENOMEM), put_dev() fires
without a matching get_dev(), leaving the refcount unbalanced.

A subsequent close of the ep0 file descriptor calls dev_release() ->
put_dev() which hits zero and frees the object; then gadgetfs_kill_sb()
calls put_dev(the_device) again on the already-freed pointer, triggering
a refcount underflow and use-after-free.

Fix by calling get_dev() at the start of gadgetfs_bind(), before any
error path that invokes gadgetfs_unbind(), so the reference is always
balanced regardless of whether bind succeeds or fails.

Reported-by: syzbot+8496ab5e117502750445@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=8496ab5e117502750445
Signed-off-by: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
---
 drivers/usb/gadget/legacy/inode.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/inode.c
index d87a8ab51..d6551a4ce 100644
--- a/drivers/usb/gadget/legacy/inode.c
+++ b/drivers/usb/gadget/legacy/inode.c
@@ -1682,6 +1682,8 @@ static int gadgetfs_bind(struct usb_gadget *gadget,
 	dev->gadget = gadget;
 	gadget->ep0->driver_data = dev;
 
+	get_dev (dev);
+
 	/* preallocate control response and buffer */
 	dev->req = usb_ep_alloc_request (gadget->ep0, GFP_KERNEL);
 	if (!dev->req)
@@ -1696,7 +1698,6 @@ static int gadgetfs_bind(struct usb_gadget *gadget,
 	spin_lock_irq(&dev->lock);
 	dev->state = STATE_DEV_UNCONNECTED;
 	spin_unlock_irq(&dev->lock);
-	get_dev (dev);
 	return 0;
 
 enomem:
-- 
2.34.1

