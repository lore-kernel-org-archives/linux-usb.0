Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFEE6C433E9
	for <linux-usb@archiver.kernel.org>; Tue, 26 Jan 2021 14:23:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A79C4206CA
	for <linux-usb@archiver.kernel.org>; Tue, 26 Jan 2021 14:23:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403869AbhAZOOn (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 26 Jan 2021 09:14:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:52806 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405827AbhAZOOR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 26 Jan 2021 09:14:17 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 803C122B2C;
        Tue, 26 Jan 2021 14:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1611670417;
        bh=YSv766COdRK+Q4CGhJ/sDz3wlp4qOX56jT9mW35921o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=F7FCjZJHnZTBPMEB26msNAJ7TxSzFLjs5ERZ9VKkLxzMgTsOLNAZbLAKa1//mQdOB
         PQLMbwLKOY97s3i0PyVSnNweYooJXxoPsJ/oKlJViVAbBSMpLcteifgaXeZY/qV1XB
         /2aac8JLw5Pp+o/knr8B8TwoifBK26ZyT1XolYMc=
Date:   Tue, 26 Jan 2021 15:13:34 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Ikjoon Jang <ikjn@chromium.org>,
        Mathias Nyman <mathias.nyman@intel.com>
Cc:     linux-mediatek@lists.infradead.org, linux-usb@vger.kernel.org,
        Zhanyong Wang <zhanyong.wang@mediatek.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Tianping Fang <tianping.fang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] usb: xhci-mtk: fix unreleased bandwidth data
Message-ID: <YBAjjmpc4yPrpmgQ@kroah.com>
References: <20210113180444.v6.1.Id0d31b5f3ddf5e734d2ab11161ac5821921b1e1e@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210113180444.v6.1.Id0d31b5f3ddf5e734d2ab11161ac5821921b1e1e@changeid>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 13, 2021 at 06:05:11PM +0800, Ikjoon Jang wrote:
> xhci-mtk needs XHCI_MTK_HOST quirk functions in add_endpoint() and
> drop_endpoint() to handle its own sw bandwidth management.
> 
> It stores bandwidth data into an internal table every time
> add_endpoint() is called, and drops those in drop_endpoint().
> But when bandwidth allocation fails at one endpoint, all earlier
> allocation from the same interface could still remain at the table.
> 
> This patch moves bandwidth management codes to check_bandwidth() and
> reset_bandwidth() path. To do so, this patch also adds those functions
> to xhci_driver_overrides and lets mtk-xhci to release all failed
> endpoints in reset_bandwidth() path.
> 
> Fixes: 08e469de87a2 ("usb: xhci-mtk: supports bandwidth scheduling with multi-TT")
> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>

Mathias, any objection to me taking this patch, or do you have others
being queued up for 5.11-final?

thanks,

greg k-h
