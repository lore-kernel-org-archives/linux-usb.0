Return-Path: <SRS0=Cs7X=UE=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B5D9C28CC5
	for <linux-usb@archiver.kernel.org>; Wed,  5 Jun 2019 14:22:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EB88920684
	for <linux-usb@archiver.kernel.org>; Wed,  5 Jun 2019 14:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1559744540;
	bh=eyRvr65dol57t/OXC0nz1955oNM46KyGg22JAPhHxHI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=2oisd1ZilLR3MD7mc3vaQzBGFx3pzERQ4fSEjMqzxC+UNPX5CFWg+2FLGqvVwzkaa
	 OR33g2iA2ylBpd9r40ScaOQFO8bRz6QLVzcR+wLAuWNxqQDi2+BKMOn2dpUdTFtrsb
	 XWX4fWSNkrw7bvj3tYr3KyNdZ3HV1ZHrhgUCWJiA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728346AbfFEOWT (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 5 Jun 2019 10:22:19 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:41497 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728190AbfFEOWT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Jun 2019 10:22:19 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 02DFE21F3C;
        Wed,  5 Jun 2019 10:22:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 05 Jun 2019 10:22:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=82Wqdd
        gTanaA8sQnpaKhsdwYdtwsBt7md4IKTrjAOog=; b=j15yEjU1Zkt+QMnnwxxjMO
        tyqUWT5/eFFuKTI9LjHiDqnEuRBOmTJm6iVCIGUhwyOmtmTWScKmpgNYglFM/LZZ
        do+0UiiQ9DD1iq90Xsv/OTAF4Y+0FEuoGXzeEnnCj/Auyfd+jD4u7dPbspbaurYM
        PAuVvX3sYHEVYUcg2Ejw+Xj0z+ROo6if2sDUGTMWpsFYHi03zGa5PnatKVKWZBXY
        FdKwf/V0Ju1Ou4XQcKxh5PtGOQpG+UoJoysMcLNpXQFtps14wO/FwPswA54uCbdF
        SYEvHJuTqdTN8WLowjx5SHySTd0YJSN5Ad5QOPALXH1sEWZbByHjeIxLECjdktHA
        ==
X-ME-Sender: <xms:GdD3XNfIp653e2BNYKmo3Hin7zRnslsFRsUqHHXu1j1SughL2agMlA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudegvddgjeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjfgesthdtredttdervdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvghfmjfeslhhinhhugihfohhunhgurghtihhonhdrohhrgheqnecukf
    hppeekfedrkeeirdekledruddtjeenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghg
    sehkrhhorghhrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:GdD3XDV_FN_TxQzZCA0XofU7HMvPPbMY8K_vsitQWR8f3cMXVTVmkg>
    <xmx:GdD3XGDVeGrF499Yy9guzHyTkeP4uAyQNi9wiNyLLEpwq3k5i9EUmg>
    <xmx:GdD3XG6YESyhbV-mAREtCqbUoz07nXBlRU5O0Iii7mKOwnRJOGtA6A>
    <xmx:GdD3XOQNXdTLmQfP2byR-ElKlI0HXMUUPofOcKQJcFwdqUfl-TROWg>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id 058EF80062;
        Wed,  5 Jun 2019 10:22:16 -0400 (EDT)
Date:   Wed, 5 Jun 2019 16:22:14 +0200
From:   Greg KH <gregKH@linuxfoundation.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-usb@vger.kernel.org, stern@rowland.harvard.edu
Subject: Re: [PATCH] usb: hso: correct debug message
Message-ID: <20190605142214.GC8803@kroah.com>
References: <20190605125942.26696-1-oneukum@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190605125942.26696-1-oneukum@suse.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 05, 2019 at 02:59:42PM +0200, Oliver Neukum wrote:
> If you do not find the OUT endpoint, you should say so,
> rather than copy the error message for the IN endpoint.
> Presumably a copy and paste error.
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>  drivers/net/usb/hso.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

drivers/net/ patches go to netdev@vger...

