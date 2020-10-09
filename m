Return-Path: <SRS0=9XAl=DQ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A0CBC433DF
	for <linux-usb@archiver.kernel.org>; Fri,  9 Oct 2020 13:07:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CD60F222C3
	for <linux-usb@archiver.kernel.org>; Fri,  9 Oct 2020 13:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602248844;
	bh=DLW/fxigT2xRQfbWFNe6kK2CQv1s4kgP4SpfF5Jrl2o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=BYLfhl5xNhrXTDI3o7Ik7TyewlQBHcbxGTgkto1X4pXQxAYwRt0n2w87rRWQRxpnJ
	 N2eralw3sLz+TJ7Q3WSDtVJyn3Jj4A5HLjq8b5yLNdl/SdcNCAf2eQWpFXJt6I5aRp
	 HVRvh+opGV79YLY0ms073dEdX1IJM7WM47xizJVY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388164AbgJINHW (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 9 Oct 2020 09:07:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:58260 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388153AbgJINHW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 9 Oct 2020 09:07:22 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C1C96222D5;
        Fri,  9 Oct 2020 13:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602248840;
        bh=DLW/fxigT2xRQfbWFNe6kK2CQv1s4kgP4SpfF5Jrl2o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=p87qFBxBO61mfs69YrAFXMDbBbCz+bitmrzHxhCFfbqMrr7EVDIfCJNqtkaKH0WIx
         UpYwW1+FeOqcFzdMaISaH/fn9p6WsGAiuHjZk6UtzS3RJMJ2uQVaLisMa2g2u0fu69
         eetFFCTr/YbCCpGzKerTaKi/PLbnwsEeJUHfqO2o=
Date:   Fri, 9 Oct 2020 15:08:05 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Oliver Neukum <oneukum@suse.com>,
        David Miller <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Subject: Re: [PATCH net-next] net: usbnet: remove driver version
Message-ID: <20201009130805.GB537013@kroah.com>
References: <bb7c95e6-30a5-dbd9-f335-51553e48d628@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb7c95e6-30a5-dbd9-f335-51553e48d628@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Oct 09, 2020 at 02:10:57PM +0200, Heiner Kallweit wrote:
> Obviously this driver version doesn't make sense. Go with the default
> and let ethtool display the kernel version.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
