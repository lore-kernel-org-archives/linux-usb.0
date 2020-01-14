Return-Path: <SRS0=yvD0=3D=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFB53C33C9E
	for <linux-usb@archiver.kernel.org>; Tue, 14 Jan 2020 17:16:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B60C9222C3
	for <linux-usb@archiver.kernel.org>; Tue, 14 Jan 2020 17:16:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728057AbgANRQJ (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 14 Jan 2020 12:16:09 -0500
Received: from mx2.suse.de ([195.135.220.15]:43194 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726270AbgANRQJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 14 Jan 2020 12:16:09 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 7D75FACE0;
        Tue, 14 Jan 2020 17:16:07 +0000 (UTC)
Message-ID: <1579022156.15925.14.camel@suse.com>
Subject: Re: Reg: USB network interface is down after the reboot
From:   Oliver Neukum <oneukum@suse.com>
To:     RAJESH DASARI <raajeshdasari@gmail.com>
Cc:     linux-usb@vger.kernel.org
Date:   Tue, 14 Jan 2020 18:15:56 +0100
In-Reply-To: <CAPXMrf8PJ=+CG9TqazvbDPL1WkRNQHVTHOowr=Y_a09ULAyscw@mail.gmail.com>
References: <CAPXMrf_d_uKZbohYWfO8rVEg7voBhESesU0w8Ng0M=wsw_75FQ@mail.gmail.com>
         <1578923319.2590.13.camel@suse.com>
         <CAPXMrf8PJ=+CG9TqazvbDPL1WkRNQHVTHOowr=Y_a09ULAyscw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Dienstag, den 14.01.2020, 10:40 +0530 schrieb RAJESH DASARI:

> Rajesh : If i assign the ip address to the usb0 interface then also
> interface is coming up and RUNNING bit is set.
>  We need to determine whether this is a kernel
> > issue or your setup in user space.
> 
> Rajesh : If  i don't run ifconfig usb0 up or if i don't set the ip
> address it is running bit is not set. Is it the standard behaviour.
> Could you please tell me how to find out it is a user space issue or
> kernel issue.

Hi,

you have basically already answered the question. Your devices
are driven by cdc-ether. It cannot assign an IP. After you have
assigned an IP manually, your network is working. Hence the kernel
is fine. Your user space is misconfigured. You need to get help
from the people of whatever network configuration tool you distro
is using.

The USB list is not the place for such issues.

	HTH
		Oliver

