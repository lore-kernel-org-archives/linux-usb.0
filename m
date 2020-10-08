Return-Path: <SRS0=gWik=DP=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 604D6C433DF
	for <linux-usb@archiver.kernel.org>; Thu,  8 Oct 2020 17:11:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EC007221FC
	for <linux-usb@archiver.kernel.org>; Thu,  8 Oct 2020 17:11:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=mork.no header.i=@mork.no header.b="SJePg4Aq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731697AbgJHRLT (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 8 Oct 2020 13:11:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727698AbgJHRLS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Oct 2020 13:11:18 -0400
Received: from canardo.mork.no (canardo.mork.no [IPv6:2001:4641::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FD8EC061755;
        Thu,  8 Oct 2020 10:11:18 -0700 (PDT)
Received: from miraculix.mork.no (miraculix.mork.no [IPv6:2001:4641:0:2:7627:374e:db74:e353])
        (authenticated bits=0)
        by canardo.mork.no (8.15.2/8.15.2) with ESMTPSA id 098HAwl6024526
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Thu, 8 Oct 2020 19:10:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mork.no; s=b;
        t=1602177059; bh=OxK0uNCFU41rDdxF9mmkmvjXR4Q9mKDgiWKQwJ+2lbY=;
        h=From:To:Cc:Subject:References:Date:Message-ID:From;
        b=SJePg4Aqp/WKar/cQIk7vC5flUEuRbXyB6x1pvsV845LtZejxfoGcFkZoC39ORuvb
         cRM+pL+7vgwcaWsuOybhCdUUCFzC/Lz4E8CTcm+ngJ5VOp0O/hoEm/ya3TLIdMvPU3
         EjRY9uogSZBNaS0b74lF6M+kTMWvrmkoqjXUk9pw=
Received: from bjorn by miraculix.mork.no with local (Exim 4.94)
        (envelope-from <bjorn@mork.no>)
        id 1kQZRR-001ACp-L3; Thu, 08 Oct 2020 19:10:57 +0200
From:   =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Wilken Gottwalt <wilken.gottwalt@mailbox.org>,
        linux-kernel@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        netdev@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 1/2] net: usb: qmi_wwan: add Cellient MPL200 card
Organization: m
References: <cover.1602140720.git.wilken.gottwalt@mailbox.org>
        <f5858ed121df35460ef17591152d606a78aa65db.1602140720.git.wilken.gottwalt@mailbox.org>
        <87d01ti1jb.fsf@miraculix.mork.no>
        <20201008095616.35a21c00@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
Date:   Thu, 08 Oct 2020 19:10:57 +0200
In-Reply-To: <20201008095616.35a21c00@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
        (Jakub Kicinski's message of "Thu, 8 Oct 2020 09:56:16 -0700")
Message-ID: <87v9fkhcda.fsf@miraculix.mork.no>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: clamav-milter 0.102.4 at canardo
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Jakub Kicinski <kuba@kernel.org> writes:

> I'm guessing that I'm supposed to take this patch into the networking
> tree, correct?

Correct.

> Is this net or net-next candidate? Bj=C3=B8rn?

Sorry, should have made that explicit. This is for net + stable

Thanks.


Bj=C3=B8rn
