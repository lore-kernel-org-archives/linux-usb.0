Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92A4FC433F5
	for <linux-usb@archiver.kernel.org>; Tue, 17 May 2022 19:14:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238367AbiEQTN7 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 17 May 2022 15:13:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233255AbiEQTN5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 May 2022 15:13:57 -0400
Received: from mxout04.lancloud.ru (mxout04.lancloud.ru [45.84.86.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 222083584C
        for <linux-usb@vger.kernel.org>; Tue, 17 May 2022 12:13:54 -0700 (PDT)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru AA65A20A7E5F
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH] usb: host: xhci: use snprintf() in xhci_decode_trb()
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        <linux-usb@vger.kernel.org>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
References: <2dc0d93e-2ac7-3f5c-e22c-d5329ec2e7f5@omp.ru>
Organization: Open Mobile Platform
Message-ID: <ef9b047d-4762-6b06-e633-f51d2848f66c@omp.ru>
Date:   Tue, 17 May 2022 22:13:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <2dc0d93e-2ac7-3f5c-e22c-d5329ec2e7f5@omp.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello!

On 3/16/22 11:36 PM, Sergey Shtylyov wrote:

> Commit cbf286e8ef83 ("xhci: fix unsafe memory usage in xhci tracing")
> apparently missed one sprintf() call in xhci_decode_trb() -- replace
> it with the snprintf() call as well...
> 
> Found by Linux Verification Center (linuxtesting.org) with the SVACE static
> analysis tool.
> 
> Fixes: cbf286e8ef83 ("xhci: fix unsafe memory usage in xhci tracing")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> 
> ---
> This patch is against the 'usb-next' branch of Greg KH's 'usb.git' repo.

   Mathias, Greg, what's going on with this patch? It was posted 2 months ago
and seemingly ignored... :-/

MBR, Sergey
