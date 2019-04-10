Return-Path: <SRS0=X9rV=SM=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 173DFC10F11
	for <linux-usb@archiver.kernel.org>; Wed, 10 Apr 2019 12:02:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CC1162084B
	for <linux-usb@archiver.kernel.org>; Wed, 10 Apr 2019 12:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1554897774;
	bh=6424W/4VCJPLPbVA+gwQAn6Y3MEMzk7d6ZZP+9gboZs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:List-ID:From;
	b=pnbbxZdRJOMSoGrkTBiqB74s320IngBGjeUJ+vUlms3xJJMibDqOeheGEhkNcD7+E
	 JBSfN+m790aC3sm0bZB3pJ3SW28qVzQk5VmkUi5VUDRfiYh3Il1V8UOV+Q9axfg70y
	 h1HKzQfq37soBT4iE2wPe42xBC0h7M28kM7yVhK8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731647AbfDJMCx (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 10 Apr 2019 08:02:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:38786 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727515AbfDJMCx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 10 Apr 2019 08:02:53 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4C36920818;
        Wed, 10 Apr 2019 12:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1554897772;
        bh=6424W/4VCJPLPbVA+gwQAn6Y3MEMzk7d6ZZP+9gboZs=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=hkoG7a9sJks4obZoCVLFadYRKNC++Pa/VTxH7Htg1wPwe5NZsk3pLdGrzWrTFFA1Q
         MY+RhF2wFcKVJZWaBaqmy3ZWtxj7SyKa4i3TCh98axOfiJbsLuNoyz7GB7UScN60kg
         uUC6GlSmFpfFdq6qGNtYfvbND14+3p/sjqsa8Hi4=
Date:   Wed, 10 Apr 2019 14:02:49 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Andrej Shadura <andrew.shadura@collabora.co.uk>
cc:     linux-input@vger.kernel.org, linux-usb@vger.kernel.org,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        kernel@collabora.com, Theodore Ts'o <tytso@mit.edu>,
        Vasily Khoruzhick <anarsoul@gmail.com>,
        Nick Kossifidis <mickflemm@gmail.com>,
        linux-crypto@vger.kernel.org
Subject: Re: [PATCH v3] HID: add driver for U2F Zero built-in LED and RNG
In-Reply-To: <20190401124200.17331-1-andrew.shadura@collabora.co.uk>
Message-ID: <nycvar.YFH.7.76.1904101400520.9803@cbobk.fhfr.pm>
References: <20190401124200.17331-1-andrew.shadura@collabora.co.uk>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190410120249.-BIGf4ajtkRBKO_Ale8ajD6WgJcPm6WTqPsDbst-ZjA@z>

On Mon, 1 Apr 2019, Andrej Shadura wrote:

> U2F Zero supports custom commands for blinking the LED and getting data
> from the internal hardware RNG. Expose the blinking function as a LED
> device, and the internal hardware RNG as an HWRNG so that it can be used
> to feed the enthropy pool.

So I still am not really happy about this being wired up into generic HID 
although it's really a USB driver, but we've discussed that already, and I 
don't see any option that'd work substantially better in this case, 
especially from the UX point of view. Oh well. Applied to for-5.2/u2fzero, 
thanks!

-- 
Jiri Kosina
SUSE Labs

