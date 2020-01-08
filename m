Return-Path: <SRS0=ucs1=25=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3003FC282DD
	for <linux-usb@archiver.kernel.org>; Wed,  8 Jan 2020 16:32:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E20952067D
	for <linux-usb@archiver.kernel.org>; Wed,  8 Jan 2020 16:32:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727390AbgAHQcR (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 8 Jan 2020 11:32:17 -0500
Received: from muru.com ([72.249.23.125]:50454 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726922AbgAHQcR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 8 Jan 2020 11:32:17 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 6D2B580C5;
        Wed,  8 Jan 2020 16:32:58 +0000 (UTC)
Date:   Wed, 8 Jan 2020 08:32:14 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Bin Liu <b-liu@ti.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: musb: remove dummy driver musb_am335x.c
Message-ID: <20200108163214.GE5881@atomide.com>
References: <20200108022806.32061-1-b-liu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200108022806.32061-1-b-liu@ti.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

* Bin Liu <b-liu@ti.com> [200108 02:24]:
> Since commit 0782e8572ce4 ("ARM: dts: Probe am335x musb with ti-sysc"),
> the dummy driver musb_am335x.c is no longer needed, let's drop it.

Acked-by: Tony Lindgren <tony@atomide.com>
