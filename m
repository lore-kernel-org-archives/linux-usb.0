Return-Path: <SRS0=7cGN=S4=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F24D1C4321A
	for <linux-usb@archiver.kernel.org>; Fri, 26 Apr 2019 15:31:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C83482077B
	for <linux-usb@archiver.kernel.org>; Fri, 26 Apr 2019 15:31:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726402AbfDZPbe convert rfc822-to-8bit (ORCPT
        <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 26 Apr 2019 11:31:34 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:37708 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726172AbfDZPbd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Apr 2019 11:31:33 -0400
Received: from localhost (unknown [12.154.31.190])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id C0C9B145E7134;
        Fri, 26 Apr 2019 08:31:32 -0700 (PDT)
Date:   Fri, 26 Apr 2019 11:31:30 -0400 (EDT)
Message-Id: <20190426.113130.120149435337896049.davem@davemloft.net>
To:     bjorn@mork.no
Cc:     netdev@vger.kernel.org, linux-usb@vger.kernel.org,
        larsm17@gmail.com
Subject: Re: [PATCH net] qmi_wwan: new Wistron, ZTE and D-Link devices
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20190424171246.4589-1-bjorn@mork.no>
References: <20190424171246.4589-1-bjorn@mork.no>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Fri, 26 Apr 2019 08:31:33 -0700 (PDT)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190426153130.DOW3-XBcA_a5cYmgztT_jIihvQ3r7TnYgs_aZh4hbeU@z>

From: Bjørn Mork <bjorn@mork.no>
Date: Wed, 24 Apr 2019 19:12:46 +0200

> Adding device entries found in vendor modified versions of this
> driver.  Function maps for some of the devices follow:
...
> Reported-by: Lars Melin <larsm17@gmail.com>
> Signed-off-by: Bjørn Mork <bjorn@mork.no>

Applied, thanks.

Want me to queue this up for -stable too?
