Return-Path: <SRS0=Q5cs=YE=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43E26C47404
	for <linux-usb@archiver.kernel.org>; Fri, 11 Oct 2019 13:59:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1962120673
	for <linux-usb@archiver.kernel.org>; Fri, 11 Oct 2019 13:59:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728198AbfJKN7k (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 11 Oct 2019 09:59:40 -0400
Received: from mga07.intel.com ([134.134.136.100]:55511 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728027AbfJKN7k (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 11 Oct 2019 09:59:40 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Oct 2019 06:59:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,284,1566889200"; 
   d="scan'208";a="207430429"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 11 Oct 2019 06:59:36 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 11 Oct 2019 16:59:35 +0300
Date:   Fri, 11 Oct 2019 16:59:35 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] usb: typec: fix an IS_ERR() vs NULL bug in
 hd3ss3220_probe()
Message-ID: <20191011135935.GB32191@kuha.fi.intel.com>
References: <20191011133558.GC22905@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191011133558.GC22905@mwanda>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Oct 11, 2019 at 04:35:58PM +0300, Dan Carpenter wrote:
> The device_get_named_child_node() function doesn't return error
> pointers, it returns NULL on error.
> 
> Fixes: 1c48c759ef4b ("usb: typec: driver for TI HD3SS3220 USB Type-C DRP port controller")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/usb/typec/hd3ss3220.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
> index 9715600aeb04..37b08f57aac4 100644
> --- a/drivers/usb/typec/hd3ss3220.c
> +++ b/drivers/usb/typec/hd3ss3220.c
> @@ -172,8 +172,8 @@ static int hd3ss3220_probe(struct i2c_client *client,
>  	hd3ss3220_set_source_pref(hd3ss3220,
>  				  HD3SS3220_REG_GEN_CTRL_SRC_PREF_DRP_DEFAULT);
>  	connector = device_get_named_child_node(hd3ss3220->dev, "connector");
> -	if (IS_ERR(connector))
> -		return PTR_ERR(connector);
> +	if (!connector)
> +		return -EIO;

I think the driver should return -ENODEV if there is no node for the
connector.

thanks,

-- 
heikki
