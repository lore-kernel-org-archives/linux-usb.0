Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EB82E401
	for <linux-usb@vger.kernel.org>; Sat, 29 Aug 2026 01:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787966354; cv=none; b=Fu5WXeyl7VPam73yJ7VpU6iFR4a4eWiZDGG2x5e5Dcnf5qBeDdmfpg5mPVNmHA2NKjPZ/9njD70x76jT5/6+LXiAyszWmkEAyQIzACVhrGAQ1EdIs74J7UVZTXmAGvNEqAOAPizsFH2val3K2ZnmeZfXzTvqaBSYilXlNKVSjew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787966354; c=relaxed/simple;
	bh=HscXdFpNsRlkFpSvaVpcYt8mqsjP9QoFN8kKOJceJZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ezdJ7eZAULrz+x8xMGnQJJmx0nOC9tTD0coZEHJqzg6EiteHn6trmbN6aoyuD+tJWdk7beRWZ+Hix9/MFHE5D7FFxEaY1xktmTPzhdOqmvhJWi07sAdKew7FBxoOcjRbXZ399oBgy4EWEQ7C3PbWm/1/tyAEd4ruTNv13DH/jgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F1Xd6sBx; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F1Xd6sBx"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so407772a91.2
        for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 18:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787966352; x=1788571152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fZg8mAdLVuaPOBvQhtWMylhZ2H86Gw6DTQC1M2Z4EuA=;
        b=F1Xd6sBx3vrV87skcElJnPIPJBt/P28uvFHzZ2w41E7w0S529D5Gs9VAEPFd7o6UHW
         xPpArbTSNB7K8m6BsR7K4p1Ug2IfLHhHRXYG1HDqIVX9p/l/C6+yD4K2B8qDXZgakWTI
         kN6L3dLJgBBbiHH7XnDOvd7Vjxj7QVfOkg+b1KVwOCQIeWVwiZmx7250WtldhvGJZ3ce
         oxDMArggVi90A/vz7yIaCfOuXBRLJqEFYAZMtzp1b+P6LYJtGyrQBrzFDmWFr822T8VP
         RvBfqWxqnwT5wXCGvu4T5khNiuaqzTrZHWNkfNLRo1oEN0J5nIW1jly1RmL8fceuWsKo
         H1tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787966352; x=1788571152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fZg8mAdLVuaPOBvQhtWMylhZ2H86Gw6DTQC1M2Z4EuA=;
        b=J5pAvBRFh3YUc+iy+Joo8ORt0hvfwd0ExDmdc5FLQEgu4vnm0R6oP5UCQsZdIf/45x
         XZnjhSDYB83j1tuHRchcrRBTSa2QyaLoTFs/WzO+LH2E9TbDe78VOkSILTHs2O+428Oj
         MdxM+Ux7XFDGHrVnohy6Fh8+LG1r9arpPBu3paob3ohfHPhPN4t/1JgMLPKs1w3awsN2
         6NyDpmlEWf4U/INJ0UnCXV7KS2DFAxFVgEOvP/nwoinHDWSwRmW8TWxzRtuR0rIGHDBn
         4xRQ7+J6V0bn3h24rhTGhxU1eye6a5txgKrS6l2tCgU7Ddhbfa4jQ8wgYXK6qw2bgwYi
         Bcgg==
X-Gm-Message-State: AFuF++lJINDW6YtTeo0dvu16+XaCdx7MEbUKagHdolbaB4/ciIg3n5h1
	djTiOevMuDfOe6fgDk4b1fshx09E/NMC5n13lAlaV46DEqPhA5o+XoA2
X-Gm-Gg: AYBFou0aXga0D9eAE+mDmyaB+vihbwJF3M6zOkuubeYUDLpcipmk46WZTCI0y227nvB
	2l31tCDZVdBIRodckNVtYbDzr6Iwx2IIZitZMDzT6IxWIkfO5S13cz0k3LzvyW814G4tSEje6eD
	FpiuTJXv9g441CfYRo4+vBbyG2dFfjNT7yOUfjDIxufDLev/XK61nVu8tYtVkLcRr+V6zMHgBlU
	LQE1fde55HoCfuYHPkmlY3AC1yyYeZziaa764kFkw1zoX7rsxBd4k29WAd6VomYuCUDa7ISLSyS
	GqqzcxR5sY7FTkD3c3QT5VLjG9246+OX4hre4z3SdAXQG3PJy8LgTqJPeXHbmaUq9a9cy7L9cpS
	WJUyqmVLaZSP1UxbVA2fhSsk7FgZJD/rtbKqNHIhFWExLWJM9/7SAMAquRsrGD8h1O/epTvCwJ/
	op8LaFDleThB3dDUoD5zYSVZtmj2WRnpxGTEfjxf5g9oRZJ2y7TluH8ZPaaPr1PQ==
X-Received: by 2002:a17:90b:2e48:b0:380:71eb:4014 with SMTP id 98e67ed59e1d1-396d0feda32mr18850877a91.15.1787966352081;
        Fri, 28 Aug 2026 18:19:12 -0700 (PDT)
Received: from tradnomic.. ([2601:646:8300:7570:a9a6:70a4:308d:c424])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e41837c6sm6833167c88.11.2026.08.28.18.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 18:19:11 -0700 (PDT)
From: Rafael Alejandro Diaz Cruz <rafad900@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rafael Alejandro Diaz Cruz <rafad900@gmail.com>,
	syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com
Subject: [PATCH usb-next v2] USB: gadgetfs: Fix use-after-free in gadgetfs_kill_sb
Date: Fri, 28 Aug 2026 18:19:01 -0700
Message-ID: <20260829011901.325379-1-rafad900@gmail.com>
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

However, if the fault injection from syzbot failed 
and it began the open()/write()/close()/unmount()
sequence then close() and umount() will each trigger
the refcount to drop once via put_dev(). This will 
still cause UAF since refcount is only incremented 
once on creation but decremented twice. 

Reported-by: syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=4a5c87a01894ca37f25c
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Rafael Alejandro Diaz Cruz <rafad900@gmail.com>
---
 drivers/usb/gadget/legacy/inode.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/inode.c
index d87a8ab51510..77efa984ce84 100644
--- a/drivers/usb/gadget/legacy/inode.c
+++ b/drivers/usb/gadget/legacy/inode.c
@@ -2059,6 +2059,7 @@ gadgetfs_fill_super (struct super_block *sb, struct fs_context *fc)
 	rc = gadgetfs_create_file(sb, CHIP, dev, &ep0_operations);
 	if (rc) {
 		put_dev(dev);
+		the_device = NULL;
 		goto Enomem;
 	}
 
@@ -2066,6 +2067,7 @@ gadgetfs_fill_super (struct super_block *sb, struct fs_context *fc)
 	 * from binding to a controller.
 	 */
 	the_device = dev;
+	get_dev(dev);
 	rc = 0;
 	goto Done;
 
-- 
2.43.0

