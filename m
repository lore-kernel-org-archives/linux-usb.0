Return-Path: <SRS0=tIEv=SZ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,T_DKIMWL_WL_HIGH,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57BA3C10F03
	for <linux-usb@archiver.kernel.org>; Tue, 23 Apr 2019 20:34:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 22D0821850
	for <linux-usb@archiver.kernel.org>; Tue, 23 Apr 2019 20:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556051671;
	bh=c7PpDKDezYMhV9BMLiPpkZMdrgQ7MKEYz2f5EZ1ecRI=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:List-ID:From;
	b=vzorkrgbvhfibPjdIMocHp/KqAlZof8qxjndfoztZcce7/RArephHZ3PE+jiJNJrh
	 U7rrzLrVEVTMbWPPxwhrtPJHhpgeFbVI71gSMz8axVROFosJiqEpaAEZTdJYzuLAZ2
	 0TM5nE9+f+MRXxzX+to8NiEya+WcMHpvUFVCwLDo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726136AbfDWUea (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 23 Apr 2019 16:34:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:46656 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726029AbfDWUe3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 23 Apr 2019 16:34:29 -0400
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net [24.9.64.241])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AA6D421773;
        Tue, 23 Apr 2019 20:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556051669;
        bh=c7PpDKDezYMhV9BMLiPpkZMdrgQ7MKEYz2f5EZ1ecRI=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=aCQ3giu4zmWaK5VDRIUxC0+hnqTySYmZd1zM5NfdCq3lumPFOmLW4MRmnXRcCjJNo
         zTXwHjFbXgWLQoELMw1eMsqkTR/un8I8GMntT531kbHAtLw+vAAmQu7czYpmWOFVry
         Xr2hbf54w60JpBUZ/vrvddB98CY4ORlrOS7Z+km0=
Subject: Re: [PATCH] usb: usbip: fix isoc packet num validation in get_pipe
To:     malte@leip.net, valentina.manea.m@gmail.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        shuah <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>
References: <20190414100012.lt6uwohkprhhydo6@alum>
From:   shuah <shuah@kernel.org>
Message-ID: <1861de1d-fe9f-1dbf-b8f1-c9feebd81805@kernel.org>
Date:   Tue, 23 Apr 2019 14:34:27 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190414100012.lt6uwohkprhhydo6@alum>
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190423203427.RgaD-YJEUPx1DM7AUOlDWeVHFu3LssyO7OTkrqzjQTQ@z>

On 4/14/19 4:00 AM, Malte Leip wrote:
> Change the validation of number_of_packets in get_pipe to compare the
> number of packets to a fixed maximum number of packets allowed, set to
> be 1024. This number was chosen due to it being used by other drivers as
> well, for example drivers/usb/host/uhci-q.c
> 
> Background/reason:
> The get_pipe function in stub_rx.c validates the number of packets in
> isochronous mode and aborts with an error if that number is too large,
> in order to prevent malicious input from possibly triggering large
> memory allocations. This was previously done by checking whether
> pdu->u.cmd_submit.number_of_packets is bigger than the number of packets
> that would be needed for pdu->u.cmd_submit.transfer_buffer_length bytes
> if all except possibly the last packet had maximum length, given by
> usb_endpoint_maxp(epd) *  usb_endpoint_maxp_mult(epd). This leads to an
> error if URBs with packets shorter than the maximum possible length are
> submitted, which is allowed according to
> Documentation/driver-api/usb/URB.rst and occurs for example with the
> snd-usb-audio driver.
> 
> Fixes: c6688ef9f297 ("usbip: fix stub_rx: harden CMD_SUBMIT path to handle malicious input")
> Signed-off-by: Malte Leip <malte@leip.net>

Looks good to me.

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah

