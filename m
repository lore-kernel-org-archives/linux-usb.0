Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E6A6C48BCF
	for <linux-usb@archiver.kernel.org>; Wed,  9 Jun 2021 12:04:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1D7E361364
	for <linux-usb@archiver.kernel.org>; Wed,  9 Jun 2021 12:04:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239705AbhFIMGF (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 9 Jun 2021 08:06:05 -0400
Received: from mga02.intel.com ([134.134.136.20]:32422 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232552AbhFIMFS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 9 Jun 2021 08:05:18 -0400
IronPort-SDR: GCJPDIxDl37wt1m0rqQaM75L2FwbWjIYI/K0PEEfJ/P8qqF1gLg4ocMIgGTL49WWlSK2POTNXo
 euxLxIjRimwA==
X-IronPort-AV: E=McAfee;i="6200,9189,10009"; a="192166392"
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; 
   d="scan'208";a="192166392"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2021 05:03:09 -0700
IronPort-SDR: U0GKMQgmwTl08QH8x1cTH/q4OCe0ePTSxCLq74sWbR89JBOU1gSdtGnfJnqzIN/ig0PVO+821f
 dAxEfq00bP7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; 
   d="scan'208";a="552653465"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 09 Jun 2021 05:03:06 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 09 Jun 2021 15:03:05 +0300
Date:   Wed, 9 Jun 2021 15:03:05 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Jack Pham <jackp@codeaurora.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        linux-usb@vger.kernel.org, Mayank Rana <mrana@codeaurora.org>,
        stable@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: Clear PPM capability data in
 ucsi_init() error path
Message-ID: <YMCt+aiot6yObtZA@kuha.fi.intel.com>
References: <20210609073535.5094-1-jackp@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210609073535.5094-1-jackp@codeaurora.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 09, 2021 at 12:35:35AM -0700, Jack Pham wrote:
> From: Mayank Rana <mrana@codeaurora.org>
> 
> If ucsi_init() fails for some reason (e.g. ucsi_register_port()
> fails or general communication failure to the PPM), particularly at
> any point after the GET_CAPABILITY command had been issued, this
> results in unwinding the initialization and returning an error.
> However the ucsi structure's ucsi_capability member retains its
> current value, including likely a non-zero num_connectors.
> And because ucsi_init() itself is done in a workqueue a UCSI
> interface driver will be unaware that it failed and may think the
> ucsi_register() call was completely successful.  Later, if
> ucsi_unregister() is called, due to this stale ucsi->cap value it
> would try to access the items in the ucsi->connector array which
> might not be in a proper state or not even allocated at all and
> results in NULL or invalid pointer dereference.
> 
> Fix this by clearing the ucsi->cap value to 0 during the error
> path of ucsi_init() in order to prevent a later ucsi_unregister()
> from entering the connector cleanup loop.
> 
> Fixes: c1b0bc2dabfa ("usb: typec: Add support for UCSI interface")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mayank Rana <mrana@codeaurora.org>
> Signed-off-by: Jack Pham <jackp@codeaurora.org>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index b433169ef6fa..b7d104c80d85 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -1253,6 +1253,7 @@ static int ucsi_init(struct ucsi *ucsi)
>  	}
>  
>  err_reset:
> +	memset(&ucsi->cap, 0, sizeof(ucsi->cap));
>  	ucsi_reset_ppm(ucsi);
>  err:
>  	return ret;
> -- 
> 2.24.0

-- 
heikki
