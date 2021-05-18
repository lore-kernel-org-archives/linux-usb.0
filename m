Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FB3DC433B4
	for <linux-usb@archiver.kernel.org>; Tue, 18 May 2021 12:27:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3D73F61353
	for <linux-usb@archiver.kernel.org>; Tue, 18 May 2021 12:27:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243967AbhERM2m (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 18 May 2021 08:28:42 -0400
Received: from mga07.intel.com ([134.134.136.100]:50359 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234046AbhERM2m (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 May 2021 08:28:42 -0400
IronPort-SDR: MeeiMj8NAYDCbD+Qfwz/P6h4KdaNdPwFBLfsIwq6dbyRw44Q/pBil6ankwR73JxmjOcPPWSorn
 p7/udPGD03RA==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="264612138"
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; 
   d="scan'208";a="264612138"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2021 05:27:23 -0700
IronPort-SDR: pDdH19FKllWnrGnaztzgLwXBlWUo4VHxEZYVEc7MJE2vTEp49Q8DuHbiPXS++me59mnDWBUpBO
 LjviaGqTYGCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; 
   d="scan'208";a="541947605"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 18 May 2021 05:27:21 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 18 May 2021 15:27:20 +0300
Date:   Tue, 18 May 2021 15:27:20 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Badhri Jagan Sridharan <badhri@google.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kyle Tso <kyletso@google.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/4] usb: typec: tcpm: Fix up PR_SWAP when vsafe0v is
 signalled
Message-ID: <YKOyqD08lqu/du+8@kuha.fi.intel.com>
References: <20210517192112.40934-1-badhri@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210517192112.40934-1-badhri@google.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 17, 2021 at 12:21:09PM -0700, Badhri Jagan Sridharan wrote:
> During PR_SWAP, When TCPM is in PR_SWAP_SNK_SRC_SINK_OFF, vbus is
> expected to reach VSAFE0V when source turns off vbus. Do not move
> to SNK_UNATTACHED state when this happens.
> 
> Fixes: 28b43d3d746b ("usb: typec: tcpm: Introduce vsafe0v for vbus")
> Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Changes since V1:
> - Fixed type s/of/off in commit message.
> - Added Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/usb/typec/tcpm/tcpm.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index c4fdc00a3bc8..b93c4c8d7b15 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -5114,6 +5114,9 @@ static void _tcpm_pd_vbus_vsafe0v(struct tcpm_port *port)
>  				tcpm_set_state(port, SNK_UNATTACHED, 0);
>  		}
>  		break;
> +	case PR_SWAP_SNK_SRC_SINK_OFF:
> +		/* Do nothing, vsafe0v is expected during transition */
> +		break;
>  	default:
>  		if (port->pwr_role == TYPEC_SINK && port->auto_vbus_discharge_enabled)
>  			tcpm_set_state(port, SNK_UNATTACHED, 0);
> -- 
> 2.31.1.751.gd2f1c929bd-goog

-- 
heikki
