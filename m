Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24FD3672A7
	for <linux-usb@vger.kernel.org>; Thu, 25 Jun 2026 21:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782424495; cv=none; b=YWPXt6fkpti3/oDvWF4d1PIESsvhNWzmUyk2ZzQbsO+n3aHplUoBJN6ldMIxNz/ghtZCxEUk5Rtr0p+w0o6pp3HQ5YjBtdObctPV8uIj1ENjuunkCrGGuAArou2xPj0cgpHU4pfMh8onMNNQsRbj+BbQMeP3DNMjfyDWrlWOQyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782424495; c=relaxed/simple;
	bh=CrWPoNPqjaiUcgDvNYnkm/g8wVQwjSm2az2yYAGGEEk=;
	h=Date:Mime-Version:Message-ID:Subject:From:Cc:Content-Type; b=McbIe35wKqUhZ9WEUuHdqLrSO8NI7uLGDcp2YSuT31OBfTsdlBgnYWGscB/AHBbWgaE3IWxecfi9lyyRayIumDZmJjfFpVCro4H/V75IuXBSO8H5iD7IVGKemNnUvGa5bYPVy7S8QncFl+/ziBryQ8i1PotYP9JTCtymdLrE2uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rdbabiera.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kObGUp0z; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rdbabiera.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kObGUp0z"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-845c18be724so381010b3a.3
        for <linux-usb@vger.kernel.org>; Thu, 25 Jun 2026 14:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782424493; x=1783029293; darn=vger.kernel.org;
        h=cc:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lsKWRUvzJt+4aBeMlXF0u7VPTAGbliAI2awDvLjmA9I=;
        b=kObGUp0ztdMmQ8ZdzdOrhOXjAa2VWhsTUon6muwvKD0O1xCI3WQJejhFiPe+UYdo5o
         qRTXIrygd61s8O5iwl+5qDIVYmqX6rPT4GdXs5qPXgP3u168CTQJWxR0vqvoIr0zLUWC
         w7svpe1Ek3eMzbu3+rtv9z3cKULKinyaHWj2JHIwHMeTrSeqrlLqoOVzJzwVBJHo6KiI
         TnX0FdlkeuouG2+mMCb0xX21JdwjlzrXIwj/cxfbu2+pjcJPf6mKtVo2wfS/GqwX5GN+
         6L75W8B5h0apKjE4/3y+jg+pIg0fvjhpXOq1YpOONajpPp/DPj6zsUVXKNdkGAK0WGs2
         fvkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782424493; x=1783029293;
        h=cc:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lsKWRUvzJt+4aBeMlXF0u7VPTAGbliAI2awDvLjmA9I=;
        b=qnu1322Z5ajgseaQcvX5q2YyzB4Dzme8YZL+wHeFqOOCiDiEs38ohsLa4zLfDbcS84
         I+zfFeTR7Mg7jtjSVrErz3FfloVqAQvNQCIJVa3ZzOIDn3MHB0DHIPMBVT5v852A3Me+
         pS1dtCf63k6tzkueT6Jv6zRfHebdp0a3p4v6ey7zv9+s16yiBe7hoeynFfbzTKKrsZHR
         Qejbo++clZOO12l3VYs2nVTHwhhoo7zyPNiEB46IiZXTWaVU/Payz1UamQeCYLeQjhpP
         gC2jpZvgzZcyY2EGOQFx9gMSq7RfdUjeMSbVBOVQFVUNF2mu+DNqjVTMLlONDHlQCuB/
         HE7g==
X-Forwarded-Encrypted: i=1; AFNElJ845kG8c9PHT0zCWGFiFU52cJGFYCHAujSjxOPPpxyDERatzMvPcX8srD49inWvDB+WldigMnsAPZI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMCgmjD8MSC0ndr+Evjr5E8IWd6bW9RlBQ7ziaSpq7o4E/nodV
	gCDjb8ikHbJb0sCsrRmQmCEi//orrB0bUYhvAeRiVHovjuKYVhEJb/yxT+/i/vhIrYzEnhDt7YB
	bCqIAs9530xwtF3/Grg==
X-Received: from pfbgm10.prod.google.com ([2002:a05:6a00:640a:b0:83e:ae1d:a060])
 (user=rdbabiera job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:f8c:b0:842:68d3:e29d with SMTP id d2e1a72fcca58-845b3ae2a13mr5283220b3a.36.1782424492567;
 Thu, 25 Jun 2026 14:54:52 -0700 (PDT)
Date: Thu, 25 Jun 2026 21:54:31 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=rdbabiera@google.com; a=openpgp; fpr=0B74D21BCA57BD40083A73A0DB00FC8CD80B20A1
X-Developer-Signature: v=1; a=openpgp-sha256; l=31472; i=rdbabiera@google.com;
 h=from:subject; bh=CrWPoNPqjaiUcgDvNYnkm/g8wVQwjSm2az2yYAGGEEk=;
 b=owGbwMvMwCV2m+FPzw1uhYWMp9WSGLJsF0/n/MjsyBj15UXJkYivb6pcLmh8N3Y8NmXvHoU1b
 KUrdGpkOkpZGMS4GGTFFFm4Sy5Jnwrf68BhVbwAZg4rE8gQBi5OAZhITCgjw/blU2JOiBloLZy7
 JuXVVP5Jh6rlMi/L2VxKUoypvd+07iUjw4pipe4jlgcX6kW7b/CvYutZpSmRmcj6O1PzccC+XtZ 57AA=
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260625215431.914380-2-rdbabiera@google.com>
Subject: [PATCH v2] usb: typec: tcpm: implement retry mechanism for Discover
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
The tcpm_port field vdm_discover_state tracks which step of the Discover
Identity process has been completed.

The current TCPM implementation utilizes the send_discover and
send_discover_prime booleans to queue Discover Identity in the
aforementioned collision case. These booleans are removed in place of
vdm_discover_state and send_discover_work is replaced by
vdm_discovery_work, which runs unconditionally in the ready state.
When the Discovery process is complete, the port will move to the
VDM_DISCOVERY_COMPLETE state and vdm_discovery_work becomes a no-op.
When there are still Discovery VDMs to be sent, vdm_discovery_work will
continue based on the last received response from the port partner or
cable.

Signed-off-by: RD Babiera <rdbabiera@google.com>
Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
---
Changes since v1:
* fixed lint error regarding vdm_discovery_state_strings declaration
---
 drivers/usb/typec/tcpm/tcpm.c | 417 ++++++++++++++++++++++------------
 1 file changed, 275 insertions(+), 142 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 7ef746a90a17..ba5aafa74947 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -212,6 +212,88 @@ static const char * const tcpm_ams_str[] = {
 	FOREACH_AMS(GENERATE_STRING)
 };
 
+enum vdm_discovery_states {
+	/*
+	 * VDM_DISCOVERY_UNKNOWN: The port has not received a Discover Identity response
+	 * from the port partner.
+	 *
+	 * 1. The port will send Discover Identity to the partner over SOP in the SRC_READY
+	 *    and SNK_READY states if there is an explicit contract.
+	 * 2. The port will send Discover Identity to the cable over SOP' in the
+	 *    SRC_VDM_IDENTITY_REQUEST state if capable of doing so.
+	 */
+	VDM_DISCOVERY_UNKNOWN = 0,
+	/*
+	 * VDM_DISCOVERY_PARTNER_IDENT: The port has received a Discover Identity ACK
+	 * from the port partner.
+	 *
+	 * 1. The port will send Discover Identity to the cable over SOP' in the SRC_READY and
+	 *    SNK_READY states if it did not previously discover the cable but is capable of doing
+	 *    so.
+	 * 2. The port will send Discover SVIDs to the partner over SOP in the SRC_READY and
+	 *    SNK_READY states otherwise.
+	 */
+	VDM_DISCOVERY_PARTNER_IDENT,
+	/*
+	 * VDM_DISCOVERY_CABLE_IDENT: The port has received a Discover Identity ACK
+	 * from the cable.
+	 *
+	 * 1. The port will send Discover SVIDs to the partner over SOP.
+	 */
+	VDM_DISCOVERY_CABLE_IDENT,
+	/*
+	 * VDM_DISCOVERY_PARTNER_SVIDS: The port has received a Discover SVIDs ACK from the partner
+	 * for the last SVIDs supported by the partner.
+	 *
+	 * 1. The port will send Discover Modes for the first SVID over SOP if the partner supports
+	 *    modal operation and valid SVIDs were registered.
+	 * 2. The vdm_discovery_state will move to VDM_DISCOVERY_COMPLETE otherwise.
+	 */
+	VDM_DISCOVERY_PARTNER_SVIDS,
+	/*
+	 * VDM_DISCOVERY_PARTNER_MODES: The port has received a Discover Modes ACK from the partner
+	 * for any mode.
+	 *
+	 * 1. The port will send Discover Modes for the next SVID that has not been discovered to
+	 *    the port partner over SOP.
+	 * 2. The port will send Discover SVIDs over SOP' if the port can communicate over SOP'
+	 *    and the cable supports VDMs.
+	 * 3. The vdm_discovery_state will move to VDM_DISCOVERY_COMPLETE otherwise.
+	 */
+	VDM_DISCOVERY_PARTNER_MODES,
+	/*
+	 * VDM_DISCOVERY_CABLE_SVIDS: The port has received a Discover SVIDs ACK from the cable over
+	 * SOP'.
+	 *
+	 * 1. The port will send Discover Modes for the first SVID over SOP'.
+	 */
+	VDM_DISCOVERY_CABLE_SVIDS,
+	/*
+	 * VDM_DISCOVERY_CABLE_MODES: The port has received a Discover Modes ACK from the cable for
+	 * any mode.
+	 *
+	 * 1. The port will send Discover Modes for the next SVID that has not been discovered to
+	 *    the cable over SOP'.
+	 */
+	VDM_DISCOVERY_CABLE_MODES,
+	/*
+	 * VDM_DISCOVERY_COMPLETE: The port partner does not need to send a Discovery VDM to the
+	 * port partner or cable.
+	 */
+	VDM_DISCOVERY_COMPLETE,
+};
+
+static const char * const vdm_discovery_state_strings[] = {
+	[VDM_DISCOVERY_UNKNOWN] = "VDM_DISCOVERY_UNKNOWN",
+	[VDM_DISCOVERY_PARTNER_IDENT] = "VDM_DISCOVERY_PARTNER_IDENT",
+	[VDM_DISCOVERY_CABLE_IDENT] = "VDM_DISCOVERY_CABLE_IDENT",
+	[VDM_DISCOVERY_PARTNER_SVIDS] = "VDM_DISCOVERY_PARTNER_SVIDS",
+	[VDM_DISCOVERY_PARTNER_MODES] = "VDM_DISCOVERY_PARTNER_MODES",
+	[VDM_DISCOVERY_CABLE_SVIDS] = "VDM_DISCOVERY_CABLE_SVIDS",
+	[VDM_DISCOVERY_CABLE_MODES] = "VDM_DISCOVERY_CABLE_MODES",
+	[VDM_DISCOVERY_COMPLETE] = "VDM_DISCOVERY_COMPLETE",
+};
+
 enum vdm_states {
 	VDM_STATE_ERR_BUSY = -3,
 	VDM_STATE_ERR_SEND = -2,
@@ -274,7 +356,7 @@ enum frs_typec_current {
 #define ALTMODE_DISCOVERY_MAX	(SVID_DISCOVERY_MAX * MODE_DISCOVERY_MAX)
 
 #define GET_SINK_CAP_RETRY_MS	100
-#define SEND_DISCOVER_RETRY_MS	100
+#define SEND_DISCOVERY_VDM_RETRY_MS	100
 
 struct pd_mode_data {
 	int svid_index;		/* current SVID index		*/
@@ -483,8 +565,6 @@ struct tcpm_port {
 	bool vbus_source;
 	bool vbus_charge;
 
-	/* Set to true when Discover_Identity Command is expected to be sent in Ready states. */
-	bool send_discover;
 	bool op_vsafe5v;
 
 	int try_role;
@@ -510,8 +590,8 @@ struct tcpm_port {
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
@@ -578,6 +658,9 @@ struct tcpm_port {
 
 	u32 bist_request;
 
+	/* VDM Discovery State to determine message sent */
+	enum vdm_discovery_states vdm_discovery_state;
+
 	/* PD state for Vendor Defined Messages */
 	enum vdm_states vdm_state;
 	u32 vdm_retries;
@@ -641,12 +724,6 @@ struct tcpm_port {
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
@@ -771,6 +848,9 @@ static const char * const pd_rev[] = {
 #define tcpm_wait_for_discharge(port) \
 	(((port)->auto_vbus_discharge_enabled && !(port)->vbus_vsafe0v) ? PD_T_SAFE_0V : 0)
 
+#define tcpm_can_send_vdm(state) \
+	((state == SRC_READY || state == SNK_READY || state == SRC_VDM_IDENTITY_REQUEST))
+
 static enum tcpm_state tcpm_default_state(struct tcpm_port *port)
 {
 	if (port->port_type == TYPEC_PORT_DRP) {
@@ -1559,13 +1639,19 @@ static void mod_enable_frs_delayed_work(struct tcpm_port *port, unsigned int del
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
 
@@ -1773,16 +1859,11 @@ static void tcpm_queue_vdm(struct tcpm_port *port, const u32 header,
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
@@ -1805,8 +1886,7 @@ static void tcpm_queue_vdm_work(struct kthread_work *work)
 	struct tcpm_port *port = event->port;
 
 	mutex_lock(&port->lock);
-	if (port->state != SRC_READY && port->state != SNK_READY &&
-	    port->state != SRC_VDM_IDENTITY_REQUEST) {
+	if (!tcpm_can_send_vdm(port->state)) {
 		tcpm_log_force(port, "dropping altmode_vdm_event");
 		goto port_unlock;
 	}
@@ -2149,6 +2229,19 @@ static bool tcpm_cable_vdm_supported(struct tcpm_port *port)
 	       tcpm_can_communicate_sop_prime(port);
 }
 
+static void tcpm_update_vdm_discovery_state(struct tcpm_port *port,
+					    enum vdm_discovery_states new_state)
+{
+	enum vdm_discovery_states old_state = port->vdm_discovery_state;
+
+	if (old_state != new_state)
+		tcpm_log_force(port, "vdm discovery state changed [%s -> %s]",
+			       vdm_discovery_state_strings[old_state],
+			       vdm_discovery_state_strings[new_state]);
+
+	port->vdm_discovery_state = new_state;
+}
+
 static int tcpm_handle_discover_mode(struct tcpm_port *port, u32 *response,
 				     enum tcpm_transmit_type rx_sop_type,
 				     enum tcpm_transmit_type *response_tx_sop_type)
@@ -2166,6 +2259,7 @@ static int tcpm_handle_discover_mode(struct tcpm_port *port, u32 *response,
 			response[0] = VDO(svid, 1,
 					  typec_get_negotiated_svdm_version(typec),
 					  CMD_DISCOVER_MODES);
+			tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_PARTNER_MODES);
 			return 1;
 		}
 
@@ -2174,10 +2268,12 @@ static int tcpm_handle_discover_mode(struct tcpm_port *port, u32 *response,
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
@@ -2188,11 +2284,13 @@ static int tcpm_handle_discover_mode(struct tcpm_port *port, u32 *response,
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
@@ -2371,18 +2469,18 @@ static int tcpm_pd_svdm(struct tcpm_port *port, struct typec_altmode *adev,
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
@@ -2393,7 +2491,6 @@ static int tcpm_pd_svdm(struct tcpm_port *port, struct typec_altmode *adev,
 				if (IS_ERR_OR_NULL(port->cable) &&
 				    tcpm_can_communicate_sop_prime(port)) {
 					*response_tx_sop_type = TCPC_TX_SOP_PRIME;
-					port->send_discover_prime = true;
 					response[0] = VDO(USB_SID_PD, 1,
 							  typec_get_negotiated_svdm_version(typec),
 							  CMD_DISCOVER_IDENT);
@@ -2421,6 +2518,7 @@ static int tcpm_pd_svdm(struct tcpm_port *port, struct typec_altmode *adev,
 					tcpm_set_state(port, SRC_SEND_CAPABILITIES, 0);
 					return 0;
 				}
+				tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_CABLE_IDENT);
 
 				*response_tx_sop_type = TCPC_TX_SOP;
 				response[0] = VDO(USB_SID_PD, 1,
@@ -2440,16 +2538,27 @@ static int tcpm_pd_svdm(struct tcpm_port *port, struct typec_altmode *adev,
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
@@ -2500,8 +2609,13 @@ static int tcpm_pd_svdm(struct tcpm_port *port, struct typec_altmode *adev,
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
@@ -2681,44 +2795,6 @@ static void tcpm_handle_vdm_request(struct tcpm_port *port,
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
@@ -2764,8 +2840,7 @@ static void vdm_run_state_machine(struct tcpm_port *port)
 		 * if there's traffic or we're not in PDO ready state don't send
 		 * a VDM.
 		 */
-		if (port->state != SRC_READY && port->state != SNK_READY &&
-		    port->state != SRC_VDM_IDENTITY_REQUEST) {
+		if (!tcpm_can_send_vdm(port->state)) {
 			port->vdm_sm_running = false;
 			break;
 		}
@@ -2775,22 +2850,10 @@ static void vdm_run_state_machine(struct tcpm_port *port)
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
@@ -2848,6 +2911,7 @@ static void vdm_run_state_machine(struct tcpm_port *port)
 		 */
 		if (port->state == SRC_VDM_IDENTITY_REQUEST) {
 			tcpm_ams_finish(port);
+			port->vdo_data[0] = 0;
 			port->vdm_state = VDM_STATE_DONE;
 			tcpm_set_state(port, SRC_SEND_CAPABILITIES, 0);
 		/*
@@ -2864,6 +2928,7 @@ static void vdm_run_state_machine(struct tcpm_port *port)
 				tcpm_ams_finish(port);
 		} else {
 			tcpm_ams_finish(port);
+			port->vdo_data[0] = 0;
 			if (port->tx_sop_type == TCPC_TX_SOP)
 				break;
 			/* Handle SOP' Transmission Errors */
@@ -2873,11 +2938,11 @@ static void vdm_run_state_machine(struct tcpm_port *port)
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
@@ -2887,9 +2952,11 @@ static void vdm_run_state_machine(struct tcpm_port *port)
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
@@ -3802,7 +3869,8 @@ static void tcpm_pd_ctrl_request(struct tcpm_port *port,
 					   PD_MSG_CTRL_NOT_SUPP,
 					   NONE_AMS);
 		} else {
-			if (port->send_discover && port->negotiated_rev < PD_REV30) {
+			if (port->vdm_discovery_state == VDM_DISCOVERY_UNKNOWN &&
+			    port->negotiated_rev < PD_REV30) {
 				tcpm_queue_message(port, PD_MSG_CTRL_WAIT);
 				break;
 			}
@@ -3818,7 +3886,8 @@ static void tcpm_pd_ctrl_request(struct tcpm_port *port,
 					   PD_MSG_CTRL_NOT_SUPP,
 					   NONE_AMS);
 		} else {
-			if (port->send_discover && port->negotiated_rev < PD_REV30) {
+			if (port->vdm_discovery_state == VDM_DISCOVERY_UNKNOWN &&
+			    port->negotiated_rev < PD_REV30) {
 				tcpm_queue_message(port, PD_MSG_CTRL_WAIT);
 				break;
 			}
@@ -3827,7 +3896,8 @@ static void tcpm_pd_ctrl_request(struct tcpm_port *port,
 		}
 		break;
 	case PD_CTRL_VCONN_SWAP:
-		if (port->send_discover && port->negotiated_rev < PD_REV30) {
+		if (port->vdm_discovery_state == VDM_DISCOVERY_UNKNOWN &&
+		    port->negotiated_rev < PD_REV30) {
 			tcpm_queue_message(port, PD_MSG_CTRL_WAIT);
 			break;
 		}
@@ -4848,8 +4918,7 @@ static int tcpm_src_attach(struct tcpm_port *port)
 	port->partner = NULL;
 
 	port->attached = true;
-	port->send_discover = true;
-	port->send_discover_prime = false;
+	tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_UNKNOWN);
 
 	return 0;
 
@@ -4926,6 +4995,7 @@ static void tcpm_reset_port(struct tcpm_port *port)
 	port->in_ams = false;
 	port->ams = NONE_AMS;
 	port->vdm_sm_running = false;
+	tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_COMPLETE);
 	tcpm_unregister_altmodes(port);
 	tcpm_typec_disconnect(port);
 	port->attached = false;
@@ -5009,8 +5079,7 @@ static int tcpm_snk_attach(struct tcpm_port *port)
 	port->partner = NULL;
 
 	port->attached = true;
-	port->send_discover = true;
-	port->send_discover_prime = false;
+	tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_UNKNOWN);
 
 	return 0;
 }
@@ -5417,16 +5486,11 @@ static void run_state_machine(struct tcpm_port *port)
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
@@ -5809,18 +5873,14 @@ static void run_state_machine(struct tcpm_port *port)
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
 
+
 		power_supply_changed(port->psy);
 		break;
 
@@ -5864,8 +5924,8 @@ static void run_state_machine(struct tcpm_port *port)
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
@@ -6012,25 +6072,15 @@ static void run_state_machine(struct tcpm_port *port)
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
@@ -6042,6 +6092,8 @@ static void run_state_machine(struct tcpm_port *port)
 		else
 			tcpm_set_roles(port, true, TYPEC_STATE_USB, port->pwr_role,
 				       TYPEC_HOST);
+		if (port->data_role == TYPEC_HOST || port->negotiated_rev > PD_REV20)
+			tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_UNKNOWN);
 		tcpm_ams_finish(port);
 		tcpm_set_state(port, ready_state(port), 0);
 		break;
@@ -6325,9 +6377,7 @@ static void run_state_machine(struct tcpm_port *port)
 
 	/* Cable states */
 	case SRC_VDM_IDENTITY_REQUEST:
-		port->send_discover_prime = true;
-		port->tx_sop_type = TCPC_TX_SOP_PRIME;
-		mod_send_discover_delayed_work(port, 0);
+		mod_vdm_discovery_delayed_work(port, 0);
 		port->upcoming_state = SRC_SEND_CAPABILITIES;
 		break;
 
@@ -7031,8 +7081,8 @@ static void tcpm_enable_frs_work(struct kthread_work *work)
 		goto unlock;
 
 	/* Send when the state machine is idle */
-	if (port->state != SNK_READY || port->vdm_sm_running || port->send_discover ||
-	    port->send_discover_prime)
+	if (port->state != SNK_READY || port->vdm_sm_running ||
+	    port->vdm_discovery_state == VDM_DISCOVERY_UNKNOWN)
 		goto resched;
 
 	port->upcoming_state = GET_SINK_CAP;
@@ -7049,30 +7099,113 @@ static void tcpm_enable_frs_work(struct kthread_work *work)
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
+	case VDM_DISCOVERY_CABLE_IDENT:
+		msg[0] = VDO(USB_SID_PD, 1, svdm_version, CMD_DISCOVER_SVID);
+		break;
+	case VDM_DISCOVERY_PARTNER_SVIDS:
+		if (modep->nsvids && supports_modal(port)) {
+			msg[0] = VDO(modep->svids[0], 1, svdm_version, CMD_DISCOVER_MODES);
+		} else {
+			tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_COMPLETE);
+			goto unlock;
+		}
+		break;
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
+	case VDM_DISCOVERY_CABLE_SVIDS:
+		if (modep_prime->nsvids) {
+			tx_sop_type = TCPC_TX_SOP_PRIME;
+			svdm_version = typec_get_cable_svdm_version(typec);
+			msg[0] = VDO(modep_prime->svids[0], 1, svdm_version, CMD_DISCOVER_MODES);
+		} else {
+			goto unlock;
+		}
+		break;
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
@@ -8487,12 +8620,12 @@ static enum hrtimer_restart enable_frs_timer_handler(struct hrtimer *timer)
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
 
@@ -8526,14 +8659,14 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
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
@@ -8628,7 +8761,7 @@ void tcpm_unregister_port(struct tcpm_port *port)
 	port->registered = false;
 	kthread_destroy_worker(port->wq);
 
-	hrtimer_cancel(&port->send_discover_timer);
+	hrtimer_cancel(&port->vdm_discovery_timer);
 	hrtimer_cancel(&port->enable_frs_timer);
 	hrtimer_cancel(&port->vdm_state_machine_timer);
 	hrtimer_cancel(&port->state_machine_timer);

base-commit: ab9de95c9cf952332ab79453b4b5d1bfca8e514f
-- 
2.55.0.rc0.799.gd6f94ed593-goog

