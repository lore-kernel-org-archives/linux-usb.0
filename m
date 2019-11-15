Return-Path: <SRS0=Ha91=ZH=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3268AC43141
	for <linux-usb@archiver.kernel.org>; Fri, 15 Nov 2019 10:18:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0E4102077B
	for <linux-usb@archiver.kernel.org>; Fri, 15 Nov 2019 10:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573813097;
	bh=uYNfVHWq4yLJeIR9yizT2SraXIuHLoSUTi/uCXss5dA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=FnYLVy2lwM76EBlGcEBbStVVIjaFMtkfHWU4ej8T8GwJouRuiQmUIRBUcWSk7fg/9
	 ZE4qiyqvJZsOU1KpIu/FnUOGd9cw5GeqvF3xnLdRuqJN3CuxxZNe1Nl2lwblM1u7bH
	 Y5VnBjujITp8Ov2PcY1g9e1DG3eW+REuAKP2icmc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727633AbfKOKSQ (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 15 Nov 2019 05:18:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:45098 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727627AbfKOKSP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 15 Nov 2019 05:18:15 -0500
Received: from localhost (unknown [104.132.150.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5D18D20748;
        Fri, 15 Nov 2019 10:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573813094;
        bh=uYNfVHWq4yLJeIR9yizT2SraXIuHLoSUTi/uCXss5dA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HrkKnjJ5x7zp9sC2jchThZe6aQ9ZAROBWRk6aD02NsMp+ObFPtLwxXd5tNZzefZps
         syH1ViGTC6QY8lqm/aJXqu6x82THbDkQWmbEUZqlHAcTT9Utj1DBGfwCWXDQpSuHke
         ui3OUFVivGJgdUG2j79ElFeWyKa/oOV6kDaMeAHU=
Date:   Fri, 15 Nov 2019 18:17:45 +0800
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB-serial updates for 5.5-rc1
Message-ID: <20191115101745.GA337025@kroah.com>
References: <20191115100109.GA20249@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191115100109.GA20249@localhost>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 15, 2019 at 11:01:09AM +0100, Johan Hovold wrote:
> The following changes since commit 4f5cafb5cb8471e54afdc9054d973535614f7675:
> 
>   Linux 5.4-rc3 (2019-10-13 16:37:36 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.5-rc1
> 
> for you to fetch changes up to c1a1f273d0825774c80896b8deb1c9ea1d0b91e3:

Pulled and pushed out, thanks.

greg k-h
