Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9C99C433F5
	for <linux-usb@archiver.kernel.org>; Tue,  5 Apr 2022 09:14:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343939AbiDEJPx (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 5 Apr 2022 05:15:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244771AbiDEIwi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Apr 2022 04:52:38 -0400
Received: from mxout02.lancloud.ru (mxout02.lancloud.ru [45.84.86.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0C3D1CFF2
        for <linux-usb@vger.kernel.org>; Tue,  5 Apr 2022 01:43:19 -0700 (PDT)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout02.lancloud.ru 95A7920C0086
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH 1/5] usb: gadget: uvc: reset bytesused on queue cancel
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>,
        <linux-usb@vger.kernel.org>
CC:     <balbi@kernel.org>, <laurent.pinchart@ideasonboard.com>,
        <paul.elder@ideasonboard.com>, <kernel@pengutronix.de>,
        <nicolas@ndufresne.ca>, <kieran.bingham@ideasonboard.com>
References: <20220402233914.3625405-1-m.grzeschik@pengutronix.de>
 <20220402233914.3625405-2-m.grzeschik@pengutronix.de>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <3a6bb767-a114-1d60-3600-52cef493ed58@omp.ru>
Date:   Tue, 5 Apr 2022 11:43:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220402233914.3625405-2-m.grzeschik@pengutronix.de>
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

On 4/3/22 2:39 AM, Michael Grzeschik wrote:

> On uvcg_queue_cancel the buf_used counter has to be reset. Since the
> encode function uses the variable to decide if the encoded data has
> reached the end of frame. Intermediate calls of uvcg_queue_cancel can
> therefor lead to miscalculations in the encode functions, if buf_used

   Therefore?

> was not properly reset.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
[...]

MBR, Sergey
