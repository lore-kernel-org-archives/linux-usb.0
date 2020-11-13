Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85850C61DD8
	for <linux-usb@archiver.kernel.org>; Fri, 13 Nov 2020 17:20:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 41ECD21D1A
	for <linux-usb@archiver.kernel.org>; Fri, 13 Nov 2020 17:20:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726612AbgKMRTg (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 13 Nov 2020 12:19:36 -0500
Received: from netrider.rowland.org ([192.131.102.5]:52969 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726603AbgKMRTf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 Nov 2020 12:19:35 -0500
Received: (qmail 327245 invoked by uid 1000); 13 Nov 2020 12:19:48 -0500
Date:   Fri, 13 Nov 2020 12:19:48 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     gregkh@linuxfoundation.org, peter.chen@nxp.com,
        s.hauer@pengutronix.de, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: host: ehci-mxc: Remove the driver
Message-ID: <20201113171948.GG322940@rowland.harvard.edu>
References: <20201113171231.2205-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201113171231.2205-1-festevam@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 13, 2020 at 02:12:31PM -0300, Fabio Estevam wrote:
> The ehci-mxc driver was only used by i.MX non-DT platforms.
> 
> Since 5.10-rc1, i.MX has been converted to a DT-only platform and all
> board files are gone.
> 
> Remove the ehci-mxc driver as there are no more users at all.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>
