Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CDABC4338F
	for <linux-usb@archiver.kernel.org>; Fri, 13 Aug 2021 23:05:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E83B3610EA
	for <linux-usb@archiver.kernel.org>; Fri, 13 Aug 2021 23:05:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235570AbhHMXGR (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 13 Aug 2021 19:06:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:60284 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235531AbhHMXGR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 13 Aug 2021 19:06:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 87E0760FC4;
        Fri, 13 Aug 2021 23:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628895949;
        bh=Nvnqwbo2C0GwFP06RyXvSRJloiNuqcOeuW6rpl8E3xk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=i3jlKOvAMBV1/lniA4l/cL70gWPMpCKsY8NJ4slDgPIe3fkPmwdk6GV5vDUQlNWYy
         NuyDLjsU2DKFEFr86gpL7SWIbXHTUc2ENJtHZ82uV5r1+IhfEPLVxIqFWThFSUHX+Z
         pQCpVRpFcRuImgjnSrBe+jFNG45QmKRi48qM461WPTbuoAFFWAAs0o7yuzSI0wqcKN
         LBEaDAioQLZY8avmgcAMvKU0PUkGD6bKCLNj1BERhHny02elIRdRNX3F61gBgC0JUp
         WxWawAxuZ33mtdEKThgQvXgNxvGKZBcNf/g4bZzOxxP77bvQ5kqcnvREK2as6rbVxg
         vwgDuDuf0p8xw==
Date:   Fri, 13 Aug 2021 16:05:48 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Pavel Skripkin <paskripkin@gmail.com>
Cc:     davem@davemloft.net, gregkh@linuxfoundation.org,
        dan.carpenter@oracle.com, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: hso: drop unused function argument
Message-ID: <20210813160548.739239a3@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20210811171321.18317-1-paskripkin@gmail.com>
References: <20210811171321.18317-1-paskripkin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 11 Aug 2021 20:13:21 +0300 Pavel Skripkin wrote:
> _hso_serial_set_termios() doesn't use it's second argument, so it can be
> dropped.
> 
> Fixes: ac9720c37e87 ("tty: Fix the HSO termios handling a bit")

This one is not a bug so no fixes tag needed :) applied, thanks
