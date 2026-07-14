Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5B8AD24;
	Tue, 14 Jul 2026 10:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784023332; cv=none; b=lWhXhUxwLmZ8BLdeO531MFXitx94m9esO3jfIu9hdiyfp3ZRRMB2Xoe6QrkmMlfAIpLsr92+pEGZm7QIf5zOSjPnNUCiK2bM2xbXxfUr7xTscECJnGQkkj3dKS+yVGAIRZOmu6c71HoGiswU6jJGet50TaAy4+jUinxAMByyHgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784023332; c=relaxed/simple;
	bh=utWgRllXcOM1d+M8nkCzctpHnwILp1Pa3JxeNPUh8xY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mGeHKSCwAzRsHDqVSmGmeDzotHRH8yWyqSw9r29za8is+t2rUfXcRXXLkRJsJzw+P6xelck301cv5WKOCGxKajoQ5OVqPNzBZl8xNY0YtyOLG1Rng2z1/FL3ZIC5qCYXnx0mG9aFgEFXlHpSfugkesjgq7NhSlDaPMzRhcjXiMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G9B2jWXD; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G9B2jWXD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784023331; x=1815559331;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=utWgRllXcOM1d+M8nkCzctpHnwILp1Pa3JxeNPUh8xY=;
  b=G9B2jWXDh0GggpIOCGpXw5Lq5VzFuolkG76xmmByN6oqRcYSWlr50HNz
   Ev6vPNEHhQFbSUajCw3JwQH4/V1hJB2sMV83RP6G7KAWOrDWz7obhvCSR
   MUMdaShuMTXQbkVqFmdvDE3ZHsOjGQJrqMHZdneTpgMF/eLSBDA1z1X72
   VFD2n26O9AzIeWK8kRADeYicXSXn5fGN0KF2GSNnGJVZSEmHD3RuehdqR
   Mgc2LYLEpEeBGTEcdSqVh/m6AfHOUjsIyrNuUWGC8G9rkrV7RCvNazrzX
   xhBa0Vf9pHYVhjx95b9miIR3u3xJ1YYf0H/BnCKhN1PQFyBE1OI07dS/r
   w==;
X-CSE-ConnectionGUID: RNlXjE9EQD6oLMl82yNgrQ==
X-CSE-MsgGUID: bRaJoTorTa+JLlCZuIaU4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="88540722"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="88540722"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 03:02:10 -0700
X-CSE-ConnectionGUID: AlCm8kkVQkKkpUtGGG30hA==
X-CSE-MsgGUID: wUy6sz3ISoabVSvRSa+5CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="255868963"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 14 Jul 2026 03:02:08 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 92B3D95; Tue, 14 Jul 2026 12:02:06 +0200 (CEST)
Date: Tue, 14 Jul 2026 13:02:05 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: RD Babiera <rdbabiera@google.com>
Cc: badhri@google.com, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] usb: typec: tcpm: implement retry mechanism for
 Discover Identity VDMs
Message-ID: <alYJHaXFR7q0q_Xq@kuha>
References: <20260710200308.1401321-2-rdbabiera@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710200308.1401321-2-rdbabiera@google.com>

On Fri, Jul 10, 2026 at 08:03:08PM +0000, RD Babiera wrote:
> The current mechanism for sending Discover Identity in the ready state
> presents a flaw where tcpm_queue_vdm can collide with non interruptible
> AMSes such as GET_SINK_CAP or VCONN_SWAP. vdm_run_state_machine will hit
> the VDM_STATE_BUSY state, and Discover SVIDs or Discover Modes will not
> retry.
> 
> This patch introduces a state machine under the enum vdm_discovery_states.
> The tcpm_port field vdm_discovery_state tracks which step of the Discover
> Identity process has been completed.
> 
> The current TCPM implementation utilizes the send_discover and
> send_discover_prime booleans to queue Discover Identity in the
> aforementioned collision case. These booleans are removed in place of
> vdm_discovery_state and send_discover_work is replaced by
> vdm_discovery_work, which runs unconditionally in the ready state.
> When the Discovery process is complete, the port will move to the
> VDM_DISCOVERY_COMPLETE state and vdm_discovery_work becomes a no-op.
> When there are still Discovery VDMs to be sent, vdm_discovery_work will
> continue based on the last received response from the port partner or
> cable.
> 
> Signed-off-by: RD Babiera <rdbabiera@google.com>
> ---
> Changes since v1:
> * fixed lint error regarding vdm_discovery_state_strings declaration
> 
> Changes since v2:
> * Convert declaration of vdm_discovery_state into FOREACH_ macro
> * Remove added newline from SNK_READY state in run_state_machine
> * tcpm_reset_port now puts the VDM discovery state machine in
>   VDM_DISCOVERY_UNKNOWN and cancels any pending work as opposed to
>   VDM_DISCOVERY_COMPLETE.
> * Removed brackets when logging states in tcpm_update_vdm_discovery_state.
> * Small logging nit (added colon) to tcpm_vdm_discovery_work and
>   tcpm_update_vdm_discovery_state.
> 
> Changes since v3:
> * vdm_discovery_state_strings type changed across versions, sorry for
>   the nit repatch here.
> * Checkpatch raises an error for #define FOREACH_VDM_DISCOVERY(S),
>   sending patch despite the error, as macro is consistent with rest of
>   driver.

This looks good to me but let's wait for Badhri. If you do v5, there
is one nitpick below. Otherwise:

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

<snip>

> -static void tcpm_send_discover_work(struct kthread_work *work)
> +static void tcpm_vdm_discovery_work(struct kthread_work *work)
>  {
> -	struct tcpm_port *port = container_of(work, struct tcpm_port, send_discover_work);
> +	struct tcpm_port *port = container_of(work, struct tcpm_port, vdm_discovery_work);
> +	enum tcpm_transmit_type tx_sop_type = TCPC_TX_SOP;
> +	struct typec_port *typec = port->typec_port;
> +	struct pd_mode_data *modep, *modep_prime;
> +	u32 msg[2] = { };
> +	int svdm_version;
>  
>  	mutex_lock(&port->lock);
> -	/* No need to send DISCOVER_IDENTITY anymore */
> -	if (!port->send_discover && !port->send_discover_prime)
> +
> +	tcpm_log_force(port, "%s state [%s]", __func__,
> +		       vdm_discovery_state_strings[port->vdm_discovery_state]);
> +
> +	/* No need to perform work if Discovery process is complete */
> +	if (port->vdm_discovery_state == VDM_DISCOVERY_COMPLETE)
>  		goto unlock;
>  
> -	if (port->data_role == TYPEC_DEVICE && port->negotiated_rev < PD_REV30) {
> -		port->send_discover = false;
> -		port->send_discover_prime = false;
> +	/* Retry if the port is not idle */
> +	if (!tcpm_can_send_vdm(port->state) || port->vdm_sm_running) {
> +		mod_vdm_discovery_delayed_work(port, SEND_DISCOVERY_VDM_RETRY_MS);
>  		goto unlock;
>  	}
>  
> -	/* Retry if the port is not idle */
> -	if ((port->state != SRC_READY && port->state != SNK_READY &&
> -	     port->state != SRC_VDM_IDENTITY_REQUEST) || port->vdm_sm_running) {
> -		mod_send_discover_delayed_work(port, SEND_DISCOVER_RETRY_MS);
> +	modep = &port->mode_data;
> +	modep_prime = &port->mode_data_prime;
> +
> +	svdm_version = typec_get_negotiated_svdm_version(typec);
> +
> +	switch (port->vdm_discovery_state) {
> +	/*
> +	 * The port has not received a Discover Identity response from the port partner.
> +	 *
> +	 * 1. The port will send Discover Identity to the partner over SOP in the SRC_READY and
> +	 *    SNK_READY states if there is an explicit contract
> +	 * 2. The port will send Discover Identity to the cable over SOP' in the
> +	 *    SRC_VDM_IDENTITY_REQUEST state if capable of doing so.
> +	 */
> +	case VDM_DISCOVERY_UNKNOWN:
> +		/* Can't send Discover Identity, VDM discovery is complete */
> +		if (port->data_role == TYPEC_DEVICE && port->negotiated_rev < PD_REV30) {
> +			tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_COMPLETE);
> +			goto unlock;
> +		}
> +
> +		if (port->state == SRC_VDM_IDENTITY_REQUEST) {
> +			tx_sop_type = TCPC_TX_SOP_PRIME;
> +			svdm_version = SVDM_VER_MAX;
> +		}
> +
> +		msg[0] = VDO(USB_SID_PD, 1, svdm_version, CMD_DISCOVER_IDENT);
> +		break;
> +	/*
> +	 * The port has received a Discover Identity ACK from the port partner.
> +	 *
> +	 * 1. The port will send Discover Identity to the cable over SOP' in the SRC_READY and
> +	 *    SNK_READY states if it did not previously discover the cable but is capable of doing
> +	 *    so.
> +	 * 2. The port will send Discover SVIDs to the partner over SOP in the SRC_READY and
> +	 *    SNK_READY states otherwise.
> +	 */
> +	case VDM_DISCOVERY_PARTNER_IDENT:
> +		if (tcpm_can_communicate_sop_prime(port) && !port->cable) {
> +			tx_sop_type = TCPC_TX_SOP_PRIME;
> +			msg[0] = VDO(USB_SID_PD, 1, svdm_version, CMD_DISCOVER_IDENT);
> +		} else {
> +			if (tcpm_can_communicate_sop_prime(port))
> +				tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_CABLE_IDENT);
> +			msg[0] = VDO(USB_SID_PD, 1, svdm_version, CMD_DISCOVER_SVID);
> +		}
> +		break;
> +	/*
> +	 * The port has received a Discover Identity ACK from the cable.
> +	 *
> +	 * 1. The port will send Discover SVIDs to the partner over SOP.
> +	 */
> +	case VDM_DISCOVERY_CABLE_IDENT:
> +		msg[0] = VDO(USB_SID_PD, 1, svdm_version, CMD_DISCOVER_SVID);
> +		break;
> +	/*
> +	 * The port has received a Discover SVIDs ACK from the partner or the last SVIDs supported
> +	 * by the partner.
> +	 *
> +	 * 1. The port will send Discover Modes for the first SVID over SOP if the partner supports
> +	 *    modal operation and valid SVIDs were registered.
> +	 * 2. The vdm_discovery_state will move to VDM_DISCOVERY_COMPLETE otherwise.
> +	 */
> +	case VDM_DISCOVERY_PARTNER_SVIDS:
> +		if (modep->nsvids && supports_modal(port)) {
> +			msg[0] = VDO(modep->svids[0], 1, svdm_version, CMD_DISCOVER_MODES);
> +		} else {
> +			tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_COMPLETE);
> +			goto unlock;
> +		}
> +		break;
> +	/*
> +	 * The port has received a Discover Modes ACK from the partner for any mode.
> +	 *
> +	 * 1. The port will send Discover Modes for the next SVID that has not been discovered to
> +	 *    the port partner over SOP.
> +	 * 2. The port will send Discover SVIDs over SOP' if the port can communicate over SOP'
> +	 *    and the cable supports VDMs.
> +	 * 3. The vdm_discovery_state will move to VDM_DISCOVERY_COMPLETE otherwise.
> +	 */
> +	case VDM_DISCOVERY_PARTNER_MODES:
> +		/* Not all modes have been discovered yet */
> +		if (modep->svid_index < modep->nsvids) {
> +			msg[0] = VDO(modep_prime->svids[modep->svid_index], 1, svdm_version,
> +				     CMD_DISCOVER_MODES);
> +		} else if (tcpm_can_communicate_sop_prime(port) && tcpm_cable_vdm_supported(port)) {
> +			tx_sop_type = TCPC_TX_SOP_PRIME;
> +			svdm_version = typec_get_cable_svdm_version(typec);
> +			msg[0] = VDO(USB_SID_PD, 1, svdm_version, CMD_DISCOVER_SVID);
> +		} else {
> +			tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_COMPLETE);
> +			goto unlock;
> +		}
> +		break;
> +	/*
> +	 * The port has received a Discover SVIDs ACK from the cable over SOP'.
> +	 *
> +	 * 1. The port will send Discover Modes for the first SVID over SOP'.
> +	 */
> +	case VDM_DISCOVERY_CABLE_SVIDS:
> +		if (modep_prime->nsvids) {
> +			tx_sop_type = TCPC_TX_SOP_PRIME;
> +			svdm_version = typec_get_cable_svdm_version(typec);
> +			msg[0] = VDO(modep_prime->svids[0], 1, svdm_version, CMD_DISCOVER_MODES);
> +		} else {
> +			goto unlock;
> +		}
> +		break;
> +	/*
> +	 * The port has received a Discover Modes ACK from the cable for any mode.
> +	 *
> +	 * 1. The port will send Discover Modes for the next SVID that has not been discovered to
> +	 *    the cable over SOP'.
> +	 */
> +	case VDM_DISCOVERY_CABLE_MODES:
> +		if (modep_prime->svid_index < modep_prime->nsvids) {
> +			tx_sop_type = TCPC_TX_SOP_PRIME;
> +			svdm_version = typec_get_cable_svdm_version(typec);
> +			msg[0] = VDO(modep_prime->svids[modep->svid_index], 1, svdm_version,
> +				     CMD_DISCOVER_MODES);
> +		} else {
> +			goto unlock;
> +		}
> +		break;
> +	default:
>  		goto unlock;
>  	}
>  
> -	tcpm_send_vdm(port, USB_SID_PD, CMD_DISCOVER_IDENT, NULL, 0, port->tx_sop_type);
> +	/* No port partner exists, and Discover Identity */
> +	if (svdm_version < 0)
> +		goto unlock;
>  
> +	tcpm_queue_vdm(port, msg[0], &msg[1], 0, tx_sop_type);

I think you could trim the above a little with this (is 0 a valid
version?):

        if (svdm_version >= 0)
        	tcpm_queue_vdm(port, msg[0], &msg[1], 0, tx_sop_type);

>  unlock:
>  	mutex_unlock(&port->lock);
>  }

thanks,

-- 
heikki
