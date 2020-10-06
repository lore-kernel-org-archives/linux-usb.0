Return-Path: <SRS0=zoLE=DN=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFC29C41604
	for <linux-usb@archiver.kernel.org>; Tue,  6 Oct 2020 07:19:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 841BE20853
	for <linux-usb@archiver.kernel.org>; Tue,  6 Oct 2020 07:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601968785;
	bh=LNvDSp5Z7ckYp/tfBKKh/c0uKzVgBYQkEA3ApjQ/XAo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=IePssennQrIFVMEriBCAiGZ8NwhuMS7oYvOxXwphUFvQ0q2dGY8glC3RNObh2OqVE
	 w51+xABsp35+WpsE03TQdRy1te96zIs9Hz0YeSVWn8RAjEpGPeM7dE4G7wDBtSFoV6
	 5HdpEXx5s3hTVSM3Xeuh4djLrS0CMy2E3vwwOx8c=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727172AbgJFHTm (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 6 Oct 2020 03:19:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:49154 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725912AbgJFHTl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 6 Oct 2020 03:19:41 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CE41F20789;
        Tue,  6 Oct 2020 07:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601968781;
        bh=LNvDSp5Z7ckYp/tfBKKh/c0uKzVgBYQkEA3ApjQ/XAo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RudRPuqMfeRzH2CdAdAfUeQNERc1m7eIvf8sr2VJhxUPWSJYQYbevDWycHB90JytL
         ZNJymQGhY6biBYvBBRCBne4bNQKcC6x3Cw7o56JWE7FWAYfdSTmM1FL2+2Rhkm/z9G
         pKw5CoUinzcI6T7MoKuIwJJYPaeyDMOCPxUxP9kc=
Date:   Tue, 6 Oct 2020 09:19:38 +0200
From:   "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To:     "Harley A.W. Lorenzo" <hl1998@protonmail.com>
Cc:     Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-safety@lists.elisa.tech" <linux-safety@lists.elisa.tech>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>
Subject: Re: [PATCH] usb: host: ehci-sched: avoid possible NULL dereference
Message-ID: <20201006071938.GA5503@kroah.com>
References: <20201005213149.12332-1-sudipm.mukherjee@gmail.com>
 <brWYeL8miTAikvEPYFNe2Kpe05OBtiD6yuS6jRg1VCX-lt7ANc1B2y7AM6ECEoG9AJwZP5_5qoGO7POvK0MtruvqG8q8kHbyHiOUIZ72Klk=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <brWYeL8miTAikvEPYFNe2Kpe05OBtiD6yuS6jRg1VCX-lt7ANc1B2y7AM6ECEoG9AJwZP5_5qoGO7POvK0MtruvqG8q8kHbyHiOUIZ72Klk=@protonmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Oct 05, 2020 at 11:19:02PM +0000, Harley A.W. Lorenzo wrote:
> On Monday, October 5, 2020 5:31 PM, Sudip Mukherjee <sudipm.mukherjee@gmail.com> wrote:
> 
> > find_tt() can return NULL or the error value in ERR_PTR() and
> > dereferencing the return value without checking for the error can
> > lead to a possible dereference of NULL pointer or ERR_PTR().
> 
> Looks fine to me. There is in fact no checks of the return value
> before a dereference here, and this solves that.
> 
> Reviewed-by: Harley A.W. Lorenzo <hl1998@protonmail.com

Nit, in the future, you need the trailing '>' there.

thanks,

greg k-h
