Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47205C7EE29
	for <linux-usb@archiver.kernel.org>; Tue, 13 Jun 2023 09:47:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241950AbjFMJrf (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 13 Jun 2023 05:47:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241588AbjFMJrD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Jun 2023 05:47:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29FF310D9;
        Tue, 13 Jun 2023 02:46:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B15FE633A9;
        Tue, 13 Jun 2023 09:46:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A021DC433D2;
        Tue, 13 Jun 2023 09:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1686649607;
        bh=8eG9BXn9SgJZO8Q9TEHnAKVexAZ+M+5pTf3R8w8Jqc4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=S7JOsAKqj74Eryl5wpQA3K3CAScfgu0jgQ0mXN7RYcEViX5fckMQ88B2657QnsMFE
         +WO98orfB3CZy4c2VaMDmTHaMU1S4wcjmM+3THw+QMpZnyJjuIn8NVc6shEww1loq/
         Ev5UD4w4FlVxXDPRouOTf3rF6R40pY7lW+PQCGtc=
Date:   Tue, 13 Jun 2023 11:46:44 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Pawel Laszczak <pawell@cadence.com>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Daisy.Barrera@siriusxm.com, Cliff.Holden@siriusxm.com,
        tony@atomide.com, jdelvare@suse.de, neal_liu@aspeedtech.com,
        linus.walleij@linaro.org, egtvedt@samfundet.no,
        biju.das.jz@bp.renesas.com, herve.codina@bootlin.com
Subject: Re: [PATCH v4 4/4] MAINTAINERS: add Cadence USBHS driver entry
Message-ID: <2023061350-calcium-follow-8649@gregkh>
References: <20230602102644.77470-1-pawell@cadence.com>
 <20230602102644.77470-5-pawell@cadence.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230602102644.77470-5-pawell@cadence.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 02, 2023 at 06:26:44AM -0400, Pawel Laszczak wrote:
> Patch adds entry for USBHS (CDNS2) driver into MAINTARNERS file
> 
> Signed-off-by: Pawel Laszczak <pawell@cadence.com>
> ---
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c269a15609e2..8b289d52d983 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4523,6 +4523,12 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git
>  F:	drivers/usb/cdns3/
>  X:	drivers/usb/cdns3/cdns3*
>  
> +CADENCE USBHS DRIVER
> +M:	Pawel Laszczak <pawell@cadence.com>
> +L:	linux-usb@vger.kernel.org
> +S:	Maintained

This isn't part of your job description?  Why doesn't Cadence allow you
to do that?  That's not good on a bunch of levels, have you seen the
Documentation/process/contribution-maturity-model.rst file yet?

thanks,

greg k-h
