Return-Path: <SRS0=Pd3P=TD=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2057CC43219
	for <linux-usb@archiver.kernel.org>; Fri,  3 May 2019 16:07:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E4E462075E
	for <linux-usb@archiver.kernel.org>; Fri,  3 May 2019 16:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556899667;
	bh=puMEKMCb9Kmic5e0boFgMiUUCcJVbbz6vkurg+Avslc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=rMKMdYfH9IYmnVdYVaJR13fMaOdElMowJ9ogITT1U6yyaHsViSiZD0tM41oMhVBeA
	 oXVZR+anjyvbNI7q7Kr1/6dwC0NLKCrlz0v2oK7agcVcukxqnXKK174wwOFMRqYHrG
	 +oG/If7hxfZhAbzqWxGzeNNCa4t0tXhMkAznQOK0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727460AbfECQHq (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 3 May 2019 12:07:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:43086 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726720AbfECQHp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 3 May 2019 12:07:45 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CFEAD2087F;
        Fri,  3 May 2019 16:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556899665;
        bh=puMEKMCb9Kmic5e0boFgMiUUCcJVbbz6vkurg+Avslc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TAdAZf4N96wwY500j+hwR6+OuELsNzc0sn9UJeChzpywEQjLJhypwGbJgEMIFfrw4
         0LrmZZifPJ2od36BcLiDTOCNYgP+j6sVat59TLkejtLb2GFPUZXgL1tqDPlCSa9VTR
         dEtfQfbj7+CtuQ9Pfu9g2kTfJHcNZmjSkLtSThC0=
Date:   Fri, 3 May 2019 18:06:01 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Felipe Balbi <felipe.balbi@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB changes for v5.2 merge window
Message-ID: <20190503160601.GA32472@kroah.com>
References: <87pnozq4pl.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pnozq4pl.fsf@linux.intel.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, May 03, 2019 at 12:15:18PM +0300, Felipe Balbi wrote:
> 
> Hi Greg,
> 
> here's my pull request for the next merge window. A bit later than
> usuall this time around, due to internal high-priority tasks. Sorry
> about that.
> 
> Let me know if you need anything to be changed.
> 
> cheers
> 
>  _______________ 
> < Busy as a bee >
>  --------------- 
>         \   ^__^
>          \  (oo)\_______
>             (__)\       )\/\
>                 ||----w |
>                 ||     ||
> 
> The following changes since commit 085b7755808aa11f78ab9377257e1dad2e6fa4bb:
> 
>   Linux 5.1-rc6 (2019-04-21 10:45:57 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git tags/usb-for-v5.2

Pulled and pushed out, thanks.

greg k-h
