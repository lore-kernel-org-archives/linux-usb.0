Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4BFAC433F5
	for <linux-usb@archiver.kernel.org>; Tue,  5 Oct 2021 14:47:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A00316128A
	for <linux-usb@archiver.kernel.org>; Tue,  5 Oct 2021 14:47:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235307AbhJEOtQ (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 5 Oct 2021 10:49:16 -0400
Received: from netrider.rowland.org ([192.131.102.5]:60343 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S233705AbhJEOtO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Oct 2021 10:49:14 -0400
Received: (qmail 623388 invoked by uid 1000); 5 Oct 2021 10:47:22 -0400
Date:   Tue, 5 Oct 2021 10:47:22 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Robert Greener <rob@robgreener.com>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 13/13] usb: core: config: fix parenthesis alignment
Message-ID: <20211005144722.GH621017@rowland.harvard.edu>
References: <cover.1633442131.git.rob@robgreener.com>
 <835bbc4e27ca989674fb916f70b81038deaf47e5.1633442131.git.rob@robgreener.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <835bbc4e27ca989674fb916f70b81038deaf47e5.1633442131.git.rob@robgreener.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 05, 2021 at 02:52:43PM +0100, Robert Greener wrote:
> Fixes the following checkpatch.pl warnings at various locations:
> 
> CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis

This is yet another case where I disagree with checkpatch.pl.  C isn't
Lisp; we shouldn't have to use the same conventions about aligning
parentheses.

My preference is to indent continuation lines by two tab stops.  In
config.c I modified this practice because the continuation lines were
very long and were indented very far; instead I sometimes indented
them by four spaces.  But in no case does it seem reasonable to align
continuation lines with opening parens.

Alan Stern
