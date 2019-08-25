Return-Path: <SRS0=8pks=WV=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05EA7C3A5A1
	for <linux-usb@archiver.kernel.org>; Sun, 25 Aug 2019 08:29:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CE691217F4
	for <linux-usb@archiver.kernel.org>; Sun, 25 Aug 2019 08:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1566721793;
	bh=MG46LMKNhzrcr7h8nqJJowawalBsfrBIT2TadX6YZUM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=MI0SamSVgP8X6DkrxCdSRJX/oT5NzWew+wybbn9VFVry3QnSDDSRUAw1Irqy77RP4
	 w/TNkhZFBnE3NiMx0+POYkHYRQxcsRWI6WRtwENSdYKRgNSz9q9UduRpdGH7txN6jv
	 08axPkHwDVdNLw1QHbB/NCeeBirZh6M8TgnLj0Rg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726653AbfHYI3x (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 25 Aug 2019 04:29:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:53084 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726564AbfHYI3w (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 25 Aug 2019 04:29:52 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 523E420870;
        Sun, 25 Aug 2019 08:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566721791;
        bh=MG46LMKNhzrcr7h8nqJJowawalBsfrBIT2TadX6YZUM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kl2LEg4blEy7zhNc5wqSZR+s8JsVX6kwjCaZCOqDFvnx3mHZ+iORqzY/xF6+v7RGq
         25rXjg6zj2ckXK9ZCAfZcz2zt53gvoIhKMYpGdfltBnNQyqtfTbk1/jrJm/0oCFWjN
         GzPxdGe9B0nU+FykBdDAry9PiBfyNaFKjLtNSyRw=
Date:   Sun, 25 Aug 2019 10:29:49 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     "Schmid, Carsten" <Carsten_Schmid@mentor.com>
Cc:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [Patch v5] usb: hcd: use managed device resources
Message-ID: <20190825082949.GA4583@kroah.com>
References: <1566569488679.31808@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1566569488679.31808@mentor.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Aug 23, 2019 at 02:11:28PM +0000, Schmid, Carsten wrote:
> Using managed device resources in usb_hcd_pci_probe() allows devm usage for
> resource subranges, such as the mmio resource for the platform device
> created to control host/device mode mux, which is a xhci extended
> capability, and sits inside the xhci mmio region.
> 
> If managed device resources are not used then "parent" resource
> is released before subrange at driver removal as .remove callback is
> called before the devres list of resources for this device is walked
> and released.
> 
> This has been observed with the xhci extended capability driver causing a
> use-after-free which is now fixed.
> 
> An additional nice benefit is that error handling on driver initialisation
> is simplified much.
> 
> Signed-off-by: Carsten Schmid <carsten_schmid@mentor.com>
> Tested-by: Carsten Schmid <carsten_schmid@mentor.com>
> ---
> Rationale:
> Use-after-free was reproduced on 4.14.102 and 4.14.129 kernel
> using unbind mechanism.
> echo 0000:00:15.0 > /sys/bus/pci/drivers/xhci_hcd/unbind
> 
> Upstream version of driver is identical in the affected code.
> Fix was tested successfully on 4.14.129.
> Provided patch applies and compiles on v5.2.8 stable.
> As this is also a bugfix, please consider it to go to stable trees too.

How far back should it go, just 4.14?  Was this caused by a specific
commit that you happened to notice?

thanks,

greg k-h
