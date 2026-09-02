Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4F4361651
	for <linux-usb@vger.kernel.org>; Wed,  2 Sep 2026 05:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788325296; cv=none; b=MMcXnalF/IeM8VvRMXAFBKHa1h9IpCXmWWrtwlpj+JJJaR30N8udsWSYhs6gf1BawQw+KD9MUGytH4XEmgeo+ph7buZPEvDaSifoZNUTGPZQlNBQN5jSMY1ACgo9XU55r4q4ADHZsuS1TJF0D7GePY0HclWg3wNxx5zlH+NAex0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788325296; c=relaxed/simple;
	bh=5mVDL4kqExw9hIknIEfIlCKSYbg9TjUWlFav0ecLMks=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B+W0bAwKuQHPGr/Hh7fMjJZZVpk21rePWDWgrvH3RxV5xEZ0xIWkkTp2AW2qCrCRoEQoTn5vpf4W3O43oTwLpeT1S9xyMpwBSAB44Xu8kad0Jl9nYYzSwXMe7mXnYt7tLPR5Wew65JQDDQNQy/hvsYFQyUIo4e9WX6iMF7RA9DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D/K+31rE; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D/K+31rE"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-396750cfee6so539230a91.2
        for <linux-usb@vger.kernel.org>; Tue, 01 Sep 2026 22:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788325295; x=1788930095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IQNqD94j63s6WRrqwJlb9dpJ00oMA6/fQfx2maPK1DY=;
        b=D/K+31rEN9aGkhxoAOGFFz+oY7t/6BumnhoI2Q9u15+H6j5umMn/L0r7Qp613BSYRq
         Q2z/4BAyWdzK+hpqeSAX9ru89sgPy3w8pSfxZXK22YQdjcJcd3kaOEUtny9OMib1Km8J
         zz1JbDSciOHzkN4ExWxHr3/p9s3VbZNe1GZ3meAjRhWiINivuAFziKP4e+cGQYAocAHo
         YPmFf+UQSpCqjyRvXoR5hNsjWUfaFVqyw5SgpLS5D8gZd0auqby1qivwVj9zkhqalx3Z
         rWs8X2DVcWMrb3RBWruMWLQXhLKEClr5XEZwQyMd5DiG+FXB3UeKcoo9JsELQg1+kCLU
         OOYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788325295; x=1788930095;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IQNqD94j63s6WRrqwJlb9dpJ00oMA6/fQfx2maPK1DY=;
        b=AJJD0enE/qhAhY/zAJJT3TxkTO4kyQ6v5HQEsNWY/G4N0fkEXCLi14kAbhEXmhvXRN
         22POjVi0P+NvWTHRzSFRoeyGo722alzTlDT/3NakZq7QfOjkRHrE9vJ+0979OLUXZhNO
         8dNOcCNZeWtwvu6VbHxCzYJGMyUoNSzqu8vhRuKlsIDdgl+N+XlwVoxiKJYgIw9aAbeF
         zrtlSGz3HcMR3gkxHlzC9d0cPBJq/tmnPmobo8sYfibgBYHzPt/dulyIOcnWuwlDqYbP
         p90bKlA7o4pWTmlPwf5uSN2cKhHUlAhZZshzHOOlmSuL7AKGDKY8SLbRY1nGHC97Z0VV
         qUAQ==
X-Gm-Message-State: AFuF++mzDkozF1dO40dkE4pDQsX/Tam2E42wxLNZYAwrqq8VuNgGxu7h
	FXWq0GTBxcSnAtqIu9+aRaPADdAP5Ag6yDmG4QJOPmRJyf4EnYSpfKy8
X-Gm-Gg: AYBFou0sD3+jE1MdGkMw3UsU8Eji74Mc+E7I5j0Rqyd+lb+d0m7ns90IJI4n6byOIvk
	QvZMwNhKXjE0qLUkhMSjt+N1Jcc5yDB2QK4MHRiw5SxcQ3gvCaV4sLQ539URi4lLxaZA3Y/lu4y
	+xTalKefIIhV2nNIsrpsHad3bWqx+dpy7VVtoAGtCk5ildXGAuf+YVenohcvZbJ+uzLxy+f3Jlu
	Pt7KQqKQrspLZUrO1W0f52OgL2dD3UJLDVSPHb+Z4ZEAJNN/LXo8qlyttCtGCfZl/GuyhgLqSwl
	1BRf0YdH1xIb/ffnJFqjrYVnL5rowxTcE4Ppp/pT/6MZ5hIf8WCkrWnV0gzH7iNcQVGDbGyMJIg
	j2EYv9TCQrwanD38b51WaUYdZJFTYi9VoqXL3UMC5MRO83U5KE28eC5gkwCh7EnEzrgsIf1grgX
	qtOtGLdjuIbUNLfrfmk5gdc+qqetBw7sDnRSyV99i0VwRWa9McS1PuQTv+g13MLQ==
X-Received: by 2002:a17:90b:3890:b0:381:a766:efc9 with SMTP id 98e67ed59e1d1-39aedee8f9bmr2979710a91.7.1788325294918;
        Tue, 01 Sep 2026 22:01:34 -0700 (PDT)
Received: from tradnomic.. ([2601:646:8300:7570:1bf0:3629:a2e2:397f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae380d0bdsm3010758a91.11.2026.09.01.22.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 22:01:34 -0700 (PDT)
From: Rafael Alejandro Diaz Cruz <rafad900@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rafael Alejandro Diaz Cruz <rafad900@gmail.com>,
	syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com
Subject: [PATCH usb-next v1] USB: gadget: Fix UAF in gadgetfs_fill_super()
Date: Tue,  1 Sep 2026 22:01:27 -0700
Message-ID: <20260902050127.3767049-1-rafad900@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

UAF is caused by syzkaller reproducer forcing
the failure of gadgetfs_fill_super()

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
---
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

