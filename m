Return-Path: <SRS0=RaDd=EE=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE99AC4363A
	for <linux-usb@archiver.kernel.org>; Thu, 29 Oct 2020 00:35:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 994C820790
	for <linux-usb@archiver.kernel.org>; Thu, 29 Oct 2020 00:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603931716;
	bh=RL+G1e2TWLsTczGXtC6txTiEvdUX/DJE5O1+QMyOLCM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=j4+WWJDM5oJSDHKBiKTO4pEdZTc23XlrPJc4zgkDKxqx74oOwvR4NBdrD9l/4iljc
	 Vu7W2UyuXSH9z2yCTvLVIUhBX52nixoObPGe0wYnryfiecMKKA3O+vJ3URgDHRlkFN
	 BxE5Xy49Vf4Xj5RaP1SjZUPf1Bt8L5AQy2HVWBmc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731919AbgJ1WT1 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 28 Oct 2020 18:19:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:60528 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731705AbgJ1WRm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 28 Oct 2020 18:17:42 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8D7BB24687;
        Wed, 28 Oct 2020 09:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603877831;
        bh=RL+G1e2TWLsTczGXtC6txTiEvdUX/DJE5O1+QMyOLCM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tp4nXFATigdHu/Apxfzw+Da8PhRNZulugG1SQ/fXzSLZALWjjVKH7rB7cpE8Ci6v3
         tqfgr8TeOW/Bvz58gEu4ymAbpX4y9ChXDLm6fHPCXdxCr7TJJGafOfysEmq6tkoMyc
         cxrmmdIJnwW/uMrJcSE7vPlYuGWLrNIau8LTna7g=
Date:   Wed, 28 Oct 2020 10:38:03 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: remove write wait queue
Message-ID: <20201028093803.GA1953863@kroah.com>
References: <20201026104421.29680-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201026104421.29680-1-johan@kernel.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Oct 26, 2020 at 11:44:21AM +0100, Johan Hovold wrote:
> The digi_acceleport driver is the only driver still using the port
> write wake queue so move it to that driver's port data.
> 
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/usb/serial/digi_acceleport.c | 12 ++++++------
>  include/linux/usb/serial.h           |  2 --
>  2 files changed, 6 insertions(+), 8 deletions(-)
> 

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
