Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76ED82FE056;
	Sat, 25 Jul 2026 12:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.181.215.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784981326; cv=none; b=bvIOM7nhNieHeT6OW+kjeeAnl64zNDRXbiwgcMkOeICW1+szMOzeArU7WldVjtnXjTEvVNAGuK1ag/WtFw7gfZJn7vNKohDxhagJ9gJf1PY0XPLF96/W9A6N6H9lonFwjiu8U+E/DkgVp+i6qXlOUJ86SRGadmMesmvhrDp5MVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784981326; c=relaxed/simple;
	bh=08EeSae4ZIM4YGb4x00whLmFzeEOn004ohmV7ljjZYY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RDKVm+WmI+sBrmQyIGc35vZy45kmHcdwAMhoQ+VDexxkLvOlNn8aQ66ArLmMcN7VZEFsT+B9ykjB18+OlvBjcmoeF1nMzI8OiOcaIFjFgnuQbXaLDsTveVlQT0PbsUyK72K3LTdpQ0Pae1g3eluNbLArkoY2cbEGYkUJqztP/Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xff.cz; spf=pass smtp.mailfrom=xff.cz; dkim=pass (1024-bit key) header.d=xff.cz header.i=@xff.cz header.b=Vgqk32wi; arc=none smtp.client-ip=195.181.215.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xff.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xff.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xff.cz header.i=@xff.cz header.b="Vgqk32wi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
	t=1784981322; bh=08EeSae4ZIM4YGb4x00whLmFzeEOn004ohmV7ljjZYY=;
	h=From:To:Cc:Subject:Date:From;
	b=Vgqk32wi6OejonSswe9vuUxu47/ayg1ZZx9sxUEFaHa3tRzZa4pc47VxsGQf3YPDR
	 bY8NzeoauRU1/P1YzVRYwB6uH/bSHSkme4UdQOdvWtryu4y3Y1CWhKu0RqVUQ6fmEp
	 P19ROWLu3ARnekNDyKvttGRDy/4oFt08uPpbj19Q=
From: =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megi@xff.cz>
To: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ondrej Jirman <megi@xff.cz>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Sam Day <me@samcday.com>,
	Michael Bommarito <michael.bommarito@gmail.com>,
	fanggeng <fanggeng@lixiang.com>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH] usb: gadget: f_fs: Init reset_work at alloc to avoid kill_sb WARN
Date: Sat, 25 Jul 2026 14:08:34 +0200
Message-ID: <20260725120838.2263579-1-megi@xff.cz>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ondrej Jirman <megi@xff.cz>

ffs_data is zero-allocated and reset_work is only INIT_WORK'd on the
FFS_DEACTIVATED path in set_alt/disable, which the normal flow never
takes. ffs_fs_kill_sb() then cancel_work_sync()s it unconditionally,
tripping the WARN_ON(!work->func) in __flush_work() with a NULL func.

Initialize reset_work once in ffs_data_new() and drop the redundant
lazy INIT_WORK calls.

Signed-off-by: Ondrej Jirman <megi@xff.cz>
---
 drivers/usb/gadget/function/f_fs.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 75912ce6ab55..a7b08180277f 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -54,6 +54,9 @@ MODULE_IMPORT_NS("DMA_BUF");
 /* Reference counter handling */
 static void ffs_data_get(struct ffs_data *ffs);
 static void ffs_data_put(struct ffs_data *ffs);
+
+static void ffs_reset_work(struct work_struct *work);
+
 /* Creates new ffs_data object. */
 static struct ffs_data *__must_check ffs_data_new(const char *dev_name)
 	__attribute__((malloc));
@@ -2222,6 +2225,8 @@ static struct ffs_data *ffs_data_new(const char *dev_name)
 	init_waitqueue_head(&ffs->wait);
 	init_completion(&ffs->ep0req_completion);
 
+	INIT_WORK(&ffs->reset_work, ffs_reset_work);
+
 	/* XXX REVISIT need to update it in some places, or do we? */
 	ffs->ev.can_stall = 1;
 
@@ -3775,7 +3780,6 @@ static int ffs_func_set_alt(struct usb_function *f,
 	if (ffs->state == FFS_DEACTIVATED) {
 		ffs->state = FFS_CLOSING;
 		spin_unlock_irqrestore(&ffs->eps_lock, flags);
-		INIT_WORK(&ffs->reset_work, ffs_reset_work);
 		schedule_work(&ffs->reset_work);
 		return -ENODEV;
 	}
@@ -3806,7 +3810,6 @@ static void ffs_func_disable(struct usb_function *f)
 	if (ffs->state == FFS_DEACTIVATED) {
 		ffs->state = FFS_CLOSING;
 		spin_unlock_irqrestore(&ffs->eps_lock, flags);
-		INIT_WORK(&ffs->reset_work, ffs_reset_work);
 		schedule_work(&ffs->reset_work);
 		return;
 	}
-- 
2.54.0

