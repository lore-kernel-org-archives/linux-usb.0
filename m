Return-Path: <SRS0=PkR+=S6=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85B2FC43219
	for <linux-usb@archiver.kernel.org>; Sun, 28 Apr 2019 16:01:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 547EA2067D
	for <linux-usb@archiver.kernel.org>; Sun, 28 Apr 2019 16:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556467262;
	bh=lyFVnJwoc685vh4uov62zI2Wd+F1dnVR6Ybe3ukewL0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=W9eIP4g8rWm8TDC3xCr+xnTEnWitiTvBL3IR3+0auI49tSqkhaEOrT+5hP8bRBzhO
	 OJZsWSiqRpX3waD+Jocr+4wcFCLase3aY5Tfu4wCaMvKZa0kW4ZZ5iz1y2o5aJ8vJp
	 8Hz2RDkO3bfJWgu/9OTYGmk8sa+neyCFBNf0Y0MA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726861AbfD1QBB (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 28 Apr 2019 12:01:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:52410 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726769AbfD1QBB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 28 Apr 2019 12:01:01 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3626E2067D;
        Sun, 28 Apr 2019 16:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556467260;
        bh=lyFVnJwoc685vh4uov62zI2Wd+F1dnVR6Ybe3ukewL0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=2FWU6jB9i/fFRHIV2s9Keer8H/FYQ0NdPGF/LRYasaXq10JunXQHqd21Yeo/A50da
         8NbqvUe3edI9tu4/DEbXYEtbwftl/l/kBpG/Phr4OO5UnfB1SfSdUdVzz/aQ+EtCn3
         vi93pOfJddYaqO5tWNxF5UPBbJkkcJFrfYUuq8Tg=
Date:   Sun, 28 Apr 2019 18:00:58 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Christo Gouws <gouws.christo@gmail.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org
Subject: Re: Line6 podstudio UX1 - driver crash on usb_hcd_map_urb_for_dma
Message-ID: <20190428160058.GC9546@kroah.com>
References: <20190427070136.GE28250@kroah.com>
 <Pine.LNX.4.44L0.1904271124490.17640-100000@netrider.rowland.org>
 <20190427180728.GA3200@kroah.com>
 <20190427182432.GA5213@kroah.com>
 <20190427184244.GB5213@kroah.com>
 <CAPHvrsnAeCwOm+ehW91zAi0f6cHD8yqx+vF5XJiLve-p9ahzEw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <CAPHvrsnAeCwOm+ehW91zAi0f6cHD8yqx+vF5XJiLve-p9ahzEw@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190428160058.FouMHCf59-lkJFF-gCTPMlqakKVE7mxtV0n4oQ4Euo4@z>

On Sun, Apr 28, 2019 at 12:50:04PM +0200, Christo Gouws wrote:
> Hi,
> 
> Confirmed issue is fixed by patch.

Wonderful, thanks for testing!  I'll go queue this up now, thanks.

greg k-h
