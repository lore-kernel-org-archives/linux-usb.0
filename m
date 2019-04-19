Return-Path: <SRS0=lmIm=SV=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C879CC282DA
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 18:36:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 973E620449
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 18:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555698961;
	bh=cpVn84UcoPjKKmwu4Ib+2u6BpDv2eMEv69X8EQZzRJY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=itrjY8hF18nB1Y4NMtDOCrewixC2gDHTvhnHGYFindiZZxRPjKFnnDL/g6JpMVd7F
	 Kdj/kUsAYk72hhEgmN9C1dcfOpIMSeHJDwhELRH0tRXD37Bx4q+/3Eyhlcwb3paEQR
	 uXqgJUyUSit3PIENx0akGmvxoMjt2jVKD1IWj17E=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728073AbfDSSf4 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 19 Apr 2019 14:35:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:53882 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727491AbfDSS3P (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 19 Apr 2019 14:29:15 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1414C2186A;
        Fri, 19 Apr 2019 08:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555662458;
        bh=cpVn84UcoPjKKmwu4Ib+2u6BpDv2eMEv69X8EQZzRJY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dl6q8/LDoWNUQ2k+TVnMysCT3K5w1D+r6WQfPs8AecKeo+Iy1qktJbDoYhkz1GN0S
         j8OlcjtaOn9CNb9A+QZFLf32nZxv/r/GXvyGJxUA+Uer/lYdWYygZPlJqzTf6cdT8Y
         V63QpAtG0W5TPbpRBDolmT1QqCbjY/hGWW1uHtYM=
Date:   Fri, 19 Apr 2019 10:27:33 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/2] USB: serial: digi_acceleport: clean up modem-control
 handling
Message-ID: <20190419082733.GA28648@kroah.com>
References: <20190418162020.23566-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <20190418162020.23566-1-johan@kernel.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190419082733.553MZQuSyOIof3CY3JBUDVNhqQLShUO8INr2pGw6enY@z>

On Thu, Apr 18, 2019 at 06:20:19PM +0200, Johan Hovold wrote:
> Clean up modem-control handling somewhat by adding missing whitespace
> around operators and splitting a long statement in two.
> 
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/usb/serial/digi_acceleport.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
