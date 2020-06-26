Return-Path: <SRS0=mkWF=AH=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAF17C433DF
	for <linux-usb@archiver.kernel.org>; Fri, 26 Jun 2020 14:50:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AEBA920775
	for <linux-usb@archiver.kernel.org>; Fri, 26 Jun 2020 14:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1593183026;
	bh=lDMCZOqsaNH1ZZut2ttZ7IT1JW9Lj/GA2YobiU9Fvjc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=ZvqTEdyuUWbJJlJskUtGFm085ICSj4jIMz92DXaKsDEZfG925DAcXvsvmVVttMGSK
	 ZJ7QQznG/1RYmUCihHtbfVmNk2d9jkJWdCPAzFDIoVmwy7N4gSN351ritR44J0ltPT
	 /u7AGLYZqoWGMeyc39qwWKtDhI1ZP1Tkqr/XbNr0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727869AbgFZOuZ (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 26 Jun 2020 10:50:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:43042 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726282AbgFZOuZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 26 Jun 2020 10:50:25 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F35D22053B;
        Fri, 26 Jun 2020 14:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593183025;
        bh=lDMCZOqsaNH1ZZut2ttZ7IT1JW9Lj/GA2YobiU9Fvjc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BTlMK1DojMtYifzRdP0DQ3gEj0FBy9n2AYj1uDxEPhq9trfO1lZYuKHkk3C/TzduG
         TdipIhgh/n9SRkbLQdRayg1nxTMG8YZy3q0hkQI/IMNz8/z1PQKZQr/mVNMIGZ3/yo
         JbfUw9KYy0Z07uCrHmx8yru53ioi0L8lTWQCHeqY=
Date:   Fri, 26 Jun 2020 16:50:20 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB: fixes for v5.8-rc
Message-ID: <20200626145020.GC1338883@kroah.com>
References: <87bll65njd.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bll65njd.fsf@kernel.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 26, 2020 at 09:49:58AM +0300, Felipe Balbi wrote:
> 
> Hi Greg,
> 
> here's the first set of fixes for the current -rc cycle. Patches have
> been soaking for a while now.
> 
> Let me know if you want anything to be changed.
> 
> cheers
> 
> PS: your branch is in -rc1, mine is in -rc2. Would you prefer that I
> rebase or can you merge -rc2 on your usb-linus?

I'll merge -rc2 into it now, thanks...

