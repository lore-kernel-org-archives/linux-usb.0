Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9382532B116
	for <linux-usb@vger.kernel.org>; Mon, 20 Jul 2026 11:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784546357; cv=pass; b=YP31yVS9haazGlTmsCLIp2KrF6OedapJ+BKkP9BAMYy1QFv5T/rxlLceHCYENZEtTiYEE/mWbNd6HDKd/6GNoEssvHWmbdypSTPZ/mKpWvVqhvHiHMcLXkzPJJWmlBHlxY41dkf3X0YPuJGGCu8pEvk7HAh2lEolrXbGQi1U22Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784546357; c=relaxed/simple;
	bh=bWqiFaSxDfBIYlaE9/R2SCjIViInDj6ScYLrUOfZZWQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qxIs6AFHDP50NqxMFYkPFtNP4USZdk+p45qUW5nCoiF+1dUz7MTl4scwEcvYpGUu3E1aRU60A1cr9Iye1MI1moHDwJUTIXH5cG+RYJCZl2D/UNfaxekaK6MWi8FTj1FZJ9vh8UdS9TkE5ENYFXJExvmkXiT90lgYDDNkGS1xAsw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fYAvINyd; arc=pass smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fYAvINyd"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4a4cb36ae00so2197330b6e.0
        for <linux-usb@vger.kernel.org>; Mon, 20 Jul 2026 04:19:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784546352; cv=none;
        d=google.com; s=arc-20260327;
        b=Rt2dwwEnXJiv50AoEnHaX9KSd62kwEJhlCBUanZVgtBXtrOOp01CAOoAVtAfm6cQ4O
         FV+rWeP6hpTSDfsVLZRLJYsrWM+0C95LFnOvIAyZCSRbsyKa7msmAN3DxjW9xN4ZcCIt
         4VAbOLaNirE7UBQ6tNB6rWnFEsRJJ4UoseZx/wsrKcEZwsmvE61OEgWa/yX6S11zeg8t
         Hto7xR8fzKoMisfjC2iNNRngwdTY9fLu3hIE9uxNxqDbS2QoadJaqh3WbTW8TyypDkMa
         q5FESPAkBcoGH2vPdTkwxhW0uCGCuy1xzz+lrF5P5hwVBvxtfcTTwtPLXlO8YRo8GhWj
         TEgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PgrPxNVW7qkt2o/ma6IZuHVl0uqKMSn5PT0HeNG6xag=;
        fh=W1VkZKMT9JEwLo4I7cQ/ub8xA3mgLKwOp0vvo2TszjM=;
        b=XcR/uC4t19judW75pIUEOa0JM0jVV64Nkp+O9FBsPuBz8qOG54y1zOFnDHUy+3zu4V
         a/RDO9dMlL7nLh/Qb1FUkvkm4P8Ogt1u571oVb0t5lZw+ebRZfXuJjJmKu4pu9hJR+nt
         K02GfLfX2KqvaRdPp2vaVPDu0ct8LfR0PBsfsEAAXVYlsbLBYu4EM3Jva0ZEccaoCb/U
         g2gXN0iwmCzje2+C5IxIuaJ7So0Ylrg2P/fetFmJLxgkXz+pwDmpsF0JlxXrln4NxDtl
         LIwHTBIyTRGPbCo6nFWqsrn1bzKsJCSOzMtmyZGVMrFyHA6sU2SV90nrrXi6is3DbYXG
         xNSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784546352; x=1785151152; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PgrPxNVW7qkt2o/ma6IZuHVl0uqKMSn5PT0HeNG6xag=;
        b=fYAvINyd0D+tdevYnbO5/omqXboNaSurMB6AH+5fzXkSvFqVMT192nGHCCTSx4/o9Q
         wyL3ruJGDE8lHoNO0smhiEtwiFk8LVptqy8O7jRCykGCloZjvwwxr/P6goTKH6YDvfze
         xo8fuKPnzl4zIc7oWpld9Wf/6NHVWkgG1HSqs2AzFHh+H0sqErFSypD/sMErHoB0yuy4
         RzJwZY4CJYCANDGetghKI5Eux6sc+oINC+1iPny87Lu6t+fi5UhJy3FIuquTWpGdK31H
         7130NqZ7hFNY20Adp3luE824Va87ksbR32UoM24P5h4vwUr14udnMbsbaaOz03gY4hkT
         0U9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784546352; x=1785151152;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PgrPxNVW7qkt2o/ma6IZuHVl0uqKMSn5PT0HeNG6xag=;
        b=JuH4xQe1Rl7UXLxCyEIbR2qcWY6rlo27eadzxoQmgq0Cvly2ymseNy7uik+Ywn3X1x
         ddFBkB/TaLm03QXxAKcXVX553cf/W4jUL7svRBNhMAQ0fn/twbxtH8BFwiljri4aayH0
         FZQUPEw6GfLqwRzwUjwxycaHIdYjmaHYAgGQvNPKq9+X8Ys1+yK+EqZ5nZhksyj4Klre
         N3FJcsDw1btOO5Rqaf592hyYvRHTKHTcPtr/WyDAQ4kE/Zsgvl5QvJocqqBV7XkbZjWn
         ExaZRQsk826F0ymRENvtRkR/MZ6PFwV91V4nxDySGtHtNmh1T1Y2wdibZjc8YduaYIgg
         Kx9g==
X-Forwarded-Encrypted: i=1; AHgh+Rqv/sFuyF7gd3eT1DZp6wOCzp3fH7nD9F7XD63iDxo6ZpTj/g1isTDuRwwacjpIBrzVW5af6QTSLow=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1yprsKfBUSFJ941QKOECAlY2Uy2gNJNguTQPytv7jvUnAwAKV
	fJajD8cr7+91exW4LXT5rUuXvA8lWMwlB+TamwOhEXNIuPa2bwAwDSZENCNSXOCe/YK1UYRysSO
	+Rc9ul0XV7rYT9BP2UYYOgWAp1Gtsyu5MHCwOacJUsrZcZvmc2GF8d0rptFk=
X-Gm-Gg: AfdE7cmULIJPJ1TFhPF9LIKRhfnwsr1/9CobisY12kpil33IgpxToelpAiQYxxDpeLm
	lxuG/jSAT7Uy5Rq9CfwPyCfPdJ1PHGxeweQuyyyzv13g5dkIFP8eh2I9YdXUaZkPqsIjEBnQ1RT
	f4V6W7R+89oYnlsu6i5uFdb4DpTyGUgJvZThdocWLiuKmIuQdUFVisdJxyPi7chO5inr+tTgTxM
	HABcgG6UfoUbZu80FlosU87+1PHYvPDfw1Rqz7N49I/bL4oMqWT+Sx01eI9Kd4tfy1mcKi/kaOc
	EIuro/eKUQ8NvgvWAA==
X-Received: by 2002:a05:6808:221a:b0:490:5ba4:18a3 with SMTP id
 5614622812f47-4a4d04cf115mr6992201b6e.30.1784546351370; Mon, 20 Jul 2026
 04:19:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717232612.3671978-2-rdbabiera@google.com>
In-Reply-To: <20260717232612.3671978-2-rdbabiera@google.com>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Mon, 20 Jul 2026 04:18:33 -0700
X-Gm-Features: AUfX_mxdJwUc9yJn3A0FszYNM37CkpjxRghFeEeIWfi2k3uThyo7w5_3msqcQEw
Message-ID: <CAPTae5K1RwefMcpAT3-s+TFnX7eNPXfaR_-cF=tQ2da3MGH9DA@mail.gmail.com>
Subject: Re: [PATCH v5] usb: typec: tcpm: implement retry mechanism for
 Discover Identity VDMs
To: RD Babiera <rdbabiera@google.com>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2026 at 4:26=E2=80=AFPM RD Babiera <rdbabiera@google.com> w=
rote:
>
> The current mechanism for sending Discover Identity in the ready state
> presents a flaw where tcpm_queue_vdm can collide with non interruptible
> AMSes such as GET_SINK_CAP or VCONN_SWAP. vdm_run_state_machine will hit
> the VDM_STATE_BUSY state, and Discover SVIDs or Discover Modes will not
> retry.
>
> This patch introduces a state machine under the enum vdm_discovery_states=
.
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
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>

My previous reviewed-by seems to have been dropped in v3 to address
the comments in
https://lore.kernel.org/all/CALzBnUEBtoiW1+hBBxkvpp4+8f-3uVyg3+4LKX8ezTg6ze=
OfTw@mail.gmail.com/.
The comments seem to have been addressed, so LGTM.

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
> * Removed brackets when logging states in tcpm_update_vdm_discovery_state=
.
> * Small logging nit (added colon) to tcpm_vdm_discovery_work and
>   tcpm_update_vdm_discovery_state.
>
> Changes since v3:
> * vdm_discovery_state_strings type changed across versions, sorry for
>   the nit repatch here.
> * Checkpatch raises an error for #define FOREACH_VDM_DISCOVERY(S),
>   sending patch despite the error, as macro is consistent with rest of
>   driver.
>
> Changes since v4:
> * Fixed small nit in tcpm_vdm_discovery_work when evaluating
>   svdm_version prior to tcpm_queue_vdm.
> * Added Reviewed-by tag
> ---
>  drivers/usb/typec/tcpm/tcpm.c | 401 ++++++++++++++++++++++------------
>  1 file changed, 259 insertions(+), 142 deletions(-)
>
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.=
c
> index 7ef746a90a17..d062a49022ee 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -212,6 +212,24 @@ static const char * const tcpm_ams_str[] =3D {
>         FOREACH_AMS(GENERATE_STRING)
>  };
>
> +#define FOREACH_VDM_DISCOVERY(S)               \
> +       S(VDM_DISCOVERY_UNKNOWN),               \
> +       S(VDM_DISCOVERY_PARTNER_IDENT),         \
> +       S(VDM_DISCOVERY_CABLE_IDENT),           \
> +       S(VDM_DISCOVERY_PARTNER_SVIDS),         \
> +       S(VDM_DISCOVERY_PARTNER_MODES),         \
> +       S(VDM_DISCOVERY_CABLE_SVIDS),           \
> +       S(VDM_DISCOVERY_CABLE_MODES),           \
> +       S(VDM_DISCOVERY_COMPLETE)
> +
> +enum vdm_discovery_states {
> +       FOREACH_VDM_DISCOVERY(GENERATE_ENUM)
> +};
> +
> +static const char * const vdm_discovery_state_strings[] =3D {
> +       FOREACH_VDM_DISCOVERY(GENERATE_STRING)
> +};
> +
>  enum vdm_states {
>         VDM_STATE_ERR_BUSY =3D -3,
>         VDM_STATE_ERR_SEND =3D -2,
> @@ -274,7 +292,7 @@ enum frs_typec_current {
>  #define ALTMODE_DISCOVERY_MAX  (SVID_DISCOVERY_MAX * MODE_DISCOVERY_MAX)
>
>  #define GET_SINK_CAP_RETRY_MS  100
> -#define SEND_DISCOVER_RETRY_MS 100
> +#define SEND_DISCOVERY_VDM_RETRY_MS    100
>
>  struct pd_mode_data {
>         int svid_index;         /* current SVID index           */
> @@ -483,8 +501,6 @@ struct tcpm_port {
>         bool vbus_source;
>         bool vbus_charge;
>
> -       /* Set to true when Discover_Identity Command is expected to be s=
ent in Ready states. */
> -       bool send_discover;
>         bool op_vsafe5v;
>
>         int try_role;
> @@ -510,8 +526,8 @@ struct tcpm_port {
>         struct kthread_work vdm_state_machine;
>         struct hrtimer enable_frs_timer;
>         struct kthread_work enable_frs;
> -       struct hrtimer send_discover_timer;
> -       struct kthread_work send_discover_work;
> +       struct hrtimer vdm_discovery_timer;
> +       struct kthread_work vdm_discovery_work;
>         bool state_machine_running;
>         /* Set to true when VDM State Machine has following actions. */
>         bool vdm_sm_running;
> @@ -578,6 +594,9 @@ struct tcpm_port {
>
>         u32 bist_request;
>
> +       /* VDM Discovery State to determine message sent */
> +       enum vdm_discovery_states vdm_discovery_state;
> +
>         /* PD state for Vendor Defined Messages */
>         enum vdm_states vdm_state;
>         u32 vdm_retries;
> @@ -641,12 +660,6 @@ struct tcpm_port {
>         bool potential_contaminant;
>
>         /* SOP* Related Fields */
> -       /*
> -        * Flag to determine if SOP' Discover Identity is available. The =
flag
> -        * is set if Discover Identity on SOP' does not immediately follo=
w
> -        * Discover Identity on SOP.
> -        */
> -       bool send_discover_prime;
>         /*
>          * tx_sop_type determines which SOP* a message is being sent on.
>          * For messages that are queued and not sent immediately such as =
in
> @@ -771,6 +784,9 @@ static const char * const pd_rev[] =3D {
>  #define tcpm_wait_for_discharge(port) \
>         (((port)->auto_vbus_discharge_enabled && !(port)->vbus_vsafe0v) ?=
 PD_T_SAFE_0V : 0)
>
> +#define tcpm_can_send_vdm(state) \
> +       ((state =3D=3D SRC_READY || state =3D=3D SNK_READY || state =3D=
=3D SRC_VDM_IDENTITY_REQUEST))
> +
>  static enum tcpm_state tcpm_default_state(struct tcpm_port *port)
>  {
>         if (port->port_type =3D=3D TYPEC_PORT_DRP) {
> @@ -1559,13 +1575,19 @@ static void mod_enable_frs_delayed_work(struct tc=
pm_port *port, unsigned int del
>         }
>  }
>
> -static void mod_send_discover_delayed_work(struct tcpm_port *port, unsig=
ned int delay_ms)
> +static void mod_vdm_discovery_cancel_delayed_work(struct tcpm_port *port=
)
> +{
> +       hrtimer_cancel(&port->vdm_discovery_timer);
> +       kthread_cancel_work_sync(&port->vdm_discovery_work);
> +}
> +
> +static void mod_vdm_discovery_delayed_work(struct tcpm_port *port, unsig=
ned int delay_ms)
>  {
>         if (delay_ms) {
> -               hrtimer_start(&port->send_discover_timer, ms_to_ktime(del=
ay_ms), HRTIMER_MODE_REL);
> +               hrtimer_start(&port->vdm_discovery_timer, ms_to_ktime(del=
ay_ms), HRTIMER_MODE_REL);
>         } else {
> -               hrtimer_cancel(&port->send_discover_timer);
> -               kthread_queue_work(port->wq, &port->send_discover_work);
> +               hrtimer_cancel(&port->vdm_discovery_timer);
> +               kthread_queue_work(port->wq, &port->vdm_discovery_work);
>         }
>  }
>
> @@ -1773,16 +1795,11 @@ static void tcpm_queue_vdm(struct tcpm_port *port=
, const u32 header,
>         WARN_ON(!mutex_is_locked(&port->lock));
>
>         /* If is sending discover_identity, handle received message first=
 */
> -       if (PD_VDO_SVDM(vdo_hdr) && PD_VDO_CMD(vdo_hdr) =3D=3D CMD_DISCOV=
ER_IDENT) {
> -               if (tx_sop_type =3D=3D TCPC_TX_SOP_PRIME)
> -                       port->send_discover_prime =3D true;
> -               else
> -                       port->send_discover =3D true;
> -               mod_send_discover_delayed_work(port, SEND_DISCOVER_RETRY_=
MS);
> -       } else {
> +       if (PD_VDO_SVDM(vdo_hdr) && PD_VDO_CMD(vdo_hdr) =3D=3D CMD_DISCOV=
ER_IDENT)
> +               mod_vdm_discovery_delayed_work(port, SEND_DISCOVERY_VDM_R=
ETRY_MS);
> +       else
>                 /* Make sure we are not still processing a previous VDM p=
acket */
>                 WARN_ON(port->vdm_state > VDM_STATE_DONE);
> -       }
>
>         port->vdo_count =3D cnt + 1;
>         port->vdo_data[0] =3D header;
> @@ -1805,8 +1822,7 @@ static void tcpm_queue_vdm_work(struct kthread_work=
 *work)
>         struct tcpm_port *port =3D event->port;
>
>         mutex_lock(&port->lock);
> -       if (port->state !=3D SRC_READY && port->state !=3D SNK_READY &&
> -           port->state !=3D SRC_VDM_IDENTITY_REQUEST) {
> +       if (!tcpm_can_send_vdm(port->state)) {
>                 tcpm_log_force(port, "dropping altmode_vdm_event");
>                 goto port_unlock;
>         }
> @@ -2149,6 +2165,19 @@ static bool tcpm_cable_vdm_supported(struct tcpm_p=
ort *port)
>                tcpm_can_communicate_sop_prime(port);
>  }
>
> +static void tcpm_update_vdm_discovery_state(struct tcpm_port *port,
> +                                           enum vdm_discovery_states new=
_state)
> +{
> +       enum vdm_discovery_states old_state =3D port->vdm_discovery_state=
;
> +
> +       if (old_state !=3D new_state)
> +               tcpm_log_force(port, "vdm discovery state changed: %s -> =
%s",
> +                              vdm_discovery_state_strings[old_state],
> +                              vdm_discovery_state_strings[new_state]);
> +
> +       port->vdm_discovery_state =3D new_state;
> +}
> +
>  static int tcpm_handle_discover_mode(struct tcpm_port *port, u32 *respon=
se,
>                                      enum tcpm_transmit_type rx_sop_type,
>                                      enum tcpm_transmit_type *response_tx=
_sop_type)
> @@ -2166,6 +2195,7 @@ static int tcpm_handle_discover_mode(struct tcpm_po=
rt *port, u32 *response,
>                         response[0] =3D VDO(svid, 1,
>                                           typec_get_negotiated_svdm_versi=
on(typec),
>                                           CMD_DISCOVER_MODES);
> +                       tcpm_update_vdm_discovery_state(port, VDM_DISCOVE=
RY_PARTNER_MODES);
>                         return 1;
>                 }
>
> @@ -2174,10 +2204,12 @@ static int tcpm_handle_discover_mode(struct tcpm_=
port *port, u32 *response,
>                         response[0] =3D VDO(USB_SID_PD, 1,
>                                           typec_get_cable_svdm_version(ty=
pec),
>                                           CMD_DISCOVER_SVID);
> +                       tcpm_update_vdm_discovery_state(port, VDM_DISCOVE=
RY_PARTNER_MODES);
>                         return 1;
>                 }
>
>                 tcpm_register_partner_altmodes(port);
> +               tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_COMPL=
ETE);
>         } else if (rx_sop_type =3D=3D TCPC_TX_SOP_PRIME) {
>                 modep =3D &port->mode_data_prime;
>                 modep->svid_index++;
> @@ -2188,11 +2220,13 @@ static int tcpm_handle_discover_mode(struct tcpm_=
port *port, u32 *response,
>                         response[0] =3D VDO(svid, 1,
>                                           typec_get_cable_svdm_version(ty=
pec),
>                                           CMD_DISCOVER_MODES);
> +                       tcpm_update_vdm_discovery_state(port, VDM_DISCOVE=
RY_CABLE_MODES);
>                         return 1;
>                 }
>
>                 tcpm_register_plug_altmodes(port);
>                 tcpm_register_partner_altmodes(port);
> +               tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_COMPL=
ETE);
>         }
>
>         return 0;
> @@ -2371,18 +2405,18 @@ static int tcpm_pd_svdm(struct tcpm_port *port, s=
truct typec_altmode *adev,
>                                                 typec_cable_set_svdm_vers=
ion(port->cable,
>                                                                          =
    svdm_version);
>                                 }
> +                               tcpm_update_vdm_discovery_state(port, VDM=
_DISCOVERY_PARTNER_IDENT);
> +
>                                 /* 6.4.4.3.1 */
>                                 svdm_consume_identity(port, p, cnt);
>                                 /* Attempt Vconn swap, delay SOP' discove=
ry if necessary */
>                                 if (tcpm_attempt_vconn_swap_discovery(por=
t)) {
> -                                       port->send_discover_prime =3D tru=
e;
>                                         port->upcoming_state =3D VCONN_SW=
AP_SEND;
>                                         ret =3D tcpm_ams_start(port, VCON=
N_SWAP);
>                                         if (!ret)
>                                                 return 0;
>                                         /* Cannot perform Vconn swap */
>                                         port->upcoming_state =3D INVALID_=
STATE;
> -                                       port->send_discover_prime =3D fal=
se;
>                                 }
>
>                                 /*
> @@ -2393,7 +2427,6 @@ static int tcpm_pd_svdm(struct tcpm_port *port, str=
uct typec_altmode *adev,
>                                 if (IS_ERR_OR_NULL(port->cable) &&
>                                     tcpm_can_communicate_sop_prime(port))=
 {
>                                         *response_tx_sop_type =3D TCPC_TX=
_SOP_PRIME;
> -                                       port->send_discover_prime =3D tru=
e;
>                                         response[0] =3D VDO(USB_SID_PD, 1=
,
>                                                           typec_get_negot=
iated_svdm_version(typec),
>                                                           CMD_DISCOVER_ID=
ENT);
> @@ -2421,6 +2454,7 @@ static int tcpm_pd_svdm(struct tcpm_port *port, str=
uct typec_altmode *adev,
>                                         tcpm_set_state(port, SRC_SEND_CAP=
ABILITIES, 0);
>                                         return 0;
>                                 }
> +                               tcpm_update_vdm_discovery_state(port, VDM=
_DISCOVERY_CABLE_IDENT);
>
>                                 *response_tx_sop_type =3D TCPC_TX_SOP;
>                                 response[0] =3D VDO(USB_SID_PD, 1,
> @@ -2440,16 +2474,27 @@ static int tcpm_pd_svdm(struct tcpm_port *port, s=
truct typec_altmode *adev,
>                                 rlen =3D 1;
>                         } else {
>                                 if (rx_sop_type =3D=3D TCPC_TX_SOP) {
> +                                       tcpm_update_vdm_discovery_state(p=
ort,
> +                                                       VDM_DISCOVERY_PAR=
TNER_SVIDS);
>                                         if (modep->nsvids && supports_mod=
al(port)) {
>                                                 response[0] =3D VDO(modep=
->svids[0], 1, svdm_version,
>                                                                 CMD_DISCO=
VER_MODES);
>                                                 rlen =3D 1;
> +                                       } else {
> +                                               tcpm_update_vdm_discovery=
_state(port,
> +                                                               VDM_DISCO=
VERY_COMPLETE);
>                                         }
>                                 } else if (rx_sop_type =3D=3D TCPC_TX_SOP=
_PRIME) {
> +                                       tcpm_update_vdm_discovery_state(p=
ort,
> +                                                       VDM_DISCOVERY_CAB=
LE_SVIDS);
>                                         if (modep_prime->nsvids) {
>                                                 response[0] =3D VDO(modep=
_prime->svids[0], 1,
>                                                                   svdm_ve=
rsion, CMD_DISCOVER_MODES);
>                                                 rlen =3D 1;
> +                                       } else {
> +                                               tcpm_register_partner_alt=
modes(port);
> +                                               tcpm_update_vdm_discovery=
_state(port,
> +                                                               VDM_DISCO=
VERY_COMPLETE);
>                                         }
>                                 }
>                         }
> @@ -2500,8 +2545,13 @@ static int tcpm_pd_svdm(struct tcpm_port *port, st=
ruct typec_altmode *adev,
>         case CMDT_RSP_NAK:
>                 tcpm_ams_finish(port);
>                 switch (cmd) {
> +               /*
> +                * The cable is not allowed to respond with NAK so this m=
ust've happened over SOP
> +                */
>                 case CMD_DISCOVER_IDENT:
>                 case CMD_DISCOVER_SVID:
> +                       tcpm_update_vdm_discovery_state(port, VDM_DISCOVE=
RY_COMPLETE);
> +                       break;
>                 case VDO_CMD_VENDOR(0) ... VDO_CMD_VENDOR(15):
>                         break;
>                 case CMD_DISCOVER_MODES:
> @@ -2681,44 +2731,6 @@ static void tcpm_handle_vdm_request(struct tcpm_po=
rt *port,
>                 port->vdm_sm_running =3D false;
>  }
>
> -static void tcpm_send_vdm(struct tcpm_port *port, u32 vid, int cmd,
> -                         const u32 *data, int count, enum tcpm_transmit_=
type tx_sop_type)
> -{
> -       int svdm_version;
> -       u32 header;
> -
> -       switch (tx_sop_type) {
> -       case TCPC_TX_SOP_PRIME:
> -               /*
> -                * If the port partner is discovered, then the port partn=
er's
> -                * SVDM Version will be returned
> -                */
> -               svdm_version =3D typec_get_cable_svdm_version(port->typec=
_port);
> -               if (svdm_version < 0)
> -                       svdm_version =3D SVDM_VER_MAX;
> -               break;
> -       case TCPC_TX_SOP:
> -               svdm_version =3D typec_get_negotiated_svdm_version(port->=
typec_port);
> -               if (svdm_version < 0)
> -                       return;
> -               break;
> -       default:
> -               svdm_version =3D typec_get_negotiated_svdm_version(port->=
typec_port);
> -               if (svdm_version < 0)
> -                       return;
> -               break;
> -       }
> -
> -       if (WARN_ON(count > VDO_MAX_SIZE - 1))
> -               count =3D VDO_MAX_SIZE - 1;
> -
> -       /* set VDM header with VID & CMD */
> -       header =3D VDO(vid, ((vid & USB_SID_PD) =3D=3D USB_SID_PD) ?
> -                       1 : (PD_VDO_CMD(cmd) <=3D CMD_ATTENTION),
> -                       svdm_version, cmd);
> -       tcpm_queue_vdm(port, header, data, count, tx_sop_type);
> -}
> -
>  static unsigned int vdm_ready_timeout(u32 vdm_hdr)
>  {
>         unsigned int timeout;
> @@ -2764,8 +2776,7 @@ static void vdm_run_state_machine(struct tcpm_port =
*port)
>                  * if there's traffic or we're not in PDO ready state don=
't send
>                  * a VDM.
>                  */
> -               if (port->state !=3D SRC_READY && port->state !=3D SNK_RE=
ADY &&
> -                   port->state !=3D SRC_VDM_IDENTITY_REQUEST) {
> +               if (!tcpm_can_send_vdm(port->state)) {
>                         port->vdm_sm_running =3D false;
>                         break;
>                 }
> @@ -2775,22 +2786,10 @@ static void vdm_run_state_machine(struct tcpm_por=
t *port)
>                         switch (PD_VDO_CMD(vdo_hdr)) {
>                         case CMD_DISCOVER_IDENT:
>                                 res =3D tcpm_ams_start(port, DISCOVER_IDE=
NTITY);
> -                               if (res =3D=3D 0) {
> -                                       switch (port->tx_sop_type) {
> -                                       case TCPC_TX_SOP_PRIME:
> -                                               port->send_discover_prime=
 =3D false;
> -                                               break;
> -                                       case TCPC_TX_SOP:
> -                                               port->send_discover =3D f=
alse;
> -                                               break;
> -                                       default:
> -                                               port->send_discover =3D f=
alse;
> -                                               break;
> -                                       }
> -                               } else if (res =3D=3D -EAGAIN) {
> +                               if (res =3D=3D -EAGAIN) {
>                                         port->vdo_data[0] =3D 0;
> -                                       mod_send_discover_delayed_work(po=
rt,
> -                                                                      SE=
ND_DISCOVER_RETRY_MS);
> +                                       mod_vdm_discovery_delayed_work(po=
rt,
> +                                                       SEND_DISCOVERY_VD=
M_RETRY_MS);
>                                 }
>                                 break;
>                         case CMD_DISCOVER_SVID:
> @@ -2848,6 +2847,7 @@ static void vdm_run_state_machine(struct tcpm_port =
*port)
>                  */
>                 if (port->state =3D=3D SRC_VDM_IDENTITY_REQUEST) {
>                         tcpm_ams_finish(port);
> +                       port->vdo_data[0] =3D 0;
>                         port->vdm_state =3D VDM_STATE_DONE;
>                         tcpm_set_state(port, SRC_SEND_CAPABILITIES, 0);
>                 /*
> @@ -2864,6 +2864,7 @@ static void vdm_run_state_machine(struct tcpm_port =
*port)
>                                 tcpm_ams_finish(port);
>                 } else {
>                         tcpm_ams_finish(port);
> +                       port->vdo_data[0] =3D 0;
>                         if (port->tx_sop_type =3D=3D TCPC_TX_SOP)
>                                 break;
>                         /* Handle SOP' Transmission Errors */
> @@ -2873,11 +2874,11 @@ static void vdm_run_state_machine(struct tcpm_por=
t *port)
>                          * discovery process on SOP only.
>                          */
>                         case CMD_DISCOVER_IDENT:
> -                               port->vdo_data[0] =3D 0;
>                                 response[0] =3D VDO(USB_SID_PD, 1,
>                                                   typec_get_negotiated_sv=
dm_version(
>                                                                         p=
ort->typec_port),
>                                                   CMD_DISCOVER_SVID);
> +                               tcpm_update_vdm_discovery_state(port, VDM=
_DISCOVERY_CABLE_IDENT);
>                                 tcpm_queue_vdm(port, response[0], &respon=
se[1],
>                                                0, TCPC_TX_SOP);
>                                 break;
> @@ -2887,9 +2888,11 @@ static void vdm_run_state_machine(struct tcpm_port=
 *port)
>                          */
>                         case CMD_DISCOVER_SVID:
>                                 tcpm_register_partner_altmodes(port);
> +                               tcpm_update_vdm_discovery_state(port, VDM=
_DISCOVERY_COMPLETE);
>                                 break;
>                         case CMD_DISCOVER_MODES:
>                                 tcpm_register_partner_altmodes(port);
> +                               tcpm_update_vdm_discovery_state(port, VDM=
_DISCOVERY_COMPLETE);
>                                 break;
>                         default:
>                                 break;
> @@ -3802,7 +3805,8 @@ static void tcpm_pd_ctrl_request(struct tcpm_port *=
port,
>                                            PD_MSG_CTRL_NOT_SUPP,
>                                            NONE_AMS);
>                 } else {
> -                       if (port->send_discover && port->negotiated_rev <=
 PD_REV30) {
> +                       if (port->vdm_discovery_state =3D=3D VDM_DISCOVER=
Y_UNKNOWN &&
> +                           port->negotiated_rev < PD_REV30) {
>                                 tcpm_queue_message(port, PD_MSG_CTRL_WAIT=
);
>                                 break;
>                         }
> @@ -3818,7 +3822,8 @@ static void tcpm_pd_ctrl_request(struct tcpm_port *=
port,
>                                            PD_MSG_CTRL_NOT_SUPP,
>                                            NONE_AMS);
>                 } else {
> -                       if (port->send_discover && port->negotiated_rev <=
 PD_REV30) {
> +                       if (port->vdm_discovery_state =3D=3D VDM_DISCOVER=
Y_UNKNOWN &&
> +                           port->negotiated_rev < PD_REV30) {
>                                 tcpm_queue_message(port, PD_MSG_CTRL_WAIT=
);
>                                 break;
>                         }
> @@ -3827,7 +3832,8 @@ static void tcpm_pd_ctrl_request(struct tcpm_port *=
port,
>                 }
>                 break;
>         case PD_CTRL_VCONN_SWAP:
> -               if (port->send_discover && port->negotiated_rev < PD_REV3=
0) {
> +               if (port->vdm_discovery_state =3D=3D VDM_DISCOVERY_UNKNOW=
N &&
> +                   port->negotiated_rev < PD_REV30) {
>                         tcpm_queue_message(port, PD_MSG_CTRL_WAIT);
>                         break;
>                 }
> @@ -4848,8 +4854,7 @@ static int tcpm_src_attach(struct tcpm_port *port)
>         port->partner =3D NULL;
>
>         port->attached =3D true;
> -       port->send_discover =3D true;
> -       port->send_discover_prime =3D false;
> +       tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_UNKNOWN);
>
>         return 0;
>
> @@ -4926,6 +4931,8 @@ static void tcpm_reset_port(struct tcpm_port *port)
>         port->in_ams =3D false;
>         port->ams =3D NONE_AMS;
>         port->vdm_sm_running =3D false;
> +       tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_UNKNOWN);
> +       mod_vdm_discovery_cancel_delayed_work(port);
>         tcpm_unregister_altmodes(port);
>         tcpm_typec_disconnect(port);
>         port->attached =3D false;
> @@ -5009,8 +5016,7 @@ static int tcpm_snk_attach(struct tcpm_port *port)
>         port->partner =3D NULL;
>
>         port->attached =3D true;
> -       port->send_discover =3D true;
> -       port->send_discover_prime =3D false;
> +       tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_UNKNOWN);
>
>         return 0;
>  }
> @@ -5417,16 +5423,11 @@ static void run_state_machine(struct tcpm_port *p=
ort)
>                  * as well.
>                  */
>                 if (port->explicit_contract) {
> -                       if (port->send_discover_prime) {
> -                               port->tx_sop_type =3D TCPC_TX_SOP_PRIME;
> -                       } else {
> -                               port->tx_sop_type =3D TCPC_TX_SOP;
> +                       if (port->vdm_discovery_state =3D=3D VDM_DISCOVER=
Y_UNKNOWN)
>                                 tcpm_set_initial_svdm_version(port);
> -                       }
> -                       mod_send_discover_delayed_work(port, 0);
> +                       mod_vdm_discovery_delayed_work(port, 0);
>                 } else {
> -                       port->send_discover =3D false;
> -                       port->send_discover_prime =3D false;
> +                       tcpm_update_vdm_discovery_state(port, VDM_DISCOVE=
RY_COMPLETE);
>                 }
>
>                 /*
> @@ -5809,16 +5810,11 @@ static void run_state_machine(struct tcpm_port *p=
ort)
>                  * as well.
>                  */
>                 if (port->explicit_contract) {
> -                       if (port->send_discover_prime) {
> -                               port->tx_sop_type =3D TCPC_TX_SOP_PRIME;
> -                       } else {
> -                               port->tx_sop_type =3D TCPC_TX_SOP;
> +                       if (port->vdm_discovery_state =3D=3D VDM_DISCOVER=
Y_UNKNOWN)
>                                 tcpm_set_initial_svdm_version(port);
> -                       }
> -                       mod_send_discover_delayed_work(port, 0);
> +                       mod_vdm_discovery_delayed_work(port, 0);
>                 } else {
> -                       port->send_discover =3D false;
> -                       port->send_discover_prime =3D false;
> +                       tcpm_update_vdm_discovery_state(port, VDM_DISCOVE=
RY_COMPLETE);
>                 }
>
>                 power_supply_changed(port->psy);
> @@ -5864,8 +5860,8 @@ static void run_state_machine(struct tcpm_port *por=
t)
>                 port->tcpc->set_pd_rx(port->tcpc, false);
>                 tcpm_unregister_altmodes(port);
>                 port->nr_sink_caps =3D 0;
> -               port->send_discover =3D true;
> -               port->send_discover_prime =3D false;
> +               tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_UNKNO=
WN);
> +               mod_vdm_discovery_cancel_delayed_work(port);
>                 if (port->pwr_role =3D=3D TYPEC_SOURCE)
>                         tcpm_set_state(port, SRC_HARD_RESET_VBUS_OFF,
>                                        PD_T_PS_HARD_RESET);
> @@ -6012,25 +6008,15 @@ static void run_state_machine(struct tcpm_port *p=
ort)
>         /* DR_Swap states */
>         case DR_SWAP_SEND:
>                 tcpm_pd_send_control(port, PD_CTRL_DR_SWAP, TCPC_TX_SOP);
> -               if (port->data_role =3D=3D TYPEC_DEVICE || port->negotiat=
ed_rev > PD_REV20) {
> -                       port->send_discover =3D true;
> -                       port->send_discover_prime =3D false;
> -               }
>                 tcpm_set_state_cond(port, DR_SWAP_SEND_TIMEOUT,
>                                     PD_T_SENDER_RESPONSE);
>                 break;
>         case DR_SWAP_ACCEPT:
>                 tcpm_pd_send_control(port, PD_CTRL_ACCEPT, TCPC_TX_SOP);
> -               if (port->data_role =3D=3D TYPEC_DEVICE || port->negotiat=
ed_rev > PD_REV20) {
> -                       port->send_discover =3D true;
> -                       port->send_discover_prime =3D false;
> -               }
>                 tcpm_set_state_cond(port, DR_SWAP_CHANGE_DR, 0);
>                 break;
>         case DR_SWAP_SEND_TIMEOUT:
>                 tcpm_swap_complete(port, -ETIMEDOUT);
> -               port->send_discover =3D false;
> -               port->send_discover_prime =3D false;
>                 tcpm_ams_finish(port);
>                 tcpm_set_state(port, ready_state(port), 0);
>                 break;
> @@ -6042,6 +6028,8 @@ static void run_state_machine(struct tcpm_port *por=
t)
>                 else
>                         tcpm_set_roles(port, true, TYPEC_STATE_USB, port-=
>pwr_role,
>                                        TYPEC_HOST);
> +               if (port->data_role =3D=3D TYPEC_HOST || port->negotiated=
_rev > PD_REV20)
> +                       tcpm_update_vdm_discovery_state(port, VDM_DISCOVE=
RY_UNKNOWN);
>                 tcpm_ams_finish(port);
>                 tcpm_set_state(port, ready_state(port), 0);
>                 break;
> @@ -6325,9 +6313,7 @@ static void run_state_machine(struct tcpm_port *por=
t)
>
>         /* Cable states */
>         case SRC_VDM_IDENTITY_REQUEST:
> -               port->send_discover_prime =3D true;
> -               port->tx_sop_type =3D TCPC_TX_SOP_PRIME;
> -               mod_send_discover_delayed_work(port, 0);
> +               mod_vdm_discovery_delayed_work(port, 0);
>                 port->upcoming_state =3D SRC_SEND_CAPABILITIES;
>                 break;
>
> @@ -7031,8 +7017,8 @@ static void tcpm_enable_frs_work(struct kthread_wor=
k *work)
>                 goto unlock;
>
>         /* Send when the state machine is idle */
> -       if (port->state !=3D SNK_READY || port->vdm_sm_running || port->s=
end_discover ||
> -           port->send_discover_prime)
> +       if (port->state !=3D SNK_READY || port->vdm_sm_running ||
> +           port->vdm_discovery_state =3D=3D VDM_DISCOVERY_UNKNOWN)
>                 goto resched;
>
>         port->upcoming_state =3D GET_SINK_CAP;
> @@ -7049,29 +7035,160 @@ static void tcpm_enable_frs_work(struct kthread_=
work *work)
>         mutex_unlock(&port->lock);
>  }
>
> -static void tcpm_send_discover_work(struct kthread_work *work)
> +static void tcpm_vdm_discovery_work(struct kthread_work *work)
>  {
> -       struct tcpm_port *port =3D container_of(work, struct tcpm_port, s=
end_discover_work);
> +       struct tcpm_port *port =3D container_of(work, struct tcpm_port, v=
dm_discovery_work);
> +       enum tcpm_transmit_type tx_sop_type =3D TCPC_TX_SOP;
> +       struct typec_port *typec =3D port->typec_port;
> +       struct pd_mode_data *modep, *modep_prime;
> +       u32 msg[2] =3D { };
> +       int svdm_version;
>
>         mutex_lock(&port->lock);
> -       /* No need to send DISCOVER_IDENTITY anymore */
> -       if (!port->send_discover && !port->send_discover_prime)
> +
> +       tcpm_log_force(port, "%s state [%s]", __func__,
> +                      vdm_discovery_state_strings[port->vdm_discovery_st=
ate]);
> +
> +       /* No need to perform work if Discovery process is complete */
> +       if (port->vdm_discovery_state =3D=3D VDM_DISCOVERY_COMPLETE)
>                 goto unlock;
>
> -       if (port->data_role =3D=3D TYPEC_DEVICE && port->negotiated_rev <=
 PD_REV30) {
> -               port->send_discover =3D false;
> -               port->send_discover_prime =3D false;
> +       /* Retry if the port is not idle */
> +       if (!tcpm_can_send_vdm(port->state) || port->vdm_sm_running) {
> +               mod_vdm_discovery_delayed_work(port, SEND_DISCOVERY_VDM_R=
ETRY_MS);
>                 goto unlock;
>         }
>
> -       /* Retry if the port is not idle */
> -       if ((port->state !=3D SRC_READY && port->state !=3D SNK_READY &&
> -            port->state !=3D SRC_VDM_IDENTITY_REQUEST) || port->vdm_sm_r=
unning) {
> -               mod_send_discover_delayed_work(port, SEND_DISCOVER_RETRY_=
MS);
> +       modep =3D &port->mode_data;
> +       modep_prime =3D &port->mode_data_prime;
> +
> +       svdm_version =3D typec_get_negotiated_svdm_version(typec);
> +
> +       switch (port->vdm_discovery_state) {
> +       /*
> +        * The port has not received a Discover Identity response from th=
e port partner.
> +        *
> +        * 1. The port will send Discover Identity to the partner over SO=
P in the SRC_READY and
> +        *    SNK_READY states if there is an explicit contract
> +        * 2. The port will send Discover Identity to the cable over SOP'=
 in the
> +        *    SRC_VDM_IDENTITY_REQUEST state if capable of doing so.
> +        */
> +       case VDM_DISCOVERY_UNKNOWN:
> +               /* Can't send Discover Identity, VDM discovery is complet=
e */
> +               if (port->data_role =3D=3D TYPEC_DEVICE && port->negotiat=
ed_rev < PD_REV30) {
> +                       tcpm_update_vdm_discovery_state(port, VDM_DISCOVE=
RY_COMPLETE);
> +                       goto unlock;
> +               }
> +
> +               if (port->state =3D=3D SRC_VDM_IDENTITY_REQUEST) {
> +                       tx_sop_type =3D TCPC_TX_SOP_PRIME;
> +                       svdm_version =3D SVDM_VER_MAX;
> +               }
> +
> +               msg[0] =3D VDO(USB_SID_PD, 1, svdm_version, CMD_DISCOVER_=
IDENT);
> +               break;
> +       /*
> +        * The port has received a Discover Identity ACK from the port pa=
rtner.
> +        *
> +        * 1. The port will send Discover Identity to the cable over SOP'=
 in the SRC_READY and
> +        *    SNK_READY states if it did not previously discover the cabl=
e but is capable of doing
> +        *    so.
> +        * 2. The port will send Discover SVIDs to the partner over SOP i=
n the SRC_READY and
> +        *    SNK_READY states otherwise.
> +        */
> +       case VDM_DISCOVERY_PARTNER_IDENT:
> +               if (tcpm_can_communicate_sop_prime(port) && !port->cable)=
 {
> +                       tx_sop_type =3D TCPC_TX_SOP_PRIME;
> +                       msg[0] =3D VDO(USB_SID_PD, 1, svdm_version, CMD_D=
ISCOVER_IDENT);
> +               } else {
> +                       if (tcpm_can_communicate_sop_prime(port))
> +                               tcpm_update_vdm_discovery_state(port, VDM=
_DISCOVERY_CABLE_IDENT);
> +                       msg[0] =3D VDO(USB_SID_PD, 1, svdm_version, CMD_D=
ISCOVER_SVID);
> +               }
> +               break;
> +       /*
> +        * The port has received a Discover Identity ACK from the cable.
> +        *
> +        * 1. The port will send Discover SVIDs to the partner over SOP.
> +        */
> +       case VDM_DISCOVERY_CABLE_IDENT:
> +               msg[0] =3D VDO(USB_SID_PD, 1, svdm_version, CMD_DISCOVER_=
SVID);
> +               break;
> +       /*
> +        * The port has received a Discover SVIDs ACK from the partner or=
 the last SVIDs supported
> +        * by the partner.
> +        *
> +        * 1. The port will send Discover Modes for the first SVID over S=
OP if the partner supports
> +        *    modal operation and valid SVIDs were registered.
> +        * 2. The vdm_discovery_state will move to VDM_DISCOVERY_COMPLETE=
 otherwise.
> +        */
> +       case VDM_DISCOVERY_PARTNER_SVIDS:
> +               if (modep->nsvids && supports_modal(port)) {
> +                       msg[0] =3D VDO(modep->svids[0], 1, svdm_version, =
CMD_DISCOVER_MODES);
> +               } else {
> +                       tcpm_update_vdm_discovery_state(port, VDM_DISCOVE=
RY_COMPLETE);
> +                       goto unlock;
> +               }
> +               break;
> +       /*
> +        * The port has received a Discover Modes ACK from the partner fo=
r any mode.
> +        *
> +        * 1. The port will send Discover Modes for the next SVID that ha=
s not been discovered to
> +        *    the port partner over SOP.
> +        * 2. The port will send Discover SVIDs over SOP' if the port can=
 communicate over SOP'
> +        *    and the cable supports VDMs.
> +        * 3. The vdm_discovery_state will move to VDM_DISCOVERY_COMPLETE=
 otherwise.
> +        */
> +       case VDM_DISCOVERY_PARTNER_MODES:
> +               /* Not all modes have been discovered yet */
> +               if (modep->svid_index < modep->nsvids) {
> +                       msg[0] =3D VDO(modep_prime->svids[modep->svid_ind=
ex], 1, svdm_version,
> +                                    CMD_DISCOVER_MODES);
> +               } else if (tcpm_can_communicate_sop_prime(port) && tcpm_c=
able_vdm_supported(port)) {
> +                       tx_sop_type =3D TCPC_TX_SOP_PRIME;
> +                       svdm_version =3D typec_get_cable_svdm_version(typ=
ec);
> +                       msg[0] =3D VDO(USB_SID_PD, 1, svdm_version, CMD_D=
ISCOVER_SVID);
> +               } else {
> +                       tcpm_update_vdm_discovery_state(port, VDM_DISCOVE=
RY_COMPLETE);
> +                       goto unlock;
> +               }
> +               break;
> +       /*
> +        * The port has received a Discover SVIDs ACK from the cable over=
 SOP'.
> +        *
> +        * 1. The port will send Discover Modes for the first SVID over S=
OP'.
> +        */
> +       case VDM_DISCOVERY_CABLE_SVIDS:
> +               if (modep_prime->nsvids) {
> +                       tx_sop_type =3D TCPC_TX_SOP_PRIME;
> +                       svdm_version =3D typec_get_cable_svdm_version(typ=
ec);
> +                       msg[0] =3D VDO(modep_prime->svids[0], 1, svdm_ver=
sion, CMD_DISCOVER_MODES);
> +               } else {
> +                       goto unlock;
> +               }
> +               break;
> +       /*
> +        * The port has received a Discover Modes ACK from the cable for =
any mode.
> +        *
> +        * 1. The port will send Discover Modes for the next SVID that ha=
s not been discovered to
> +        *    the cable over SOP'.
> +        */
> +       case VDM_DISCOVERY_CABLE_MODES:
> +               if (modep_prime->svid_index < modep_prime->nsvids) {
> +                       tx_sop_type =3D TCPC_TX_SOP_PRIME;
> +                       svdm_version =3D typec_get_cable_svdm_version(typ=
ec);
> +                       msg[0] =3D VDO(modep_prime->svids[modep->svid_ind=
ex], 1, svdm_version,
> +                                    CMD_DISCOVER_MODES);
> +               } else {
> +                       goto unlock;
> +               }
> +               break;
> +       default:
>                 goto unlock;
>         }
>
> -       tcpm_send_vdm(port, USB_SID_PD, CMD_DISCOVER_IDENT, NULL, 0, port=
->tx_sop_type);
> +       if (svdm_version >=3D 0)
> +               tcpm_queue_vdm(port, msg[0], &msg[1], 0, tx_sop_type);
>
>  unlock:
>         mutex_unlock(&port->lock);
> @@ -8487,12 +8604,12 @@ static enum hrtimer_restart enable_frs_timer_hand=
ler(struct hrtimer *timer)
>         return HRTIMER_NORESTART;
>  }
>
> -static enum hrtimer_restart send_discover_timer_handler(struct hrtimer *=
timer)
> +static enum hrtimer_restart vdm_discovery_timer_handler(struct hrtimer *=
timer)
>  {
> -       struct tcpm_port *port =3D container_of(timer, struct tcpm_port, =
send_discover_timer);
> +       struct tcpm_port *port =3D container_of(timer, struct tcpm_port, =
vdm_discovery_timer);
>
>         if (port->registered)
> -               kthread_queue_work(port->wq, &port->send_discover_work);
> +               kthread_queue_work(port->wq, &port->vdm_discovery_work);
>         return HRTIMER_NORESTART;
>  }
>
> @@ -8526,14 +8643,14 @@ struct tcpm_port *tcpm_register_port(struct devic=
e *dev, struct tcpc_dev *tcpc)
>         kthread_init_work(&port->vdm_state_machine, vdm_state_machine_wor=
k);
>         kthread_init_work(&port->event_work, tcpm_pd_event_handler);
>         kthread_init_work(&port->enable_frs, tcpm_enable_frs_work);
> -       kthread_init_work(&port->send_discover_work, tcpm_send_discover_w=
ork);
> +       kthread_init_work(&port->vdm_discovery_work, tcpm_vdm_discovery_w=
ork);
>         hrtimer_setup(&port->state_machine_timer, state_machine_timer_han=
dler, CLOCK_MONOTONIC,
>                       HRTIMER_MODE_REL);
>         hrtimer_setup(&port->vdm_state_machine_timer, vdm_state_machine_t=
imer_handler,
>                       CLOCK_MONOTONIC, HRTIMER_MODE_REL);
>         hrtimer_setup(&port->enable_frs_timer, enable_frs_timer_handler, =
CLOCK_MONOTONIC,
>                       HRTIMER_MODE_REL);
> -       hrtimer_setup(&port->send_discover_timer, send_discover_timer_han=
dler, CLOCK_MONOTONIC,
> +       hrtimer_setup(&port->vdm_discovery_timer, vdm_discovery_timer_han=
dler, CLOCK_MONOTONIC,
>                       HRTIMER_MODE_REL);
>
>         spin_lock_init(&port->pd_event_lock);
> @@ -8628,7 +8745,7 @@ void tcpm_unregister_port(struct tcpm_port *port)
>         port->registered =3D false;
>         kthread_destroy_worker(port->wq);
>
> -       hrtimer_cancel(&port->send_discover_timer);
> +       hrtimer_cancel(&port->vdm_discovery_timer);
>         hrtimer_cancel(&port->enable_frs_timer);
>         hrtimer_cancel(&port->vdm_state_machine_timer);
>         hrtimer_cancel(&port->state_machine_timer);
>
> base-commit: ab9de95c9cf952332ab79453b4b5d1bfca8e514f
> --
> 2.55.0.229.g6434b31f56-goog
>
