Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09EE4503BD0
	for <linux-usb@vger.kernel.org>; Fri,  4 Sep 2026 16:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788539925; cv=none; b=O+WLDEUdZihM2k4RA8NxDUZdQEBuJ063GN4b2kGOUHkQkVz0KnIO3DdcQDbVWL5/Mv4WwFF5w65fOBO0S/HBXaVhIUFFKqe/AxLURwKpQQtiT8saw45+F1ebQtLyXofT2EEHeKWdaTlc7cfcgwCCnlbBJ/T9xJbGRT1h/M6p8j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788539925; c=relaxed/simple;
	bh=VKAyMFOEHDxI3Q+8qBkxUa8/6iweGbt0YbZmWBPx1yo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HA1t/08U4qFkPFBZimIW8nu2qfS1Z3QKt+oQbIx3p30rmdeUgUrkgeeRh7tdFXiA5pxkr1DhZltpB14Iagwmg0jJo7pGqD0Y++6ZAF4BtGRtBKOxTufYR7OkH/6e7gJLY+3p/uYb/K752j5Rm36i1mwdPkmnqSc2UeHz73aa104=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NR7MPp0h; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NR7MPp0h"
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-78a4dff7ddfso278754137.3
        for <linux-usb@vger.kernel.org>; Fri, 04 Sep 2026 09:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788539923; x=1789144723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nz+wtM/LyIGrj670Oht3rIrfsv5KkPLkDFJBNKdd4+4=;
        b=NR7MPp0h27FJS3XuFZ79WX6Z+LUnuI6tR2OHDCTwni8XaK/VPhjKbHBpP6lnvBOHPL
         KkeJlnCyGRCYcinbnFFUrYDYhEYWipynoXSNBU6oxwqsID27aiw0WIixVH97uoE6XVCa
         AN+f7Usxh4y0T1cmg96iSrodqMauiQq08I4dxCRwkpEN5OSH6V0Vqzp8YqIaczJva+34
         /68s/dnVYp7v1C0btXsF7mN7oNbPWlfl0wSosRuC4ICMRIeLBZLfUnAfdG85eJVyLBfG
         MRQD0QtgETAeJfWpfY2HIARzQGRDUuVdSMM5xCFGid9/vKm21w+LV5TKIhjjYNyB5xtB
         ubHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788539923; x=1789144723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nz+wtM/LyIGrj670Oht3rIrfsv5KkPLkDFJBNKdd4+4=;
        b=Uf/mdxyT3Pw7sxjTQeGmaOa9bXVxfno4I0YiPCRQJI60dDvgqQCUjeaCXJwynAiYb6
         di95ncDB0x6BhtlC6n0XGCrvYFOE58aOvijab8sX6x+IQza37P5ZQpcOeyRERK59vk07
         pa4fwkPn0FOM5THVuWmI5s6gbh1ZRWISVcTabHJNnoyBHe30SGHuslNY9kEglgvaPgJ9
         2iWhvMK95HJwpjRCl4E4cuJFfnoBBip7LWzkgXEIMGaeabedG+Ui69L5wz2s+308gSRF
         jSe626T3lLljb/qFwC34v5it96KryX/Xia4paU0ELoCv8fNH8i8Dp8t1W2oIFCQwaJWY
         C19w==
X-Gm-Message-State: AFuF++lHT6c7VkDnh+p0EL5Ra+RLwg7fnqSMF7KWLHhTRn87R1HecQBR
	PRUamvHmGerSyiDWwcSq43gmg5W2SzMnqhZP24Eygudai+lNNvoQ/rdz
X-Gm-Gg: AYBFou0gkNjj2ad26TEEI7ZrgDV5QbuImiJ+pw9pYXncQ/oR7NQtjoka/Ip6VDKnIQs
	Z440tDaLEWz2auz4moyZOJz1Z9CojNo27b5jrRBdziJSIYQ7dGOUwi+sk55kUPG5+DJeiPt8GyA
	knnvs7ZkvJW46c1rdbikm3ARGD20PjDkN9QuLw7aVonHJOLBCUmQfjpXQsnqHrXUuq75niIBzkm
	pwQttIjRDJI+ZQD0iZgfD2HCxDlmIZCqEq9vp5T1TrmzO1ezQeoaAJykLCMWLaQemlXEITQkBYh
	0CD6jPuoKrgYZJ033t7DuwzcQeHzp/Hes386tLCssnEcqUAZJVMpF4yHzAzSwNLL0R0sGnBFTGB
	clbCWFgWXGDNHI36h0tWI0ccnSWIIAuZQdJPnl8Z5SSL/aWGLb4byDPu4T1AOwRy0ZkKs8tSgOD
	JYxusdujRSLR1MvtcZucWNiCabH1G7VY/WcGQsyQpaKhcItRvsheLEz2kVwGGB+vA=
X-Received: by 2002:a05:6102:5486:b0:783:f3bf:f9aa with SMTP id ada2fe7eead31-78a4a880c21mr2026426137.8.1788539922672;
        Fri, 04 Sep 2026 09:38:42 -0700 (PDT)
Received: from adriano ([190.215.95.120])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808ebb37fdsm2043176241.1.2026.09.04.09.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 09:38:41 -0700 (PDT)
From: Adriano Cordova <adrianox@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	Adriano Cordova <adrianox@gmail.com>,
	syzbot+7bf725ed337e37307001@syzkaller.appspotmail.com
Subject: [PATCH 1/1] usb: gadget: inode: fix use-after-free of struct ep_data
Date: Fri,  4 Sep 2026 12:38:27 -0400
Message-ID: <20260904163827.216389-1-adrianox@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gadgetfs_unbind() -> destroy_ep_files() frees each struct ep_data via
put_ep(), but the inode still points at that ep_data through ->i_private
with no reference of its own.  A concurrent openat() on an endpoint file
can therefore reach ep_open() and dereference the freed ep_data (the
mutex fast path), even while the inode outlives it.

Give the inode its own reference: take get_ep() when the endpoint inode
is created and drop it again from a new gadgetfs_evict_inode(), so an
ep_data can never be freed while any inode still points at it.  This is
also safe against dcache pruning, since the inode reference keeps the
count >= 1 until the endpoint is removed from dev->epfiles.

Reported-by: syzbot+7bf725ed337e37307001@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=7bf725ed337e37307001
Tested-by: syzbot+7bf725ed337e37307001@syzkaller.appspotmail.com
Signed-off-by: Adriano Cordova <adrianox@gmail.com>
---
 drivers/usb/gadget/legacy/inode.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/inode.c
index db961aaa3740..089fa7119922 100644
--- a/drivers/usb/gadget/legacy/inode.c
+++ b/drivers/usb/gadget/legacy/inode.c
@@ -1626,6 +1626,8 @@ static int activate_ep_files (struct dev_data *dev)
 		if (!data->req)
 			goto enomem1;
 
+		/* The inode keeps this ep_data alive via ->i_private. */
+		get_ep(data);
 		err = gadgetfs_create_file (dev->sb, data->name,
 				data, &ep_io_operations);
 		if (err)
@@ -2015,9 +2017,20 @@ static int gadgetfs_create_file (struct super_block *sb, char const *name,
 	return 0;
 }
 
+static void gadgetfs_evict_inode(struct inode *inode)
+{
+	/* EP inodes hold the reference on their ep_data via ->i_private. */
+	if (inode->i_fop == &ep_io_operations)
+		put_ep(inode->i_private);
+
+	truncate_inode_pages_final(&inode->i_data);
+	clear_inode(inode);
+}
+
 static const struct super_operations gadget_fs_operations = {
 	.statfs =	simple_statfs,
 	.drop_inode =	inode_just_drop,
+	.evict_inode =	gadgetfs_evict_inode,
 };
 
 static int
-- 
2.51.0

