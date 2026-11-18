Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795011432;
	b=NoruD1GZahLQXtg5WVAXQ6W0MWZ+ftnHbfcDTHHCOup6RqZfqDWm2Al/jRdjywcGmpv5
	 E8WPgCpOerVyUU2uGP5BLniWUqkoXMG7uyA34pjTeLg4QTjdn676MMD565hw4OHvNiyo6
	 m0QqL4bJXd/JctcMJ6KjZJSwL37hIvnddOmCBVCf+vnKrz7VzFLD7qORVsDn4V1HvpaUv
	 QU9U/2m3vj1MsAKi7+VJtA0FBUMyZEPsMwYawgOSzM5EzpExI9bF7dGaN5cqz3kZegSTY
	 bQCibF9dUrS2hic661FGeD/eqn28ST2QBLoi47sdgJYn2nP8EGtpBy6pBB1Rl8d/uSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011432;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JsAnA2fBtjg72iQS6X5KhwIX0MbqAnc4bq0cGrLJdtk=;
	b=MUoV1GkrjY5cP14fiTbgfu1ZGDFbpmOZa2UEieetVJ11uKKK57ieAcAIq1Xt0DU8ILqy
	 z0648e2Plw07xuoer4M6TVCEG1lpeICO4Hode/5cV4mL5zzPNjNzh1zNDdrgxuidnFJPX
	 mqKHxVHnaCehrY66vvybZRtzlCSRUcbopRES2XIOWEHJX/SbN/fSzdhC6eaEeaytDHgp3
	 1BdEXeqGyhpzRw1NGBi21X40kyT1SSwfTjwpoOJwO1GbPgD+qTlQknAFiSlOxnoSQa9K/
	 jwnXCPLC57yCOuTWXiCKsja0lr36NZOlKydFF5/9ziKhcTENExTh09hYOVWwqVhSH9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=VcQPnPwV;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AA7C60A381A;
	Wed, 18 Nov 2026 14:17:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AA7C60A381A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=VcQPnPwV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=VcQPnPwVvSwFFpJepw28Q4hRzd2wdzZrMsBxUgB9ym/nw0LelHCCPbUfj8j6HCFSgZXzHbDbxkRnd
	 r7cQs1yutx9aA0NQmzJqeQCSOuSWTiTbN5ALhsaW41JjVMfTKO2bOEUgpm6AOTkN7isiur3EldOprL
	 z9ZXvD3AwQzzBRgY=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96afdb35ba6f-1a345;
	Wed, 18 Nov 2026 22:17:00 +0800 (CST)
X-RM-TRANSID:2ee96afdb35ba6f-1a345
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from FHD-W7400297 (unknown[10.55.1.70])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee66afdb35aa5d-d92ae;
	Wed, 18 Nov 2026 22:17:00 +0800 (CST)
X-RM-TRANSID:2ee66afdb35aa5d-d92ae
From: Aibing Chen <chenaibing@cmss.chinamobile.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v4] net: hso: fix stashed tx skb leak and replay race
Date: Wed, 18 Nov 2026 22:16:58 +0800
Message-ID: <20261118141658.1381-1-chenaibing@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <20261117084732.297-1-chenaibing@cmss.chinamobile.com>
References: <20261117084732.297-1-chenaibing@cmss.chinamobile.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hso_net_start_xmit() stashes the skb in odev->skb_tx_buf and stops the
queue when hso_get_activity() reports -EAGAIN, which happens when the
USB device is suspended or no longer configured.  If the interface is
then brought down, or the device is disconnected, that skb is simply
left behind: hso_net_close() and hso_free_net_device() never release
it, and hso_net_open() clears the pointer, so the skb and its data
buffer are leaked.

hso_resume() loses a frame in the same way when the device is still not
ready: it passes skb_tx_buf to hso_net_start_xmit() and then clears the
pointer unconditionally, so a frame stashed again by that call is never
freed.

Take the stashed skb with xchg() in both paths so that only one of them
can obtain it, serialize the replay in hso_resume() against
hso_net_close() with a per-interface mutex, and take the netdev TX lock
around the replay so that it is also serialized with the stash in
hso_net_start_xmit().  The state check uses test_bit(HSO_NET_RUNNING),
the bit that hso_net_open() and hso_net_close() maintain.

Reported-by: syzbot+bf62ca9997f43d2fa521@syzkaller.appspotmail.com
Link: https://lore.kernel.org/all/6af74e31.fe96acdb.12252b.0009.GAE@google.com/
Fixes: 72dc1c096c70 ("HSO: add option hso driver")
Fixes: c213f286f2cf ("[netdrvr] hso: dev_kfree_skb crash fix")
Signed-off-by: Aibing Chen <chenaibing@cmss.chinamobile.com>
---
v4:
- take the netdev TX lock around the replay in hso_resume() so it is
  serialized with the stash in hso_net_start_xmit().

v3:
- serialize the replay in hso_resume() against hso_net_close() with a
  per-interface mutex.
- check HSO_NET_RUNNING instead of the IFF_UP alias.

v2:
- take the stashed skb with xchg() so that only one path can free it.
- add the two Fixes tags.

 drivers/net/usb/hso.c | 51 ++++++++++++++++++++++++++++++++++++-------
 1 file changed, 43 insertions(+), 8 deletions(-)

diff --git a/drivers/net/usb/hso.c b/drivers/net/usb/hso.c
index 71caa3764..247c58cc7 100644
--- a/drivers/net/usb/hso.c
+++ b/drivers/net/usb/hso.c
@@ -142,6 +142,9 @@ struct hso_net {
 	struct sk_buff *skb_rx_buf;
 	struct sk_buff *skb_tx_buf;
 
+	/* serializes the hso_resume() replay with hso_net_close() */
+	struct mutex tx_replay_lock;
+
 	enum pkt_parse_state rx_parse_state;
 	spinlock_t net_lock;
 
@@ -720,6 +723,14 @@ static int hso_net_open(struct net_device *net)
 static int hso_net_close(struct net_device *net)
 {
 	struct hso_net *odev = netdev_priv(net);
+	struct sk_buff *skb;
+
+	/*
+	 * Serialize with the replay in hso_resume(): either the frame is
+	 * replayed before we stop the device, or it is taken and dropped
+	 * here, never both and never after the queue is gone.
+	 */
+	mutex_lock(&odev->tx_replay_lock);
 
 	/* we don't need the queue anymore */
 	netif_stop_queue(net);
@@ -728,6 +739,11 @@ static int hso_net_close(struct net_device *net)
 
 	hso_stop_net_device(odev->parent);
 
+	skb = xchg(&odev->skb_tx_buf, NULL);
+	dev_kfree_skb(skb);
+
+	mutex_unlock(&odev->tx_replay_lock);
+
 	/* done */
 	return 0;
 }
@@ -2398,6 +2414,7 @@ static void hso_net_init(struct net_device *net)
 
 	/* and initialize the semaphore */
 	spin_lock_init(&hso_net->net_lock);
+	mutex_init(&hso_net->tx_replay_lock);
 }
 
 /* Adds a network device in the network device table */
@@ -3032,6 +3049,7 @@ static int hso_resume(struct usb_interface *iface)
 {
 	int i, result = 0;
 	struct hso_net *hso_net;
+	struct sk_buff *skb;
 
 	/* Start all serial ports */
 	for (i = 0; i < HSO_SERIAL_TTY_MINORS; i++) {
@@ -3051,21 +3069,38 @@ static int hso_resume(struct usb_interface *iface)
 		if (network_table[i] &&
 		    (network_table[i]->interface == iface)) {
 			hso_net = dev2net(network_table[i]);
-			if (hso_net->flags & IFF_UP) {
-				/* First transmit any lingering data,
-				   then restart the device. */
-				if (hso_net->skb_tx_buf) {
+			mutex_lock(&hso_net->tx_replay_lock);
+
+			/*
+			 * First transmit any lingering data, then restart
+			 * the device.
+			 */
+			if (test_bit(HSO_NET_RUNNING, &hso_net->flags)) {
+				/*
+				 * The frame is stashed by hso_net_start_xmit()
+				 * under the TX lock, so take the same lock here:
+				 * otherwise a concurrent transmit could store
+				 * after we took the pointer and leave the queue
+				 * stopped with the frame still stashed.
+				 */
+				netif_tx_lock_bh(hso_net->net);
+				skb = xchg(&hso_net->skb_tx_buf, NULL);
+				if (skb) {
 					dev_dbg(&iface->dev,
 						"Transmitting"
 						" lingering data\n");
-					hso_net_start_xmit(hso_net->skb_tx_buf,
-							   hso_net->net);
-					hso_net->skb_tx_buf = NULL;
+					hso_net_start_xmit(skb, hso_net->net);
 				}
+				netif_tx_unlock_bh(hso_net->net);
+
 				result = hso_start_net_device(network_table[i]);
-				if (result)
+				if (result) {
+					mutex_unlock(&hso_net->tx_replay_lock);
 					goto out;
+				}
 			}
+
+			mutex_unlock(&hso_net->tx_replay_lock);
 		}
 	}
 


