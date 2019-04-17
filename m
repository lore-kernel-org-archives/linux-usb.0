Return-Path: <SRS0=xlna=ST=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDFA5C10F12
	for <linux-usb@archiver.kernel.org>; Wed, 17 Apr 2019 06:23:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7853820643
	for <linux-usb@archiver.kernel.org>; Wed, 17 Apr 2019 06:23:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728650AbfDQGXL (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 17 Apr 2019 02:23:11 -0400
Received: from mga11.intel.com ([192.55.52.93]:2662 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725814AbfDQGXL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 17 Apr 2019 02:23:11 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Apr 2019 23:23:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,360,1549958400"; 
   d="scan'208";a="165431026"
Received: from kuha.fi.intel.com ([10.237.72.189])
  by fmsmga001.fm.intel.com with SMTP; 16 Apr 2019 23:23:08 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 17 Apr 2019 09:23:08 +0300
Date:   Wed, 17 Apr 2019 09:23:08 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Kyle Tso <kyletso@google.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 1/3] usb: typec: tcpm: Notify the tcpc to start
 connection-detection for SRPs
Message-ID: <20190417062308.GF1747@kuha.fi.intel.com>
References: <20190416200754.2826-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <20190416200754.2826-1-hdegoede@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190417062308.t2dHDP0YPTIsbjdAYt_eAPaMR2VMJEa53Zq4oWo8044@z>

On Tue, Apr 16, 2019 at 10:07:52PM +0200, Hans de Goede wrote:
> Some tcpc device-drivers need to explicitly be told to watch for connection
> events, otherwise the tcpc will not generate any TCPM_CC_EVENTs and devices
> being plugged into the Type-C port will not be noticed.
> 
> For dual-role ports tcpm_start_drp_toggling() is used to tell the tcpc to
> watch for connection events. Sofar we lack a similar callback to the tcpc
> for single-role ports. With some tcpc-s such as the fusb302 this means
> no TCPM_CC_EVENTs will be generated when the port is configured as a
> single-role port.
> 
> This commit renames start_drp_toggling to start_toggling and since the
> device-properties are parsed by the tcpm-core, adds a port_type parameter
> to the start_toggling callback so that the tcpc_dev driver knows the
> port-type and can act accordingly when it starts toggling.
> 
> The new start_toggling callback now always gets called if defined, instead
> of only being called for DRP ports.
> 
> To avoid this causing undesirable functional changes all existing
> start_drp_toggling implementations are not only renamed to start_toggling,
> but also get a port_type check added and return -EOPNOTSUPP when port_type
> is not DRP.
> 
> Fixes: ea3b4d5523bc("usb: typec: fusb302: Resolve fixed power role ...")
> Cc: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Changes in v2:
> -Rename start_drp_toggling to start_toggling and make it multi-purpose,
>  rather then adding a new start_srp_connection_detect callback
> ---
>  drivers/usb/typec/tcpm/fusb302.c | 10 +++++++---
>  drivers/usb/typec/tcpm/tcpci.c   | 10 +++++++---
>  drivers/usb/typec/tcpm/tcpm.c    | 32 ++++++++++++++------------------
>  drivers/usb/typec/tcpm/wcove.c   | 10 +++++++---
>  include/linux/usb/tcpm.h         | 13 +++++++------
>  5 files changed, 42 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
> index 6ea6199caafa..6d83891cc895 100644
> --- a/drivers/usb/typec/tcpm/fusb302.c
> +++ b/drivers/usb/typec/tcpm/fusb302.c
> @@ -876,13 +876,17 @@ static int tcpm_set_roles(struct tcpc_dev *dev, bool attached,
>  	return ret;
>  }
>  
> -static int tcpm_start_drp_toggling(struct tcpc_dev *dev,
> -				   enum typec_cc_status cc)
> +static int tcpm_start_toggling(struct tcpc_dev *dev,
> +			       enum typec_port_type port_type,
> +			       enum typec_cc_status cc)
>  {
>  	struct fusb302_chip *chip = container_of(dev, struct fusb302_chip,
>  						 tcpc_dev);
>  	int ret = 0;
>  
> +	if (port_type != TYPEC_PORT_DRP)
> +		return -EOPNOTSUPP;
> +
>  	mutex_lock(&chip->lock);
>  	ret = fusb302_set_src_current(chip, cc_src_current[cc]);
>  	if (ret < 0) {
> @@ -1094,7 +1098,7 @@ static void init_tcpc_dev(struct tcpc_dev *fusb302_tcpc_dev)
>  	fusb302_tcpc_dev->set_vbus = tcpm_set_vbus;
>  	fusb302_tcpc_dev->set_pd_rx = tcpm_set_pd_rx;
>  	fusb302_tcpc_dev->set_roles = tcpm_set_roles;
> -	fusb302_tcpc_dev->start_drp_toggling = tcpm_start_drp_toggling;
> +	fusb302_tcpc_dev->start_toggling = tcpm_start_toggling;
>  	fusb302_tcpc_dev->pd_transmit = tcpm_pd_transmit;
>  }
>  
> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> index ac6b418b15f1..c1f7073a56de 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c
> @@ -100,13 +100,17 @@ static int tcpci_set_cc(struct tcpc_dev *tcpc, enum typec_cc_status cc)
>  	return 0;
>  }
>  
> -static int tcpci_start_drp_toggling(struct tcpc_dev *tcpc,
> -				    enum typec_cc_status cc)
> +static int tcpci_start_toggling(struct tcpc_dev *tcpc,
> +				enum typec_port_type port_type,
> +				enum typec_cc_status cc)
>  {
>  	int ret;
>  	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
>  	unsigned int reg = TCPC_ROLE_CTRL_DRP;
>  
> +	if (port_type != TYPEC_PORT_DRP)
> +		return -EOPNOTSUPP;
> +
>  	/* Handle vendor drp toggling */
>  	if (tcpci->data->start_drp_toggling) {
>  		ret = tcpci->data->start_drp_toggling(tcpci, tcpci->data, cc);
> @@ -511,7 +515,7 @@ struct tcpci *tcpci_register_port(struct device *dev, struct tcpci_data *data)
>  	tcpci->tcpc.get_cc = tcpci_get_cc;
>  	tcpci->tcpc.set_polarity = tcpci_set_polarity;
>  	tcpci->tcpc.set_vconn = tcpci_set_vconn;
> -	tcpci->tcpc.start_drp_toggling = tcpci_start_drp_toggling;
> +	tcpci->tcpc.start_toggling = tcpci_start_toggling;
>  
>  	tcpci->tcpc.set_pd_rx = tcpci_set_pd_rx;
>  	tcpci->tcpc.set_roles = tcpci_set_roles;
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index a2233d72ae7c..fba32d84e578 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -31,7 +31,7 @@
>  
>  #define FOREACH_STATE(S)			\
>  	S(INVALID_STATE),			\
> -	S(DRP_TOGGLING),			\
> +	S(TOGGLING),			\
>  	S(SRC_UNATTACHED),			\
>  	S(SRC_ATTACH_WAIT),			\
>  	S(SRC_ATTACHED),			\
> @@ -472,7 +472,7 @@ static void tcpm_log(struct tcpm_port *port, const char *fmt, ...)
>  	/* Do not log while disconnected and unattached */
>  	if (tcpm_port_is_disconnected(port) &&
>  	    (port->state == SRC_UNATTACHED || port->state == SNK_UNATTACHED ||
> -	     port->state == DRP_TOGGLING))
> +	     port->state == TOGGLING))
>  		return;
>  
>  	va_start(args, fmt);
> @@ -2540,20 +2540,16 @@ static int tcpm_set_charge(struct tcpm_port *port, bool charge)
>  	return 0;
>  }
>  
> -static bool tcpm_start_drp_toggling(struct tcpm_port *port,
> -				    enum typec_cc_status cc)
> +static bool tcpm_start_toggling(struct tcpm_port *port, enum typec_cc_status cc)
>  {
>  	int ret;
>  
> -	if (port->tcpc->start_drp_toggling &&
> -	    port->port_type == TYPEC_PORT_DRP) {
> -		tcpm_log_force(port, "Start DRP toggling");
> -		ret = port->tcpc->start_drp_toggling(port->tcpc, cc);
> -		if (!ret)
> -			return true;
> -	}
> +	if (!port->tcpc->start_toggling)
> +		return false;
>  
> -	return false;
> +	tcpm_log_force(port, "Start toggling");
> +	ret = port->tcpc->start_toggling(port->tcpc, port->port_type, cc);
> +	return ret == 0;
>  }
>  
>  static void tcpm_set_cc(struct tcpm_port *port, enum typec_cc_status cc)
> @@ -2847,15 +2843,15 @@ static void run_state_machine(struct tcpm_port *port)
>  
>  	port->enter_state = port->state;
>  	switch (port->state) {
> -	case DRP_TOGGLING:
> +	case TOGGLING:
>  		break;
>  	/* SRC states */
>  	case SRC_UNATTACHED:
>  		if (!port->non_pd_role_swap)
>  			tcpm_swap_complete(port, -ENOTCONN);
>  		tcpm_src_detach(port);
> -		if (tcpm_start_drp_toggling(port, tcpm_rp_cc(port))) {
> -			tcpm_set_state(port, DRP_TOGGLING, 0);
> +		if (tcpm_start_toggling(port, tcpm_rp_cc(port))) {
> +			tcpm_set_state(port, TOGGLING, 0);
>  			break;
>  		}
>  		tcpm_set_cc(port, tcpm_rp_cc(port));
> @@ -3053,8 +3049,8 @@ static void run_state_machine(struct tcpm_port *port)
>  			tcpm_swap_complete(port, -ENOTCONN);
>  		tcpm_pps_complete(port, -ENOTCONN);
>  		tcpm_snk_detach(port);
> -		if (tcpm_start_drp_toggling(port, TYPEC_CC_RD)) {
> -			tcpm_set_state(port, DRP_TOGGLING, 0);
> +		if (tcpm_start_toggling(port, TYPEC_CC_RD)) {
> +			tcpm_set_state(port, TOGGLING, 0);
>  			break;
>  		}
>  		tcpm_set_cc(port, TYPEC_CC_RD);
> @@ -3621,7 +3617,7 @@ static void _tcpm_cc_change(struct tcpm_port *port, enum typec_cc_status cc1,
>  						       : "connected");
>  
>  	switch (port->state) {
> -	case DRP_TOGGLING:
> +	case TOGGLING:
>  		if (tcpm_port_is_debug(port) || tcpm_port_is_audio(port) ||
>  		    tcpm_port_is_source(port))
>  			tcpm_set_state(port, SRC_ATTACH_WAIT, 0);
> diff --git a/drivers/usb/typec/tcpm/wcove.c b/drivers/usb/typec/tcpm/wcove.c
> index 6770afd40765..f1f8f45e2f3d 100644
> --- a/drivers/usb/typec/tcpm/wcove.c
> +++ b/drivers/usb/typec/tcpm/wcove.c
> @@ -416,12 +416,16 @@ static int wcove_pd_transmit(struct tcpc_dev *tcpc,
>  	return regmap_write(wcove->regmap, USBC_TXCMD, cmd | USBC_TXCMD_START);
>  }
>  
> -static int wcove_start_drp_toggling(struct tcpc_dev *tcpc,
> -				    enum typec_cc_status cc)
> +static int wcove_start_toggling(struct tcpc_dev *tcpc,
> +				enum typec_port_type port_type,
> +				enum typec_cc_status cc)
>  {
>  	struct wcove_typec *wcove = tcpc_to_wcove(tcpc);
>  	unsigned int usbc_ctrl;
>  
> +	if (port_type != TYPEC_PORT_DRP)
> +		return -EOPNOTSUPP;
> +
>  	usbc_ctrl = USBC_CONTROL1_MODE_DRP | USBC_CONTROL1_DRPTOGGLE_RANDOM;
>  
>  	switch (cc) {
> @@ -642,7 +646,7 @@ static int wcove_typec_probe(struct platform_device *pdev)
>  	wcove->tcpc.set_polarity = wcove_set_polarity;
>  	wcove->tcpc.set_vconn = wcove_set_vconn;
>  	wcove->tcpc.set_current_limit = wcove_set_current_limit;
> -	wcove->tcpc.start_drp_toggling = wcove_start_drp_toggling;
> +	wcove->tcpc.start_toggling = wcove_start_toggling;
>  
>  	wcove->tcpc.set_pd_rx = wcove_set_pd_rx;
>  	wcove->tcpc.set_roles = wcove_set_roles;
> diff --git a/include/linux/usb/tcpm.h b/include/linux/usb/tcpm.h
> index 0c532ca3f079..36a15dcadc53 100644
> --- a/include/linux/usb/tcpm.h
> +++ b/include/linux/usb/tcpm.h
> @@ -121,10 +121,10 @@ struct tcpc_config {
>   *		with partner.
>   * @set_pd_rx:	Called to enable or disable reception of PD messages
>   * @set_roles:	Called to set power and data roles
> - * @start_drp_toggling:
> - *		Optional; if supported by hardware, called to start DRP
> - *		toggling. DRP toggling is stopped automatically if
> - *		a connection is established.
> + * @start_toggling:
> + *		Optional; if supported by hardware, called to start dual-role
> + *		toggling or single-role connection detection. Toggling stops
> + *		automatically if a connection is established.
>   * @try_role:	Optional; called to set a preferred role
>   * @pd_transmit:Called to transmit PD message
>   * @mux:	Pointer to multiplexer data
> @@ -147,8 +147,9 @@ struct tcpc_dev {
>  	int (*set_pd_rx)(struct tcpc_dev *dev, bool on);
>  	int (*set_roles)(struct tcpc_dev *dev, bool attached,
>  			 enum typec_role role, enum typec_data_role data);
> -	int (*start_drp_toggling)(struct tcpc_dev *dev,
> -				  enum typec_cc_status cc);
> +	int (*start_toggling)(struct tcpc_dev *dev,
> +			      enum typec_port_type port_type,
> +			      enum typec_cc_status cc);
>  	int (*try_role)(struct tcpc_dev *dev, int role);
>  	int (*pd_transmit)(struct tcpc_dev *dev, enum tcpm_transmit_type type,
>  			   const struct pd_message *msg);
> -- 
> 2.21.0

thanks,

-- 
heikki
