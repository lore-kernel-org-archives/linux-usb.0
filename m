Return-Path: <SRS0=lmIm=SV=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7A29C282DA
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 18:33:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 980A0204EC
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 18:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555698837;
	bh=f6QFhQvpvprW58UF6rppdwfwO05ooLKzn749vajSJS0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=2APQe3Vp4ivEda6qrxAOpggUpiBqBLtV7HdkhdewxQvnWuVD3Uc8+4ufkIwXCza1z
	 FUNM0i+CYKEW56C9bclcfvtkRM2ZZx3mox/h9gHuWUgxFgjO6KDYpqF9Hn31djsWHJ
	 kyqoGwGXXQ+YeaUFT2pCNgzByU33623ejTX11yj8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727607AbfDSSdu (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 19 Apr 2019 14:33:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:53918 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727601AbfDSS3Q (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 19 Apr 2019 14:29:16 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 75052218AC;
        Fri, 19 Apr 2019 08:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555662490;
        bh=f6QFhQvpvprW58UF6rppdwfwO05ooLKzn749vajSJS0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qBvTSZ0AxCIzjTgt4Jvj6fcz+hh2OF1RvrHLw5DCUx9swWpVwwmW6bIYtT/BpBX4U
         17TDzd2JcmFs3yAwc2A5LXrrWQfQweCWKODeTXDEg93mHWPlJj3/XQF16iq7tKUtSW
         obnUye1Ff0JqwxMT1f9OsgxbnvCfLssi06LtIHUw=
Date:   Fri, 19 Apr 2019 10:28:07 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org, Florian Zumbiehl <florz@florz.de>
Subject: Re: [PATCH] USB: serial: pl2303: fix xon/xoff flow control
Message-ID: <20190419082807.GC28648@kroah.com>
References: <20190418160352.17793-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <20190418160352.17793-1-johan@kernel.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190419082807.XVkuFlpVsSWhI7CQHEyNYegU0gHHPpXGP2zE8yWy5hw@z>

On Thu, Apr 18, 2019 at 06:03:52PM +0200, Johan Hovold wrote:
> Fix the XON/XOFF flow-control implementation by reporting back the
> attributes actually supported while ignoring the rest.
> 
> Note that only outgoing XON/XOFF flow control (IXON) is currently
> supported for PL2303HX, and only using the default start and stop chars.
> 
> Fixes: 68270dab9710 ("USB: serial: pl2303: fix non-supported xon/xoff")
> Fixes: 7041d9c3f01b ("USB: serial: pl2303: add support for tx xon/xoff flow control")
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/usb/serial/pl2303.c | 29 +++++++++++------------------
>  1 file changed, 11 insertions(+), 18 deletions(-)

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
