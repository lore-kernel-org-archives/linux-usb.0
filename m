Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6203E31F9A3;
	Tue,  2 Jun 2026 03:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780371882; cv=none; b=JENd9XDcYlEhyzCFj95fFXUbD4x8IPp4a51c5aXAHYFNjtLfAHsHQrAaBoXfKSgb3nT7Qmxxkn1oJ8KxfhjCFVMoHiiATdWVoBrfEEpbK8Imvk8xPxA/D8AtHzuX2imq664sB1oNBHcSq7eWrQZs+j0jnuiha6D1r1WQX5J/5Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780371882; c=relaxed/simple;
	bh=jZ6pdMKOSFoDgnWsiBPRh8wXBbltts9dTS8KFsS6qeI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DcjPyrlGYR3H/sPwruRqHgx5VYVwY0tgqGN+YbiHCNxTwbUKFVWYOJspo2luvgy3u6uO/dwEVWFGTHqjiRBkL4q1IAYrFteQO696z6JmoLWpvnCTq4FcDd8hLXCOS/lsH8OhSg4gc1wRO4fXEoUel0ZXSSBWCzv/ifDMqQGdvrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=eY7e8zCI; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="eY7e8zCI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1780371828;
	bh=i7aAmzR2EINuxTnlO7fEKPv5dwDRoSiK5DmceKSw77E=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=eY7e8zCIR//OhR/w34DwSGZdk/CwTlrnSo1Xts8keZZT5//wRzfSz79rH5Y5hVK6R
	 SJk9XEN8KFAglY4soT1kau3vAhrM72APQvBoFBokAtbjLzxuQPMrfmIWv5Yix3nErh
	 RbuHwzW2uJCJggVtJpx4OUe1Z6g5HcjvJxQL5Ado=
X-QQ-mid: esmtpsz19t1780371811tcc362642
X-QQ-Originating-IP: zZRLl9JCMib1ECIoWoisp5aRgtrNKr/GFKDAqDbs6vI=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 02 Jun 2026 11:43:29 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 15405620555191542574
EX-QQ-RecipientCnt: 9
From: Xu Rao <raoxu@uniontech.com>
To: gregkh@linuxfoundation.org
Cc: mathias.nyman@linux.intel.com,
	niklas.neronin@linux.intel.com,
	stern@rowland.harvard.edu,
	michal.pecio@gmail.com,
	ukaszb@chromium.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	raoxu@uniontech.com
Subject: [PATCH] xhci: sideband: fix ring sg table pages leak
Date: Tue,  2 Jun 2026 11:43:27 +0800
Message-ID: <53B0BFAB966BDF11+20260602034327.2780520-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NNCgUTg3ctKTVkWMMleBohom5xFX/nhEOjdgIEG8pHLl+Xg43LVK1aXH
	KJBqOzTVBSAJaU+XwISrYvHKlI53Mh3ZwbTtl2TWUxYaqRIcLeQ77NVqFVXHsx0SoyHqB8f
	SURIj6p0OWL8df4j5Oq+FlbKiYBNbZAnHG5cB45ODHWt8OJKKlRhr0/YHAFGR16kmzA4Lc9
	CKAGd6yHkMYE1i05Qkhd7fWO75LjuToBKKTuHdUB1G5XzQxnhzgNpaBpalLsAQhbq6zDmwk
	z2G4laRYknOLYk5TpDqnXI19XhfIxMtTe+TBCNrOje85R7bQXkoprs0TScSF4gZAiX/ueaL
	HSuweR6VUwS9EBbNwdumD3AjPMnqp3V5xsT8n931KFdFmSWWbZMfwqME6wfWGY30Dvo7PUj
	GXiG9dEX9vR4cXf1TveLNhivQPuLdAkSJ9NUxGXKs9es5KaQ5VRgkISWPDNtIE3NiJaAGxF
	fK2RDshFejvlTAkN1/+XIIXWP5gS8gQ+45KzSOcURgqdxOeg1iIPtNeNKuioyxAdHx6WN0H
	K6ww7+jhqSUyRdpUuODNEaUbO4W6NcgxkipkihfxA6/ey9K5OZjx0sTlnwZ207VpSOEVqnD
	rHzPKVVsoLPW1fcqYMsbVijuLy+7pxnrwByGk2RBgRJxMtdMWYtqI4jb84lgfqjDvFZOyYo
	gEUF7JhrLEjpR4JFoo87GjY7hL+AsfTsv5J4K/v5JQsq6khtzssTzAyRTKVc41jzb4JF5Bg
	shuyRnJH/MMmiHX3keUrnIfpodnuLecOtKpBsDAOCHLFR6YeMdOL4PnrdaSJvUly29R8k61
	7IC2KOGhX5kr9fnB2C852Ias7VSMRZPeVv+9YtE2go3ZzqGVAKIOuBq2mDbYez3uEOZe+FH
	atOMIOCyAZIYsb0aw/HbUMglj3fINJqqMI/GUvuKLu3oggi9LEDBXaIz7QeUZ5sr6Qa4j0b
	hFcUmfDfU311j3tm9DasZQyoL0qUtf4Rte1X8Bd2EIEEPpk/aRdskp7o3YX+/RNxEc80KvR
	jgdtmvdw==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

xhci_ring_to_sgtable() allocates a temporary pages array and
uses it to build the returned sg_table with
sg_alloc_table_from_pages().

The error paths free the pages array, but the success path
returns the sg_table without freeing it. This leaks the temporary
array every time a sideband client gets an endpoint or event ring
buffer.

Free the pages array after sg_alloc_table_from_pages() succeeds.
The returned sg_table has its own scatterlist entries and does not
depend on the temporary array after construction.

Fixes: de66754e9f80 ("xhci: sideband: add initial api to register a secondary interrupter entity")

Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
 drivers/usb/host/xhci-sideband.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
index 23153e136d4b..a5deeee4d5dc 100644
--- a/drivers/usb/host/xhci-sideband.c
+++ b/drivers/usb/host/xhci-sideband.c
@@ -58,6 +58,8 @@ xhci_ring_to_sgtable(struct xhci_sideband *sb, struct xhci_ring *ring)
 	if (sg_alloc_table_from_pages(sgt, pages, n_pages, 0, sz, GFP_KERNEL))
 		goto err;

+	kvfree(pages);
+
 	/*
 	 * Save first segment dma address to sg dma_address field for the sideband
 	 * client to have access to the IOVA of the ring.
--
2.50.1

