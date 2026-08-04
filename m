Received: from forward205b.mail.yandex.net (forward205b.mail.yandex.net [178.154.239.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6382E738F
	for <linux-usb@vger.kernel.org>; Tue,  4 Aug 2026 13:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785851867; cv=none; b=Fg5hRKvQP3erlT4kuyox+tnoSPZrd8WBXnFZyKY688TgIbKKlquqTplUqC/jIdvZCQ/mqRmJSSumCjnKtMXKssufXjSiYqI0S5eviyvasKlTelF9m2bHmAkWV8YeRhNYY6r+7zCWNpE0XCj+r3x6h4u6m/Vu3r4+zspV3WCpbf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785851867; c=relaxed/simple;
	bh=Hjr6dmhzxqD/u6uJeF9t1AhwzhhqfwhkwKFdImpETac=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dT+Hgfvhq97EJnh9/BTlVEop/9GeZy6ibppacWulbXhg6GcATppXDQLl+OP8d5rqaYOayBlx5U8yPxyY34gOnf5WNNNRpLfdUnfj5lrpttwT//+gvz1out2TU1fuZ5hnY+gTuVs64htct7q6AiYt0CfDZ6T8BKf4FbS+0qxeqW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=a+kUHa5b; arc=none smtp.client-ip=178.154.239.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="a+kUHa5b"
Received: from forward100b.mail.yandex.net (forward100b.mail.yandex.net [IPv6:2a02:6b8:c02:900:1:45:d181:d100])
	by forward205b.mail.yandex.net (postfix) with ESMTPS id D583388DA9
	for <linux-usb@vger.kernel.org>; Tue, 04 Aug 2026 16:50:03 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net [IPv6:2a02:6b8:c11:1199:0:640:2d84:0])
	by forward100b.mail.yandex.net (postfix) with ESMTPS id E2263806E2;
	Tue, 04 Aug 2026 16:49:55 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net (smtp) with ESMTPSA id inkREv3gMmI0-C90kx6MG;
	Tue, 04 Aug 2026 16:49:55 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1785851395; bh=YQmmI9CqWPU9Jd63yM11Z4pViOQMOyeaKjidWe7k4XM=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=a+kUHa5bMbUslkGSDuu5vv1QrZKSShU7K1JN/tnjwbhje+j/TolfI4FBV0yNzrV1m
	 U8lRtwOBbgMuYE6OFKjGL5IZxL6HilKUnfFIB7b1CNVVI5X/dlu8pW3HGkBOjYaswd
	 BC6W8B5OiCDzs7biwmpPM268wdcDd0fIq2RjT+IQ=
Authentication-Results: mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH] usb: dwc3: simplify dwc3_lsp_write()
Date: Tue,  4 Aug 2026 16:49:43 +0300
Message-ID: <20260804134943.651893-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify 'dwc3_lsp_write()' by using the convenient
'kstrtou32_from_user()'.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/usb/dwc3/debugfs.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/usb/dwc3/debugfs.c b/drivers/usb/dwc3/debugfs.c
index 65d909e4b785..01ebd73198e0 100644
--- a/drivers/usb/dwc3/debugfs.c
+++ b/drivers/usb/dwc3/debugfs.c
@@ -367,14 +367,10 @@ static ssize_t dwc3_lsp_write(struct file *file, const char __user *ubuf,
 	struct seq_file		*s = file->private_data;
 	struct dwc3		*dwc = s->private;
 	unsigned long		flags;
-	char			buf[32] = { 0 };
 	u32			sel;
 	int			ret;
 
-	if (copy_from_user(&buf, ubuf, min_t(size_t, sizeof(buf) - 1, count)))
-		return -EFAULT;
-
-	ret = kstrtouint(buf, 0, &sel);
+	ret = kstrtou32_from_user(ubuf, count, 0, &sel);
 	if (ret)
 		return ret;
 
-- 
2.55.0

