Return-Path: <SRS0=9UCG=UR=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73E3AC31E5B
	for <linux-usb@archiver.kernel.org>; Tue, 18 Jun 2019 15:27:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3CC1C20B1F
	for <linux-usb@archiver.kernel.org>; Tue, 18 Jun 2019 15:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1560871621;
	bh=SSnKVKJU0sLRhqBq4rWiHjbloE8WCZeYuIUyrvX0IuQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=kAbcV8Jvk2mM5667gF3ytfmizUZcke+PfBdoO41K5VwtOEJF48RvupChnh0nM7128
	 3HdoFPjkkmnqnnxVn1y0v9kzE97x8L4ysKGU3Sfk/H/yRNCBp2lZQa51H2recFJNul
	 8VxN3I1X4NvPx/CN+L3/21ywF+WhRICxZYk8gtbY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729308AbfFRP1A (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 18 Jun 2019 11:27:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:54046 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728982AbfFRP1A (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 Jun 2019 11:27:00 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 07E382085A;
        Tue, 18 Jun 2019 15:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560871619;
        bh=SSnKVKJU0sLRhqBq4rWiHjbloE8WCZeYuIUyrvX0IuQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TNVsbSr+J7ksOeKydpSZY4pJ/tQgfEVAMjcQqbe+o69oJ9nON2nWWW7bx9IZ/6Wq/
         css/mUSXC9LeUD5HulAfva/vL33uD/sra5x51RBOssCxUvqlMIH8kcLERQgYZfUOlT
         VGGtuAHNerpgfRTQXYcFscY0V3Z00lS29cIF2Fc0=
Date:   Tue, 18 Jun 2019 17:26:57 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     dmg <dmg@turingmachine.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: Replace a < b ? a : b construct with min_t(type, a,
 b) in drivers/usb
Message-ID: <20190618152657.GA1912@kroah.com>
References: <20190617233050.21409-1-dmg@turingmachine.org>
 <20190618064905.GA22457@kroah.com>
 <87pnnbj5v7.fsf@mn.cs.uvic.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87pnnbj5v7.fsf@mn.cs.uvic.ca>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 18, 2019 at 08:00:28AM -0700, dmg wrote:
> 
> Greg KH <gregkh@linuxfoundation.org> writes:
> 
> > On Mon, Jun 17, 2019 at 04:30:50PM -0700, dmg@turingmachine.org wrote:
> >> From: Daniel M German <dmg@turingmachine.org>
> >>
> >> Use min_t to find the minimum of two values instead of using the ?: operator.
> >
> > Why is min_t() needed for all of these and not just min()?
> 
> The use of min triggers a compilation warning (see below), which min_t is supposed to
> address (from min_t comment: 'min()/max() macros that also do strict type-checking.. See the
> "unnecessary" pointer comparison.", from include/linux/kernel')
> 
>    In file included from drivers/usb/misc/adutux.c:19:
>    drivers/usb/misc/adutux.c: In function ‘adu_read’:
>    ./include/linux/kernel.h:818:29: warning: comparison of distinct pointer types lacks a cast
>       (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
>                                 ^~
>    ./include/linux/kernel.h:832:4: note: in expansion of macro ‘__typecheck’
>       (__typecheck(x, y) && __no_side_effects(x, y))
>        ^~~~~~~~~~~
>    ./include/linux/kernel.h:842:24: note: in expansion of macro ‘__safe_cmp’
>      __builtin_choose_expr(__safe_cmp(x, y), \
>                            ^~~~~~~~~~
>    ./include/linux/kernel.h:851:19: note: in expansion of macro ‘__careful_cmp’
>     #define min(x, y) __careful_cmp(x, y, <)
>                       ^~~~~~~~~~~~~
>    drivers/usb/misc/adutux.c:382:34: note: in expansion of macro ‘min’
>                         int amount = min(bytes_to_read, data_in_secondary);
>                                      ^~~

Yes, but is it needed for all of these?

And what about just changing the types of those variables to be the
same?  Does the cast have to be there?

thanks,

greg k-h
