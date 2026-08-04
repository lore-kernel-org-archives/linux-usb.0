Received: from forward205a.mail.yandex.net (forward205a.mail.yandex.net [178.154.239.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C76463B72
	for <linux-usb@vger.kernel.org>; Tue,  4 Aug 2026 13:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785851766; cv=none; b=h4PtIgGMANQ3nEdpNeCnzwgEt+Gij/WSdybeN7oyugszCbGAdyhLS4cGjHyVGNAbaHOMAE+TNpZUWNipDp7he/9+gJSQ0kBCpofbTqKmECU6iKeMc1wl4SF/Km95AK7Maz1fj/ADU81ITKYEmanyxTAqWdeJgzudrmuEV9tvC2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785851766; c=relaxed/simple;
	bh=a4r8CPNDLxb57ETc5bzXNpvQdNrLiWXcY4LnFsko7ww=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EzL1sdK3VB8Vf/WnL/K+1IyiMuW40jYOD6Zmk+PZU8HvEW8QS2//tXkBTx1IEfWyaxD3r6npo328xSLfe2i0JwEbS+K347pmy3paC5cGNsXX+Wn+Ci8CmXBWnHSTZYzq99kmqYN+Ra/bfvpHW5p3b/tmnqJN9DX5vf6s2vR2OMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=tB+6fT2z; arc=none smtp.client-ip=178.154.239.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="tB+6fT2z"
Received: from forward100a.mail.yandex.net (forward100a.mail.yandex.net [IPv6:2a02:6b8:c0e:500:1:45:d181:d100])
	by forward205a.mail.yandex.net (postfix) with ESMTPS id D19F7C989A
	for <linux-usb@vger.kernel.org>; Tue, 04 Aug 2026 16:49:49 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-74.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-74.vla.yp-c.yandex.net [IPv6:2a02:6b8:c22:d15:0:640:87c2:0])
	by forward100a.mail.yandex.net (postfix) with ESMTPS id 45C3BC046F;
	Tue, 04 Aug 2026 16:49:42 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-74.vla.yp-c.yandex.net (smtp) with ESMTPSA id fnkIWN7d9a60-ieufxwsN;
	Tue, 04 Aug 2026 16:49:41 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1785851381; bh=J31sess3ZgYNdkaCCvHBs6OXYt8AFKKUntOyb+00qo4=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=tB+6fT2zidjAnJDlrO1re+dtoYQvH7Bov0t4my6vy8Y3Q/ewNRMsliBhomap/IDbH
	 ryqEU18Psw5cRDsss6HRi1z+blxB9qlHi7WotQZpl7/QTj3VHyIc2nQrtlsmAbB2qL
	 P7KSVfrz9cY2DaKpHK+4TP4zDMGdrUPcDTjJvYgA=
Authentication-Results: mail-nwsmtp-smtp-production-main-74.vla.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH] usb: mtu3: simplify mtu3_probe_write() and ssusb_vbus_write()
Date: Tue,  4 Aug 2026 16:49:36 +0300
Message-ID: <20260804134936.651880-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify 'mtu3_probe_write()' and 'ssusb_vbus_write()' by using the
convenient 'kstrtou32_from_user()' and 'kstrtobool_from_user()'.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/usb/mtu3/mtu3_debugfs.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_debugfs.c b/drivers/usb/mtu3/mtu3_debugfs.c
index c003049bafbf..a70daf77873c 100644
--- a/drivers/usb/mtu3/mtu3_debugfs.c
+++ b/drivers/usb/mtu3/mtu3_debugfs.c
@@ -300,14 +300,12 @@ static ssize_t mtu3_probe_write(struct file *file, const char __user *ubuf,
 	struct seq_file *sf = file->private_data;
 	struct mtu3 *mtu = sf->private;
 	const struct debugfs_reg32 *regs = debugfs_get_aux(file);
-	char buf[32];
+	int ret;
 	u32 val;
 
-	if (copy_from_user(&buf, ubuf, min_t(size_t, sizeof(buf) - 1, count)))
-		return -EFAULT;
-
-	if (kstrtou32(buf, 0, &val))
-		return -EINVAL;
+	ret = kstrtou32_from_user(ubuf, count, 0, &val);
+	if (ret)
+		return ret;
 
 	mtu3_writel(mtu->ippc_base, (u32)regs->offset, val);
 
@@ -470,16 +468,12 @@ static ssize_t ssusb_vbus_write(struct file *file, const char __user *ubuf,
 	struct seq_file *sf = file->private_data;
 	struct ssusb_mtk *ssusb = sf->private;
 	struct otg_switch_mtk *otg_sx = &ssusb->otg_switch;
-	char buf[16];
 	bool enable;
+	int ret;
 
-	if (copy_from_user(&buf, ubuf, min_t(size_t, sizeof(buf) - 1, count)))
-		return -EFAULT;
-
-	if (kstrtobool(buf, &enable)) {
-		dev_err(ssusb->dev, "wrong setting\n");
-		return -EINVAL;
-	}
+	ret = kstrtobool_from_user(ubuf, count, &enable);
+	if (ret)
+		return ret;
 
 	ssusb_set_vbus(otg_sx, enable);
 
-- 
2.55.0

