Return-Path: <SRS0=7X6x=XX=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E03ACC4360C
	for <linux-usb@archiver.kernel.org>; Sat, 28 Sep 2019 02:41:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AA68E20869
	for <linux-usb@archiver.kernel.org>; Sat, 28 Sep 2019 02:41:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nic.cz header.i=@nic.cz header.b="BfhpkU2j"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726408AbfI1Cl6 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 27 Sep 2019 22:41:58 -0400
Received: from mail.nic.cz ([217.31.204.67]:59700 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725306AbfI1Cl5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 27 Sep 2019 22:41:57 -0400
Received: from localhost (unknown [172.20.6.135])
        by mail.nic.cz (Postfix) with ESMTPSA id D3E42140E6B;
        Sat, 28 Sep 2019 04:32:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1569637930; bh=PHJxNmUdFjLClF3fYBn9Bw3ogSKlLPbL0/s/38ERX9k=;
        h=Date:From:To;
        b=BfhpkU2jwiK+yF9D047vrQpvCsu5DS214wxxOUaVrb6nf7Wg1p0tk4G2fa3ZpUUZC
         h5E3yJMyO/NEadhZBt0SdI0oQUctVJElVlh3Le14zk6cAx3oGFafQ7vkHxJZvLbau5
         OU9NyuErobSoDWNVTIsdCZKvzeziq7CfTaqWVuu4=
Date:   Sat, 28 Sep 2019 04:32:09 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     linux-usb@vger.kernel.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: regression from commit "usb: host: xhci-plat: Prevent an
 abnormally restrictive PHY init skipping"
Message-ID: <20190928043209.62cfc2ef@nic.cz>
In-Reply-To: <20190928042950.3ae07173@nic.cz>
References: <20190928042950.3ae07173@nic.cz>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.100.3 at mail.nic.cz
X-Virus-Status: Clean
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, 28 Sep 2019 04:29:50 +0200
Marek Behun <marek.behun@nic.cz> wrote:

> Hi Miquel,
> 
> I am encountering a regression caused by your commit eb6c2eb6c7fb
> "usb: host: xhci-plat: Prevent an abnormally restrictive PHY init
> skipping" [1]

I forgot to explain how the regression presents itself

  rcu: INFO: rcu_sched detected stalls on CPUs/tasks:

The kernel than hangs.

Marek
