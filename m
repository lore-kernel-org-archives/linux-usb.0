Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52EFDC43460
	for <linux-usb@archiver.kernel.org>; Thu, 15 Apr 2021 10:11:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 27FB76109F
	for <linux-usb@archiver.kernel.org>; Thu, 15 Apr 2021 10:11:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232431AbhDOKL0 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 15 Apr 2021 06:11:26 -0400
Received: from mx2.suse.de ([195.135.220.15]:45500 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232342AbhDOKLZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 15 Apr 2021 06:11:25 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1618481461; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=h+WiULKinmurJkhof433BxwTJk0d0vJ05DazTJmxqG8=;
        b=BEW7sNskb1JkhT90fckI2/7wMhoFZMaBwPRayq3QqwVF163x73w5foxls5/G80uTSY7+ON
        gBEGBcZy2Jsm6jhOVfwREur7k2j8KMZ2tpu+jytVypktqEOCLXKqOdJUmXLFx3RQ09xORR
        PikG9snw/SSL4PwmkIsB1tPoc8qIwDo=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id B3F54B1F3;
        Thu, 15 Apr 2021 10:11:01 +0000 (UTC)
Message-ID: <2223fc29fdbd5a37494454d95952c1b9f8373f3e.camel@suse.com>
Subject: Re: rtl8152 / power management kernel hang
From:   Oliver Neukum <oneukum@suse.com>
To:     Thiago Macieira <thiago.macieira@intel.com>,
        netdev@vger.kernel.org, Hayes Wang <hayeswang@realtek.com>
Cc:     linux-usb@vger.kernel.org
Date:   Thu, 15 Apr 2021 12:10:58 +0200
In-Reply-To: <7261663.lHksN3My1W@tjmaciei-mobl1>
References: <7261663.lHksN3My1W@tjmaciei-mobl1>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Dienstag, den 13.04.2021, 13:57 -0700 schrieb Thiago Macieira:
> This has been happening for at least a year but I've only now decided to 
> report it.
> 
> Kernel 5.11.11
> Symptom: 
> - partial kernel freeze
> - some kernel tasks end up in state D and never leave it
>     (notably ipv6_addrconf)
> - problem propagates as other userspace processes try to use
>   networking, such as /sbin/ip trying to set the device down
> - normal reboot impossible, Alt+SysRq,B is necessary
> 
> Steps to reproduce: use device for a few hours. I'm using it in a bonded 
> connection, but I don't think that's a required condition.
> 
> Workaround: disable power management on the device via PowerTop before the 
> problem occurs.

Hi,

is this device part of a docking station?

	Regards
		Oliver


