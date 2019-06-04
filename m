Return-Path: <SRS0=VYZK=UD=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_NEOMUTT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87874C28CC3
	for <linux-usb@archiver.kernel.org>; Tue,  4 Jun 2019 09:37:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4AFA8243BD
	for <linux-usb@archiver.kernel.org>; Tue,  4 Jun 2019 09:37:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727008AbfFDJhr (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 4 Jun 2019 05:37:47 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:52338 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726918AbfFDJhr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 Jun 2019 05:37:47 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 05C4625B73F;
        Tue,  4 Jun 2019 19:37:45 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 01160940986; Tue,  4 Jun 2019 11:37:42 +0200 (CEST)
Date:   Tue, 4 Jun 2019 11:37:42 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: renesas_usbhs: remove controlling PWEN/EXTLP
 support
Message-ID: <20190604093742.fsqjurnpq6457ijl@verge.net.au>
References: <1559621375-5436-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1559621375-5436-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1559621375-5436-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 04, 2019 at 01:09:35PM +0900, Yoshihiro Shimoda wrote:
> Controlling PWMEN/EXTLP (named as "has_otg") was supported in v3.2,
> but was never used by any platform. So, this patch remove it.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

