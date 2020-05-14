Return-Path: <SRS0=M0dr=64=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70F4FC433E0
	for <linux-usb@archiver.kernel.org>; Thu, 14 May 2020 14:02:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4602B205CB
	for <linux-usb@archiver.kernel.org>; Thu, 14 May 2020 14:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589464942;
	bh=i7rwsJmhhnKdCIlKZ0fqMiMUBczaEbzoOwO3vQphRZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=HNeB74YdIYyy5ihBdHaFGwCT4pqVFjrRaunT9gXY/9KrJYHMHFDAnv+c9eKqlTzI0
	 9PHXbJ4QjbXp0Yqw7QjkyYoBGvBW0wWYkbfEu23+7xhJslGKunMqrPxoOb/AtT7/8Z
	 aGIth2WoRUYUe8zMt4pWrnkt0T65hBF9dnJszu24=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726087AbgENOCV (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 14 May 2020 10:02:21 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:40534 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbgENOCV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 May 2020 10:02:21 -0400
Received: by mail-lf1-f68.google.com with SMTP id h188so1984555lfd.7
        for <linux-usb@vger.kernel.org>; Thu, 14 May 2020 07:02:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/EkCQZ9Cadty0jT52rHmIbAJoEa67VuDBzIkXpXwKmI=;
        b=kHGh5LcEBn0xXFXEB1j9ALk57d8vWuTH1Zmiwl8f0mEkgDs5ZtG9icQiljnxfm25SC
         ni7PkL5OKNKtnt8hR534jj6cfErB2NcOdOYlcYFjSGeUUzwvNRMBX/ipwwG6Ls4zvoOQ
         c41xkhWF7p3vNqBFeDaqVyM8r+F8/cuE9hgZUKzjjTUuyTcwpuGgxZh1dAlzM9j0Sn3y
         hJ5/k/mAv3tbo8qjWOldWnE2YG1Uyg+ChPwDYQMhlomo0UuN8zKiNaTjybZX9F1mjTT9
         ww5vPluq6IX3aY6533jovCchKSMHFsT0NYxV/H7IQo9T3MuslmR9AGKJVpYKRsbfTr8U
         eAhg==
X-Gm-Message-State: AOAM5335EmQWQ/iNDuvdIX5YqFPKjRFGCGOEFQuDHGTundPj+8SV8zTV
        9toa5RX8XixDj0/GaClHyaNEoWiL
X-Google-Smtp-Source: ABdhPJzFE65upKRuxHm2sCd2elrRqs2jJnagwTC8BhoWo2q5ffo+6TSvMMsc0g3bb1rb+NSgG0wsrw==
X-Received: by 2002:ac2:58fb:: with SMTP id v27mr1787480lfo.116.1589464939416;
        Thu, 14 May 2020 07:02:19 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id v4sm1556075ljj.104.2020.05.14.07.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 07:02:17 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1jZERI-0006aO-VQ; Thu, 14 May 2020 16:02:21 +0200
Date:   Thu, 14 May 2020 16:02:20 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Michael Hanselmann <public@hansmi.ch>
Cc:     linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Michael Dreher <michael@5dot1.de>,
        Jonathan Olds <jontio@i4free.co.nz>
Subject: Re: [PATCH v2 0/6] USB: serial: ch341: Add support for limited chips
 (was: Add support for HL340 devices)
Message-ID: <20200514140220.GC25962@localhost>
References: <cover.1585697281.git.public@hansmi.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1585697281.git.public@hansmi.ch>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Michel,

and sorry about the late feedback on this one.

On Tue, Mar 31, 2020 at 11:37:16PM +0000, Michael Hanselmann wrote:
> A subset of CH341 devices does not support all features, namely the
> prescaler is limited to a reduced precision and there is no support for
> sending a RS232 break condition.
> 
> These devices can usually be identified by an imprint of "340" on the
> turquoise-colored plug. They're also sometimes called "HL340", but not
> all such devices are affected.
> 
> This series takes multiple steps to support the limited chips:
> 
> * Remove special cases from clock prescaler computation
> * Detect limited devices by trying to read a register related to sending
>   a break condition
> * Amend clock prescaler computation to only use working values on
>   limited chips
> * Simulate an RS232 break condition by temporarily lowering the baud
>   rate and sending a NUL byte

Good summary, and generally clean overall. I know you replied to my
earlier comments mentioning what you had done for v2, but its good
always include a short changelog here when resending a series.

> Michael Hanselmann (6):
>   USB: serial: ch341: Reduce special cases in clock calculation
>   USB: serial: ch341: Add basis for quirk detection
>   USB: serial: ch341: Limit prescaler on quirky chips
>   USB: serial: ch341: Name prescaler, divisor registers
>   USB: serial: ch341: Compute minimum baud rate
>   USB: serial: ch341: Simulate break condition if not supported
> 
>  drivers/usb/serial/ch341.c | 294 ++++++++++++++++++++++++++++++-------
>  1 file changed, 244 insertions(+), 50 deletions(-)

Johan
