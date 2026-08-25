Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF653932D3
	for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 10:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787655488; cv=none; b=D4Gu0YPzJzUj4QpJwWAAnkW6qYEaqzHQrwIT8e7fMbp/NV+degVjkzt7iFMkpQSo91+8BTx671ayiOna4WzPxjoSwh+Dj3WF5Xy7r0Ck1MMcH9B9OfdG8b9+zlPRQ8LAom7Q44hRIinEO4QHU2T6GUkP+BXvnLyAICU+04festg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787655488; c=relaxed/simple;
	bh=FPYe1crnsYHtn0U7WPNaYM9b5z0ifdW88rHUuc4KNhA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N1FrH+rvL84UmOex+mwgT1QCmZkxvNSbZdU83ray/fK8qro94hNyKQSREe0JicdLsFK6NJ2vDTDNLiOxghLniqWWYqNtMQJ1q3eiLd3H5fqWhW/eTVs4Qj17f8JPixOpBmpEbTeZiHzcVxxd+jFrGx3G5vN5eNs1bry6FVefbn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a7tUavtM; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a7tUavtM"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc147d86bebso654642a12.0
        for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 03:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787655486; x=1788260286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ac16pfv2Rj18iPUVLOrADWTqxfqfViLMohr3+8pP5Us=;
        b=a7tUavtMS4NC1dzrg0HvxlNwLmjBJ0abt5zAmYDoVQqzMsB8fQyR+/JDF5r0zZlS6y
         ESq7RrFXVSTCSuLEMBnM6njhGpNi6gAzlOuDOl1DB1vsBau1/1ZLfvz289cwNmdDH90F
         vVn2+0zQ+tKou7b8BLFnflcIBHOYwOTL+3BfTRWZ7ZhRyEDzfOFKYz4flS12prMJjWiG
         J/VWU3AoIvcU+hd+dIv1izO4YuKqmesxtZNHCedLby9Wo+WRyCDsKJS0QAYOt8jMSh9N
         p48bWGuwgA6Nh6crUkvCxRtfPLS2juRJgXejgc5cwcCyuTMIX7aFjY20pDWW8QPZfrYB
         NQJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787655486; x=1788260286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ac16pfv2Rj18iPUVLOrADWTqxfqfViLMohr3+8pP5Us=;
        b=JiIMmBUH32FnTY/q0MrnzdhYFdK6Vlj57oEJJdOEc7UZ4Sa153eDa6DKpir/T9bMtl
         FuXN0GzSESyDBExmrIgMVy0HmrHCbwaKogqHEwx05TyGqG9FWswjf1I5prQ0/QcrBas/
         KX8BQuUs/SX1ecMZEfibcuTMIm+++fs1zltO4oOH12e4ztTQh5nLmXsH66NbWZkFFO3r
         ArJVBVVEpsoEUGXjDsUaVbDi7+1lfI1eoIUYWl5NZ3lXkqn2AYoSbs1Ymn3mG8B8adsO
         Y5quEB7zPKsdc6Y9XbMFYUxA3hRQWUQIvxWyMYRV+neF8ctZDnLLvXLfKOrCi7bAwDry
         7FmQ==
X-Forwarded-Encrypted: i=1; AHgh+RpzPYR22b5d74sxKNp9E0x2NWzZFEUSibOirSGZMFJrrzRlBWbyn98mdaMz4tHTCBeXPcL/1pQDaok=@vger.kernel.org
X-Gm-Message-State: AFuF++mymNEqZRDtVjw+bUonbgVyBpojrbzPhIivQNoGrsHf73wJKnze
	7vMgkRyX1DYIeSLOkMjtsY1Ltw8PMmeQe0NMbeTlgtnG5Y6GxVtHXAHZ
X-Gm-Gg: AR+sD13oWyfl231uMDyHAfM5Twmw4nzQnsp7wq6NXnHQ89HRQXivL+cmiP3fQU56cSM
	Rdsal52wIzCFygsSQjucUNCn5XadpqYn8jMvttFudimedl7JgOg9C2lGEhYxA9gil+V6yS3DxdN
	QOyBbbX56NV8REWzcMEHV9Qamb2RB5Rto0OD/KEsKLuGz7R/24iIk5AwgRan2OGQIFuOHRiw2sR
	cG5ASO0V8z3K1DAHmHxBoWdC4tsg1Y4cSiCLNER6P/UE9DBujTT3+Ndg7KUMFtte3YU0gGR3jsx
	CLOlUgMOwF9ttg8sSuOhTwtItPUjyVGp4f6LLg+oq3H2hHsnhLqG4II6fK5zPfYlyRSkhSVX4I6
	30RZihZ+uFEKBFWLPedl8BKSpIGsdmFeCaM51Xjk7DZSAkIDCbIph8Ry0B306H3N3RutjYbWVet
	KtgX04amL7Eow9VT9+pxQMkGN4IE+N+xkvogO8t5laWtkZMOm4xtG6mx8iC/XiVo/vTlnDkkGqd
	VYkbnUPWfmji9itgiwU8R63xfsBkR6V6g==
X-Received: by 2002:a17:90b:39a3:b0:36b:de66:92c3 with SMTP id 98e67ed59e1d1-39645a565e4mr7275293a91.10.1787655486061;
        Tue, 25 Aug 2026 03:58:06 -0700 (PDT)
Received: from localhost ([2409:40c4:101c:e5a9:a28f:e499:1b07:43b3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141860fe08csm53644630c88.8.2026.08.25.03.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 03:58:05 -0700 (PDT)
From: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
To: jjy600901@snu.ac.kr
Cc: brauner@kernel.org,
	eulgyukim@snu.ac.kr,
	gregkh@linuxfoundation.org,
	jack@suse.cz,
	kees@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	mjguzik@gmail.com,
	stern@rowland.harvard.edu,
	viro@zeniv.linux.org.uk,
	Lovekesh Solanki <lovekeshsolanki00@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] USB: gadget: fix NULL pointer dereference in gadget_dev_ioctl()
Date: Tue, 25 Aug 2026 16:28:01 +0530
Message-ID: <20260825105801.319997-1-lovekeshsolanki00@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260824113510.1141236-1-jjy600901@snu.ac.kr>
References: <20260824113510.1141236-1-jjy600901@snu.ac.kr>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gadget_dev_ioctl() reads dev->gadget outside the dev->lock, while
gadgetfs_bind() writes it without holding the lock. A concurrent
bind can update dev->gadget and dev->state under the lock while the
ioctl thread holds a stale NULL copy, causing a NULL pointer
dereference at offset 0x28 (gadget->ops->ioctl).

Read dev->gadget inside the locked region, before the state check,
so the state and gadget pointer are always consistent.

Cc: stable@vger.kernel.org
Reported-by: Eulgyu Kim <eulgyukim@snu.ac.kr>
Link: https://lore.kernel.org/all/20260824160022.2378192-1-jjy600901@snu.ac.kr/
Reported-by: Jaeyoung Chung <jjy600901@snu.ac.kr>
Link: https://lore.kernel.org/all/20260824160022.2378192-1-jjy600901@snu.ac.kr/
Signed-off-by: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
---
 drivers/usb/gadget/legacy/inode.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/inode.c
index d87a8ab51510..e9f7d7c1a6a3 100644
--- a/drivers/usb/gadget/legacy/inode.c
+++ b/drivers/usb/gadget/legacy/inode.c
@@ -1251,14 +1251,15 @@ ep0_poll (struct file *fd, poll_table *wait)
 static long gadget_dev_ioctl (struct file *fd, unsigned code, unsigned long value)
 {
 	struct dev_data		*dev = fd->private_data;
-	struct usb_gadget	*gadget = dev->gadget;
+	struct usb_gadget	*gadget;
 	long ret = -ENOTTY;
 
 	spin_lock_irq(&dev->lock);
+	gadget = dev->gadget;
 	if (dev->state == STATE_DEV_OPENED ||
 			dev->state == STATE_DEV_UNBOUND) {
 		/* Not bound to a UDC */
-	} else if (gadget->ops->ioctl) {
+	} else if (gadget && gadget->ops->ioctl) {
 		++dev->udc_usage;
 		spin_unlock_irq(&dev->lock);
 
-- 
2.55.0

