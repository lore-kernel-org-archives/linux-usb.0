Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2B22DF13F
	for <linux-usb@vger.kernel.org>; Sat,  5 Sep 2026 00:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788568564; cv=none; b=bVJoWafrPxwZ8gqf01MilODnKdTEhFgCMCFcG+p4wt+18jbPl/8nbx53J+ofMPizA5mqvTgfztDgBP9SlK/GO9bpH8HpHnLLis+DSpyL5V9oFiK2oVL52VyvChmTJhjB5aFrXbUpIkIPyO2/tC6zzoV8SQCnqRrpujr6idTV9Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788568564; c=relaxed/simple;
	bh=4ocR7EIzawTfTG7p/inFgc30YXw4KjBNKt9fYUmExSk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i2bLTncSOP11sKQrddPVjrDjh8ae2nKRwX7/NU5RKLw8YApr+Twx5+htboPV5c8WQPQAm3Gn7fhLKQcwcBLK7ixnNKqNkYsZdRoB4QYeNZSWUuuRcgh8gxyPcgfwMQX3wCBSq4OrzznI6A8MmohbHOzmTxZL5fuVmQB1dgm+JAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=svZS+au8; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="svZS+au8"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3964dfb5b9aso2019453a91.1
        for <linux-usb@vger.kernel.org>; Fri, 04 Sep 2026 17:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788568561; x=1789173361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LD3OLCMtVZNmVhZuxqAq1q8x8oye3KoraYKv1uY4dv4=;
        b=svZS+au8HnLlsqOl0KVxOqPanEvmr5rMmdq72mQzFkomkr7dV/SlMEdiWViNW3s5Ex
         KpkRhpBwnJqrOjVJ+i8GJKegqVgAyCwT7cdlhtHZBJz9fJC2zY00xsWb7vSCyuK5vsYP
         Sfsm/RhUvOUKqSt+tSgdQfDwKLXn4YYHGpAGoNmhXJ8zAK441v7Fw4z2QdE6rlbqWaFH
         pfKG8ylaIaIPa6536XQGstvuc0g15PK4u2hs2VI9AsDXRSQfmRTQPr5/JaZMdZI+b81o
         GvHumgbXV9JVmRFd0vmMG2V28i1EqQU7w93UoYXvqnMy9LJPDj3Pxy9DcLBG7yTyDBBB
         SKSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788568561; x=1789173361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LD3OLCMtVZNmVhZuxqAq1q8x8oye3KoraYKv1uY4dv4=;
        b=tJ3ZKq2jYS3D3fgR9tqUZGLy1iuFHrqU6tP+wXn9wdmUwwafBJbJJ5lIoL/G8utH1H
         uR0SCc3o/HvNpZWPtr34lPPQug/owyrO8PMa937tg0WYZo2z5aYPnfVtG7UwoN5IijSt
         Uhcpr6IcQ098PX5yTjdWo21Ju8zCulmTLoLxNdOabakqBab6dATi5hmnO/OfZscfcdeG
         haGdw0uj+aF3W6CV+pkQPaAmiFL5uPLu+UExSsMtmV0o/AxzddRQRVJaa6oaKrLUPB6Y
         71MLbWWXk4BrrfjpzBL0nLLvvZr38nubGq9txBQXRh3xf0EPMZOwVeNDfYId2YJ8aAqF
         ekqQ==
X-Gm-Message-State: AFuF++lrrquSG5tdYicCiS966dPobRUfoD9EvkmgP3PBNyAe/7jO77jl
	v43I6LA1B/lm5NqARhYzTYaSXunzZdXrsE/DflQUNvjVPeIyp9a2wNBT
X-Gm-Gg: AYBFou1/03eaFruV+k/ZdA0hyZ5nvH+OmnuyTbsrdjTUyCbxGfqCKWE1L7HAxHQV0ER
	nXb9d6rk/QoeX+SBsSUte5aFw+N8hS4wjEJlkeCuLcpBLBTeAf5lj0gJrcnmmB5hWKwf3k+rTXH
	mtCtJXrRlpMRjFlTh4Aa52tTS8n54rgcgjnDfbcTk86aNDXRg+vRTVtaxATDzRefE9PBi/HYMs6
	ri/bc80dwVuAPvSJ+pO1VrJ7ANLyh+RoNCFm6ByCg2ObMbJ36a7V8u6CsT6i0U7oYnTvm0SxUum
	ObpNk/0Q3n5QoWfB3Ju1kMganJnE/IMMD8FNjxV+LnfKHnuY4ZGdQiPH59a0Bz2hYvuiiZk6ChG
	oZMoiaXEgYeYWi9oB0hevolMhcN+5ql0gSUhnLV8dG0nbRdMh/NVENhPzB09SUWEjkZCa9DCSUU
	6uxuNFWp+3ApQJTT7PN4/bLGASZ99iS7mjRsv3UgiGumUTTy3oOcZ1zNPwlbZ0
X-Received: by 2002:a17:90b:50cc:b0:396:65dd:4093 with SMTP id 98e67ed59e1d1-39b26202ebamr14823913a91.14.1788568561231;
        Fri, 04 Sep 2026 17:36:01 -0700 (PDT)
Received: from tradnomic.. ([2601:646:8300:7570:4132:9566:38a4:e435])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b2612ba2bsm6549744a91.14.2026.09.04.17.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 17:36:00 -0700 (PDT)
From: Rafael Alejandro Diaz Cruz <rafad900@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rafael Alejandro Diaz Cruz <rafad900@gmail.com>,
	syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com,
	Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH usb-next v2] USB: gadget: Fix UAF in gadgetfs_fill_super()
Date: Fri,  4 Sep 2026 17:35:58 -0700
Message-ID: <20260905003558.1686039-1-rafad900@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When gadgetfs_fill_super() fails, it's error path calls
put_dev() which drops refcount inside the_device to 0
and frees the objet. But the_device pointer is not
cleared, leading to point at freed memory.

VFS will then call gadgetfs_kill_sb() after mount
failure leading to put_dev() to be called on the
already freed pointer.

Fix by setting the_device = NULL during error path
before calling put_dev() inside gadgetfs_fill_super()
so that gadgetfs_kill_sb() skips put_dev().

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=4a5c87a01894ca37f25c
Signed-off-by: Rafael Alejandro Diaz Cruz <rafad900@gmail.com>
Reviewed-by: Alan Stern <stern@rowland.harvard.edu>
---

Changes from v1:
    
    Removed unecessary reference to syzkaller in the description.

    Added Reviewed-by: tag.


 drivers/usb/gadget/legacy/inode.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/inode.c
index d87a8ab51510..3e2bce7543d4 100644
--- a/drivers/usb/gadget/legacy/inode.c
+++ b/drivers/usb/gadget/legacy/inode.c
@@ -2059,6 +2059,7 @@ gadgetfs_fill_super (struct super_block *sb, struct fs_context *fc)
 	rc = gadgetfs_create_file(sb, CHIP, dev, &ep0_operations);
 	if (rc) {
 		put_dev(dev);
+		the_device = NULL;
 		goto Enomem;
 	}
 
-- 
2.43.0

