Return-Path: <SRS0=hNA8=SH=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A17ABC4360F
	for <linux-usb@archiver.kernel.org>; Fri,  5 Apr 2019 04:49:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6981921852
	for <linux-usb@archiver.kernel.org>; Fri,  5 Apr 2019 04:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1554439749;
	bh=zlVyvHhgo/xNqZYctBLwe3djsYyjGtEl7vzVGPFBrhc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=ZMg+FBLu8fzO8RVXDlZ7SJUBvALIUE37EGc73JN9JJlLhDNZv53mJ8nVzDdQksAOM
	 OTGvgqnkGB7wtzl1eZSWKRBpVAPm+A0JjRT07RYuIb8w0P0dQvFyRkXmq/2glMQm2W
	 G3aDncvGeLGhJgBjeH6sjMY1szU/6yF02dcxlbFc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726271AbfDEEtI (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 5 Apr 2019 00:49:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:60064 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725973AbfDEEtI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 5 Apr 2019 00:49:08 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 195342184B;
        Fri,  5 Apr 2019 04:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1554439747;
        bh=zlVyvHhgo/xNqZYctBLwe3djsYyjGtEl7vzVGPFBrhc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=y8niuydbGyztAHrsywvXV3VImUV+a7L2mRAYJW1A2aLRHOTHJMck2MbA3e+LYeFho
         bHWcSpk/Ok7tkpomq2+RojnGNuDaWHlf8Km7jWZejGAK1nRiBnVSu0ICMLNxsej8fY
         sDTmFHwpFllhbouxu1OTIF4CEwip5T70i8Po9+18=
Date:   Fri, 5 Apr 2019 06:49:04 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     John Travell <john@travell.uk.net>
Cc:     linux-usb@vger.kernel.org
Subject: Re: USB keyboard and mouse non responsive at login
Message-ID: <20190405044904.GA553@kroah.com>
References: <a8c6d4e9-29c5-73cc-ca9d-8c973a5876ac@travell.uk.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8c6d4e9-29c5-73cc-ca9d-8c973a5876ac@travell.uk.net>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Apr 04, 2019 at 10:16:36PM +0100, John Travell wrote:
> Summary: USB keyboard and mouse non responsive at login
> Product: Drivers
> Version: 2.5
> Kernel Version: 3.13.0-166-generic
> Kernel Version: 3.13.0-167-generic
> Kernel Version: 3.13.0-168-generic

3.13 was released back in January of 2014, if you are stuck on this old,
obsolete kernel version, please contact the company you are paying for
support for this, as they are the only ones that can provide this (and
you are paying for it, so use that!)

good luck,

greg k-h
