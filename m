Received: from smtp153-165.sina.com.cn (smtp153-165.sina.com.cn [61.135.153.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195F225333F
	for <linux-usb@vger.kernel.org>; Thu, 27 Aug 2026 01:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787793728; cv=none; b=kgxfp86NK9/vmzqca3iCFhQa2mD14Y+s4IxF4ipkEXtBEy5nvmeWU7F3ta08R7QTT494Au2OLtNzofKSr2d9TVx7L5oq2xddy98AV1uXsjhE4wo1jDd/5rPMcgtDQ6d7IrmRXMHKB8E3hGiagSv7oTvhpa7qkQLpUg0jOt/A4OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787793728; c=relaxed/simple;
	bh=yhf5Ls84xb0/YZwUOsBoga31kGHBT2Vd0FH8biQ6HaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F+WXZFNdeZWzeJitiZKy7FmIQz4S9azzAO5R1/C1pJkRM6QZ9gLguIhJTrmos5vHCSnjai6iREDOEdmildjSMpUD+uc55JOw38KT/0VwNCw8S3+jyBp9gdyWNAsXgi6iwJUcMncDjxU/RIcF3+n8iLbrsfKif8Uk87nRtONnZW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=GM5dfmNY; arc=none smtp.client-ip=61.135.153.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="GM5dfmNY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1787793721;
	bh=69qLh8EeIZ5aLPcwqXu/mKGH3VIeMnWhYQZeUdr4/RA=;
	h=From:Subject:Date:Message-ID;
	b=GM5dfmNYwDfdBoNoofd12YJMb6px1VRTK/W3paencj30e9mRR2xfwOkUKcETOxdPD
	 iFqbd2tVnjmKw56tpA9LItAvHSa2lKRb8AvUBUe0CIEZAThQmcSW7D0FXr73DEnppf
	 4n/iQ/kgtpKrBA+sGOjaI8dvB89o+EuGSMzQuAL8=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.32) with ESMTP
	id 6A8F913200004E5F; Thu, 27 Aug 2026 09:21:56 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 3743344456686
X-SMAIL-UIID: 3FB25119A80B497392AB0B22052E266E-20260827-092156-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+06fa667a0931a3430026@syzkaller.appspotmail.com
Cc: gregkh@linuxfoundation.org,
	i@zenithal.me,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	shuah@kernel.org,
	syzkaller-bugs@googlegroups.com,
	valentina.manea.m@gmail.com,
	suwan.kim027@gmail.com
Subject: [PATCH] usbip: prevent priv from uaf in cmd submit
Date: Thu, 27 Aug 2026 09:21:53 +0800
Message-ID: <20260827012153.138991-1-eadavis@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6a8f1920.1d9ded08.62e62.00b7.GAE@google.com>
References: <6a8f1920.1d9ded08.62e62.00b7.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The num_urbs is 1, and the request is not special, so it is not tweaked.
After stub_complete() executes, priv is added to the tx queue.
stub_tx_loop() immediately dequeues it and frees priv; the subsequent
loop iteration then checks priv->num_urbs, which ultimately triggers [1].

Use num_urbs directly to avoid accessing the already-freed priv.

[1]
BUG: KASAN: slab-use-after-free in stub_recv_cmd_submit drivers/usb/usbip/stub_rx.c:609 [inline]
Read of size 4 at addr ffff888034999db0 by task stub_rx/6028
Call Trace:
 stub_recv_cmd_submit drivers/usb/usbip/stub_rx.c:609 [inline]
 stub_rx_pdu drivers/usb/usbip/stub_rx.c:688 [inline]
 stub_rx_loop+0x2d3b/0x31c0 drivers/usb/usbip/stub_rx.c:707

Allocated by task 6028:
 stub_priv_alloc drivers/usb/usbip/stub_rx.c:314 [inline]
 stub_recv_cmd_submit drivers/usb/usbip/stub_rx.c:490 [inline]
 stub_rx_pdu drivers/usb/usbip/stub_rx.c:688 [inline]
 stub_rx_loop+0x638/0x31c0 drivers/usb/usbip/stub_rx.c:707

Freed by task 6029:
 stub_free_priv_and_urb+0x427/0x570 drivers/usb/usbip/stub_main.c:321
 stub_send_ret_submit+0xecf/0x1810 drivers/usb/usbip/stub_tx.c:333
 stub_tx_loop+0xe2/0x3e0 drivers/usb/usbip/stub_tx.c:437

Fixes: ea44d190764b ("usbip: Implement SG support to vhci-hcd and stub driver")
Reported-by: syzbot+06fa667a0931a3430026@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=06fa667a0931a3430026
Signed-off-by: Edward Adam Davis <eadavis@sina.com>
---
 drivers/usb/usbip/stub_rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/usbip/stub_rx.c b/drivers/usb/usbip/stub_rx.c
index 1e9ae578810d..85370b3bc600 100644
--- a/drivers/usb/usbip/stub_rx.c
+++ b/drivers/usb/usbip/stub_rx.c
@@ -606,7 +606,7 @@ static void stub_recv_cmd_submit(struct stub_device *sdev,
 		return;
 
 	/* urb is now ready to submit */
-	for (i = 0; i < priv->num_urbs; i++) {
+	for (i = 0; i < num_urbs; i++) {
 		if (!is_tweaked) {
 			ret = usb_submit_urb(priv->urbs[i], GFP_KERNEL);
 
-- 
2.43.0

