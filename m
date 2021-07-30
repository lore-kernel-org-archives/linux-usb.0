Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43F8AC4338F
	for <linux-usb@archiver.kernel.org>; Fri, 30 Jul 2021 15:22:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 26DA461040
	for <linux-usb@archiver.kernel.org>; Fri, 30 Jul 2021 15:22:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239413AbhG3PWU (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 30 Jul 2021 11:22:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:59710 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239344AbhG3PWT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 30 Jul 2021 11:22:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C08660F5E;
        Fri, 30 Jul 2021 15:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627658534;
        bh=WYpmqCkY1DSUpD6EOZrei2Mhm7XPQP5Y6mLnEdzkXkA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XSpfepKRSPGsKuRuulaSEJnS38+KZqzOdDrhQZDmF0giEWEMRNHpUZdPshAVscLOd
         E0nusG1h9rYQayFHmyEdVXW/0lYyXPUaZnU5ZQ3ZAusn/2fJ3peOehQJOcQuE0MPh6
         tdqL1r9lCVImGV/R/3ydeFG4YY+A+d0oxaF6SGkT57pPwU0IrsPdO4n5HiEbspC9jq
         MdqODnQ7kUICvpAmOPuf9Wnqn5rcUwCaExaGMp9LUMkoa1+9LG72L5gYA2rPqVu/wv
         YaNVNtxLXy0CvkEdBxdlojW69DyR/zz9tgqoyEbSlSFj/O/XHeJLHbNc5licPA3Arc
         UWDb9Sdc2tW7g==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1m9UKP-0001Ms-Il; Fri, 30 Jul 2021 17:21:38 +0200
Date:   Fri, 30 Jul 2021 17:21:37 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/6] USB: serial: cp210x: fixes and CP2105/CP2108 fw
 version
Message-ID: <YQQZAeK0NfS11sYO@hovoldconsulting.com>
References: <20210705082015.18286-1-johan@kernel.org>
 <YOLDjgUFoIbWjilh@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YOLDjgUFoIbWjilh@kroah.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 05, 2021 at 10:32:14AM +0200, Greg Kroah-Hartman wrote:
> On Mon, Jul 05, 2021 at 10:20:09AM +0200, Johan Hovold wrote:
> > Here are couple of minor fixes and some cleanups related to the recent
> > regression which broke RTS control on some CP2102N devices with buggy
> > firmware.
> > 
> > In case we run into another one of these, let's log the firmware
> > version also for CP2105 and CP2108 for which it can be retrieved.
> > 
> > Johan
> > 
> > 
> > Changes in v2
> >  - keep the special-chars error message to make it more obvious that
> >    continuing on errors is intentional (1/6) (Greg)
> 
> Thanks for the change, looks good to me!
> 
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Thanks also for reviewing these. Now applied for -next.

Johan
