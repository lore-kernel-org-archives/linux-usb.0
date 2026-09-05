Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1732BEFFD
	for <linux-usb@vger.kernel.org>; Sat,  5 Sep 2026 00:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788568574; cv=none; b=AwWf5oVpxBdJOXiOebxBAGSChjhB4T0CaZ6j+Q/OqDxRMB6eiJJeNiid07/U4EDE2LtnFgTmoIA9AwSS8eC4EgqWgh1NTG9beNn7M+xUbXIsDW4s9hzKm3OIXa6u7+Sv8giHle2uObQrDxQzazN4LhcB4a4rGCfrIwpfgiR5I4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788568574; c=relaxed/simple;
	bh=8HzIcvm2I4PGEsFdux3m3Apu6yc5GgCA35XtCp1TzvE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Eg864/SQ+HFDmmPvRFr5VLyG5YzAX2eXB0MENooEAdf4I4KDOosK+h2MK2RJBnYCtmOuIy/1ZIPo0jqra15zXBopt0dklHDpXbSF1aRMHruPF+JE9mCRIiZrQPXd/qBKYJk3ftDJSIclw/xGHznClwU4UGELLbLTsbcV4ITV/WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QYV0a0Gy; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QYV0a0Gy"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-398b1e63c49so2482560a91.0
        for <linux-usb@vger.kernel.org>; Fri, 04 Sep 2026 17:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788568573; x=1789173373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l2i3q/8SP6YXjJaU7ec/Y5TJPcKgIJqQrS0aacfBKX4=;
        b=QYV0a0GyWciguOP+EZ3ZYvLeJQzt4kQ8ETzl3bU1C4JGe6/dtnhNNx5el60HikHdpd
         sZhBxc2JHcLHWaVoyY5ltmgTSI1GR9adC+Lm0cmsCHcIxYBhgyD4eouCEk1aJgq1z1ZS
         7FdT03EcPfJHVB6ssUqoxZ8M7Ej1hMppEW2q62t1yOwXthCj3u2yLxAS6ExzeNxQSbEI
         TeE/dbmGOuYMlqbu8Rf6DNLgXMHmXJ0qWFgoxrilCC5ODAjO2tMZ7O3SJspM6UC1KZlc
         rgedTtgB8oWGy+vtozR3eHCHUJgzfnpK/uE3h5QnZMJB94UNlUR1r+cuY4eIYoypHov1
         EbdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788568573; x=1789173373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l2i3q/8SP6YXjJaU7ec/Y5TJPcKgIJqQrS0aacfBKX4=;
        b=EDDr8NvnRtdjn6UEfF2Yx2dX66l51bsLa8lRsfMTWlg8M7cTrnvD9CMqJz57i2eHUn
         gzFBI6jfnir7ad61c8vkAoaaDwXG4zfgvcLpWyxBlnGkV8pYtvTIaEgl7Avct2194kFK
         lJDf2pRh+nVIgYnp5R29IodxjIN3jm/eNfTjibTMYFSENjwNlAc2oWb+ndx/ssdr5Y54
         SWbLNV+BqVKInCU1GNvHuYn2eUBcZuvu51pxenrVq7sHQMWL4hvu38bQ4EJzvtiUOnZ4
         cCcuEkAZvE1T3JZZw3PZJPUjxncV43rchHJ007LQ/onW01Vv1J/f6tbmeoIgQPac/cRC
         QjfA==
X-Gm-Message-State: AFuF++kF0aX3B26gXapjrtsFXcAoMHuihPCp5LTaA7GHvdEWU4z8eC3c
	pikp8+qUyqdeLrYju67YQZnwjBcVHDL1yXIdSgkGG73z0nH6rJa3agvp
X-Gm-Gg: AYBFou3BJ8/eo3W246a8AqeWZu3uQO20cD8puWCbiluiO4iVb9pYAUPZ358sMJbGPGU
	lL0EmM6ti5Mn8w11VBRHYYgvlxbFkdq6KPbBtu8vduu1+BOx9T+c9asVgz7+kniUPi4V1yipH4l
	3CDXSTguXOuJfLOoGoLqER7BumpeeBPNsF+oTEtSpPHYk9+rQo/FqZMHbeN7yu+EH8NiRlG4Q+g
	4xxjY0wk+1T6NAFDvhdhdV6zSWVKZjdR4FAU+u0ynKj0EjqY2cK05MlplieaAG5IIpCdHchwFv8
	gjLOWSVcjsBXtdsNhLfFme/f8j1lPUHNKdi5nhVEWQ/MYvncLrjR3rPlol9gY+K6fyNhS+7yiNM
	qlZ0W4zyBp/lPgrxz3qjI4gQJbF5ReVa3wFjyOOS1UHcRiN82+ppENLLhoerpcZSpGQapYIm2Kn
	nO5UxY+qPvq4MqqdlduAUPE8ZX2owS1k/RpnKSqLDfqXPSkT4ZH0QvpaSYl6Gl
X-Received: by 2002:a17:90b:584f:b0:38f:657:6823 with SMTP id 98e67ed59e1d1-39b27c8b9e4mr7191704a91.8.1788568572711;
        Fri, 04 Sep 2026 17:36:12 -0700 (PDT)
Received: from tradnomic.. ([2601:646:8300:7570:4132:9566:38a4:e435])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b25f88475sm6760895a91.1.2026.09.04.17.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 17:36:12 -0700 (PDT)
From: Rafael Alejandro Diaz Cruz <rafad900@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rafael Alejandro Diaz Cruz <rafad900@gmail.com>,
	syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com,
	Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH usb-next v2] USB: gadget: Fix UAF on refcount inside gadgetfs_bind()
Date: Fri,  4 Sep 2026 17:36:07 -0700
Message-ID: <20260905003607.1686172-1-rafad900@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When usb_ep_alloc_request() fails, gadgetfs_bind() takes
the following error path:

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
Reviewed-by: Alan Stern <stern@rowland.harvard.edu>
---
Changes from v1:
    Removed syzkaller reference in description

    Added Reviewed-by: tag. 

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

