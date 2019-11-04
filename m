Return-Path: <SRS0=8L6C=Y4=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C54F2CA9ECF
	for <linux-usb@archiver.kernel.org>; Mon,  4 Nov 2019 12:08:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 96D9D217F5
	for <linux-usb@archiver.kernel.org>; Mon,  4 Nov 2019 12:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572869295;
	bh=7zGrMI1fvPH9cnFjATy9NF+0zm/3rSG8M3hvxqz29IA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=x642kS8wSsJlKjC9H8tdx8K0PqHSjDML0flLiwSYa3AdEFW0jnFmgrHuYWCAdO3tw
	 VA3TsSdk8Fix9tWq1USED1TwKwA3r5cyvd7OtgRjXq97ci/VCBZVZvTsurJ2PxEWUR
	 pWw0w1O6Kr2CYzZ0ezeygeI9JwbPV9VES+pGzNwc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728827AbfKDMIP (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 4 Nov 2019 07:08:15 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:35466 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728671AbfKDMIO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Nov 2019 07:08:14 -0500
Received: by mail-lf1-f68.google.com with SMTP id y6so12062864lfj.2
        for <linux-usb@vger.kernel.org>; Mon, 04 Nov 2019 04:08:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ln57+MfnjfMbMEvkZfc9CxVzyzufDOKmZ4pyc0ojQr8=;
        b=msNwxNZsbFHL+p+GZ0vc7W4ZHwMT2Q/P7qMthe9PkdI8HTErVZIFV0Z1bO525WxcC6
         FQoKtejxtkTqfeOahWWr+m9LJ0SbRattGKwKrkU/Imj6q/RO3aZGs8AR7bJyVHEZMM0U
         i97QbFK4cou52Z7yUVK6mBsv++vSiJYwNddSA7C4Z3MQ5LM1rff0ZtP6w0bpiYxZ0yXN
         gZ+E3FNwgQjzGZw4rDqgOHk7FvxOLTrto9rFl+XotO0zss4E2YYvIj26Wy9Oo+oTs48d
         XAaN1igGU2q/oQo5zOskhBuLB8X8HlhcDKjM+a6a51DP/Abn0f3WqRIayPiyjZKRvsba
         BU/g==
X-Gm-Message-State: APjAAAVcFAWrS37HTbntAgcOhpxW2V9jT6UldvqHawloBKPYRSUaz1Gu
        gGNB7uoqJCyya8bxGfsnMFA=
X-Google-Smtp-Source: APXvYqzY3g7JzOqBsru8YiSk72Hhjz9esqyyo/CIm0F94MKVs76hXTW60VhLzzQoGc82FgAbC3AXgA==
X-Received: by 2002:a19:f608:: with SMTP id x8mr17430582lfe.112.1572869291714;
        Mon, 04 Nov 2019 04:08:11 -0800 (PST)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id r1sm7159335ljk.83.2019.11.04.04.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 04:08:10 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1iRb9W-0007wH-A5; Mon, 04 Nov 2019 13:08:10 +0100
Date:   Mon, 4 Nov 2019 13:08:10 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     Jonathan Olds <jontio@i4free.co.nz>,
        Michael Dreher <michael@5dot1.de>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: ch341: reimplement line-speed handling
Message-ID: <20191104120810.GH3657@localhost>
References: <20191101172410.20419-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191101172410.20419-1-johan@kernel.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 01, 2019 at 06:24:10PM +0100, Johan Hovold wrote:
> The current ch341 divisor algorithm was known to give inaccurate results
> for certain higher line speeds. Jonathan Olds <jontio@i4free.co.nz>
> investigated this, determined the basic equations used to derive the
> divisors and confirmed them experimentally [1].
> 
> The equations Jonathan used could be generalised further to:
> 
> 	baud = 48000000 / (2^(12 - 3 * ps - fact) * div), where
> 
> 		0 <= ps <= 3,
> 		0 <= fact <= 1,
> 		2 <= div <= 256 if fact = 0, or
> 		9 <= div <= 256 if fact = 1
> 
> which will also give better results for lower rates.
> 
> Notably the error is reduced for the following standard rates:
> 
> 	1152000	(4.0% instead of 15% error)
> 	 921600	(0.16% instead of -7.5% error)
> 	 576000	(-0.80% instead of -5.6% error)
> 	    200	(0.16% instead of -0.69% error)
> 	    134	(-0.05% instead of -0.63% error)
> 	    110	(0.03% instead of -0.44% error)
> 
> but also for many non-standard ones.
> 
> The current algorithm also suffered from rounding issues (e.g. 2950000
> was rounded to 2 Mbaud instead of 3 Mbaud resulting in a -32% instead of
> 1.7% error).
> 
> The new algorithm was inspired by the current vendor driver even if that
> one only handles two higher rates that require fact=1 by hard coding the
> corresponding divisors [2].
> 
> Michael Dreher <michael@5dot1.de> also did a similar generalisation of
> Jonathan's work and has published his results with a very good summary
> that provides further insights into how this device works [3].
> 
> [1] https://lkml.kernel.org/r/000001d51f34$bad6afd0$30840f70$@co.nz
> [2] http://www.wch.cn/download/CH341SER_LINUX_ZIP.html
> [3] https://github.com/nospam2000/ch341-baudrate-calculation
> 
> Reported-by: Jonathan Olds <jontio@i4free.co.nz>
> Tested-by: Jonathan Olds <jontio@i4free.co.nz>
> Cc: Michael Dreher <michael@5dot1.de>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/usb/serial/ch341.c | 97 +++++++++++++++++++++++++++++---------
>  1 file changed, 75 insertions(+), 22 deletions(-)

I've applied this one for 5.5 now (not 5.4 as I mistakingly said earlier).

Johan
