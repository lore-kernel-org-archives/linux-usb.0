Return-Path: <SRS0=2rsX=2B=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E213C43603
	for <linux-usb@archiver.kernel.org>; Wed, 11 Dec 2019 07:46:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 03F4C214AF
	for <linux-usb@archiver.kernel.org>; Wed, 11 Dec 2019 07:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576050400;
	bh=tyLqKmHGdCaeHZRXVzfApHfVIhiWhgGCvrNystZzppc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=w5XbiqkRqEzCAL0y7hfz8ubLe0xDrBlU3qgrqEPUsDKGnEQHdv+c9e1US0jaUbId8
	 s07k8kmxYA66BWEPgtWdyoLID4lTT1oM6znpteG96VtWpWl3vGxeiNZg122zcP2hpZ
	 43VCyfo2fEqeASuwaoQkHkDVLqiLoBH02b3H9pKQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728147AbfLKHqg (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 11 Dec 2019 02:46:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:52400 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726151AbfLKHqg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 11 Dec 2019 02:46:36 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EA90C20637;
        Wed, 11 Dec 2019 07:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576050395;
        bh=tyLqKmHGdCaeHZRXVzfApHfVIhiWhgGCvrNystZzppc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lCr4nYHLTn7FptvCQ276kxhnhXyjF91LhOHvh5AIdw8NA3rH3IqmlgE4KgafsE7xU
         o4vsD4ozPzb1KKdwyda0rCUwXJiB2h9dl4cJxvCRJ+r5wYiaL9SM0rnjPRjDp1Drf9
         1ApebZnK0aE/AWphgKWK2Nxysb5aK045ww61wBa8=
Date:   Wed, 11 Dec 2019 08:46:33 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Sasha Levin <sashal@kernel.org>
Cc:     linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Ingo Rohloff <ingo.rohloff@lauterbach.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 4.9 33/91] usb: usbfs: Suppress problematic bind
 and unbind uevents.
Message-ID: <20191211074633.GE398293@kroah.com>
References: <20191210223035.14270-1-sashal@kernel.org>
 <20191210223035.14270-33-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191210223035.14270-33-sashal@kernel.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Dec 10, 2019 at 05:29:37PM -0500, Sasha Levin wrote:
> From: Ingo Rohloff <ingo.rohloff@lauterbach.com>
> 
> [ Upstream commit abb0b3d96a1f9407dd66831ae33985a386d4200d ]
> 
> commit 1455cf8dbfd0 ("driver core: emit uevents when device is bound
> to a driver") added bind and unbind uevents when a driver is bound or
> unbound to a physical device.

That commit only went into 4.14, so this is not needed on any kernel
older than that.

thanks,

greg k-h
