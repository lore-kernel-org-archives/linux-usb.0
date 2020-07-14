Return-Path: <SRS0=da/P=AZ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B88CAC433E1
	for <linux-usb@archiver.kernel.org>; Tue, 14 Jul 2020 09:55:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 87CA821D7D
	for <linux-usb@archiver.kernel.org>; Tue, 14 Jul 2020 09:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594720510;
	bh=dWb45m/0pW6rJTpCs/g4i2oLwnwIPcjvXD4dh58rL90=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=IlfTN5lGykUyvJW7eMvs+DFBnmuXn2PDGHrpRHO02OOkgo0EP9eXmO9oLrnm6kTGl
	 0WFKNRjVrQ3KGCyKS/B1FEL1bL16Eg6o2x/+61CYhRNfxN7MeVpELn6TyGvPBvPEL8
	 HLJBeyqeS+w6CQVcsCm3e22QSGqiEZbqW0w635b4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726062AbgGNJzK (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 14 Jul 2020 05:55:10 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:41097 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725884AbgGNJzJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Jul 2020 05:55:09 -0400
Received: by mail-lj1-f195.google.com with SMTP id z24so21681969ljn.8
        for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2020 02:55:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ATbRFY7wq3JIvSw+NAGCr4ieI+/LXdrYzhxoOnZ1uZ4=;
        b=jhgiX12Ti7XYm3DnQ0iLNro17KCgp1DNNgxadiFpmxujuxUxZ5K4hVi6rFA72cuMBO
         /S4LtaMcQJve2Smx+sNB5dm3JFKgaPzNa9Vm02ZpNIUkZloFSyYkTj+xfDGZeGF48v4d
         iqsF+gzdUblKPaOQpNz8V274BKKRAMY128VcvSwheQReJHbLGyIJFAq3QozwryrRVWfF
         XtIGEGtZ7qcaFYd7xYVB6jKMMpmwwIKnytRx3KHKOoNd98cscc4hyX57tZuJRHKRn9lw
         praw9crwlXQczr0Fm3RZaY5ckbd3O2bDE+3945JoKvMGO0FGp1CoUodsgRc09MKu6vzk
         DWeQ==
X-Gm-Message-State: AOAM530BdcpzPnTqSnb+DFr4Z4aGJRebf15Gr+zTwsqGetEARchdXigU
        6rSSOp2EiWGQe8ZcbMHwCZ6OWxMIYnI=
X-Google-Smtp-Source: ABdhPJw9B8UG6p/gUmXVPFT03aCqk1CU8gy+JWjwaUWFR3ktwvA9Qe8EsN5WCY2d60WktBpody4cLw==
X-Received: by 2002:a05:651c:550:: with SMTP id q16mr1912801ljp.188.1594720507134;
        Tue, 14 Jul 2020 02:55:07 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id e10sm4526822ljb.118.2020.07.14.02.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 02:55:06 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1jvHef-0006Tv-BU; Tue, 14 Jul 2020 11:55:17 +0200
Date:   Tue, 14 Jul 2020 11:55:17 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
        =?utf-8?B?SmFyb23DrXIgxaBrb3JwaWw=?= <Jerry@jrr.cz>
Subject: Re: [PATCH 0/5] USB: serial: cp210x: add support for line-status
 events
Message-ID: <20200714095517.GZ3453@localhost>
References: <20200713105517.27796-1-johan@kernel.org>
 <20200713134129.GA3175228@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200713134129.GA3175228@kroah.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 13, 2020 at 03:41:29PM +0200, Greg Kroah-Hartman wrote:
> On Mon, Jul 13, 2020 at 12:55:12PM +0200, Johan Hovold wrote:
> > This series add supports for line-status events that specifically can be
> > used to detect parity errors.
> > 
> > The implementation relies on the device's event-insertion mode, which
> > can also be used to detect line-breaks and modem status changes. But as
> > this doesn't seem to work as expected on CP2102, support has been left
> > unimplemented for now.
> > 
> > Included are also a couple of cleanups.
> > 
> > Johan
> > 
> > Changes since RFC [1]:
> >  - drop sysrq support which relies on break detection
> >  - use 0xec (instead of 0xff) as escape character
> > 
> > [1] https://lore.kernel.org/r/20200703150104.GE3453@localhost
> 
> 
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Thanks. Now applied.

Johan
