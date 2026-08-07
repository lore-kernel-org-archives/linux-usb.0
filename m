Received: from forward201a.mail.yandex.net (forward201a.mail.yandex.net [178.154.239.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF7F418345
	for <linux-usb@vger.kernel.org>; Fri,  7 Aug 2026 08:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786092523; cv=none; b=hpYyvVYSXL59W2ZthEJYBjjYxGAVM/I+UZ6l6kWFIIhCzo5w5CFFeS7n+7nGIfEIK6Gi8MId+7F5+Vt5ZKhBqbldhoUMj/hQrsyMlYDecgmF7cQ6Ebt4NSWv4azTK00vo6spSW3KeBM5yt1KVO8wos2D4TI23uWDTu8yRTsoPsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786092523; c=relaxed/simple;
	bh=cRLULwcCvXsnrokUO7cF8kl7pnpAHs1Imv+MqODSAGg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bunsWtllbRJnfLtaaDYJ6GRuJ1f16y4lRlyhO7W6RGP6MAFInzsdp5TH46+b81eIvUHzeLp5uBqDAxkYUlA26K40J615dw0zd2LUylcGjdycznb9RaOxxmTCbPVUTzIeUfi5niP4l/2SFgm/AWzMgGipftVtVTSiFxaGrK7FBmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=ZYkSKUDZ; arc=none smtp.client-ip=178.154.239.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="ZYkSKUDZ"
Received: from forward101a.mail.yandex.net (forward101a.mail.yandex.net [IPv6:2a02:6b8:c0e:500:1:45:d181:d101])
	by forward201a.mail.yandex.net (postfix) with ESMTPS id 2BED887DEF
	for <linux-usb@vger.kernel.org>; Fri, 07 Aug 2026 11:41:08 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-74.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-74.vla.yp-c.yandex.net [IPv6:2a02:6b8:c22:d15:0:640:87c2:0])
	by forward101a.mail.yandex.net (postfix) with ESMTPS id DE57F80DF2;
	Fri, 07 Aug 2026 11:40:59 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-74.vla.yp-c.yandex.net (smtp) with ESMTPSA id weFKBYJg28c0-Qf9CL5pD;
	Fri, 07 Aug 2026 11:40:59 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1786092059; bh=hv/TS3TZjTAyWXo1wQSnC/Ez7fwNHKemJGS0gaMR1Qc=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=ZYkSKUDZyuUeYzGDfSXAUQ9SnLAFpEJ7xZ0jzcK049R1r2r1XjCJKSjFt2YnVbFRm
	 Qms+YK+lpEn5jqiDnjeK38L38Xd/BScmmFL97yzdT7813YmD1SJ/Ft7/9/3GJqLpE7
	 0BISghOBVex1+zWMrSd+B7hg0U+PPrkjPpEMXNak=
Authentication-Results: mail-nwsmtp-smtp-production-main-74.vla.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Dmitry Antipov <dmantipov@yandex.ru>,
	syzbot+901ca72278dfd89daf58@syzkaller.appspotmail.com
Subject: [PATCH] thunderbolt: verify PCI resource type and size in nhi_probe()
Date: Fri,  7 Aug 2026 11:37:57 +0300
Message-ID: <20260807083757.318371-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Syzbot reproducer at [1] enforces the kernel to probe PCI device 00:02.0
as Thunderbolt NHI. On QEMU/aarch64 'virt' machine, the device (at least
with qemu >= 11.0.0) is:

00:02.0 Class 0100: Device 1af4:1001
	Subsystem: Device 1af4:0002
	Flags: bus master, fast devsel, latency 0, IRQ 47
	I/O ports at 1000 [size=128]                           <-- Hmmm...
	Memory at 10041000 (32-bit, non-prefetchable) [size=4K]
	Memory at 8000004000 (64-bit, prefetchable) [size=16K]

So call to 'pcim_iomap_region(pdev, 0, ...)' in 'nhi_pci_probe()' maps this
128-bytes I/O ports area, and call to 'ioread32(nhi->iobase + REG_CAPS)' in
'nhi_probe()' issues an invalid access at REG_CAPS (0x39640) offset. Since
NHI's typical register window size is 256K, simple sanity check whether 1)
the region is a memory rather than I/O ports and 2) the region is 256K at
least should be enough to prevent from such a scenario.

[1] https://syzkaller.appspot.com/text?tag=ReproC&x=1564acc6580000

Reported-by: syzbot+901ca72278dfd89daf58@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=901ca72278dfd89daf58
Fixes: 16603153666d ("thunderbolt: Add initial cactus ridge NHI support")
Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/thunderbolt/nhi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index 0f795ea58756..724263c17b3e 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -1186,6 +1186,7 @@ static struct tb *nhi_select_cm(struct tb_nhi *nhi)
 int nhi_probe(struct tb_nhi *nhi)
 {
 	struct device *dev = nhi->dev;
+	struct pci_dev *pdev;
 	struct tb *tb;
 	int res;
 
@@ -1195,6 +1196,12 @@ int nhi_probe(struct tb_nhi *nhi)
 	if (!nhi->ops->init_interrupts)
 		return dev_err_probe(dev, -EINVAL, "missing required NHI ops\n");
 
+	pdev = to_pci_dev(dev);
+	if (!pci_resource_is_mem(pdev, 0))
+		return dev_err_probe(dev, -ENODEV, "invalid resource type\n");
+	if (pci_resource_len(pdev, 0) < 0x40000)
+		return dev_err_probe(dev, -ENODEV, "invalid resource size\n");
+
 	nhi->hop_count = ioread32(nhi->iobase + REG_CAPS) & 0x3ff;
 	dev_dbg(dev, "total paths: %d\n", nhi->hop_count);
 
-- 
2.55.0

