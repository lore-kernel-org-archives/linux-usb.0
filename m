Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B71CC433B4
	for <linux-usb@archiver.kernel.org>; Thu,  1 Apr 2021 08:09:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BEEBC610A0
	for <linux-usb@archiver.kernel.org>; Thu,  1 Apr 2021 08:09:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233450AbhDAIJS (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 1 Apr 2021 04:09:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:47464 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233024AbhDAIJG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 1 Apr 2021 04:09:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0F3AE610A0;
        Thu,  1 Apr 2021 08:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617264546;
        bh=NMCFXNkyTxe7jYe9LKLuBpM2TEuj+8MCi3QE7ObNobw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=c/y958x25Stwq+Kf2GG7zgwzRQ7MGaKmWLelvLbQS8rcwRlrwmJAqGwxLFzShvSD3
         +i5D70caX6+gAcCszTMJLKsPqecIolsQUv8AAxbr4L1wW/FUKxvIDVQJoeNNxAdw8C
         sY1+WOpPV6243ICYXcXX/kPh7SSzDlJ3cx9ZIjRoCiKtf0IwOVrE6AbKEXu8VeDvcO
         k1L1QGH0oqDYziJtu6CRKUql0vLhAfM+xd4TfL9UU+sMxyRDns9Qtgd8VIC9tpjnJv
         /AD/Jrn9NOBUHV0NkFIpFjD+dvoo/Dyac4ckudyXnooZEQR/BhsAPzm2niucJ0qb6l
         N1/wG1zsviY4A==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1lRsNy-0005Vw-Qc; Thu, 01 Apr 2021 10:09:03 +0200
Date:   Thu, 1 Apr 2021 10:09:02 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] USB: serial: add support for multi-interface
 functions
Message-ID: <YGV/nr4hl/qpPw76@hovoldconsulting.com>
References: <20210330143820.9103-1-johan@kernel.org>
 <YGM6mhvDrFkqHe70@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YGM6mhvDrFkqHe70@kroah.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Mar 30, 2021 at 04:50:02PM +0200, Greg Kroah-Hartman wrote:
> On Tue, Mar 30, 2021 at 04:38:16PM +0200, Johan Hovold wrote:
> > A single USB function can be implemented using a group of interfaces and
> > this is for example commonly used for Communication Class devices.
> >     
> > This series adds support for multi-interface functions to USB serial
> > core and exports an interface that allows drivers to claim a second
> > sibling interface. The interface could easily be extended to allow
> > claiming further interfaces if ever needed.
> > 
> > The final patch uses the new interface to properly claim both the
> > control and data interface of Maxlinear/Exar devices.
> 
> Looks good, thanks for adding this:
> 
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Thanks for reviewing. Now applied.

Johan
