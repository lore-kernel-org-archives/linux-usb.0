Return-Path: <SRS0=WMKl=S3=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4717C43219
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 15:00:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D3C7A2081C
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 15:00:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727722AbfDYPAF (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 25 Apr 2019 11:00:05 -0400
Received: from mga03.intel.com ([134.134.136.65]:5257 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726155AbfDYPAF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 25 Apr 2019 11:00:05 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Apr 2019 08:00:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,394,1549958400"; 
   d="scan'208";a="152306405"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.164]) ([10.237.72.164])
  by FMSMGA003.fm.intel.com with ESMTP; 25 Apr 2019 08:00:03 -0700
Subject: Re: [PATCH] xhci: update bounce buffer with correct sg num
To:     Henry Lin <henryl@nvidia.com>, mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org
References: <1556189032-28188-1-git-send-email-henryl@nvidia.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <9315e411-b68c-c1d3-5c9d-d6c8fdc58e31@linux.intel.com>
Date:   Thu, 25 Apr 2019 18:02:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <1556189032-28188-1-git-send-email-henryl@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190425150233.jxjpSpQ-OfAL8a6OgSYIRnapzyBl3HZxWrWS5K7kTPg@z>

On 25.4.2019 13.43, Henry Lin wrote:
> This change fixes a data corruption issue occurred on USB hard disk for
> the case that bounce buffer is used during transferring data.
> 
> While updating data between sg list and bounce buffer, current
> implementation passes mapped sg number (urb->num_mapped_sgs) to
> sg_pcopy_from_buffer() and sg_pcopy_to_buffer(). This causes data
> not get copied if target buffer is located in the elements after
> mapped sg elements. This change passes sg number for full list to
> fix issue.

Nice catch, thanks.

> 
> Besides, for copying data from bounce buffer, calling dma_unmap_single()
> on the bounce buffer before copying data to sg list can avoid cache issue.

Sure, no need to keep it mapped anymore at this stage.

I'll add this to the queue

-Mathias
  
