Return-Path: <SRS0=WwEB=DG=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BB67C47420
	for <linux-usb@archiver.kernel.org>; Tue, 29 Sep 2020 06:09:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DF5AA2158C
	for <linux-usb@archiver.kernel.org>; Tue, 29 Sep 2020 06:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601359774;
	bh=vato/ATkmRSyEajlKkDTPiR91f1ZuLn1H05fHRPJIXI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=yLCJOQ2L763rl2QRIBOQkGuZ5sXRdKveBWJrwTicfLoPYaxIQQgeEXDzS6c+21oI5
	 z2cOVZ1bhTMwDHspMDtH6/yblBZmN5ebPeVe0rVbjGwn+Ofu5bCEjZPl9f+2t/RAZH
	 ClmNQflU0EvrqhRBObBHeq4uTeDiTlt7Du7fFLUk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727650AbgI2GJb (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 29 Sep 2020 02:09:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:45356 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727646AbgI2GJa (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 29 Sep 2020 02:09:30 -0400
Received: from coco.lan (ip5f5ad5bc.dynamic.kabel-deutschland.de [95.90.213.188])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CD3EC20BED;
        Tue, 29 Sep 2020 06:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601359770;
        bh=vato/ATkmRSyEajlKkDTPiR91f1ZuLn1H05fHRPJIXI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=hsBBarug0eTLR0DdQoJPu/by5DwGDQC7SYYDTOD27s61Vy0BOQHwQz4j7Xt1hVIiC
         rbpE8SLADwz5cHcQlG2g6xcfSRRL9dU3l8QskPH/1ccyc0wzBtrn1GKhpny08jTL9v
         FuTA4Jv7iX7W2T9whs/rt7MUyUNDD6WAwstmUrhQ=
Date:   Tue, 29 Sep 2020 08:09:23 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Rob Herring <robh@kernel.org>, Felipe Balbi <balbi@kernel.org>
Cc:     Linuxarm <linuxarm@huawei.com>, mauro.chehab@huawei.com,
        John Stultz <john.stultz@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: document a new quirk for dwc3
Message-ID: <20200929080923.2a365748@coco.lan>
In-Reply-To: <CAL_JsqLucKWwgBVAoyXpm1mCD5-OvFj2pM_q2+tcyA+K9fCnKg@mail.gmail.com>
References: <cover.1599549364.git.mchehab+huawei@kernel.org>
        <cb821a8b5ef2d44ce32c8ce1d01c34b7afb70eb2.1599549364.git.mchehab+huawei@kernel.org>
        <20200915163814.GA2084568@bogus>
        <20200917091821.0de18caa@coco.lan>
        <CAL_JsqLucKWwgBVAoyXpm1mCD5-OvFj2pM_q2+tcyA+K9fCnKg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Ping.

Felipe,

Em Thu, 17 Sep 2020 08:47:48 -0600
Rob Herring <robh@kernel.org> escreveu:

> On Thu, Sep 17, 2020 at 1:18 AM Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> >

> > IMO, adding a new quirk is cleaner, and adopts the same solution
> > that it is currently used by other drivers with Designware IP.  
> 
> We already have a bunch of quirk properties. What's one more, sigh. So
> if that's what you want, fine.
> 
> Rob

It sounds that this is the last piece for us to have everything
needed at the drivers in order to provide upstream support for
the Hikey 970 USB hub.

Could you please merge it?

Thanks,
Mauro
