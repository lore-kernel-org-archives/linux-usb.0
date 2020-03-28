Return-Path: <SRS0=BFt0=5N=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7AD3C43331
	for <linux-usb@archiver.kernel.org>; Sat, 28 Mar 2020 07:09:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 786A42072F
	for <linux-usb@archiver.kernel.org>; Sat, 28 Mar 2020 07:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1585379340;
	bh=cipgCIDBEEhfK2JjCpfAj7xHv97dJn2WDWEFijWO1fk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=hKPST+Vx+m9EjLxPBhkt//zdxQX2HVFsoje7TUI0CWoNcjdbPbRiKIQuQqBafAv6M
	 YyJgcjMov1bgv7Dooz7XtBrjEgHrjbwPmjHw1aLAeGzaDGBK4bfiXtIQFBvqqeLRBo
	 tct5P2I9KPIOzCRaEZZ2kQyUcSbWplk85TMAI5OI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725937AbgC1HI7 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 28 Mar 2020 03:08:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:57794 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725372AbgC1HI7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 28 Mar 2020 03:08:59 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C135020714;
        Sat, 28 Mar 2020 07:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585379337;
        bh=cipgCIDBEEhfK2JjCpfAj7xHv97dJn2WDWEFijWO1fk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UcbeFYLqKG2QvF2aRR7TSt/muS6wb5KC7GSvrVZB5E0Xz6FSXbym2UEYiyxX9JEUn
         Zl1O608YoxzQeVXi+LmFn8ELftma5Sw+oomU7ZWOCURWNQ+XUrbnwtSYW0EXkTuXBW
         aicGyZBTxsX7VBceEKljS+Au6xIuwufCa3Asm3Mk=
Date:   Sat, 28 Mar 2020 08:08:53 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     John Donnelly <john.p.donnelly@oracle.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: ehci-pci :   WARNING: CPU: 0 PID: 347 at kernel/dma/direct.c:34
Message-ID: <20200328070853.GA3643170@kroah.com>
References: <F5A0CCCB-4503-40B1-A24D-323F5B89C1F4@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <F5A0CCCB-4503-40B1-A24D-323F5B89C1F4@oracle.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Mar 27, 2020 at 11:11:33PM -0500, John Donnelly wrote:
> 
> Hi,
> 
> I am seeing this WARNING  event with iommu=off when booting a DL380 server with a  5.4.17 kernel.
> 
> 
> 
> [    7.292703] ehci-pci 0000:00:1a.0: swiotlb buffer is full (sz: 8 bytes), total 0 (slots), used 0 (slots)
> [    7.309834] ehci-pci 0000:00:1a.0: overflow 0x0000000a1c8f9a60+8 of DMA mask ffffffff bus limit 0
> [    7.325937] ------------[ cut here ]------------

So your system really wants the iommu enabled, I would stick with doing
that :)

thanks,

greg k-h
