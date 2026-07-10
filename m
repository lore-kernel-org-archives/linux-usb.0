Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E18738AC99
	for <linux-usb@vger.kernel.org>; Fri, 10 Jul 2026 20:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783713832; cv=none; b=O0T7TfVjpxDlwSuJ7BdToZhQ1sxlFp7/tDeMoSEuAkcNKprDWngyj6mtEHpORNLvX2LcuuH9zqy14t+xOLw9oHpFULSrnJxW3kclqoFsvNxwTghSNVJVxjAhbJrF9HCsgdtbB/SUy8scW8Q+n+ZITVM9xI/Ci3qZQa+L1HBa8Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783713832; c=relaxed/simple;
	bh=emIUaTE3UKXWcQW00OCaMRNz8EimlyJSGvbXh1udjSs=;
	h=Date:Mime-Version:Message-ID:Subject:From:Cc:Content-Type; b=omvOhDFAXDuB0DivHAkl7NvjkHOMCCImTsoQxk7CH8+87s0NGUPql/WIi2UlBT+oXO3ysiAeQLp7AYPyPnvYjpqafZ00mcqWnkRCLooDXW/9IHwTK07vTwaGd8iQeHDAmlYJIUKy5OM/CQk67tysw5reVCuJ0DiYnl5LwNrT+NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rdbabiera.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oZJFS1qW; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rdbabiera.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oZJFS1qW"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-cab041eced3so201348a12.1
        for <linux-usb@vger.kernel.org>; Fri, 10 Jul 2026 13:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783713829; x=1784318629; darn=vger.kernel.org;
        h=content-type:cc:from:subject:message-id:mime-version:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=h079s7w6AFi8ZJnuHY78xjLLb5DGPU4orV6hmjEbZjo=;
        b=oZJFS1qWzeLj+vLGB+aO/TN98TfMBomYddk5DeEnwbzO1SsX4Kiw0h/fc6JFQAEglf
         EYyjpxX67SwURj+dYXeaYw33A8P03a0AFgCR71If7wBtnIksRPzKVeVpfRpyWzwF+KqQ
         +D6p/6b8WfOWVZMKKi1kL6P734UGAjUhRM6XEPAvNsHYCnL+5m11tGmza0wxIhG6LYRW
         99DwGZYZwGU4zXnA7M3R5RPgXX6AwFljW4SmUDfgLRRXL+HrvSEKUsrw6kPLq56mIKk3
         9lrlca3BlKuYWRRBWXuQsFqm06JzfXpNLg/v1AWoJUmLofQ8xFzWXpcCiZOAQ9fyB0pv
         o51Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783713829; x=1784318629;
        h=content-type:cc:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h079s7w6AFi8ZJnuHY78xjLLb5DGPU4orV6hmjEbZjo=;
        b=SNsNTevA/aH58I5HnZd/0+YVBbo84W+qst24Bq3Jm+vuP18J9XvDXcNhFUgasGu5kG
         axSS549WrOsEKw/eLc0P/qo8RXUKo4lAaQtkbh+9SI2IIauOAKbgoQo8V6nGfqMW/91+
         SIpXvPTpaSYkZgsQasp2f+yk2N0Qr1iG7H72jl+hjQEjWWCIOKslENvtBdzA+Y+gjCWM
         3ZQ67tw5H6xFN3Qqu9yRI4wipFM65v4JQQWFwYf48/8uKl/q4HPtBxTORdZFN8/PGLiP
         PvdzHKImkpnPy15CV+bpHCzLHy1dBxbATEagFtHnsGk16q0NKz//bBnQElRUvx2CRh/b
         c/qA==
X-Forwarded-Encrypted: i=1; AHgh+RoVtyohXwnkUdlJP8Y0sgRdby725J7m29bQJqNVyqnc5BDcEgTTjmQSrMEsVYyzjeGalBWIPhqQA5s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1dZ7WhJ1tEmhYUma4UIiqVqjdYnh2+KS9H2jDIPkqq8XFuV7c
	a/3HyIyhH1Oak1s4iUrteHWX65Ub09AHPjPyt2f/1EcQoYvBdz8TVvqpGOHFWSl1bwgzJXcCqdT
	s1ISLTKtKQsLvYugcvA==
X-Received: from pgig5.prod.google.com ([2002:a63:f405:0:b0:c98:a4cf:469b])
 (user=rdbabiera job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:6f13:b0:3b4:b340:411d with SMTP id adf61e73a8af0-3c1108b5fe1mr487454637.24.1783713828456;
 Fri, 10 Jul 2026 13:03:48 -0700 (PDT)
Date: Fri, 10 Jul 2026 20:03:08 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=rdbabiera@google.com; a=openpgp; fpr=0B74D21BCA57BD40083A73A0DB00FC8CD80B20A1
X-Developer-Signature: v=1; a=openpgp-sha256; l=31505; i=rdbabiera@google.com;
 h=from:subject; bh=emIUaTE3UKXWcQW00OCaMRNz8EimlyJSGvbXh1udjSs=;
 b=owGbwMvMwCV2m+FPzw1uhYWMp9WSGLIC/f9aT+ifff/m18+sna8EW5VrTKNeVHbbWERYLFzbF
 nOb//n7jlIWBjEuBlkxRRbukkvSp8L3OnBYFS+AmcPKBDKEgYtTACZifofhf7jIB91wZ1PbczWz
 p9iltM/eM/GJXOBz6f2H06aunPd2QzbD/xh5SdHbLT9nXDfa+kb765e1DX02t3c5bC7v9TzvUWR ylxUA
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260710200308.1401321-2-rdbabiera@google.com>
Subject: [PATCH v4] usb: typec: tcpm: implement retry mechanism for Discover
 Identity VDMs
From: RD Babiera <rdbabiera@google.com>
Cc: heikki.krogerus@linux.intel.com, badhri@google.com, 
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, RD Babiera <rdbabiera@google.com>
Content-Type: text/plain; charset="UTF-8"

The current mechanism for sending Discover Identity in the ready state
presents a flaw where tcpm_queue_vdm can collide with non interruptible
AMSes such as GET_SINK_CAP or VCONN_SWAP. vdm_run_state_machine will hit
the VDM_STATE_BUSY state, and Discover SVIDs or Discover Modes will not
retry.

This patch introduces a state machine under the enum vdm_discovery_states.
The tcpm_port field vdm_discovery_state tracks which step of the Discover
Identity process has been completed.

The current TCPM implementation utilizes the send_discover and
send_discover_prime booleans to queue Discover Identity in the
aforementioned collision case. These booleans are removed in place of
vdm_discovery_state and send_discover_work is replaced by
vdm_discovery_work, which runs unconditionally in the ready state.
When the Discovery process is complete, the port will move to the
VDM_DISCOVERY_COMPLETE state and vdm_discovery_work becomes a no-op.
When there are still Discovery VDMs to be sent, vdm_discovery_work will
continue based on the last received response from the port partner or
cable.

Signed-off-by: RD Babiera <rdbabiera@google.com>
---
Changes since v1:
* fixed lint error regarding vdm_discovery_state_strings declaration

Changes since v2:
* Convert declaration of vdm_discovery_state into FOREACH_ macro
* Remove added newline from SNK_READY state in run_state_machine
* tcpm_reset_port now puts the VDM discovery state machine in
  VDM_DISCOVERY_UNKNOWN and cancels any pending work as opposed to
  VDM_DISCOVERY_COMPLETE.
* Removed brackets when logging states in tcpm_update_vdm_discovery_state.
* Small logging nit (added colon) to tcpm_vdm_discovery_work and
  tcpm_update_vdm_discovery_state.

Changes since v3:
* vdm_discovery_state_strings type changed across versions, sorry for
  the nit repatch here.
* Checkpatch raises an error for #define FOREACH_VDM_DISCOVERY(S),
  sending patch despite the error, as macro is consistent with rest of
  driver.
---
 drivers/usb/typec/tcpm/tcpm.c | 403 ++++++++++++++++++++++------------
 1 file changed, 261 insertions(+), 142 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 7ef746a90a17..bb89c256394e 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -212,6 +212,24 @@ static const char * const tcpm_ams_str[] = {
 	FOREACH_AMS(GENERATE_STRING)
 };
 
+#define FOREACH_VDM_DISCOVERY(S)		\
+	S(VDM_DISCOVERY_UNKNOWN),		\
+	S(VDM_DISCOVERY_PARTNER_IDENT),		\
+	S(VDM_DISCOVERY_CABLE_IDENT),		\
+	S(VDM_DISCOVERY_PARTNER_SVIDS),		\
+	S(VDM_DISCOVERY_PARTNER_MODES),		\
+	S(VDM_DISCOVERY_CABLE_SVIDS),		\
+	S(VDM_DISCOVERY_CABLE_MODES),		\
+	S(VDM_DISCOVERY_COMPLETE)
+
+enum vdm_discovery_states {
+	FOREACH_VDM_DISCOVERY(GENERATE_ENUM)
+};
+
+static const char * const vdm_discovery_state_strings[] = {
+	FOREACH_VDM_DISCOVERY(GENERATE_STRING)
+};
+
 enum vdm_states {
 	VDM_STATE_ERR_BUSY = -3,
 	VDM_STATE_ERR_SEND = -2,
@@ -274,7 +292,7 @@ enum frs_typec_current {
 #define ALTMODE_DISCOVERY_MAX	(SVID_DISCOVERY_MAX * MODE_DISCOVERY_MAX)
 
 #define GET_SINK_CAP_RETRY_MS	100
-#define SEND_DISCOVER_RETRY_MS	100
+#define SEND_DISCOVERY_VDM_RETRY_MS	100
 
 struct pd_mode_data {
 	int svid_index;		/* current SVID index		*/
@@ -483,8 +501,6 @@ struct tcpm_port {
 	bool vbus_source;
 	bool vbus_charge;
 
-	/* Set to true when Discover_Identity Command is expected to be sent in Ready states. */
-	bool send_discover;
 	bool op_vsafe5v;
 
 	int try_role;
@@ -510,8 +526,8 @@ struct tcpm_port {
 	struct kthread_work vdm_state_machine;
 	struct hrtimer enable_frs_timer;
 	struct kthread_work enable_frs;
-	struct hrtimer send_discover_timer;
-	struct kthread_work send_discover_work;
+	struct hrtimer vdm_discovery_timer;
+	struct kthread_work vdm_discovery_work;
 	bool state_machine_running;
 	/* Set to true when VDM State Machine has following actions. */
 	bool vdm_sm_running;
@@ -578,6 +594,9 @@ struct tcpm_port {
 
 	u32 bist_request;
 
+	/* VDM Discovery State to determine message sent */
+	enum vdm_discovery_states vdm_discovery_state;
+
 	/* PD state for Vendor Defined Messages */
 	enum vdm_states vdm_state;
 	u32 vdm_retries;
@@ -641,12 +660,6 @@ struct tcpm_port {
 	bool potential_contaminant;
 
 	/* SOP* Related Fields */
-	/*
-	 * Flag to determine if SOP' Discover Identity is available. The flag
-	 * is set if Discover Identity on SOP' does not immediately follow
-	 * Discover Identity on SOP.
-	 */
-	bool send_discover_prime;
 	/*
 	 * tx_sop_type determines which SOP* a message is being sent on.
 	 * For messages that are queued and not sent immediately such as in
@@ -771,6 +784,9 @@ static const char * const pd_rev[] = {
 #define tcpm_wait_for_discharge(port) \
 	(((port)->auto_vbus_discharge_enabled && !(port)->vbus_vsafe0v) ? PD_T_SAFE_0V : 0)
 
+#define tcpm_can_send_vdm(state) \
+	((state == SRC_READY || state == SNK_READY || state == SRC_VDM_IDENTITY_REQUEST))
+
 static enum tcpm_state tcpm_default_state(struct tcpm_port *port)
 {
 	if (port->port_type == TYPEC_PORT_DRP) {
@@ -1559,13 +1575,19 @@ static void mod_enable_frs_delayed_work(struct tcpm_port *port, unsigned int del
 	}
 }
 
-static void mod_send_discover_delayed_work(struct tcpm_port *port, unsigned int delay_ms)
+static void mod_vdm_discovery_cancel_delayed_work(struct tcpm_port *port)
+{
+	hrtimer_cancel(&port->vdm_discovery_timer);
+	kthread_cancel_work_sync(&port->vdm_discovery_work);
+}
+
+static void mod_vdm_discovery_delayed_work(struct tcpm_port *port, unsigned int delay_ms)
 {
 	if (delay_ms) {
-		hrtimer_start(&port->send_discover_timer, ms_to_ktime(delay_ms), HRTIMER_MODE_REL);
+		hrtimer_start(&port->vdm_discovery_timer, ms_to_ktime(delay_ms), HRTIMER_MODE_REL);
 	} else {
-		hrtimer_cancel(&port->send_discover_timer);
-		kthread_queue_work(port->wq, &port->send_discover_work);
+		hrtimer_cancel(&port->vdm_discovery_timer);
+		kthread_queue_work(port->wq, &port->vdm_discovery_work);
 	}
 }
 
@@ -1773,16 +1795,11 @@ static void tcpm_queue_vdm(struct tcpm_port *port, const u32 header,
 	WARN_ON(!mutex_is_locked(&port->lock));
 
 	/* If is sending discover_identity, handle received message first */
-	if (PD_VDO_SVDM(vdo_hdr) && PD_VDO_CMD(vdo_hdr) == CMD_DISCOVER_IDENT) {
-		if (tx_sop_type == TCPC_TX_SOP_PRIME)
-			port->send_discover_prime = true;
-		else
-			port->send_discover = true;
-		mod_send_discover_delayed_work(port, SEND_DISCOVER_RETRY_MS);
-	} else {
+	if (PD_VDO_SVDM(vdo_hdr) && PD_VDO_CMD(vdo_hdr) == CMD_DISCOVER_IDENT)
+		mod_vdm_discovery_delayed_work(port, SEND_DISCOVERY_VDM_RETRY_MS);
+	else
 		/* Make sure we are not still processing a previous VDM packet */
 		WARN_ON(port->vdm_state > VDM_STATE_DONE);
-	}
 
 	port->vdo_count = cnt + 1;
 	port->vdo_data[0] = header;
@@ -1805,8 +1822,7 @@ static void tcpm_queue_vdm_work(struct kthread_work *work)
 	struct tcpm_port *port = event->port;
 
 	mutex_lock(&port->lock);
-	if (port->state != SRC_READY && port->state != SNK_READY &&
-	    port->state != SRC_VDM_IDENTITY_REQUEST) {
+	if (!tcpm_can_send_vdm(port->state)) {
 		tcpm_log_force(port, "dropping altmode_vdm_event");
 		goto port_unlock;
 	}
@@ -2149,6 +2165,19 @@ static bool tcpm_cable_vdm_supported(struct tcpm_port *port)
 	       tcpm_can_communicate_sop_prime(port);
 }
 
+static void tcpm_update_vdm_discovery_state(struct tcpm_port *port,
+					    enum vdm_discovery_states new_state)
+{
+	enum vdm_discovery_states old_state = port->vdm_discovery_state;
+
+	if (old_state != new_state)
+		tcpm_log_force(port, "vdm discovery state changed: %s -> %s",
+			       vdm_discovery_state_strings[old_state],
+			       vdm_discovery_state_strings[new_state]);
+
+	port->vdm_discovery_state = new_state;
+}
+
 static int tcpm_handle_discover_mode(struct tcpm_port *port, u32 *response,
 				     enum tcpm_transmit_type rx_sop_type,
 				     enum tcpm_transmit_type *response_tx_sop_type)
@@ -2166,6 +2195,7 @@ static int tcpm_handle_discover_mode(struct tcpm_port *port, u32 *response,
 			response[0] = VDO(svid, 1,
 					  typec_get_negotiated_svdm_version(typec),
 					  CMD_DISCOVER_MODES);
+			tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_PARTNER_MODES);
 			return 1;
 		}
 
@@ -2174,10 +2204,12 @@ static int tcpm_handle_discover_mode(struct tcpm_port *port, u32 *response,
 			response[0] = VDO(USB_SID_PD, 1,
 					  typec_get_cable_svdm_version(typec),
 					  CMD_DISCOVER_SVID);
+			tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_PARTNER_MODES);
 			return 1;
 		}
 
 		tcpm_register_partner_altmodes(port);
+		tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_COMPLETE);
 	} else if (rx_sop_type == TCPC_TX_SOP_PRIME) {
 		modep = &port->mode_data_prime;
 		modep->svid_index++;
@@ -2188,11 +2220,13 @@ static int tcpm_handle_discover_mode(struct tcpm_port *port, u32 *response,
 			response[0] = VDO(svid, 1,
 					  typec_get_cable_svdm_version(typec),
 					  CMD_DISCOVER_MODES);
+			tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_CABLE_MODES);
 			return 1;
 		}
 
 		tcpm_register_plug_altmodes(port);
 		tcpm_register_partner_altmodes(port);
+		tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_COMPLETE);
 	}
 
 	return 0;
@@ -2371,18 +2405,18 @@ static int tcpm_pd_svdm(struct tcpm_port *port, struct typec_altmode *adev,
 						typec_cable_set_svdm_version(port->cable,
 									     svdm_version);
 				}
+				tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_PARTNER_IDENT);
+
 				/* 6.4.4.3.1 */
 				svdm_consume_identity(port, p, cnt);
 				/* Attempt Vconn swap, delay SOP' discovery if necessary */
 				if (tcpm_attempt_vconn_swap_discovery(port)) {
-					port->send_discover_prime = true;
 					port->upcoming_state = VCONN_SWAP_SEND;
 					ret = tcpm_ams_start(port, VCONN_SWAP);
 					if (!ret)
 						return 0;
 					/* Cannot perform Vconn swap */
 					port->upcoming_state = INVALID_STATE;
-					port->send_discover_prime = false;
 				}
 
 				/*
@@ -2393,7 +2427,6 @@ static int tcpm_pd_svdm(struct tcpm_port *port, struct typec_altmode *adev,
 				if (IS_ERR_OR_NULL(port->cable) &&
 				    tcpm_can_communicate_sop_prime(port)) {
 					*response_tx_sop_type = TCPC_TX_SOP_PRIME;
-					port->send_discover_prime = true;
 					response[0] = VDO(USB_SID_PD, 1,
 							  typec_get_negotiated_svdm_version(typec),
 							  CMD_DISCOVER_IDENT);
@@ -2421,6 +2454,7 @@ static int tcpm_pd_svdm(struct tcpm_port *port, struct typec_altmode *adev,
 					tcpm_set_state(port, SRC_SEND_CAPABILITIES, 0);
 					return 0;
 				}
+				tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_CABLE_IDENT);
 
 				*response_tx_sop_type = TCPC_TX_SOP;
 				response[0] = VDO(USB_SID_PD, 1,
@@ -2440,16 +2474,27 @@ static int tcpm_pd_svdm(struct tcpm_port *port, struct typec_altmode *adev,
 				rlen = 1;
 			} else {
 				if (rx_sop_type == TCPC_TX_SOP) {
+					tcpm_update_vdm_discovery_state(port,
+							VDM_DISCOVERY_PARTNER_SVIDS);
 					if (modep->nsvids && supports_modal(port)) {
 						response[0] = VDO(modep->svids[0], 1, svdm_version,
 								CMD_DISCOVER_MODES);
 						rlen = 1;
+					} else {
+						tcpm_update_vdm_discovery_state(port,
+								VDM_DISCOVERY_COMPLETE);
 					}
 				} else if (rx_sop_type == TCPC_TX_SOP_PRIME) {
+					tcpm_update_vdm_discovery_state(port,
+							VDM_DISCOVERY_CABLE_SVIDS);
 					if (modep_prime->nsvids) {
 						response[0] = VDO(modep_prime->svids[0], 1,
 								  svdm_version, CMD_DISCOVER_MODES);
 						rlen = 1;
+					} else {
+						tcpm_register_partner_altmodes(port);
+						tcpm_update_vdm_discovery_state(port,
+								VDM_DISCOVERY_COMPLETE);
 					}
 				}
 			}
@@ -2500,8 +2545,13 @@ static int tcpm_pd_svdm(struct tcpm_port *port, struct typec_altmode *adev,
 	case CMDT_RSP_NAK:
 		tcpm_ams_finish(port);
 		switch (cmd) {
+		/*
+		 * The cable is not allowed to respond with NAK so this must've happened over SOP
+		 */
 		case CMD_DISCOVER_IDENT:
 		case CMD_DISCOVER_SVID:
+			tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_COMPLETE);
+			break;
 		case VDO_CMD_VENDOR(0) ... VDO_CMD_VENDOR(15):
 			break;
 		case CMD_DISCOVER_MODES:
@@ -2681,44 +2731,6 @@ static void tcpm_handle_vdm_request(struct tcpm_port *port,
 		port->vdm_sm_running = false;
 }
 
-static void tcpm_send_vdm(struct tcpm_port *port, u32 vid, int cmd,
-			  const u32 *data, int count, enum tcpm_transmit_type tx_sop_type)
-{
-	int svdm_version;
-	u32 header;
-
-	switch (tx_sop_type) {
-	case TCPC_TX_SOP_PRIME:
-		/*
-		 * If the port partner is discovered, then the port partner's
-		 * SVDM Version will be returned
-		 */
-		svdm_version = typec_get_cable_svdm_version(port->typec_port);
-		if (svdm_version < 0)
-			svdm_version = SVDM_VER_MAX;
-		break;
-	case TCPC_TX_SOP:
-		svdm_version = typec_get_negotiated_svdm_version(port->typec_port);
-		if (svdm_version < 0)
-			return;
-		break;
-	default:
-		svdm_version = typec_get_negotiated_svdm_version(port->typec_port);
-		if (svdm_version < 0)
-			return;
-		break;
-	}
-
-	if (WARN_ON(count > VDO_MAX_SIZE - 1))
-		count = VDO_MAX_SIZE - 1;
-
-	/* set VDM header with VID & CMD */
-	header = VDO(vid, ((vid & USB_SID_PD) == USB_SID_PD) ?
-			1 : (PD_VDO_CMD(cmd) <= CMD_ATTENTION),
-			svdm_version, cmd);
-	tcpm_queue_vdm(port, header, data, count, tx_sop_type);
-}
-
 static unsigned int vdm_ready_timeout(u32 vdm_hdr)
 {
 	unsigned int timeout;
@@ -2764,8 +2776,7 @@ static void vdm_run_state_machine(struct tcpm_port *port)
 		 * if there's traffic or we're not in PDO ready state don't send
 		 * a VDM.
 		 */
-		if (port->state != SRC_READY && port->state != SNK_READY &&
-		    port->state != SRC_VDM_IDENTITY_REQUEST) {
+		if (!tcpm_can_send_vdm(port->state)) {
 			port->vdm_sm_running = false;
 			break;
 		}
@@ -2775,22 +2786,10 @@ static void vdm_run_state_machine(struct tcpm_port *port)
 			switch (PD_VDO_CMD(vdo_hdr)) {
 			case CMD_DISCOVER_IDENT:
 				res = tcpm_ams_start(port, DISCOVER_IDENTITY);
-				if (res == 0) {
-					switch (port->tx_sop_type) {
-					case TCPC_TX_SOP_PRIME:
-						port->send_discover_prime = false;
-						break;
-					case TCPC_TX_SOP:
-						port->send_discover = false;
-						break;
-					default:
-						port->send_discover = false;
-						break;
-					}
-				} else if (res == -EAGAIN) {
+				if (res == -EAGAIN) {
 					port->vdo_data[0] = 0;
-					mod_send_discover_delayed_work(port,
-								       SEND_DISCOVER_RETRY_MS);
+					mod_vdm_discovery_delayed_work(port,
+							SEND_DISCOVERY_VDM_RETRY_MS);
 				}
 				break;
 			case CMD_DISCOVER_SVID:
@@ -2848,6 +2847,7 @@ static void vdm_run_state_machine(struct tcpm_port *port)
 		 */
 		if (port->state == SRC_VDM_IDENTITY_REQUEST) {
 			tcpm_ams_finish(port);
+			port->vdo_data[0] = 0;
 			port->vdm_state = VDM_STATE_DONE;
 			tcpm_set_state(port, SRC_SEND_CAPABILITIES, 0);
 		/*
@@ -2864,6 +2864,7 @@ static void vdm_run_state_machine(struct tcpm_port *port)
 				tcpm_ams_finish(port);
 		} else {
 			tcpm_ams_finish(port);
+			port->vdo_data[0] = 0;
 			if (port->tx_sop_type == TCPC_TX_SOP)
 				break;
 			/* Handle SOP' Transmission Errors */
@@ -2873,11 +2874,11 @@ static void vdm_run_state_machine(struct tcpm_port *port)
 			 * discovery process on SOP only.
 			 */
 			case CMD_DISCOVER_IDENT:
-				port->vdo_data[0] = 0;
 				response[0] = VDO(USB_SID_PD, 1,
 						  typec_get_negotiated_svdm_version(
 									port->typec_port),
 						  CMD_DISCOVER_SVID);
+				tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_CABLE_IDENT);
 				tcpm_queue_vdm(port, response[0], &response[1],
 					       0, TCPC_TX_SOP);
 				break;
@@ -2887,9 +2888,11 @@ static void vdm_run_state_machine(struct tcpm_port *port)
 			 */
 			case CMD_DISCOVER_SVID:
 				tcpm_register_partner_altmodes(port);
+				tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_COMPLETE);
 				break;
 			case CMD_DISCOVER_MODES:
 				tcpm_register_partner_altmodes(port);
+				tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_COMPLETE);
 				break;
 			default:
 				break;
@@ -3802,7 +3805,8 @@ static void tcpm_pd_ctrl_request(struct tcpm_port *port,
 					   PD_MSG_CTRL_NOT_SUPP,
 					   NONE_AMS);
 		} else {
-			if (port->send_discover && port->negotiated_rev < PD_REV30) {
+			if (port->vdm_discovery_state == VDM_DISCOVERY_UNKNOWN &&
+			    port->negotiated_rev < PD_REV30) {
 				tcpm_queue_message(port, PD_MSG_CTRL_WAIT);
 				break;
 			}
@@ -3818,7 +3822,8 @@ static void tcpm_pd_ctrl_request(struct tcpm_port *port,
 					   PD_MSG_CTRL_NOT_SUPP,
 					   NONE_AMS);
 		} else {
-			if (port->send_discover && port->negotiated_rev < PD_REV30) {
+			if (port->vdm_discovery_state == VDM_DISCOVERY_UNKNOWN &&
+			    port->negotiated_rev < PD_REV30) {
 				tcpm_queue_message(port, PD_MSG_CTRL_WAIT);
 				break;
 			}
@@ -3827,7 +3832,8 @@ static void tcpm_pd_ctrl_request(struct tcpm_port *port,
 		}
 		break;
 	case PD_CTRL_VCONN_SWAP:
-		if (port->send_discover && port->negotiated_rev < PD_REV30) {
+		if (port->vdm_discovery_state == VDM_DISCOVERY_UNKNOWN &&
+		    port->negotiated_rev < PD_REV30) {
 			tcpm_queue_message(port, PD_MSG_CTRL_WAIT);
 			break;
 		}
@@ -4848,8 +4854,7 @@ static int tcpm_src_attach(struct tcpm_port *port)
 	port->partner = NULL;
 
 	port->attached = true;
-	port->send_discover = true;
-	port->send_discover_prime = false;
+	tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_UNKNOWN);
 
 	return 0;
 
@@ -4926,6 +4931,8 @@ static void tcpm_reset_port(struct tcpm_port *port)
 	port->in_ams = false;
 	port->ams = NONE_AMS;
 	port->vdm_sm_running = false;
+	tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_UNKNOWN);
+	mod_vdm_discovery_cancel_delayed_work(port);
 	tcpm_unregister_altmodes(port);
 	tcpm_typec_disconnect(port);
 	port->attached = false;
@@ -5009,8 +5016,7 @@ static int tcpm_snk_attach(struct tcpm_port *port)
 	port->partner = NULL;
 
 	port->attached = true;
-	port->send_discover = true;
-	port->send_discover_prime = false;
+	tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_UNKNOWN);
 
 	return 0;
 }
@@ -5417,16 +5423,11 @@ static void run_state_machine(struct tcpm_port *port)
 		 * as well.
 		 */
 		if (port->explicit_contract) {
-			if (port->send_discover_prime) {
-				port->tx_sop_type = TCPC_TX_SOP_PRIME;
-			} else {
-				port->tx_sop_type = TCPC_TX_SOP;
+			if (port->vdm_discovery_state == VDM_DISCOVERY_UNKNOWN)
 				tcpm_set_initial_svdm_version(port);
-			}
-			mod_send_discover_delayed_work(port, 0);
+			mod_vdm_discovery_delayed_work(port, 0);
 		} else {
-			port->send_discover = false;
-			port->send_discover_prime = false;
+			tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_COMPLETE);
 		}
 
 		/*
@@ -5809,16 +5810,11 @@ static void run_state_machine(struct tcpm_port *port)
 		 * as well.
 		 */
 		if (port->explicit_contract) {
-			if (port->send_discover_prime) {
-				port->tx_sop_type = TCPC_TX_SOP_PRIME;
-			} else {
-				port->tx_sop_type = TCPC_TX_SOP;
+			if (port->vdm_discovery_state == VDM_DISCOVERY_UNKNOWN)
 				tcpm_set_initial_svdm_version(port);
-			}
-			mod_send_discover_delayed_work(port, 0);
+			mod_vdm_discovery_delayed_work(port, 0);
 		} else {
-			port->send_discover = false;
-			port->send_discover_prime = false;
+			tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_COMPLETE);
 		}
 
 		power_supply_changed(port->psy);
@@ -5864,8 +5860,8 @@ static void run_state_machine(struct tcpm_port *port)
 		port->tcpc->set_pd_rx(port->tcpc, false);
 		tcpm_unregister_altmodes(port);
 		port->nr_sink_caps = 0;
-		port->send_discover = true;
-		port->send_discover_prime = false;
+		tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_UNKNOWN);
+		mod_vdm_discovery_cancel_delayed_work(port);
 		if (port->pwr_role == TYPEC_SOURCE)
 			tcpm_set_state(port, SRC_HARD_RESET_VBUS_OFF,
 				       PD_T_PS_HARD_RESET);
@@ -6012,25 +6008,15 @@ static void run_state_machine(struct tcpm_port *port)
 	/* DR_Swap states */
 	case DR_SWAP_SEND:
 		tcpm_pd_send_control(port, PD_CTRL_DR_SWAP, TCPC_TX_SOP);
-		if (port->data_role == TYPEC_DEVICE || port->negotiated_rev > PD_REV20) {
-			port->send_discover = true;
-			port->send_discover_prime = false;
-		}
 		tcpm_set_state_cond(port, DR_SWAP_SEND_TIMEOUT,
 				    PD_T_SENDER_RESPONSE);
 		break;
 	case DR_SWAP_ACCEPT:
 		tcpm_pd_send_control(port, PD_CTRL_ACCEPT, TCPC_TX_SOP);
-		if (port->data_role == TYPEC_DEVICE || port->negotiated_rev > PD_REV20) {
-			port->send_discover = true;
-			port->send_discover_prime = false;
-		}
 		tcpm_set_state_cond(port, DR_SWAP_CHANGE_DR, 0);
 		break;
 	case DR_SWAP_SEND_TIMEOUT:
 		tcpm_swap_complete(port, -ETIMEDOUT);
-		port->send_discover = false;
-		port->send_discover_prime = false;
 		tcpm_ams_finish(port);
 		tcpm_set_state(port, ready_state(port), 0);
 		break;
@@ -6042,6 +6028,8 @@ static void run_state_machine(struct tcpm_port *port)
 		else
 			tcpm_set_roles(port, true, TYPEC_STATE_USB, port->pwr_role,
 				       TYPEC_HOST);
+		if (port->data_role == TYPEC_HOST || port->negotiated_rev > PD_REV20)
+			tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_UNKNOWN);
 		tcpm_ams_finish(port);
 		tcpm_set_state(port, ready_state(port), 0);
 		break;
@@ -6325,9 +6313,7 @@ static void run_state_machine(struct tcpm_port *port)
 
 	/* Cable states */
 	case SRC_VDM_IDENTITY_REQUEST:
-		port->send_discover_prime = true;
-		port->tx_sop_type = TCPC_TX_SOP_PRIME;
-		mod_send_discover_delayed_work(port, 0);
+		mod_vdm_discovery_delayed_work(port, 0);
 		port->upcoming_state = SRC_SEND_CAPABILITIES;
 		break;
 
@@ -7031,8 +7017,8 @@ static void tcpm_enable_frs_work(struct kthread_work *work)
 		goto unlock;
 
 	/* Send when the state machine is idle */
-	if (port->state != SNK_READY || port->vdm_sm_running || port->send_discover ||
-	    port->send_discover_prime)
+	if (port->state != SNK_READY || port->vdm_sm_running ||
+	    port->vdm_discovery_state == VDM_DISCOVERY_UNKNOWN)
 		goto resched;
 
 	port->upcoming_state = GET_SINK_CAP;
@@ -7049,30 +7035,163 @@ static void tcpm_enable_frs_work(struct kthread_work *work)
 	mutex_unlock(&port->lock);
 }
 
-static void tcpm_send_discover_work(struct kthread_work *work)
+static void tcpm_vdm_discovery_work(struct kthread_work *work)
 {
-	struct tcpm_port *port = container_of(work, struct tcpm_port, send_discover_work);
+	struct tcpm_port *port = container_of(work, struct tcpm_port, vdm_discovery_work);
+	enum tcpm_transmit_type tx_sop_type = TCPC_TX_SOP;
+	struct typec_port *typec = port->typec_port;
+	struct pd_mode_data *modep, *modep_prime;
+	u32 msg[2] = { };
+	int svdm_version;
 
 	mutex_lock(&port->lock);
-	/* No need to send DISCOVER_IDENTITY anymore */
-	if (!port->send_discover && !port->send_discover_prime)
+
+	tcpm_log_force(port, "%s state [%s]", __func__,
+		       vdm_discovery_state_strings[port->vdm_discovery_state]);
+
+	/* No need to perform work if Discovery process is complete */
+	if (port->vdm_discovery_state == VDM_DISCOVERY_COMPLETE)
 		goto unlock;
 
-	if (port->data_role == TYPEC_DEVICE && port->negotiated_rev < PD_REV30) {
-		port->send_discover = false;
-		port->send_discover_prime = false;
+	/* Retry if the port is not idle */
+	if (!tcpm_can_send_vdm(port->state) || port->vdm_sm_running) {
+		mod_vdm_discovery_delayed_work(port, SEND_DISCOVERY_VDM_RETRY_MS);
 		goto unlock;
 	}
 
-	/* Retry if the port is not idle */
-	if ((port->state != SRC_READY && port->state != SNK_READY &&
-	     port->state != SRC_VDM_IDENTITY_REQUEST) || port->vdm_sm_running) {
-		mod_send_discover_delayed_work(port, SEND_DISCOVER_RETRY_MS);
+	modep = &port->mode_data;
+	modep_prime = &port->mode_data_prime;
+
+	svdm_version = typec_get_negotiated_svdm_version(typec);
+
+	switch (port->vdm_discovery_state) {
+	/*
+	 * The port has not received a Discover Identity response from the port partner.
+	 *
+	 * 1. The port will send Discover Identity to the partner over SOP in the SRC_READY and
+	 *    SNK_READY states if there is an explicit contract
+	 * 2. The port will send Discover Identity to the cable over SOP' in the
+	 *    SRC_VDM_IDENTITY_REQUEST state if capable of doing so.
+	 */
+	case VDM_DISCOVERY_UNKNOWN:
+		/* Can't send Discover Identity, VDM discovery is complete */
+		if (port->data_role == TYPEC_DEVICE && port->negotiated_rev < PD_REV30) {
+			tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_COMPLETE);
+			goto unlock;
+		}
+
+		if (port->state == SRC_VDM_IDENTITY_REQUEST) {
+			tx_sop_type = TCPC_TX_SOP_PRIME;
+			svdm_version = SVDM_VER_MAX;
+		}
+
+		msg[0] = VDO(USB_SID_PD, 1, svdm_version, CMD_DISCOVER_IDENT);
+		break;
+	/*
+	 * The port has received a Discover Identity ACK from the port partner.
+	 *
+	 * 1. The port will send Discover Identity to the cable over SOP' in the SRC_READY and
+	 *    SNK_READY states if it did not previously discover the cable but is capable of doing
+	 *    so.
+	 * 2. The port will send Discover SVIDs to the partner over SOP in the SRC_READY and
+	 *    SNK_READY states otherwise.
+	 */
+	case VDM_DISCOVERY_PARTNER_IDENT:
+		if (tcpm_can_communicate_sop_prime(port) && !port->cable) {
+			tx_sop_type = TCPC_TX_SOP_PRIME;
+			msg[0] = VDO(USB_SID_PD, 1, svdm_version, CMD_DISCOVER_IDENT);
+		} else {
+			if (tcpm_can_communicate_sop_prime(port))
+				tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_CABLE_IDENT);
+			msg[0] = VDO(USB_SID_PD, 1, svdm_version, CMD_DISCOVER_SVID);
+		}
+		break;
+	/*
+	 * The port has received a Discover Identity ACK from the cable.
+	 *
+	 * 1. The port will send Discover SVIDs to the partner over SOP.
+	 */
+	case VDM_DISCOVERY_CABLE_IDENT:
+		msg[0] = VDO(USB_SID_PD, 1, svdm_version, CMD_DISCOVER_SVID);
+		break;
+	/*
+	 * The port has received a Discover SVIDs ACK from the partner or the last SVIDs supported
+	 * by the partner.
+	 *
+	 * 1. The port will send Discover Modes for the first SVID over SOP if the partner supports
+	 *    modal operation and valid SVIDs were registered.
+	 * 2. The vdm_discovery_state will move to VDM_DISCOVERY_COMPLETE otherwise.
+	 */
+	case VDM_DISCOVERY_PARTNER_SVIDS:
+		if (modep->nsvids && supports_modal(port)) {
+			msg[0] = VDO(modep->svids[0], 1, svdm_version, CMD_DISCOVER_MODES);
+		} else {
+			tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_COMPLETE);
+			goto unlock;
+		}
+		break;
+	/*
+	 * The port has received a Discover Modes ACK from the partner for any mode.
+	 *
+	 * 1. The port will send Discover Modes for the next SVID that has not been discovered to
+	 *    the port partner over SOP.
+	 * 2. The port will send Discover SVIDs over SOP' if the port can communicate over SOP'
+	 *    and the cable supports VDMs.
+	 * 3. The vdm_discovery_state will move to VDM_DISCOVERY_COMPLETE otherwise.
+	 */
+	case VDM_DISCOVERY_PARTNER_MODES:
+		/* Not all modes have been discovered yet */
+		if (modep->svid_index < modep->nsvids) {
+			msg[0] = VDO(modep_prime->svids[modep->svid_index], 1, svdm_version,
+				     CMD_DISCOVER_MODES);
+		} else if (tcpm_can_communicate_sop_prime(port) && tcpm_cable_vdm_supported(port)) {
+			tx_sop_type = TCPC_TX_SOP_PRIME;
+			svdm_version = typec_get_cable_svdm_version(typec);
+			msg[0] = VDO(USB_SID_PD, 1, svdm_version, CMD_DISCOVER_SVID);
+		} else {
+			tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_COMPLETE);
+			goto unlock;
+		}
+		break;
+	/*
+	 * The port has received a Discover SVIDs ACK from the cable over SOP'.
+	 *
+	 * 1. The port will send Discover Modes for the first SVID over SOP'.
+	 */
+	case VDM_DISCOVERY_CABLE_SVIDS:
+		if (modep_prime->nsvids) {
+			tx_sop_type = TCPC_TX_SOP_PRIME;
+			svdm_version = typec_get_cable_svdm_version(typec);
+			msg[0] = VDO(modep_prime->svids[0], 1, svdm_version, CMD_DISCOVER_MODES);
+		} else {
+			goto unlock;
+		}
+		break;
+	/*
+	 * The port has received a Discover Modes ACK from the cable for any mode.
+	 *
+	 * 1. The port will send Discover Modes for the next SVID that has not been discovered to
+	 *    the cable over SOP'.
+	 */
+	case VDM_DISCOVERY_CABLE_MODES:
+		if (modep_prime->svid_index < modep_prime->nsvids) {
+			tx_sop_type = TCPC_TX_SOP_PRIME;
+			svdm_version = typec_get_cable_svdm_version(typec);
+			msg[0] = VDO(modep_prime->svids[modep->svid_index], 1, svdm_version,
+				     CMD_DISCOVER_MODES);
+		} else {
+			goto unlock;
+		}
+		break;
+	default:
 		goto unlock;
 	}
 
-	tcpm_send_vdm(port, USB_SID_PD, CMD_DISCOVER_IDENT, NULL, 0, port->tx_sop_type);
+	/* No port partner exists, and Discover Identity */
+	if (svdm_version < 0)
+		goto unlock;
 
+	tcpm_queue_vdm(port, msg[0], &msg[1], 0, tx_sop_type);
 unlock:
 	mutex_unlock(&port->lock);
 }
@@ -8487,12 +8606,12 @@ static enum hrtimer_restart enable_frs_timer_handler(struct hrtimer *timer)
 	return HRTIMER_NORESTART;
 }
 
-static enum hrtimer_restart send_discover_timer_handler(struct hrtimer *timer)
+static enum hrtimer_restart vdm_discovery_timer_handler(struct hrtimer *timer)
 {
-	struct tcpm_port *port = container_of(timer, struct tcpm_port, send_discover_timer);
+	struct tcpm_port *port = container_of(timer, struct tcpm_port, vdm_discovery_timer);
 
 	if (port->registered)
-		kthread_queue_work(port->wq, &port->send_discover_work);
+		kthread_queue_work(port->wq, &port->vdm_discovery_work);
 	return HRTIMER_NORESTART;
 }
 
@@ -8526,14 +8645,14 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
 	kthread_init_work(&port->vdm_state_machine, vdm_state_machine_work);
 	kthread_init_work(&port->event_work, tcpm_pd_event_handler);
 	kthread_init_work(&port->enable_frs, tcpm_enable_frs_work);
-	kthread_init_work(&port->send_discover_work, tcpm_send_discover_work);
+	kthread_init_work(&port->vdm_discovery_work, tcpm_vdm_discovery_work);
 	hrtimer_setup(&port->state_machine_timer, state_machine_timer_handler, CLOCK_MONOTONIC,
 		      HRTIMER_MODE_REL);
 	hrtimer_setup(&port->vdm_state_machine_timer, vdm_state_machine_timer_handler,
 		      CLOCK_MONOTONIC, HRTIMER_MODE_REL);
 	hrtimer_setup(&port->enable_frs_timer, enable_frs_timer_handler, CLOCK_MONOTONIC,
 		      HRTIMER_MODE_REL);
-	hrtimer_setup(&port->send_discover_timer, send_discover_timer_handler, CLOCK_MONOTONIC,
+	hrtimer_setup(&port->vdm_discovery_timer, vdm_discovery_timer_handler, CLOCK_MONOTONIC,
 		      HRTIMER_MODE_REL);
 
 	spin_lock_init(&port->pd_event_lock);
@@ -8628,7 +8747,7 @@ void tcpm_unregister_port(struct tcpm_port *port)
 	port->registered = false;
 	kthread_destroy_worker(port->wq);
 
-	hrtimer_cancel(&port->send_discover_timer);
+	hrtimer_cancel(&port->vdm_discovery_timer);
 	hrtimer_cancel(&port->enable_frs_timer);
 	hrtimer_cancel(&port->vdm_state_machine_timer);
 	hrtimer_cancel(&port->state_machine_timer);

base-commit: ab9de95c9cf952332ab79453b4b5d1bfca8e514f
-- 
2.55.0.795.g602f6c329a-goog

