Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.205
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794608465;
	b=T3vBrZyLyJb5pmO6Ch3ij/cWtf9q2C/p0nt3NXAfTGDExEs4xYXpZF2+3qrbLyi5YGwG
	 KsGBLYUyWncqisDoxORAYG91n+uTw2PmMO9wyIXYOr3fErcwT164qYNmWv7Nr2NBCmSIP
	 vrS1Fjp2hfVjWR+1OJ4LG7qSdrFs5B5L1wolBEfwkAzpNPDMZApDAFrNKxorXdfbE7XJM
	 f++1REBfZo0LJwQdZ4B4cR3L1qfsMcV7AG/Ih1M2lL4shT1bWCFrb+dfK8vRuWXIvpJAX
	 p2Y8bpxJOrR7C/gPL3ONJ32ub9urLSStNqf9V0hPSkGPWWncHfntanmp36F/Xd+pO7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794608465;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=sAhM9B6tHDWzfDvaFUqHyoZvj2qtGqmd+E4XM3N1Wh0=;
	b=qUAoDhJC0T9VsVCn7W7lMJ/LEAAX8kmX4qTs2kCdCk900xod3riu1e18Gv4L+Q6uJLdM
	 tEg4RuRxoO2f3n15IfhHNvoEymRGYwO4JQLOj1w72gXlnosOiGXzwu6jS2bWJuLCe+lvE
	 NejqvnjhBawidxysJe6+pEmlozlI0N91CoBytN/ALqcSlPp14X62TAHwv6vIyr+XfdH90
	 qdUNOZuT+vyA3ymvdILumBCu0rJczD0orL8WNR+BK6yZHeo4Jy7ZpYwoUw6HCYwtgAo/h
	 BGJgFW8pwfrbw4l77wkU+Ud18KugKb5Dh40WbheWCyCZjAj382ykrmWrWNt4ypSbtbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foxmail.com;
	spf=pass smtp.mailfrom=foxmail.com;
	dkim=pass header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256 header.s=s201512 header.b=lvpndJxp;
	arc=none smtp.remote-ip=203.205.221.205
Received: from out203-205-221-205.mail.qq.com (out203-205-221-205.mail.qq.com [203.205.221.205])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D96C606A331
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 22:20:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D96C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256 header.s=s201512 header.b=lvpndJxp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1794608457;
	bh=sAhM9B6tHDWzfDvaFUqHyoZvj2qtGqmd+E4XM3N1Wh0=;
	h=From:To:Cc:Subject:Date;
	b=lvpndJxpRiEuL42jpO+lqA4tSe4t0kDpROyfTJAr/LNRAAd2BWhyHiSoBG2zXelx2
	 UbBoKYL9kGRZtY+pP3JJJAyosrfKwxxSrQ9kXponGgbE1ewXfb+vQFhf3SNQOInixd
	 SyOSCqll6dgndD6kfZliJYQB18B4mDisqeiJWf2o=
Received: from localhost.localdomain ([240e:3bb:3032:791:1c66:e624:37fc:2222])
	by newxmesmtplogicsvrszb43-0.qq.com (NewEsmtp) with SMTP
	id 5371B4B8; Sat, 14 Nov 2026 06:20:55 +0800
X-QQ-mid: xmsmtpt1794608455tpk1ninpv
Message-ID: <tencent_E92BE5AC4B6F212D7B309853D803D54D270A@qq.com>
X-QQ-XMAILINFO: OIJV+wUmQOUAJ+u7YRDq/v//iG3n7/zIN1tdH1iy9yrdZ6j2vwDKe9e30FJH1v
	 5vWkW7oKtdtbLDhit8uMOiS+7VMVy+fhCYUFGTrXYm2waGN8WjP+hYL5tv7d2xPTTbDsHQPA5T7f
	 DR8dYyMOfPYTBJMEIOBqG0TwmwCrwEFU0O9H95O0llcrTW4+/egbOe6FdGwqgB6BI23uZBAaHAHb
	 dtzWujRKI1gHAMnauWUZCy7CfmYuo3Te84MtGVyNbflyr3q6qqzjKGble/ZgbXrSrp8rtj3wQP5e
	 hWiyP2e8YmltqlesbDhbBCM3T+X2dFyeiv/H7g/Y2cbQDv8lKq9HCyLc1WXGGRVgO2zcFPIigyGy
	 6Pw2Un4/lRQbO+ZiBpyhWI6rfGEhPO9FZmVOoQhwmyjBY9cudd5cc3h+nDkYdnOrQqSynezg3Ohi
	 2JsozTUrwUdlale89A4b2hmJURO6aFJVnqlH/y7DaX5jz8/pHdEWX8zII/b9k7DoC9hj5KdHg1BU
	 OsTj2fMZ1FXbPrGtLbWSz+8o6ZFj7ZqwMYLjwehd8EYU7O8gJO8NAC4PTDAZULjyfJHXtoJj9Hxf
	 UT1IuOYtDaOziNoy2fg29vjvWLIBCz4XWssiwMBUS5W9gg//ot7xmYl4PEwcQL+RTQyAEH2LZ7wL
	 /VPzRA9KZPVI1BDrD+mdV/oxPozcGDZEqjQCV9m7InGCjHh0KDf41BkvOefkLHlNYYtgL/u9tuB0
	 DcPtdshq6SOfHDFE9qY5oVbDRXs6GJOf4AD0NqlzUc4pdqw4RfrZX+yU+QgpF1HyeVsMx/C3bihP
	 5F5R5j03Q8Q8KDg0VM7nowOBnh7h2LzuHhvBU8HqtVYaKwfZjhLpmac0IWZ/bNLGBsyvt5AgZ9bZ
	 Ojmj2HF+AHk81eeVmSpSlP/owIi42YgFEBsS980w02AVh0W800c3pspky84ozuT0wT24m2ahgXOk
	 QEqU6TrqQw7DuWh7PvNtNpnSE6WT03sGeUAcJigAPTXY/laRpIrpe8XdXQwZK+2TlLQLvw6fh2yI
	 dY9t9GAOdIeu2V5GwJG2o2gJkYvEz3GTVGQcfWLsqCk3jCFxzUCVLU6hd3jk2YOKu2soFEQZV3Ed
	 J55Kh7aZv3f1V3ptjV/7WptHrZvQ==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: memoriaru@foxmail.com
To: linux-usb@vger.kernel.org
Cc: heikki.krogerus@linux.intel.com,
	badhri@google.com,
	gregkh@linuxfoundation.org,
	memoriaru@foxmail.com
Subject: [PATCH usb] usb: typec: tcpm: align SOP' Soft Reset handling with SOP
Date: Sat, 14 Nov 2026 06:20:54 +0800
X-OQ-MSGID: <20261113222054.43679-1-memoriaru@foxmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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

From: Zhang Hewei <memoriaru@foxmail.com>

The PD message duplicate-check and the SOFT_RESET state handling treat
the SOP and SOP' channels differently:

- tcpm_pd_rx_handler() exempts PD_CTRL_SOFT_RESET from the MessageID
  duplicate check on the SOP path (the USB PD spec 6.6.1.2 note: a
  Soft_Reset Message always carries MessageID zero, so the duplicate
  check must not drop it), but the SOP' branch of the same switch has
  no such exemption. A cable that sends a second Soft Reset over SOP'
  (MessageID zero again) has that message silently dropped by the
  stale rx_msgid_prime comparison, and the cable-side re-negotiation
  stalls.

- run_state_machine()'s SOFT_RESET case resets message_id/rx_msgid but
  not message_id_prime/rx_msgid_prime, while the initiator path
  (SOFT_RESET_SEND, SOP_PRIME branch) resets both counter pairs. After
  a responder-side soft reset the prime counters stay stale.

Reset the prime counters together with the SOP counters and exempt
Soft Reset from the SOP' duplicate check, aligning the SOP' handling
with the SOP path.

Found by code inspection; a software TCPC stub was built for the
responder path.

Fixes: 6bd181ba60 ("usb: typec: tcpm: add control message support to sop'")
Signed-off-by: Zhang Hewei <memoriaru@foxmail.com>
---
 tcpm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tcpm.c b/tcpm.c
index bb90211..95f748d 100644
--- a/tcpm.c
+++ b/tcpm.c
@@ -4200,7 +4200,8 @@ static void tcpm_pd_rx_handler(struct kthread_work *work)
 		 */
 		switch (rx_sop_type) {
 		case TCPC_TX_SOP_PRIME:
-			if (msgid == port->rx_msgid_prime)
+			if (msgid == port->rx_msgid_prime &&
+			    type != PD_CTRL_SOFT_RESET)
 				goto done;
 			port->rx_msgid_prime = msgid;
 			break;
@@ -6193,6 +6194,8 @@ static void run_state_machine(struct tcpm_port *port)
 	case SOFT_RESET:
 		port->message_id = 0;
 		port->rx_msgid = -1;
+		port->message_id_prime = 0;
+		port->rx_msgid_prime = -1;
 		/* remove existing capabilities */
 		tcpm_partner_source_caps_reset(port);
 		tcpm_pd_send_control(port, PD_CTRL_ACCEPT, TCPC_TX_SOP);
-- 
2.39.5 (Apple Git-154)

