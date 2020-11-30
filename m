Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37A21C5519F
	for <linux-usb@archiver.kernel.org>; Mon, 30 Nov 2020 08:45:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D1923207BC
	for <linux-usb@archiver.kernel.org>; Mon, 30 Nov 2020 08:45:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N5ElSh6l"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726746AbgK3Ipa (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 30 Nov 2020 03:45:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57531 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726137AbgK3Ipa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Nov 2020 03:45:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606725843;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ey1C0d9PZ+jC1SeRokoRwtQYfI7PDl+5m30mISh+nx8=;
        b=N5ElSh6l3ue4g9AV/+pJ2f21bcxjeWXkMvMb7HleWN/CpBVHo+iO+LzcruagBRkIpQuMH/
        aI3H4YwulFfYiNdCGcZ/f30lNfHyRQNm85SKWUh35z0UPXWplGWwwJVLQHsGR3n9BY9qKE
        DAEBuuSF4QbOsuVb//CSfxtCGqZtBoY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-gdcyDVUFOaqwf1cZ7Jnvpw-1; Mon, 30 Nov 2020 03:44:01 -0500
X-MC-Unique: gdcyDVUFOaqwf1cZ7Jnvpw-1
Received: by mail-ed1-f69.google.com with SMTP id s7so6394038eds.17
        for <linux-usb@vger.kernel.org>; Mon, 30 Nov 2020 00:44:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ey1C0d9PZ+jC1SeRokoRwtQYfI7PDl+5m30mISh+nx8=;
        b=RJuKDT9zPcCLzLioTo+5omc1onN6AlGlF9rC8cQBASxHk83bEiLt1++fUXHZMpX+LS
         MSh4fJabGuTwakqAr+b75YXSb5sdAgKKob67jpmS/VgyXSlnS2XBPFDxUEFuvkeIidWz
         GwVIug5koBY+bqA1vUrBCTiTs1S5OVCCkxazdmt1wcGjJ14dLSuO9Cem4zS7AFa4t9Jo
         8FQj4YWwg3nkSBr2cekmHxDUBjT+cBUEOGLIizKsYyfzKLoRoUH56KcpSmeGiL48BI+3
         d2itx4x05TB8m9vhs1DfBFmAyw7LNYVxFiJG7yI6MR6f1zmSBZv6gTcxSAp+QKKxiR1R
         JTzg==
X-Gm-Message-State: AOAM530F0U5s/gJT5FiTcYwGLR5BPIHg+XJux8UPH90vvbvQLsRWO5Ra
        YouRtBjVnFQDO+3COn/3sSEtWxZjwkQvGnEhDpdvRjHIrojNfggGuqIpLyGIuW61yF1unZtDa+u
        7w3n7R0oj/jWn/Xz/ezi3
X-Received: by 2002:a17:906:aac1:: with SMTP id kt1mr567771ejb.329.1606725840171;
        Mon, 30 Nov 2020 00:44:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxs3ln5Efn41CjmIOtYUTR38V2LHcxx3XUgPY7qefkj2/Jh8zpB5MhDtTGr1Nse7RBqGNLFPA==
X-Received: by 2002:a17:906:aac1:: with SMTP id kt1mr567760ejb.329.1606725840030;
        Mon, 30 Nov 2020 00:44:00 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id d10sm7897462ejc.39.2020.11.30.00.43.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Nov 2020 00:43:59 -0800 (PST)
Subject: Re: 5.10 regression caused by: "uas: fix sdev->host->dma_dev": many
 XHCI swiotlb buffer is full / DMAR: Device bounce map failed errors on
 thunderbolt connected XHCI controller
To:     Christoph Hellwig <hch@lst.de>
Cc:     Tom Yan <tom.ty89@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-pci@vger.kernel.org, Lu Baolu <baolu.lu@linux.intel.com>
References: <b046dd04-ac4f-3c69-0602-af810fb1b365@redhat.com>
 <be031d15-201f-0e5c-8b0f-be030077141f@redhat.com>
 <20201124102715.GA16983@lst.de>
 <fde7e11f-5dfc-8348-c134-a21cb1116285@redhat.com>
 <8a52e868-0ca1-55b7-5ad2-ddb0cbb5e45d@redhat.com>
 <20201127161900.GA10986@lst.de>
 <fded04e2-f2e9-de92-ab1f-5aa088904e90@redhat.com>
 <20201128171500.GA3550@lst.de>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <a84974a8-514b-690b-480b-c82c0617fec0@redhat.com>
Date:   Mon, 30 Nov 2020 09:43:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201128171500.GA3550@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 11/28/20 6:15 PM, Christoph Hellwig wrote:
> Can you give this one-liner a spin?
> 
> diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
> index c6622011d4938c..e889111b55c71d 100644
> --- a/drivers/iommu/intel/iommu.c
> +++ b/drivers/iommu/intel/iommu.c
> @@ -4007,6 +4007,7 @@ static const struct dma_map_ops bounce_dma_ops = {
>  	.alloc_pages		= dma_common_alloc_pages,
>  	.free_pages		= dma_common_free_pages,
>  	.dma_supported		= dma_direct_supported,
> +	.max_mapping_size	= swiotlb_max_mapping_size,
>  };
>  
>  static inline int iommu_domain_cache_init(void)
> 

I'm afraid that this does not help.

Also I still find it somewhat wrong that the use of scsi_add_host_with_dma()
in uas.c, which then passed the XHCI controller as dma-dev is causing changes
to the DMA settings of the XHCI controller, impacting *other* USB devices
and these changes also are permanent, they stay around even after unbinding
the uas driver.

This just feels wrong on many levels. If some changes to the XHCI controllers
DMA settings are necessary for better uas performance then these changes
really should be made inside the XHCI driver, so that they always apply and
not have this weirdness going on where binding one USB driver permanently
changes the behavior of the entire USB bus (until rebooted).

Querying the DMA settings of the XHCI controller in the uas driver is fine,
but changing them seems like a big nono to me.

Regards,

Hans

