Return-Path: <SRS0=iu7A=SK=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF7B5C282CE
	for <linux-usb@archiver.kernel.org>; Mon,  8 Apr 2019 07:32:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C267E20870
	for <linux-usb@archiver.kernel.org>; Mon,  8 Apr 2019 07:32:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726798AbfDHHck (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 8 Apr 2019 03:32:40 -0400
Received: from mx2.suse.de ([195.135.220.15]:40490 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726373AbfDHHcj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 8 Apr 2019 03:32:39 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 6CAB9B028;
        Mon,  8 Apr 2019 07:32:38 +0000 (UTC)
Message-ID: <1554708756.8951.7.camel@suse.com>
Subject: Re: Bug: cdc_acm blocking write after many small writes
From:   Oliver Neukum <oneukum@suse.com>
To:     "Linus K." <linus.kaschulla@gmail.com>, linux-usb@vger.kernel.org
Date:   Mon, 08 Apr 2019 09:32:36 +0200
In-Reply-To: <10cfe58c-2d91-30d3-8672-ebe261363bf1@gmail.com>
References: <10cfe58c-2d91-30d3-8672-ebe261363bf1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fr, 2019-04-05 at 17:09 +0200,  Linus K.  wrote:
> Hi,
> I recently submitted this bug to https://bugzilla.kernel.org/ and was 
> redirected here.

Hi,

does your kernel have

commit df3aa13c7bbb307e172c37f193f9a7aa058d4739
Author: Oliver Neukum <oneukum@suse.com>
Date:   Wed Sep 5 17:56:46 2018 +0200


    Revert "cdc-acm: implement put_char() and flush_chars()"

and

commit 93e1c8a638308980309e009cc40b5a57ef87caf1
Author: Romain Izard <romain.izard.pro@gmail.com>
Date:   Fri Mar 22 16:53:02 2019 +0100

    usb: cdc-acm: fix race during wakeup blocking TX traffic

	Regards
		Oliver

