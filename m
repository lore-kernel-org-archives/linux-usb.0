Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794914129;
	b=sOxdlYWch77Y/7HuGEgjs3r16OCEEn/zaRrLJka/1pDkDgpGlmBZ+t2QZhzfZuoC35I4
	 OsW1iBPn2Q/mxQQLLqv0c4uapGlsuCqw8UVzk7VFKmE8GizuT4VqLtS54T9M8QBU43nFz
	 avujpg4Va0qkYHfU8QK1mgo1cIUbd36CnlGwrCBqBslTPfHV4BgnVnIGb536rQ4hbVW+6
	 xgRkkdsbONDvTUWoAalw7GHPjX7Wh+oO2w/WsV8CpogS0vg1Q83/uJQsCmBNsN5QJTl1r
	 p7zwi2gHN/S1pX/ySXq6CFqPIveeylDS66QUGMppXUA1kzCaVr96n+JIOp6pEd5oBGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794914129;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=IEfLep2EKbzLK5wwOg4/ywwAQ7ECQZqB1AGacSMQjoE=;
	b=5NAIPgZrUIF3OfLQeNNFOFNUeEKntUtgMrCA3PqcAWoTkoMsGYxgVDzrCJV1wign22Pb
	 05ak+Pp4tMDKwuo6XFgH8o8ZFm70BllQf5Lfh9PBSY1JOMy4Iio6Q5IuxfZx28ptrrP47
	 Q1yrmWCIrj+K5auIf0xsShz/Tb9sEkXgZm5cjCBkHQFouOVnJpwtZL8QfWV4xQvnCtHbo
	 1EdFlO3t5dXC8lOBYA2NbGnadDwaql/1qokS0fgVxm6B8FBwpdqrro69QCd1hARpehuwB
	 C6A0i7b7/mNT6kRugHPGHJJx/VWMpfV6gfpOk4s12U4yrtepHgwrF3NuIUeLKm1fIRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=8k0gQi63;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7D3606A899
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 11:15:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F7D3606A899
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=8k0gQi63
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so19788295e9.0
        for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 03:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794914127; x=1795518927; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IEfLep2EKbzLK5wwOg4/ywwAQ7ECQZqB1AGacSMQjoE=;
        b=8k0gQi63ogsmhRHAhOnhwPEHROlscAeGtHkvc1O6mRi6+ehUcpHyPImVqgq326t8xT
         OLtz9ld9eDAi3rt4lRXoTZ2PVvCsT74nla3l/l4YGMSJ7jNE2G6QIwxoiJe2wbDcbN+t
         KDtPFGDtcaG5EUu8W7HYAWkvA6ZId8waMVsW4A8H1PCllXDsj09XOTdGXYxuKWsi7cBL
         RunhquvQlxPfJvziN5KXeJe64urpXjQ3Rrw6oyRZNXRgpqserPVS1TmmwI8OfA71LFTw
         PJ0mA4x89NrN802AGVuS/0SLUyOcPqTne/I0UDKVf+GCsf3of8Ab3LlIMLa4h6p7FcLV
         14IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794914127; x=1795518927;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IEfLep2EKbzLK5wwOg4/ywwAQ7ECQZqB1AGacSMQjoE=;
        b=KfLSMe7QgljmO0uRpl6Kp/hkgltmAVGm68groMFFbPqaZX9o+GZr5jxziUL3gXpIrZ
         IDvgKT/ghuhfO70PWpZ0cC5K4H7X9dCx35T70LBoxpReId6tX4/74O6kwYAI9bC4RrFM
         fy3OgNkb6X+J1BA8rZ7NzHx4E6GgMkI/KG+QFFaFbmW7g4vmRpbjuTbs5J2FYdTYnuO0
         lXTo2xRWatA38IXoU1IDRbZqIqecd/wzDoBbkWQhV8xfNtoaBVo9hqA1PhuxtbEgKn5c
         CuWrq0hnLBcfq5OqPfKvTKqPetsAcPTfUJy82htsElOuzwFEVQnQd6HiU7R7mjDgGt2L
         sImQ==
X-Forwarded-Encrypted: i=1; AL+hErHfkUOrNTuCGpA8OaMc8aawYUVglA5Rwcs8XHfpVNmt55buB0goIiAbLB16ukuWykJB4t/cbI/+wTw=@vger.kernel.org
X-Gm-Message-State: APuU4Z89cR+xhbQ6Nz9q/1c0KyhHoi5V+poLzUpajVaZCkEz+2NJYZI2
	Enyn4nVm2PcnpzgeYtS6yQynlq4i1RjWmjmdAEkO8h6yc+sHJjgSWq1yCltOnskYJxgZe4+nihZ
	6z3Ip
X-Gm-Gg: AYBFou0OSQ3a5KHOV9xfrSFwPWabnLySVWS8qqd6J4267E2n3vYN02dF2hwc0nhqIeD
	2SteyGryOvmXBU+C96DrE6fbEZEAgh2sTNH/amWrhIxGKHc+NTqF1Y3DM5+s8KpwK/PdihRFquk
	BHNfw7ROrAAz3z/xDBJLi9cj3OyfWZt0SpB4oP2nmEUUi537Iz0XiPQJHlFaEvKM/PCxT0jN8cD
	01AxO1sPj3xcklFslujqHrb5XI2MmmU1UueA5lRmu4IOcsNNXiLSY14yNGEOo3ch08ln2Wwd+n+
	nrz+/Dlq2tAuWVJjfRTcSCVwQQpjFpKKPQHKsFMQH7mwZHvct1p3+0rseaLOIIJxqj54idSo2jq
	Hv3CZECk2Nc4ADCQ4TJxYKAHAlKswkcZDwUKo3rQd8TvpyGsa3lGGTVnek6eA+TkUV7KbwedcCz
	Ij/ZKTq1IUimHy11PnIt58a1M0OZiqZsKVOZi2tLPcYC6brotNPcSDDQa44rGBjCa0ty3EE3LO7
	2zJ97/slMPoOq5C6Tuu6hR4eO/2NeNZzESvij/z94fA/DAf9Y8Vf8d929/HURXDtaDuw5kZAH8p
	BWwXpIKp7mppe+vhwLpK2YDdQgH26cGDLMzxlnwbzEK25g6k88bENc03rx9JEeDxBbrT1sSycEW
	Y/xttJ1jOqA==
X-Received: by 2002:a05:600c:628c:b0:4bb:5345:606b with SMTP id 5b1f17b1804b1-4bb55a7f885mr263921685e9.31.1794914126785;
        Tue, 17 Nov 2026 03:15:26 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f8220sm59773745e9.5.2026.11.17.03.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:15:26 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 17 Nov 2026 15:15:15 +0400
Subject: [PATCH 1/3] usb: typec: tcpm: Keep the Soft_Reset target apart
 from the VDM one
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
Message-Id: <20261117-tcpm-soft-reset-sop-v1-1-c7e1543828c0@flipper.net>
References: <20261117-tcpm-soft-reset-sop-v1-0-c7e1543828c0@flipper.net>
In-Reply-To: <20261117-tcpm-soft-reset-sop-v1-0-c7e1543828c0@flipper.net>
To: Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 RD Babiera <rdbabiera@google.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-usb@vger.kernel.org, Alexey Charkov <alchark@flipper.net>, 
 stable@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6130; i=alchark@flipper.net;
 h=from:subject:message-id; bh=rXiocxvuACvVzl/cb4g2FqTc2srJ3wIGGcgRP+Lz7wI=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWT9Mfd6rip0mXfvx/wHmacM1svZsObbmxomuD7lXnTgT
 Fw95w2tjoksDGJcDJZiiixzvy2xnWrEN2uXh8dXmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKa66hjDP4uJexUMFtt+NJ72USrjWPfzW1PqGlQ/Gyhe+fTkbPijF/YM//2VhLk
 ilL5X7c35kz8/+WUZn82kqzYTMhrOeLT5qhn85gQA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

tx_sop_type holds the SOP* of the VDM being sent, for its retries, and
SOFT_RESET_SEND also reads it to tell a Soft_Reset for the cable plug,
after a VCONN Swap, from one for the port partner. Nothing sets it back
after a VDM, so once a VDM has gone to the cable plug, such as Discover
Identity on SOP' before the first contract, every Soft_Reset meant for
the port partner goes to the cable plug instead. The cable plug accepts
it and the port goes back to its ready state, but the port partner never
sees the Soft_Reset: a source whose Source_Capabilities got Not_Supported
is then left without a contract. The VCONN Swap, in turn, overwrites the
SOP* of a VDM that may still be pending. This left a FUSB302B-based
source without a contract until it was unplugged, after its partner
missed a message following Discover Identity to an e-marked cable.

Keep one target per context: vdm_sop_type for the VDM and its retries,
and soft_reset_sop_type for the next Soft_Reset. Point the latter at the
cable plug only for the VCONN Swap, only once, and back at SOP whenever
the protocol layer starts over or a Soft_Reset of the port partner
starts, along with the SOP' MessageID counters.

Fixes: 6bd181ba60e1 ("usb: typec: tcpm: add control message support to sop'")
Cc: stable@vger.kernel.org
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/usb/typec/tcpm/tcpm.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index bb90211660ca..8c5be904d772 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -675,12 +675,13 @@ struct tcpm_port {
 
 	/* SOP* Related Fields */
 	/*
-	 * tx_sop_type determines which SOP* a message is being sent on.
-	 * For messages that are queued and not sent immediately such as in
-	 * tcpm_queue_message or messages that send after state changes,
-	 * the tx_sop_type is set accordingly.
+	 * Messages that are not sent right away carry their SOP* separately,
+	 * one per context so that one cannot redirect another:
+	 * vdm_sop_type for the VDM being sent, including its retries, and
+	 * soft_reset_sop_type for the next Soft_Reset.
 	 */
-	enum tcpm_transmit_type tx_sop_type;
+	enum tcpm_transmit_type vdm_sop_type;
+	enum tcpm_transmit_type soft_reset_sop_type;
 	/*
 	 * Prior to discovering the port partner's Specification Revision, the
 	 * Vconn source and cable plug will use the lower of their two revisions.
@@ -2003,7 +2004,7 @@ static void tcpm_queue_vdm(struct tcpm_port *port, const u32 header,
 	port->vdm_state = VDM_STATE_READY;
 	port->vdm_sm_running = true;
 
-	port->tx_sop_type = tx_sop_type;
+	port->vdm_sop_type = tx_sop_type;
 
 	mod_vdm_delayed_work(port, 0);
 }
@@ -3065,7 +3066,7 @@ static void vdm_run_state_machine(struct tcpm_port *port)
 		} else {
 			tcpm_ams_finish(port);
 			port->vdo_data[0] = 0;
-			if (port->tx_sop_type == TCPC_TX_SOP)
+			if (port->vdm_sop_type == TCPC_TX_SOP)
 				break;
 			/* Handle SOP' Transmission Errors */
 			switch (PD_VDO_CMD(vdo_hdr)) {
@@ -3102,7 +3103,7 @@ static void vdm_run_state_machine(struct tcpm_port *port)
 	case VDM_STATE_SEND_MESSAGE:
 		/* Prepare and send VDM */
 		memset(&msg, 0, sizeof(msg));
-		if (port->tx_sop_type == TCPC_TX_SOP_PRIME) {
+		if (port->vdm_sop_type == TCPC_TX_SOP_PRIME) {
 			msg.header = PD_HEADER_LE(PD_DATA_VENDOR_DEF,
 						  0,	/* Cable Plug Indicator for DFP/UFP */
 						  0,	/* Reserved */
@@ -3119,7 +3120,7 @@ static void vdm_run_state_machine(struct tcpm_port *port)
 		}
 		for (i = 0; i < port->vdo_count; i++)
 			msg.payload[i] = cpu_to_le32(port->vdo_data[i]);
-		res = tcpm_pd_transmit(port, port->tx_sop_type, &msg);
+		res = tcpm_pd_transmit(port, port->vdm_sop_type, &msg);
 		if (res < 0) {
 			port->vdm_state = VDM_STATE_ERR_SEND;
 		} else {
@@ -5529,6 +5530,7 @@ static void run_state_machine(struct tcpm_port *port)
 		port->message_id_prime = 0;
 		port->rx_msgid = -1;
 		port->rx_msgid_prime = -1;
+		port->soft_reset_sop_type = TCPC_TX_SOP;
 		port->explicit_contract = false;
 		/* SNK -> SRC POWER/FAST_ROLE_SWAP finished */
 		if (port->ams == POWER_ROLE_SWAP ||
@@ -5801,6 +5803,7 @@ static void run_state_machine(struct tcpm_port *port)
 		port->message_id_prime = 0;
 		port->rx_msgid = -1;
 		port->rx_msgid_prime = -1;
+		port->soft_reset_sop_type = TCPC_TX_SOP;
 		port->explicit_contract = false;
 
 		if (port->ams == POWER_ROLE_SWAP ||
@@ -6193,6 +6196,7 @@ static void run_state_machine(struct tcpm_port *port)
 	case SOFT_RESET:
 		port->message_id = 0;
 		port->rx_msgid = -1;
+		port->soft_reset_sop_type = TCPC_TX_SOP;
 		/* remove existing capabilities */
 		tcpm_partner_source_caps_reset(port);
 		tcpm_pd_send_control(port, PD_CTRL_ACCEPT, TCPC_TX_SOP);
@@ -6210,6 +6214,7 @@ static void run_state_machine(struct tcpm_port *port)
 	case SNK_SOFT_RESET:
 		if (port->ams != NONE_AMS)
 			tcpm_ams_finish(port);
+		port->soft_reset_sop_type = TCPC_TX_SOP;
 		port->upcoming_state = SOFT_RESET_SEND;
 		tcpm_ams_start(port, SOFT_RESET_AMS);
 		break;
@@ -6220,7 +6225,8 @@ static void run_state_machine(struct tcpm_port *port)
 		 * A Soft_Reset Message Shall be targeted at a specific entity
 		 * depending on the type of SOP* packet used.
 		 */
-		if (port->tx_sop_type == TCPC_TX_SOP_PRIME) {
+		if (port->soft_reset_sop_type == TCPC_TX_SOP_PRIME) {
+			port->soft_reset_sop_type = TCPC_TX_SOP;
 			port->message_id_prime = 0;
 			port->rx_msgid_prime = -1;
 			tcpm_pd_send_control(port, PD_CTRL_SOFT_RESET, TCPC_TX_SOP_PRIME);
@@ -6439,7 +6445,7 @@ static void run_state_machine(struct tcpm_port *port)
 	case VCONN_SWAP_SEND_SOFT_RESET:
 		tcpm_swap_complete(port, port->swap_status);
 		if (tcpm_can_communicate_sop_prime(port)) {
-			port->tx_sop_type = TCPC_TX_SOP_PRIME;
+			port->soft_reset_sop_type = TCPC_TX_SOP_PRIME;
 			port->upcoming_state = SOFT_RESET_SEND;
 			tcpm_ams_start(port, SOFT_RESET_AMS);
 		} else {

-- 
2.56.0

