Return-Path: <SRS0=sojL=SO=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F45EC10F0E
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 15:02:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 165FA2083E
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 15:02:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726777AbfDLPCU (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 12 Apr 2019 11:02:20 -0400
Received: from mga09.intel.com ([134.134.136.24]:65403 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726714AbfDLPCU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 12 Apr 2019 11:02:20 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Apr 2019 08:02:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,341,1549958400"; 
   d="scan'208";a="163878423"
Received: from kuha.fi.intel.com ([10.237.72.189])
  by fmsmga001.fm.intel.com with SMTP; 12 Apr 2019 08:02:16 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 12 Apr 2019 18:02:15 +0300
Date:   Fri, 12 Apr 2019 18:02:15 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Ajay Gupta <ajaykuee@gmail.com>
Cc:     linux-usb@vger.kernel.org, Ajay Gupta <ajayg@nvidia.com>
Subject: Re: [PATCH v6 2/2] usb: typec: ucsi: ccg: add firmware flashing
 support
Message-ID: <20190412150215.GB5805@kuha.fi.intel.com>
References: <20190411200310.9775-1-ajayg@nvidia.com>
 <20190411200310.9775-3-ajayg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <20190411200310.9775-3-ajayg@nvidia.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190412150215.2PVtOr-wOkSL5xQd5o4ym-o3OFfcPQl6QpWVAxWmArM@z>

Hi Ajay,

On Thu, Apr 11, 2019 at 01:03:10PM -0700, Ajay Gupta wrote:
> +#define CCG_FW_VERSION_NVIDIA(b)	(le16_to_cpu(b) != (('n' << 8) | 'v'))

Does that remove the sparce warning?

Now that I see that this version is specific to NVIDIA, I think we are
going to want to get this detail from a device property. I'll prepare
an example for you right now so you can see how it can be done.

> +static bool ccg_check_vendor_version(struct ucsi_ccg *uc,
> +				     struct version_format *app,
> +				     struct fw_config_table *fw_cfg)
> +{
> +	struct device *dev = uc->dev;
> +
> +	/* Check if the fw build is for supported vendors.
> +	 * Add all supported vendors here.
> +	 */
> +	if (CCG_FW_VERSION_NVIDIA(app->build)) {
> +		dev_info(dev, "current fw is not from supported vendor\n");
> +		return false;
> +	}
> +
> +	/* Check if the new fw build is for supported vendors
> +	 * Add all supported vendors here.
> +	 */
> +	if (CCG_FW_VERSION_NVIDIA(fw_cfg->app.build)) {
> +		dev_info(dev, "new fw is not from supported vendor\n");
> +		return false;
> +	}
> +	return true;
> +}

Br,

-- 
heikki
