Return-Path: <SRS0=xlna=ST=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D52A9C10F12
	for <linux-usb@archiver.kernel.org>; Wed, 17 Apr 2019 06:24:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AAE5C20652
	for <linux-usb@archiver.kernel.org>; Wed, 17 Apr 2019 06:24:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729293AbfDQGYK (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 17 Apr 2019 02:24:10 -0400
Received: from mga04.intel.com ([192.55.52.120]:39102 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725814AbfDQGYJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 17 Apr 2019 02:24:09 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Apr 2019 23:24:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,360,1549958400"; 
   d="scan'208";a="165431145"
Received: from kuha.fi.intel.com ([10.237.72.189])
  by fmsmga001.fm.intel.com with SMTP; 16 Apr 2019 23:24:06 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 17 Apr 2019 09:24:06 +0300
Date:   Wed, 17 Apr 2019 09:24:06 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Kyle Tso <kyletso@google.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 2/3] usb: typec: fusb302: Implement start_toggling for
 all port-types
Message-ID: <20190417062406.GG1747@kuha.fi.intel.com>
References: <20190416200754.2826-1-hdegoede@redhat.com>
 <20190416200754.2826-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <20190416200754.2826-2-hdegoede@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190417062406.rKZ32kN8Z6hDRfQMtC5eN0kC3qzaBzrPYZVv1zERxho@z>

On Tue, Apr 16, 2019 at 10:07:53PM +0200, Hans de Goede wrote:
> When in single-role port mode, we must start single-role toggling to
> get an interrupt when a device / cable gets plugged into the port.
> 
> This commit modifies the fusb302 start_toggling implementation to
> start toggling for all port-types, so that connection-detection works
> on single-role ports too.
> 
> Fixes: ea3b4d5523bc("usb: typec: fusb302: Resolve fixed power role ...")
> Cc: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Changes in v2:
> -Adjust for the tcpm core renaming start_drp_toggling to start_toggling,
>  instead of adding a new start_srp_connection_detect callback
> ---
>  drivers/usb/typec/tcpm/fusb302.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
> index 6d83891cc895..ba030b03d156 100644
> --- a/drivers/usb/typec/tcpm/fusb302.c
> +++ b/drivers/usb/typec/tcpm/fusb302.c
> @@ -882,10 +882,20 @@ static int tcpm_start_toggling(struct tcpc_dev *dev,
>  {
>  	struct fusb302_chip *chip = container_of(dev, struct fusb302_chip,
>  						 tcpc_dev);
> +	enum toggling_mode mode = TOGGLING_MODE_OFF;
>  	int ret = 0;
>  
> -	if (port_type != TYPEC_PORT_DRP)
> -		return -EOPNOTSUPP;
> +	switch (port_type) {
> +	case TYPEC_PORT_SRC:
> +		mode = TOGGLING_MODE_SRC;
> +		break;
> +	case TYPEC_PORT_SNK:
> +		mode = TOGGLING_MODE_SNK;
> +		break;
> +	case TYPEC_PORT_DRP:
> +		mode = TOGGLING_MODE_DRP;
> +		break;
> +	}
>  
>  	mutex_lock(&chip->lock);
>  	ret = fusb302_set_src_current(chip, cc_src_current[cc]);
> @@ -894,7 +904,7 @@ static int tcpm_start_toggling(struct tcpc_dev *dev,
>  			    typec_cc_status_name[cc], ret);
>  		goto done;
>  	}
> -	ret = fusb302_set_toggling(chip, TOGGLING_MODE_DRP);
> +	ret = fusb302_set_toggling(chip, mode);
>  	if (ret < 0) {
>  		fusb302_log(chip,
>  			    "unable to start drp toggling, ret=%d", ret);
> -- 
> 2.21.0

thanks,

-- 
heikki
