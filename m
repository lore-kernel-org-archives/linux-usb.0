Return-Path: <SRS0=7cGN=S4=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD02BC43219
	for <linux-usb@archiver.kernel.org>; Fri, 26 Apr 2019 04:55:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A6AF0206C1
	for <linux-usb@archiver.kernel.org>; Fri, 26 Apr 2019 04:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556254505;
	bh=FlDZqHA6akN44poFliGYPn8Gm1itz/KLh5Lfkar6HHo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=WmaHA3E5cb8An9nSGOswswyz2IrzoN4nWv71+f26lbawFeiTaIWFOCj0BKg82wSYg
	 hoXEXkBnxEgiZ0Xz9QC2v4ROudPa3qP5WJR3GQPQGXZoeMixOeSDTQ0Xby15NiRuMn
	 YNRsv/cQXb24XbS5Y6uh43Sne6pt5M+SxLg3CqdY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbfDZEzE (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 26 Apr 2019 00:55:04 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40195 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725871AbfDZEzE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Apr 2019 00:55:04 -0400
Received: by mail-lj1-f195.google.com with SMTP id t10so629732ljg.7
        for <linux-usb@vger.kernel.org>; Thu, 25 Apr 2019 21:55:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pja+DBPfqa/5/N/eZzWdo8C82KBYYrKWIVJsTskf1MA=;
        b=e2e6QEW0cPujMbZ/INv7/KYKFmD245SkqVLvlksMfEVZ0nQ3iZsdmUKXpb4xu38myF
         BOiQrAQiJ+vXE/flIuqd/qQvgiZW/Zi8PxpuWIDXH2NS43j5DtmcV4elk8+1Mgr7D1N+
         yvFLmOPUlS4QzkivEOJzkog8ZrKpLrSPlJ+idFoFSiwWhAkfbWeCCoSSzJI6CASXWr5b
         9v8xTttcsGEJsx76pNMSHlsyLZPLWQ6PnSHRap1bARmIW4ZTubW+3IMkCCPVjFAQXwjQ
         lkFVWizmdfQNYf9Wvy3Zj73tl/c6rn20YsjUhc2xa2TWI7wvv+JSREoHkjOoRW8idl7k
         1fbA==
X-Gm-Message-State: APjAAAWGBodnPTvdJjwmOPzK+anIBTdwTWk+LTUb0xRz99qMk/OK/grc
        0m9WAvzRjcWoiySHM/H58gvtxrPk
X-Google-Smtp-Source: APXvYqyERuzSK6f5o4ZSF81+UmNEUhWyDOx5drSlsnN/M0+zevCdpDWt5KPmH/MB62j2WffvmyPu8w==
X-Received: by 2002:a05:651c:14b:: with SMTP id c11mr23234955ljd.185.1556254502171;
        Thu, 25 Apr 2019 21:55:02 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id z2sm1320458lji.77.2019.04.25.21.55.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Apr 2019 21:55:01 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.91)
        (envelope-from <johan@kernel.org>)
        id 1hJst2-0003En-AN; Fri, 26 Apr 2019 06:55:00 +0200
Date:   Fri, 26 Apr 2019 06:55:00 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Johan Hovold <johan@kernel.org>, Oliver Neukum <oneukum@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/5] USB: fix tty unthrottle races
Message-ID: <20190426045500.GA12280@localhost>
References: <20190425160540.10036-1-johan@kernel.org>
 <Pine.LNX.4.44L0.1904251655590.1292-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1904251655590.1292-100000@iolanthe.rowland.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Apr 25, 2019 at 04:58:20PM -0400, Alan Stern wrote:
> On Thu, 25 Apr 2019, Johan Hovold wrote:
> 
> > This series fixes a couple of long-standing issues in USB serial and
> > cdc-acm which essentially share the same implementation.
> > 
> > As noted by Oliver a few years back, read-urb completion can race with
> > unthrottle() running on another CPU and this can potentially lead to
> > memory corruption. This particular bug in cdc-acm was unfortunately
> > reintroduced a year later.
> > 
> > There's also a second race due to missing memory barriers which could
> > theoretically lead to the port staying throttled until reopened on
> > weakly ordered systems. A second set of memory barriers should address
> > that.
> > 
> > I would appreciate your keen eyes on this one to make sure I got the
> > barriers right.
> > 
> > I noticed there's some on-going discussion about the atomic memory
> > barriers that Alan's involved in, and I'll try to catch up on his
> > data-race work as well. I'm still a little concerned about whether the
> > smp_mb__before_atomic() is sufficient to prevent the compiler from
> > messing things up without adding READ_ONCE().
> 
> I think your changes in patches 1 and 4 are correct.  Regardless of the
> issues still undergoing discussion elsewhere, smp_mb__before_atomic()
> should cause both the compiler and the CPU to order every preceding
> operation (READ_ONCE or not) before the atomic op.

Ok, thanks for taking a look!

Johan
