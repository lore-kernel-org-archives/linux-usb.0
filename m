Return-Path: <SRS0=7cGN=S4=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8BF4C43218
	for <linux-usb@archiver.kernel.org>; Fri, 26 Apr 2019 19:56:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B5B8C206DD
	for <linux-usb@archiver.kernel.org>; Fri, 26 Apr 2019 19:56:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726503AbfDZTz7 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 26 Apr 2019 15:55:59 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:41954 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726455AbfDZTz7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Apr 2019 15:55:59 -0400
Received: from localhost (unknown [12.154.31.190])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 4CDCF1477002E;
        Fri, 26 Apr 2019 12:55:58 -0700 (PDT)
Date:   Fri, 26 Apr 2019 15:55:53 -0400 (EDT)
Message-Id: <20190426.155553.1671436741307513039.davem@davemloft.net>
To:     bjorn@mork.no
Cc:     netdev@vger.kernel.org, linux-usb@vger.kernel.org,
        larsm17@gmail.com
Subject: Re: [PATCH net] qmi_wwan: new Wistron, ZTE and D-Link devices
From:   David Miller <davem@davemloft.net>
In-Reply-To: <871s1orcmr.fsf@miraculix.mork.no>
References: <20190424171246.4589-1-bjorn@mork.no>
        <20190426.113130.120149435337896049.davem@davemloft.net>
        <871s1orcmr.fsf@miraculix.mork.no>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Fri, 26 Apr 2019 12:55:58 -0700 (PDT)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190426195553.023ZucR6Jk6DCQdIUMH-kr0BTbulUJ0Q7xzbU2wIW6s@z>

From: Bjørn Mork <bjorn@mork.no>
Date: Fri, 26 Apr 2019 17:48:28 +0200

> David Miller <davem@davemloft.net> writes:
>> Want me to queue this up for -stable too?
> 
> Yes, please.  Sorry I forgot to add the tag.

Ok, done.
