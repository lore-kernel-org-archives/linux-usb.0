Return-Path: <SRS0=Fi+P=2X=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97BB4C32764
	for <linux-usb@archiver.kernel.org>; Thu,  2 Jan 2020 00:13:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6CA292072C
	for <linux-usb@archiver.kernel.org>; Thu,  2 Jan 2020 00:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1577924032;
	bh=alScVJ8JiASC+OnKeH0vbQnAkIsi9CP1LgoupJA4Fog=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:List-ID:From;
	b=dp0Vb9w2ZQJKwz55yXzN11GH7BQdQIC6dHm1SucznPMQ3ftf217jMLHdEILPGdao5
	 cz21zIDXAIexlHjv00pOVNVjegEHm2m44BcJlKOrRzQs4X8wqWMPjOSULFVfkZXSKx
	 n02LDIBuacwg65YeMjM+vVW4HENLjOcVULDpKdy0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727472AbgABANu (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 1 Jan 2020 19:13:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:53694 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727393AbgABANt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Jan 2020 19:13:49 -0500
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net [24.9.64.241])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 031A92072C;
        Thu,  2 Jan 2020 00:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577924029;
        bh=alScVJ8JiASC+OnKeH0vbQnAkIsi9CP1LgoupJA4Fog=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=GLEmVnfvWitIjX3x315Uiw2mwZwrVJ31ftNKLQgVxxAvbUPDwskJoMHZ30ODv1+Qg
         9M0QpBHzX5Woj24w6TMCbW0Vqku0IxtrlHambP86OxVouo00gClGa2Z0HZC0g9G53t
         oKa2EAXUMYwk53ouBWlaAVXWoe1ic/MXwgHvs1m8=
Subject: Re: [PATCH] tools: usb: usbip: Get rid of driver name printout in
 README
To:     Magnus Damm <magnus.damm@gmail.com>, valentina.manea.m@gmail.com
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        shuah <shuah@kernel.org>
References: <157677692518.684.15385402529285904844.sendpatchset@octo>
From:   shuah <shuah@kernel.org>
Message-ID: <bb773815-813c-1e6f-3cd7-e1e7ba48ee8d@kernel.org>
Date:   Wed, 1 Jan 2020 17:13:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <157677692518.684.15385402529285904844.sendpatchset@octo>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 12/19/19 10:35 AM, Magnus Damm wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
> 
> Driver name is no longer printed out so update the README
> examples to avoid confusion.
> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> ---
> 
>   tools/usb/usbip/README |   22 +++++++++++-----------
>   1 file changed, 11 insertions(+), 11 deletions(-)
> 

Thanks for the patch.

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
