Return-Path: <SRS0=oy5M=TP=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D130C04E87
	for <linux-usb@archiver.kernel.org>; Wed, 15 May 2019 07:55:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3C06C20843
	for <linux-usb@archiver.kernel.org>; Wed, 15 May 2019 07:55:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbfEOHzH (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 15 May 2019 03:55:07 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:57082 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725939AbfEOHzG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 May 2019 03:55:06 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 7188825AEAD;
        Wed, 15 May 2019 17:55:04 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 43ACBE21335; Wed, 15 May 2019 09:55:02 +0200 (CEST)
Date:   Wed, 15 May 2019 09:55:02 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Chris Brandt <chris.brandt@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 08/15] usb: renesas_usbhs: move flags to param
Message-ID: <20190515075501.lz6ypvz5l3c6jnzn@verge.net.au>
References: <20190514145605.19112-1-chris.brandt@renesas.com>
 <20190514145605.19112-9-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190514145605.19112-9-chris.brandt@renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 14, 2019 at 09:55:58AM -0500, Chris Brandt wrote:
> Move options from 'flags' field in private structure to param structure
> where other options are already being kept.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

