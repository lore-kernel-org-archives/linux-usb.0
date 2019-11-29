Return-Path: <SRS0=+jy/=ZV=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E33EFC432C0
	for <linux-usb@archiver.kernel.org>; Fri, 29 Nov 2019 14:17:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AC683215A5
	for <linux-usb@archiver.kernel.org>; Fri, 29 Nov 2019 14:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1575037037;
	bh=Mq6dvKy4hqoF+b0335xBNPSniq/8yKBZpNYk+G1gFDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=kRcbKzlykL7l4LqAwzEzFbmQeqQoW2lyAzubNjEwbvvu4+0Y+bvacTYICNKPDcKFm
	 gnovFpHvfJyMIkZgmvOTKCfqGsI5obofaW2eCAfM9jvK1lsF3T2cbcpownn+7GRZSC
	 uB9oUKZs9NQ85+PQuBlLwyHktr8w815Z6lCXZp9o=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726834AbfK2ORR (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 29 Nov 2019 09:17:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:51712 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726608AbfK2ORR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 29 Nov 2019 09:17:17 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 05BD9208E4;
        Fri, 29 Nov 2019 14:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575037036;
        bh=Mq6dvKy4hqoF+b0335xBNPSniq/8yKBZpNYk+G1gFDE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Zw/NXg/s3+eAoLt66O/tjlw1pXBrfniot8IXY+9H1v+RnWbliZARXqAilSQJTyFk4
         ybZ1NWPBH1P1ewBXIF/3ZsuhpfQOmxGMNOXJKwFg6cv7jY2NtuGLMWsBW+lqVLNRMH
         5e5hUaVmKb8Q8nDGRpf1qWEeziOMfUtbi0Km+6Hc=
Date:   Fri, 29 Nov 2019 15:17:13 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Vadim Troshchinskiy <vtroshchinskiy@qindel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: usbip tools from 5.4 fail to build due to unaligned pointer
 value warning
Message-ID: <20191129141713.GA3706703@kroah.com>
References: <6296180.lmSoKh01SJ@gverdu.qindel.com>
 <20191129133327.GB3703941@kroah.com>
 <2248932.DWrUWtNFSA@gverdu.qindel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2248932.DWrUWtNFSA@gverdu.qindel.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 29, 2019 at 02:49:45PM +0100, Vadim Troshchinskiy wrote:
> В письме от пятница, 29 ноября 2019 г. 14:33:27 CET пользователь Greg KH 
> написал:
> > On Fri, Nov 29, 2019 at 01:24:30PM +0100, Vadim Troshchinskiy wrote:
> > > Hello,
> > > 
> > > Building the usbip tools from 4.15 is failing under Fedora 30, gcc version
> > 
> > > 9.2.1:
> > When 4.15 was released, there was no such gcc version :)
> > 
> > 4.15 is long end-of-life, please use a more modern kernel release with
> > newer versions of gcc.
> 
> Ah, my apologies, had a bit of a mix-up here. This compilation problem was on 
> v5.4 as it says in the title, I'm working on porting something from 4.15 and 
> accidentally put that there.

Ah, sorry about that.

Send patches on, odds are no one has tried this yet.

thanks,

greg k-h
