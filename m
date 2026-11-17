Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794914132;
	b=ENJRq1dZMnEFFeTXUCwaUZG1HYAInFLSTXVpgaFIcSUh/gx0Sk2gFtnDSaO5e/OfSzH3
	 1osALRjt8ah9Jgrfpj2DrtHDSE9dhBGzE8GFivZVuYV/EL3DBYjRy+VXyOm3j2wIuyY/L
	 FgkscI/3HXlk2Lzaklp54v0bEHQbrTrhMEMST0jr5QubIZDW+Eslz5TQyNNNRsNrOicK1
	 38LD+PpuUPnWwXOFurM6ZpQelmxkRadl2g5h7sWMb7qUf/NN8Ha1dh3ZG4oINkm7KEOLb
	 YsZ7TuVjDq0ePPzwm+fq/iL8NtDOHHTakrZGOyj5JlxuO7IaYMqXKpTCjy3I64znZEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794914132;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ag2QBnwdZ6y2/TuESOe4zvxzApYAxpOe3s2YM+v4PAY=;
	b=LuP5HZ9+16fkEe+4M6akdtb8ye3uyYLnttg7QvOaITqPp6Ik3UpKI7h70IWJ8fhmMhhJ
	 wgGq26g1pygJsHVHixA3ve0+sE45N0umuI4kwFJO5BSOTbpbh9i1+gWTLhImT83EZAFxP
	 EsRyAVeFWHkTb2W7Y96eywuucTo4B85N7WKXE0sEdhXMzlLtGT0W2TQpViAHbC4PqjQCl
	 EWX9p6ZSPMMOk1dTlAl5FiSl97bbyFKPVuZowfgTctm2c32/80lu4v2zIuCPmlXEvBm/7
	 x+ndG+CwCp0Kxvk8PKl+wOv5w2w7g41crXHRbifyHJI9ZlXwkUhdUiYaWwKdUNocv2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=tMibRi8p;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C03A606A31C
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 11:15:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C03A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=tMibRi8p
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso28670575e9.0
        for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 03:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794914130; x=1795518930; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ag2QBnwdZ6y2/TuESOe4zvxzApYAxpOe3s2YM+v4PAY=;
        b=tMibRi8pIgZwAEsYjQQpV6d4ym+qSxCYcsvHHoswrN2LhVryF/0xy1x3iejjjc8yfc
         r4gmbjh4H6JRo5IYNO9SdU5hJJ/R2Nf2+JN5fvvMQJGRuehYj4VYdcVB3wfzhZLzd5Vl
         lWMZGhes2XbUKe7scPC9KMWV647aCa9I3ovQBvqCE6+MieC+bPohR81OVwzj5C7Ji8aS
         Vxpw3M7nDg/IHuBOAQT9nISmfIRpZJO08bSUPLbE+Y5ytbuisFdJZkfcdRra/GZSAeTq
         /fvWjUadNsGuEUo5kIrwlUl6+iD6CquBJTl7hci1NHfXdg5U8OFqueqwNnVtdiBTZkZr
         G/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794914130; x=1795518930;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ag2QBnwdZ6y2/TuESOe4zvxzApYAxpOe3s2YM+v4PAY=;
        b=DmGOD21QOMCDC0ksNW8OoTnX190KGG7MEQmdI7zMr2xwgO/hPEs8kwbmG6Cy/69l76
         qEzAoli8xa03Xp4iZUUGHSPpLFWi/r9hTzan2mu0LmxTFrje3agWTRhWYlNg0DWS/h1E
         8Z/Zz8iaQWnzJhMHYDNOCxilRjnbFiPPitsPp1Kzy3vPWNv2Bcl/2Duedo7PU7l3zAtT
         bxe9VaA8c0Tc6jI8vD77Y7fa5MgeZogtRTwmUK3rnxDKJ9re0gV5UClb+QN3QkKfqPhj
         pQhNf3OEN2cW94fBHsjef4HzLorBio0omhWnuseZRHF5ELw+y4rfrNRvuE8bZXjQLTce
         3QGw==
X-Forwarded-Encrypted: i=1; AL+hErFTNyCsAvE/v+N2TzQqpBDausXGBNUD3zZ6YhrRDpBh84d5+uCABAx4LKc1lcmndc0YQICXAzYesAs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+iMd4auFIqcnN7pTpQppmFBvp8uunteZmu8H7o2rr6E3d6Wi6Y
	NdUOPFrrqC1dGhZZvS5ncx4vgOUYu2zqKdcXmJKjs4bM1D/31A62ac7PD6bZQL7XPmI=
X-Gm-Gg: AYBFou2/4jFm+GDM4AlbTyPMJwbicATwUKV5AoVzSX/omXHxHyFCl4aOtEHZit0y2dQ
	/apq+XhVX8peS7NLw9B7uevltf33Yzst/qPMxMUu4UJet24F5SObQr4HprUTiKEQp0+vW6h9H1x
	CQ475/uOEbggRxTlWPNjAzNtRYRDoBSofqmejt9jCoxh9jewCzibJpNjUsfh/zNssASmZ5vxaab
	UvrWrRnqikIOEPrsK/aFZM2XYUqg9DYX7Yw0TGaLwbK5lYmZspmz8AYTIaHwApztFd9psNfhU/z
	4cZXb7gUKJnUYwolAmEWHqwHN+dlbt1PHjyXQmXUmR4V9KmX+TqvhgpUPL8HR74pbQ5WXJhchrx
	hn70EYhWKT+9TxWE+9ItEpwu2lfvxuqT73y2seqv4cP8+F0MjEmtZKoubGhpGEBqRfd7uY6tOSm
	VSGMeROGrnvEJ/YO7po6XsxPQphOEfFZm2jFKdAnl8liRlZTTkjcXbg9wmLbLX8tqArvresmWcl
	LCTf+OeDDGKWB2bftjZoDaVbqju2MxicDRpfKqH91UglUXMf8BlDyTtd9dvXq8l81yOS6QrqTK9
	zBlSe8QKvYLWHdrCYQyS/vJRuU1hE4CfSHS323nK+wsfndngnECcd+VteUTIxwYpGdvq4Ef6G3D
	FuLjnrJGzPGyYl4w8/J+hj2tfP1YQlAM=
X-Received: by 2002:a05:600c:512:b0:4a2:a9:ed87 with SMTP id 5b1f17b1804b1-4bb55a5aa47mr217213845e9.19.1794914130439;
        Tue, 17 Nov 2026 03:15:30 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f8220sm59773745e9.5.2026.11.17.03.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:15:30 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 17 Nov 2026 15:15:17 +0400
Subject: [PATCH 3/3] usb: typec: tcpm: Keep cable plug messages away from
 the port partner
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-tcpm-soft-reset-sop-v1-3-c7e1543828c0@flipper.net>
References: <20261117-tcpm-soft-reset-sop-v1-0-c7e1543828c0@flipper.net>
In-Reply-To: <20261117-tcpm-soft-reset-sop-v1-0-c7e1543828c0@flipper.net>
To: Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 RD Babiera <rdbabiera@google.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-usb@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5097; i=alchark@flipper.net;
 h=from:subject:message-id; bh=eg4EQzDOrpOjQtbK5LWXbBzb6fldKVcIYWEfdxKU5CA=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWT9Mffu+LZa490ca+EDqyvCIyax5XSKv30eeHdWufIj4
 /nLmnindUxkYRDjYrAUU2SZ+22J7VQjvlm7PDy+wsxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkY6xjpGDFycAjDV9/cxMjyMWfo0JXIZ5181t/ViKnaKyg0PrhekBcyTtlYP050XZ8PwP+ve1Td
 /97Us6fr96uO8F42hfeeE6yfVf5Jwn/SGwfldCysA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

When the port is the VCONN source, messages from the cable plug on SOP'
go through the port partner's handlers, which act on them and answer on
SOP: an unrecognized message gets Not_Supported on SOP, which the partner
answers with a Soft_Reset, and an unexpected Accept soft resets the
partner. SOP'' and the debug SOP* types, which TCPM does not support,
take the same path and shadow the partner's last MessageID.

A cable plug only answers the VCONN source and never starts an AMS (USB
PD r3.3, section 8.5 and table 7.5). Pass on its VDMs, its Accept to a
Soft_Reset sent to it, and its Reject or Not_Supported to a VDM in the
ready state, the only one that takes them as the VDM's answer. Drop
anything else on SOP', and drop other SOP* types before they touch the
MessageID tracking.

This hardens TCPM against cable plugs that break the rules: it was found
with a port posing as a cable plug, and no cable or TCPC driver is known
to trigger it.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/usb/typec/tcpm/tcpm.c | 62 ++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 58 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 947fca918414..2a909ca96811 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -682,6 +682,8 @@ struct tcpm_port {
 	 */
 	enum tcpm_transmit_type vdm_sop_type;
 	enum tcpm_transmit_type soft_reset_sop_type;
+	/* The Soft_Reset in SOFT_RESET_SEND went to the cable plug */
+	bool soft_reset_sent_prime;
 	/*
 	 * Prior to discovering the port partner's Specification Revision, the
 	 * Vconn source and cable plug will use the lower of their two revisions.
@@ -4164,6 +4166,52 @@ static void tcpm_pd_ext_msg_request(struct tcpm_port *port,
 	}
 }
 
+/* Whether a cable plug control message responds to what the port sent it */
+static bool tcpm_cable_ctrl_msg_expected(struct tcpm_port *port,
+					 enum pd_ctrl_msg_type type)
+{
+	switch (type) {
+	case PD_CTRL_ACCEPT:
+		/* the Soft_Reset after a VCONN Swap */
+		return port->state == SOFT_RESET_SEND &&
+		       port->soft_reset_sent_prime;
+	case PD_CTRL_REJECT:
+	case PD_CTRL_NOT_SUPP:
+		/* a VDM, in the ready state, which takes it as the answer */
+		return port->vdm_sop_type == TCPC_TX_SOP_PRIME &&
+		       port->vdm_state > VDM_STATE_READY &&
+		       port->state == ready_state(port);
+	default:
+		return false;
+	}
+}
+
+/*
+ * A cable plug only responds to the VCONN source: to its VDMs, and to its
+ * Soft_Reset. Hand those to the usual handlers, which tell SOP' apart where
+ * it matters, and drop anything else on SOP': it comes from a cable plug
+ * that breaks the rules, and no sequence has the port answer a cable plug.
+ */
+static void tcpm_pd_cable_msg_request(struct tcpm_port *port,
+				      const struct pd_message *msg)
+{
+	unsigned int type = pd_header_type_le(msg->header);
+	bool ext = le16_to_cpu(msg->header) & PD_HEADER_EXT_HDR;
+	bool ctrl = !ext && !pd_header_cnt_le(msg->header);
+
+	if (!ext && !ctrl && type == PD_DATA_VENDOR_DEF) {
+		tcpm_pd_data_request(port, msg, TCPC_TX_SOP_PRIME);
+		return;
+	}
+	if (ctrl && tcpm_cable_ctrl_msg_expected(port, type)) {
+		tcpm_pd_ctrl_request(port, msg, TCPC_TX_SOP_PRIME);
+		return;
+	}
+
+	tcpm_log(port, "Dropping unexpected SOP' message, header: %#x",
+		 le16_to_cpu(msg->header));
+}
+
 static void tcpm_pd_rx_handler(struct kthread_work *work)
 {
 	struct pd_rx_event *event = container_of(work,
@@ -4204,13 +4252,17 @@ static void tcpm_pd_rx_handler(struct kthread_work *work)
 			if (msgid == port->rx_msgid_prime)
 				goto done;
 			port->rx_msgid_prime = msgid;
-			break;
+			tcpm_pd_cable_msg_request(port, msg);
+			goto done;
 		case TCPC_TX_SOP:
-		default:
 			if (msgid == port->rx_msgid && type != PD_CTRL_SOFT_RESET)
 				goto done;
 			port->rx_msgid = msgid;
 			break;
+		default:
+			/* Neither for the port partner nor for a supported cable plug */
+			tcpm_log(port, "Dropping message on SOP* type %d", rx_sop_type);
+			goto done;
 		}
 
 		/*
@@ -4218,7 +4270,7 @@ static void tcpm_pd_rx_handler(struct kthread_work *work)
 		 * mismatch.
 		 */
 		if (!!(le16_to_cpu(msg->header) & PD_HEADER_DATA_ROLE) ==
-		    (port->data_role == TYPEC_HOST) && rx_sop_type == TCPC_TX_SOP) {
+		    (port->data_role == TYPEC_HOST)) {
 			tcpm_log(port,
 				 "Data role mismatch, initiating error recovery");
 			tcpm_set_state(port, ERROR_RECOVERY, 0);
@@ -6225,7 +6277,9 @@ static void run_state_machine(struct tcpm_port *port)
 		 * A Soft_Reset Message Shall be targeted at a specific entity
 		 * depending on the type of SOP* packet used.
 		 */
-		if (port->soft_reset_sop_type == TCPC_TX_SOP_PRIME) {
+		port->soft_reset_sent_prime =
+			port->soft_reset_sop_type == TCPC_TX_SOP_PRIME;
+		if (port->soft_reset_sent_prime) {
 			port->soft_reset_sop_type = TCPC_TX_SOP;
 			port->message_id_prime = 0;
 			port->rx_msgid_prime = -1;

-- 
2.56.0

