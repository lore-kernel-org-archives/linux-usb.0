Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794986833;
	b=XBG3VzRjNN5BvyakABftaMBXTGbNh5GoiqTHiM84i9nxCbaUyvoeNuCS2BOrM1UhG+tV
	 YfLb4+EBsxx+6kD2el8xKMpiI7uJC490xR1eq1i7CAJLUhAWubrCW9r7U+NLC8/nAgwbi
	 I7zhGpe51JXJZu4ZQu4VeULjyQcgxrdntOespnCaOFxWG5/N3mPS3YkXRtNd3wPhZ17dX
	 xQduoYjmNXHuJnFptsgmHog1TbLYX28yFUyZBXK/bt1epZe0ILojzryCkBNqh7617sH9n
	 R+JtnrD/XNXG+QU0s6t6/bcQmi5LXrS0kG3MCrdXBTFGiN0Y+MUdXgDALzUMqc2qvJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794986833;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=q52DsBxcpIJ5ZdwdocmhvnSMhnHUhTSxbqyaBSpEmSQ=;
	b=XQziIkRg3DdPxFG9Km+XCu6tI0WzmhFxkUGU8AkYisEs3EJE017hK/Wey8SOof4t95qg
	 fp/wdpETswcQjZgoK6AvulLHVLzLB0Qi6x9TE5cElYewqcTA3rirdtjsYc0zwDsGxO29B
	 qOXxV+sQ0WxC2doeLSs6a4t9ojwBY5TRnHf9menldShtmZgv3hBItdf9eONkY55i0j0Pj
	 +E+aNglCAbYkqrI1oL88CnOp25rcXK84AHF3uWJFzd5M4HrflCk6fOVN1UgFVADV9nqcu
	 KkaF8vlKhmFj45sleFfbWYIT9w/+TEP4bdenj4mszEYE1OKS5+N9kx3OiQMuyATjRtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=ffJx9EKR;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3257606A32A
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 07:27:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3257606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=ffJx9EKR
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso270970f8f.1
        for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 23:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794986831; x=1795591631; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q52DsBxcpIJ5ZdwdocmhvnSMhnHUhTSxbqyaBSpEmSQ=;
        b=ffJx9EKRUTg/BFbNubaldNtByXG1Kmc+mXB5UIzBTeZETM9XWKor0ZVAYU4M8JxGgg
         ZG9k3y/CnJIve7kQAh+oGVUZNDXxCGhdzYv3ll4yVa9jJKjyS/51gsuo+4axrnOdcrVN
         LvCVMu8qeXtgsYsSFT4t9+qj73XG7cOnfWTvsC6C/0wWcbTptDA4ytMe6xm3REKJlDqK
         S465/mUynT+BUKuLrYXJMMcbkUG/ahQDA0eEp37DO2Yy+SmlrkL55rmZ20eaBqsW/Yxe
         dLw3JQpHiyic3s3NdefSfUnr51J1ZdZ0CGSeGV1qjeX/O2OHLzs+YofirdqbAQ+Rtl7q
         jbwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794986831; x=1795591631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q52DsBxcpIJ5ZdwdocmhvnSMhnHUhTSxbqyaBSpEmSQ=;
        b=0f5VDxj0pPmZS6PchIVOUKO1gKyeQptOdlmOG+pkgW1M6hv8/xMjTIX1J5YltrXgVP
         1tMoBsqxCI0NzqATzlGT+PGdWVBLZSu0H6FcXp6/EdWslyKhrLHXV/F7mPYSzmZ7II2R
         nCU4rc3d1occR+MpfP0VmZLEi8FYIjpWoIaMqtIScZaolVQp2NBi34teu4KfwEfsgr81
         MNM+/JEUBZEUkCOr39vMkdOCUzddvwg6XBWzjYUsyzH836SHtg+1FD6HPZNM04fh7dDA
         kZykUSlbk23ZcbTrb4GPYDYLMn5iYqEeKFh+DNHNn4ICyBSS5DXNRKR2ciTH+JBay8kt
         YFeQ==
X-Forwarded-Encrypted: i=1; AL+hErEP9MkYVXwu3gjYepaIxXqfGxdu9TxYLxufHaf9b76TaSGJjD3kN/r7OKzVoAHNlO7U5ylaLsX7w1g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ljdmoIshXxr1TY1vrgQJxok8pbzdzcaD1dfRF5aJBj71VeQD+
	V/WTedfPpXLtfbukh1Y7JO9pmzqkS6wdx41+NabiGh7/LTqyn3WR7hpJvs5y+/IE4/Q=
X-Gm-Gg: AZFdTZdkQyWHRwwH4ZcpinQLGzYerNxZu65SJDdm6h7nrfcttV6CtPowPMg8nKfh7yI
	1SiR6FFrX8hA0cRp0tJehUtOaDivkx4SXJs7b1s2hSig5M0vWfrx7Q+7Nmt92YltHkPKOzy7s8U
	aQfYQWDyEMQ3irPz2Y5QJYywj+P7TgJrbwpnY95ytPYy/UXnkGn81YALUrvW8Rpkjv1J09pctmk
	1ohZsg7YwiAGuB73bGLkqLDlppDGP3ZeJzpomGHyAxyxILIOwewBpJ81JWtzCpIla2b0maYPZ5k
	1PnvX7nLdf7boev8WhiZRYVdi1vwqlqnF0gtMj9f1bvOj4zHVenxM10w9FsVtsMQroRTCllwPSz
	Zxcdt3lGc9zSi2Tk+DdGYEIpbM4PSoRje61ZSulzTUAnDr126NSphnYO9PFL5kk6Ws3VVWhWp/u
	Y+4RLXHdToI6r3CWNZb7spmzPdjOxxjoSLvEc2W0Fqz0fQHWg/o3+Kyw+8ozBVbUvgWXY2ErHXa
	hwdcXjgpIRzpbUJr7rkT4fyKlJJxhR7PYb3ZvtKTXzlfw7ZKNytyDA6x0UMIff7F1beDJUjO+Tf
	MKSWSKpVQJPAk/7c2lINf4AfsDn97hbBG/UMfQpkAxHDS4wE328btvPUn47mVER2rrDlu7S5rnZ
	+StFI2OL17g==
X-Received: by 2002:a05:6000:4207:b0:499:978:251a with SMTP id ffacd0b85a97d-4a63fa25c9dmr3312721f8f.54.1794986831345;
        Tue, 17 Nov 2026 23:27:11 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656095f21sm2901099f8f.38.2026.11.17.23.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:27:11 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 18 Nov 2026 11:26:42 +0400
Subject: [PATCH v2 4/4] usb: typec: tcpm: Keep cable plug messages away
 from the port partner
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
Message-Id: <20261118-tcpm-soft-reset-sop-v2-4-b6decdc95e66@flipper.net>
References: <20261118-tcpm-soft-reset-sop-v2-0-b6decdc95e66@flipper.net>
In-Reply-To: <20261118-tcpm-soft-reset-sop-v2-0-b6decdc95e66@flipper.net>
To: Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 RD Babiera <rdbabiera@google.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-usb@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5556; i=alchark@flipper.net;
 h=from:subject:message-id; bh=TI626upUwKznQCIt/8Dyolq8JAeCV5lHXGDvi/23OOs=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWT9DXb7sHua4949y4U2eTm90Du8ZL7cxE7O366/K9wDX
 tx13q6b0DGRhUGMi8FSTJFl7rcltlON+Gbt8vD4CjOHlQlkiLRIAwMQsDDw5SbmlRrpGOmZahvq
 GRrpGOsYMXBxCsBUT7nNyLBdZ+WUmpJTypNZPQW5PKMr5wionzRaUfZK8E9Pzll/NX+GPzy//Rm
 EtsfEpjUbTvD7tv/cnq/n2x26rSKnt+3U/306nREA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

When the port is the VCONN source, messages from the cable plug on SOP'
go through the port partner's handlers, which act on them and answer on
SOP: an unrecognized message gets Not_Supported on SOP, which the partner
answers with a Soft_Reset, and an unexpected Accept or Reject soft resets
the partner. SOP'' and the debug SOP* types, which TCPM does not support,
take the same path and shadow the partner's last MessageID.

A cable plug only answers the VCONN source and never starts an AMS (USB
PD r3.3, section 8.5 and table 7.5). Pass on its answer to a VDM still
waiting for one, its Accept to a Soft_Reset sent to it, and its
Not_Supported to a VDM in the ready state, the only one that takes it as
the VDM's answer. Drop anything else on SOP', and drop other SOP* types
before they touch the MessageID tracking.

This hardens TCPM against cable plugs that break the rules: it was found
with a port posing as a cable plug, and no cable or TCPC driver is known
to trigger it.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/usb/typec/tcpm/tcpm.c | 74 ++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 70 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index ab7ec5334564..f9fb915d98c1 100644
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
@@ -4177,6 +4179,64 @@ static void tcpm_pd_ext_msg_request(struct tcpm_port *port,
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
+/* Whether a cable plug VDM answers the one the port is waiting on */
+static bool tcpm_cable_vdm_expected(struct tcpm_port *port,
+				    const struct pd_message *msg)
+{
+	u32 vdo = le32_to_cpu(msg->payload[0]);
+
+	return port->vdm_sop_type == TCPC_TX_SOP_PRIME &&
+	       port->vdm_state == VDM_STATE_BUSY &&
+	       PD_VDO_SVDM(vdo) && PD_VDO_CMDT(vdo) != CMDT_INIT;
+}
+
+/*
+ * A cable plug only responds to the VCONN source: to its VDMs, and to its
+ * Soft_Reset. Hand those responses to the usual handlers, which tell SOP'
+ * apart where it matters, and drop anything else on SOP': it comes from a
+ * cable plug that breaks the rules, and no sequence has the port answer a
+ * cable plug.
+ */
+static void tcpm_pd_cable_msg_request(struct tcpm_port *port,
+				      const struct pd_message *msg)
+{
+	unsigned int type = pd_header_type_le(msg->header);
+	bool ext = le16_to_cpu(msg->header) & PD_HEADER_EXT_HDR;
+	bool ctrl = !ext && !pd_header_cnt_le(msg->header);
+
+	if (!ext && !ctrl && type == PD_DATA_VENDOR_DEF &&
+	    tcpm_cable_vdm_expected(port, msg)) {
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
@@ -4217,13 +4277,17 @@ static void tcpm_pd_rx_handler(struct kthread_work *work)
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
@@ -4231,7 +4295,7 @@ static void tcpm_pd_rx_handler(struct kthread_work *work)
 		 * mismatch.
 		 */
 		if (!!(le16_to_cpu(msg->header) & PD_HEADER_DATA_ROLE) ==
-		    (port->data_role == TYPEC_HOST) && rx_sop_type == TCPC_TX_SOP) {
+		    (port->data_role == TYPEC_HOST)) {
 			tcpm_log(port,
 				 "Data role mismatch, initiating error recovery");
 			tcpm_set_state(port, ERROR_RECOVERY, 0);
@@ -6254,7 +6318,9 @@ static void run_state_machine(struct tcpm_port *port)
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

