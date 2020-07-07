Return-Path: <SRS0=ACcI=AS=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 733A2C433E0
	for <linux-usb@archiver.kernel.org>; Tue,  7 Jul 2020 15:17:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4818020663
	for <linux-usb@archiver.kernel.org>; Tue,  7 Jul 2020 15:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594135063;
	bh=1cpFN4w2qvFtaA18mFQLUYNIjHUY3wCdn0G4iz1AI3A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=ayyqCe4S+L7xjr3uLljOQ2xAnItUvc9s6Sxzz8eh2cgdi70HTgwDzgGIBEqejjjcb
	 eZ+Kw7+wHvFe9+Ij4UDrlzPmJkydn/X8rCi5E7pDnt3Ey1677y2akpV1gv8owMwG+m
	 vk15a7qVxBZM88G8RYC6E4kvUJl4T2OrAbDBec9s=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729011AbgGGPQd (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 7 Jul 2020 11:16:33 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:40408 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727793AbgGGPQ2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Jul 2020 11:16:28 -0400
Received: by mail-lj1-f193.google.com with SMTP id j11so1607866ljo.7
        for <linux-usb@vger.kernel.org>; Tue, 07 Jul 2020 08:16:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=sbNUy/pYmWizkuHMmgvAjN7GA5oVDSpsZn1jtB3HC2g=;
        b=p3hEaby/uOTePjbeMk9N9uw8yiGaT4RZBvDjGgkTNOqlsRo+hslZwRkA9nfBdW5R1s
         hc6d7UsDC0pxEUBBpZPT8O56vzYDZ3nFRM+yX54U+LmA14OwfbhR5+NWsozCkcnswCkh
         76CBTp6+44SmBmo8EV9RcIXYvzlfpmWXw+uq+TL+nwUJrn8AlSQGERtR3YQHA77lf/qf
         0omAbC1/nGBQPg8hePzSQt7gNSvd+5egJxxKmTEUFdhJl07vV6uY/AAQ5WYfzXIXrxpT
         uOXdwMt0xPZkOt4fkwYC0JyXIoT3PjPAzShU7PGRPfZbRnJQcWMu2jGk8jylQOVHNIx8
         2iVQ==
X-Gm-Message-State: AOAM5330yChsWiNy8eXd6ob7gcIQVmBZlb6VuIPixEPZEiQRSJxDWJFN
        xDHSKPcVVp3ofNXE13r6JSYX3WcAwIo=
X-Google-Smtp-Source: ABdhPJxQ9Xb1c0A4x8UAfGSdI0ZqmvvvkgTkr/0I3y4whTdIEmSQg2GxdobmqtwFiB8J+7xx1W+vCA==
X-Received: by 2002:a2e:574b:: with SMTP id r11mr19381503ljd.417.1594134986360;
        Tue, 07 Jul 2020 08:16:26 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id b26sm256227lji.36.2020.07.07.08.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 08:16:25 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1jspKY-0007op-MG; Tue, 07 Jul 2020 17:16:22 +0200
Date:   Tue, 7 Jul 2020 17:16:22 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Frank =?iso-8859-1?Q?Sch=E4fer?= <fschaefer.oss@googlemail.com>
Cc:     Johan Hovold <johan@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: read() from removed usb-serial device
Message-ID: <20200707151622.GK3453@localhost>
References: <4f43f7ac-33ea-df67-f623-a7edc3d14c4c@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4f43f7ac-33ea-df67-f623-a7edc3d14c4c@googlemail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 07, 2020 at 04:49:31PM +0200, Frank Schäfer wrote:
> Hi,
> 
> I recently noticed that read() from a usb-serial device does not fail 
> after the device got removed.
> Is this really the correct/expected behavior or a bug ?
> 
> I would expect it to return -1 and set an appropriate errno, but it 
> returns 0 (no error, no bytes read) instead.
> 
> According to the glibc developers "glibc just calls into the kernel and 
> reports back whatever it receives from there."

Yeah, this is the expected behaviour for a hung up tty (see poll(2) or
the POSIX spec).

Johan
