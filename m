Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 903F1C48BE6
	for <linux-usb@archiver.kernel.org>; Wed, 16 Jun 2021 07:18:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6EA826008E
	for <linux-usb@archiver.kernel.org>; Wed, 16 Jun 2021 07:18:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231630AbhFPHUI (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 16 Jun 2021 03:20:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:41558 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231293AbhFPHUI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 16 Jun 2021 03:20:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 91E5060FEE;
        Wed, 16 Jun 2021 07:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1623827882;
        bh=yCCQgCaXqKoJI/1+n5rAGup004IhWGxcZxJJCONLi7o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ajNSkOcivMoeqNpNyF/JQ9o82YILr8/XtPs2UEMzVE//eel5HetroNtPJ7SPanBON
         zkmU8RRlevYrRWGu8cs4vEcQ4rw2IPuJtKt1HBfSWCaLymMOzhvOOXxbJBW29yLkH4
         t7Kma9wr+selU5ncdCm3qx08ytLPki48slC4er1M=
Date:   Wed, 16 Jun 2021 09:17:59 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 4/8] docs: usb: replace some characters
Message-ID: <YMmlpyxyfmum9r9O@kroah.com>
References: <cover.1623826294.git.mchehab+huawei@kernel.org>
 <0a4b0c38a9cd1133402a04a7ff60fefd9682d42e.1623826294.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0a4b0c38a9cd1133402a04a7ff60fefd9682d42e.1623826294.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 16, 2021 at 08:55:10AM +0200, Mauro Carvalho Chehab wrote:
> The conversion tools used during DocBook/LaTeX/html/Markdown->ReST
> conversion and some cut-and-pasted text contain some characters that
> aren't easily reachable on standard keyboards and/or could cause
> troubles when parsed by the documentation build system.
> 
> Replace the occurences of the following characters:
> 
> 	- U+feff ('﻿'): BOM
> 	  as it is not needed on UTF-8
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/usb/ehci.rst           | 2 +-
>  Documentation/usb/gadget_printer.rst | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
