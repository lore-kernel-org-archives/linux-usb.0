Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367BE386435
	for <linux-usb@vger.kernel.org>; Wed,  2 Sep 2026 05:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788326502; cv=none; b=K/x6qTDph8c6UUuzwM4KlKbBWeANRLMnegirr5CHXDi6wYHado44O9LSZPebFy8QQf9rP2FRxx1bOeNICjKyF1RW4OtlLJH+9xZRJrT+vw9pc2TVXIf3W4dkwxpiNIxPvWCeQIIcnu1xmnidZCwibUEbvIaT0pDbgKjGusbyEdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788326502; c=relaxed/simple;
	bh=Rhc5FHXC9zWJK8LXgHnAbIqBwTamgzTfAaU6cucS/50=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kQ07Ff+yZzGNrgFcGgSzQuiMnXpE2esWE4G4dsjLdeNOmlEpm+MBxPj7Xw4mBAlW//F4mHK5Iqs2AqV/k4d2wX6IlcBTx5kIMt7MfkHU2EFhuqkSIkNA5BBfGKl5Pr0yxsrhz/jVjUu8il+fuab/UCNnj+PnqgYoGoXHZHiH+RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EtxY6ZhP; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EtxY6ZhP"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso604055a91.3
        for <linux-usb@vger.kernel.org>; Tue, 01 Sep 2026 22:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788326500; x=1788931300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pRhdOtnB24Vt7kyfqTpsWsi9boNwnxaSeXytL8/XR20=;
        b=EtxY6ZhPv3NwNLhqstfrrfvT0lYUa8/FRaurybaqvPCzSsOcZW5Hv71Ui2rBYUHcR0
         4ldct3JSQNDHTO03yAOll6Vsm+slx+McUBMfU2mGzA19EBahE2JbLJqxeUx9vN+iVh2i
         7jh4LQHpvkczvXAQ1nlxr0NQyluszGtkhEFH9wdaP86bVZyOZYWo09yzyImyslhoC2DV
         kn7Suu7wkfJgPM6Eqd7cMNKB4u+Z2LtVpBrmmH97s/zzSU4dztEeLA6lC01jQ/YjsaJ8
         ci5VhpVrJmCLY2hOtJu35lu8xs9iZ4bPc4YkQf6x/1xCgD3ak/QcOUm1QnwfwET2hVmt
         cyfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788326500; x=1788931300;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pRhdOtnB24Vt7kyfqTpsWsi9boNwnxaSeXytL8/XR20=;
        b=Big8+Vmawbfy2mfWNXOGiU01RQoViAkMVZ6Xl26Q3TUValJJ2PwtyVN0hzQIjdMHef
         81xDmrAuO6437aHkHDWSlhaANYBT/kTMg/3McFlWPTw7ke2hOdWY90zf1pYj9KbkIBr6
         Vbr+1yLO/4fddsUJ3Sf+vNkldJETrI6OHieKcPTSK7UA6YDOhmnzRW5Lm5/ntB1kDFDd
         JZHJCBesnZVGRutYc6Rac/n5eo0gaO8EhBCeuH6wGTNqTU4zyLr/5dQgmCwf24F/nV+W
         xKGuDqjluCz1YWiWdve8oubWvYDtx6tpXOh3fsJWj6BOdgb3G43rLDBN7WASyULCQ7Df
         s6+A==
X-Gm-Message-State: AFuF++l1otjVQCuVLLDfgr+z8GhjLMET138Aj9e+3AEN7b1IFeQnQTBl
	Fmo1paR/7NyOissFK3dfPgDbhrUu8cTsqU7QuDTCUD03UwnNiU1iTlST
X-Gm-Gg: AYBFou13ixHmjqgVAgotRN1eeNWvGO6TcAKf4uoAOPF5rJd07hsnP+Tt5P2XsXpngAp
	wpDsgktpmf+cit0hstb0HIT4i6fF4SnI2w5LA6vNNlxBpQQjbc0bWT70IbmQzJlDcCr1bquM68+
	CiAI4Oypo/kqEA2iAsoa38+TIgs2uY5fWSrcpUE1SSWNbaMJatL1eIZf3gw5lM6mPYlAgkBUYGO
	ZLhiQlKL31i7yY0qTtWJj86wiNNkdggL6lcASxz2I2j7ZRDkkk+Xm/YcqNMwalAPlCUyHFz/lJ9
	7GlDxS3XHtfEuzQLFqukw5lLF/f5rrOJvUF7dguXn2LGihB7HdOztFsqL2NTvIn/7wmwgBL7CWY
	Lo0pPrCooEX0ynhlbuNw0YeMzvfdw1fccrV6aA5XBvaTOfycTfCJusQbg435AJut0SIBHlSBBmm
	lmK8gudEihMv1HEptHZo73dTG8JHw29bQntieA39YFk8S62pbr9PNRVMnxgAap
X-Received: by 2002:a17:90b:3c04:b0:398:d6e8:f84e with SMTP id 98e67ed59e1d1-39aedf5571fmr3835629a91.9.1788326500382;
        Tue, 01 Sep 2026 22:21:40 -0700 (PDT)
Received: from tradnomic.. ([2601:646:8300:7570:1bf0:3629:a2e2:397f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae3c1d85bsm3478024a91.13.2026.09.01.22.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 22:21:39 -0700 (PDT)
From: Rafael Alejandro Diaz Cruz <rafad900@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rafael Alejandro Diaz Cruz <rafad900@gmail.com>,
	syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com
Subject: [PATCH usb-next v1] USB: gadget: Fix UAF on refcount inside gadgetfs_bind()
Date: Tue,  1 Sep 2026 22:21:37 -0700
Message-ID: <20260902052137.3824591-1-rafad900@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The UAF is triggered by the syzkaller reproducer which
forces kmalloc failure inside of usb_ep_alloc_request().

This will cause the following error path to execute:

if (!dev->req)
        goto enomem;
// ...

enomem:
	gadgetfs_unbind (gadget);
	return -ENOMEM;

In normal case, get_dev() will be called to increment
refcounter from gadget->dev->count but in error case,
this increment is skipped and gadgetfs_unbind() will
decrement it via put_dev().

Going down the error path leads to a refcount imbalance
which will cause UAF in close()/umount() operations
due to refcount dropping below 0.

Fix this by moving get_dev() above the error paths so
that refcounter is incremented before the put_dev()
call.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=4a5c87a01894ca37f25c
Signed-off-by: Rafael Alejandro Diaz Cruz <rafad900@gmail.com>
---
 drivers/usb/gadget/legacy/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/inode.c
index 3e2bce7543d4..181b19e7fc2f 100644
--- a/drivers/usb/gadget/legacy/inode.c
+++ b/drivers/usb/gadget/legacy/inode.c
@@ -1679,6 +1679,7 @@ static int gadgetfs_bind(struct usb_gadget *gadget,
 	}
 
 	set_gadget_data (gadget, dev);
+	get_dev(dev);
 	dev->gadget = gadget;
 	gadget->ep0->driver_data = dev;
 
@@ -1696,7 +1697,6 @@ static int gadgetfs_bind(struct usb_gadget *gadget,
 	spin_lock_irq(&dev->lock);
 	dev->state = STATE_DEV_UNCONNECTED;
 	spin_unlock_irq(&dev->lock);
-	get_dev (dev);
 	return 0;
 
 enomem:
-- 
2.43.0

