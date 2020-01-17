Return-Path: <SRS0=zrGg=3G=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CF28C33C9E
	for <linux-usb@archiver.kernel.org>; Fri, 17 Jan 2020 18:43:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D77792082F
	for <linux-usb@archiver.kernel.org>; Fri, 17 Jan 2020 18:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579286628;
	bh=6/YCoAh6Ww+EHZXe/FNPyJSJVFJcwAWc0DXeLaH9cOU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=EoiRWU8wZI1ssDs8Gjj4y9uqplDQ8UgahQIVUi4KqqNhiBxT3b2t1jT2SR7CmMM7g
	 RbnNc1nj8zUr7DtmRxqPbO76wbxQBa9VRtt9+ffboq8Uw4fzv2UqPIE1CCqMWKP+Iz
	 GJQ3cajv5wUqv9UNQ1shBsc1PZiGTCST5s8+t0sw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729359AbgAQSns (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 17 Jan 2020 13:43:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:35842 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729325AbgAQSns (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 17 Jan 2020 13:43:48 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 500702082F;
        Fri, 17 Jan 2020 18:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579286627;
        bh=6/YCoAh6Ww+EHZXe/FNPyJSJVFJcwAWc0DXeLaH9cOU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jY9KOUSfLwks3UmPjSuMa5DRZX8VoscAEQvl2PRHIkVA7y5VoSbvNbtHmzJU6EX3S
         MoV5jLeskmZTDF/GEiVlvXJcCdHn+EMXU7j5YrWC/Bzs1fDRidutMbhcPZ3PoHOBpl
         6PiBEGaK7xVnmtscR4oJ+VVhpqYA+4RvUNkPRfNY=
Date:   Fri, 17 Jan 2020 19:43:39 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB-serial fixes for 5.5-rc7
Message-ID: <20200117184339.GC1969121@kroah.com>
References: <20200117171213.GA18463@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200117171213.GA18463@localhost>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jan 17, 2020 at 06:12:13PM +0100, Johan Hovold wrote:
> The following changes since commit b3a987b0264d3ddbb24293ebff10eddfc472f653:
> 
>   Linux 5.5-rc6 (2020-01-12 16:55:08 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.5-rc7

Pulled and pushed out, thanks.

greg k-h
