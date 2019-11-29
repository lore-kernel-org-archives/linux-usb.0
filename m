Return-Path: <SRS0=+jy/=ZV=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67B5BC432C0
	for <linux-usb@archiver.kernel.org>; Fri, 29 Nov 2019 13:33:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3A48E2086A
	for <linux-usb@archiver.kernel.org>; Fri, 29 Nov 2019 13:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1575034411;
	bh=bVAwTfQZyJ+xVSCxG3m5UIa0RJZNvKqr27nrpVB4CWo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=GhbMCLnsV/BHbUI5WRSVpeMmtLP1mimaU7/nnH0JjpeGqjOWtESXF2XWv19xOpxTy
	 rDHl50tH5tlJdJnpwUg0lg99WIxtH3DkZVGxBzKooX1pQapkrmG84gP3ZpZgYz2nve
	 g6XLZxdwCYaHiiI6qUW9ZGt6Sp68VJdOebWX0csw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726857AbfK2Nda (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 29 Nov 2019 08:33:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:42614 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726853AbfK2Nda (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 29 Nov 2019 08:33:30 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9FAA120869;
        Fri, 29 Nov 2019 13:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575034410;
        bh=bVAwTfQZyJ+xVSCxG3m5UIa0RJZNvKqr27nrpVB4CWo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ugyv8Rym+9k5uZpea/OEw6cch1jB2Uk2mxYuQeytmQXIQu2yRuoWCAyjjAUM7WlCm
         SvHXzzl4cgq56t+9bgoypcQAvQ31CIZKe4Wi92r71haI89g1/STnXXH+vVRK1CWe8h
         YjEyo/lInhfM5Fd1IsGgHuxwfw5ctA7JsbR4xSAk=
Date:   Fri, 29 Nov 2019 14:33:27 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Vadim Troshchinskiy <vtroshchinskiy@qindel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: usbip tools from 5.4 fail to build due to unaligned pointer
 value warning
Message-ID: <20191129133327.GB3703941@kroah.com>
References: <6296180.lmSoKh01SJ@gverdu.qindel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6296180.lmSoKh01SJ@gverdu.qindel.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 29, 2019 at 01:24:30PM +0100, Vadim Troshchinskiy wrote:
> Hello,
> 
> Building the usbip tools from 4.15 is failing under Fedora 30, gcc version 
> 9.2.1:

When 4.15 was released, there was no such gcc version :)

4.15 is long end-of-life, please use a more modern kernel release with
newer versions of gcc.

thanks,

greg k-h
