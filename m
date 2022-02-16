Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 879AAC433F5
	for <linux-usb@archiver.kernel.org>; Wed, 16 Feb 2022 11:10:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231330AbiBPLKc (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 16 Feb 2022 06:10:32 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:33474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbiBPLKa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Feb 2022 06:10:30 -0500
Received: from mxout02.lancloud.ru (mxout02.lancloud.ru [45.84.86.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEAF1EDF08
        for <linux-usb@vger.kernel.org>; Wed, 16 Feb 2022 03:10:16 -0800 (PST)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout02.lancloud.ru 2696D22C5B34
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH] usb: host: xhci: make 'usec' parameter of
 xhci_handshake() *unsigned*
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Mathias Nyman <mathias.nyman@intel.com>,
        <linux-usb@vger.kernel.org>
References: <e8e27f4c-489e-08c2-7495-7bfe07bf6f97@omp.ru>
 <YgzUrP06/tdiquXg@kroah.com>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <13ba1e25-16a1-ea26-4942-f1005eb6f7ce@omp.ru>
Date:   Wed, 16 Feb 2022 14:10:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YgzUrP06/tdiquXg@kroah.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2/16/22 1:40 PM, Greg Kroah-Hartman wrote:

>> The negative timeouts hardly make sense, and the 'usec' parameter of
>> xhci_handshake() gets assigned to a 'u64' typed local variable in
>> readl_poll_timeout_atomic() anyways...
> 
> Then why not just make it a u64 instead of a unsigned int?

   Because *unsigned int* is enough? :-)

> thanks,
> 
> greg k-h

MBR, Sergey
