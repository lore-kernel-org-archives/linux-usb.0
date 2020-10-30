Return-Path: <SRS0=TW+4=EF=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDE42C4741F
	for <linux-usb@archiver.kernel.org>; Fri, 30 Oct 2020 13:27:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9F6F622258
	for <linux-usb@archiver.kernel.org>; Fri, 30 Oct 2020 13:27:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726633AbgJ3N1A (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 30 Oct 2020 09:27:00 -0400
Received: from mga12.intel.com ([192.55.52.136]:6321 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726078AbgJ3N1A (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 30 Oct 2020 09:27:00 -0400
IronPort-SDR: KOaE4zNRPzH3ePzMvkbq72dsnuHqH8+hm/1VqtBZOt/DXRgQe86S8ppXlW2JPB5mwjBH5luV6Q
 AAb8B1FCRTgA==
X-IronPort-AV: E=McAfee;i="6000,8403,9789"; a="147889745"
X-IronPort-AV: E=Sophos;i="5.77,433,1596524400"; 
   d="scan'208";a="147889745"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2020 06:26:10 -0700
IronPort-SDR: YV4wtnH3IbPh9jWJxKOoi2HaVoQvD2DRl2ZQ7xMBjrzlRSS29MaPLlNoVKeXW4U+RJngJoRIqD
 wRuU8KGsnIew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,433,1596524400"; 
   d="scan'208";a="425344461"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 30 Oct 2020 06:26:07 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 30 Oct 2020 15:26:06 +0200
Date:   Fri, 30 Oct 2020 15:26:06 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Amelie Delaunay <amelie.delaunay@st.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: Re: [PATCH 1/1] usb: typec: add missing MODULE_DEVICE_TABLE() to
 stusb160x
Message-ID: <20201030132606.GD2333887@kuha.fi.intel.com>
References: <20201028151703.31195-1-amelie.delaunay@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201028151703.31195-1-amelie.delaunay@st.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Oct 28, 2020 at 04:17:03PM +0100, Amelie Delaunay wrote:
> When stusb160x driver is built as a module, no modalias information is
> available, and it prevents the module to be loaded by udev.
> Add MODULE_DEVICE_TABLE() to fix this issue.
> 
> Fixes: da0cb6310094 ("usb: typec: add support for STUSB160x Type-C controller family")
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/stusb160x.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/typec/stusb160x.c b/drivers/usb/typec/stusb160x.c
> index da7f1957bcb3..42076697e26c 100644
> --- a/drivers/usb/typec/stusb160x.c
> +++ b/drivers/usb/typec/stusb160x.c
> @@ -633,6 +633,7 @@ static const struct of_device_id stusb160x_of_match[] = {
>  	{ .compatible = "st,stusb1600", .data = &stusb1600_regmap_config},
>  	{},
>  };
> +MODULE_DEVICE_TABLE(of, stusb160x_of_match);
>  
>  static int stusb160x_probe(struct i2c_client *client)
>  {
> -- 
> 2.17.1

-- 
heikki
