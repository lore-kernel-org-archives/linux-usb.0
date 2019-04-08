Return-Path: <SRS0=iu7A=SK=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,T_DKIMWL_WL_HIGH,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 877A8C10F13
	for <linux-usb@archiver.kernel.org>; Mon,  8 Apr 2019 13:12:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 596AC2147A
	for <linux-usb@archiver.kernel.org>; Mon,  8 Apr 2019 13:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1554729168;
	bh=nJBbtsN/cpKD2DenPGFLGd3fGM8ebukyh0M/xQp7K6M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=XDOQYGRkWxjj3Zmm4emS6qsMiMoknAC9p2HwwFGl/PjQPoyNLYRH8mfOxDzSZ14UJ
	 9qhL5eVkB7imQH+xu+/+q3+MwVBPjXthR1BLHU9BrbU4HaJoI+FfXenmlcjXgGAM0X
	 by07i90avWgqbRBbvQ3VcC/Mkoce+8ajURAqN+Ck=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726530AbfDHNMr (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 8 Apr 2019 09:12:47 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:33978 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbfDHNMr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 8 Apr 2019 09:12:47 -0400
Received: by mail-lj1-f194.google.com with SMTP id j89so11226706ljb.1;
        Mon, 08 Apr 2019 06:12:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Am71RulpTFJZ5pi1WTVijVtGKSEt335ICjoqGLB21Qg=;
        b=oW6deHz73qpvD9QYjvxXdweVRzmZ+L8ii0to+HLaxkVxyxO9ENH6AGLYvNq6U63mdC
         e0cEYWxiyDygqJLMc4SVJNRHM4335Ph0cVlv3OVLJYpMLjeWB1/02EtwT30a+DCHtw9t
         JuQi5Tub2k31IAJhgPmlh9yrjtJGCwUP3YHhBTIWKuucFa5LeQTsjTqvgnf6qzodtzND
         4PdAEOevC9PajmScHQ3l6XZK62wJNRPrvBNeO9UfaL+hMKq5v9e05Qus1MZ4xpdJ5qfc
         pRCKG/J69f92C9dIeTxsEqrTTbFOruYFMWAp/sZ444edqppj4e0+u/7/OQUGqDswrur5
         kX9A==
X-Gm-Message-State: APjAAAUb5qOiUnXAMB0Ufn26bh+4y/RWpmSqf9XZfG+1PkV6hPYoUWUr
        VU9rx9VM6+GGPMC2SJBKUNw=
X-Google-Smtp-Source: APXvYqwbWuahmKd5oNZKpZ6QPXJ3qoJvzs8Ho69vZliTOoAJU1zvrsOs80x7mRYxTRBXhsEvNrn8dA==
X-Received: by 2002:a2e:420c:: with SMTP id p12mr16070936lja.1.1554729164911;
        Mon, 08 Apr 2019 06:12:44 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id d3sm6281038ljc.15.2019.04.08.06.12.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Apr 2019 06:12:43 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.91)
        (envelope-from <johan@kernel.org>)
        id 1hDU4r-0002if-CX; Mon, 08 Apr 2019 15:12:45 +0200
Date:   Mon, 8 Apr 2019 15:12:45 +0200
From:   Johan Hovold <johan@kernel.org>
To:     "Ramachandran Srinivasan (BRT-SG)" <srinivasan.r@brtchip.com>
Cc:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Deferred URB submission for timesharing the DMA channels
 of DWC_OTG host controller in Raspberry PI
Message-ID: <20190408131245.GC24108@localhost>
References: <1554724399-2972-1-git-send-email-srinivasan.r@brtchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <1554724399-2972-1-git-send-email-srinivasan.r@brtchip.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190408131245.WdlG__nCkl9NRHrHFVNWI0vifGs_bFgr7SuWWh0YeLg@z>

On Mon, Apr 08, 2019 at 11:54:00AM +0000, Ramachandran Srinivasan (BRT-SG) wrote:

Make sure to always provide a proper commit message.

> Signed-off-by: Srinivasan R <srinivasan.r@brtchip.com>
> ---
>  drivers/usb/serial/ftdi_sio.c | 153 +++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 152 insertions(+), 1 deletion(-)

Your patch has been been (whitespace) corrupted and is barely readable.
I have no idea you're trying to here.

Johan
