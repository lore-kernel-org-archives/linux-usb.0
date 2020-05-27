Return-Path: <SRS0=gdTw=7J=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0903BC433E0
	for <linux-usb@archiver.kernel.org>; Wed, 27 May 2020 09:33:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DF66120890
	for <linux-usb@archiver.kernel.org>; Wed, 27 May 2020 09:33:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726464AbgE0Jdb (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 27 May 2020 05:33:31 -0400
Received: from mx2.suse.de ([195.135.220.15]:38290 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725882AbgE0Jdb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 27 May 2020 05:33:31 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id E5FEFABD1;
        Wed, 27 May 2020 09:33:32 +0000 (UTC)
Message-ID: <1590572006.2838.53.camel@suse.com>
Subject: Re: Kernel Oops in cdc_acm
From:   Oliver Neukum <oneukum@suse.com>
To:     Jean Rene Dawin <jdawin@math.uni-bielefeld.de>
Cc:     linux-usb@vger.kernel.org
Date:   Wed, 27 May 2020 11:33:26 +0200
In-Reply-To: <20200527082847.GA8044@math.uni-bielefeld.de>
References: <20200525120026.GA11378@math.uni-bielefeld.de>
         <1590409690.2838.7.camel@suse.com>
         <20200525191624.GA28647@math.uni-bielefeld.de>
         <1590491586.2838.38.camel@suse.com>
         <20200527082847.GA8044@math.uni-bielefeld.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Mittwoch, den 27.05.2020, 10:28 +0200 schrieb Jean Rene Dawin:

Hi,

> But since 0afccd7601514c4b83d8cc58c740089cc447051d
> only when condition
> 
>    if (!acm->susp_count) {
> 
> was also fulfilled:

This is odd, because it is actually a bug to clear a HALT on a
suspended device. Yet you have tested.
Can I ask you to retest (twice removal) with
0afccd7601514c4b83d8cc58c740089cc447051d

so that we can be sure, that it causes this issue?

	Regards
		Oliver

