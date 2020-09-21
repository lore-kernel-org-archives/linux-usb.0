Return-Path: <SRS0=kiWP=C6=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6340C43465
	for <linux-usb@archiver.kernel.org>; Mon, 21 Sep 2020 15:06:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 894F22075E
	for <linux-usb@archiver.kernel.org>; Mon, 21 Sep 2020 15:06:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727285AbgIUPGN (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 21 Sep 2020 11:06:13 -0400
Received: from netrider.rowland.org ([192.131.102.5]:59241 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726688AbgIUPGM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Sep 2020 11:06:12 -0400
Received: (qmail 1215898 invoked by uid 1000); 21 Sep 2020 11:06:11 -0400
Date:   Mon, 21 Sep 2020 11:06:11 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     yasushi asano <yazzep@gmail.com>
Cc:     andrew_gabbasov@mentor.com, erosca@de.adit-jv.com,
        gregkh@linuxfoundation.org, jim_baxter@mentor.com,
        linux-usb@vger.kernel.org, nnishiguchi@jp.adit-jv.com,
        wnatsume@jp.adit-jv.com, yasano@jp.adit-jv.com
Subject: Re: [PATCH] Re: [PATCH v3] USB: hub.c: decrease the number of
 attempts of enumeration scheme
Message-ID: <20200921150611.GD1213381@rowland.harvard.edu>
References: <20200920192114.GB1190206@rowland.harvard.edu>
 <20200921140342.3813-1-yazzep@gmail.com>
 <20200921144827.GC1213381@rowland.harvard.edu>
 <CAEt1Rjq-DOwN0+_7F0m-kqUHTzm5YPUaXqUOpTszCsqrfLRt5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEt1Rjq-DOwN0+_7F0m-kqUHTzm5YPUaXqUOpTszCsqrfLRt5w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Sep 21, 2020 at 11:59:31PM +0900, yasushi asano wrote:
> Dear Alan
> 
> Thank you very much for the reply.
> please merge my modification to your patch.

Yes.

I will wait to hear the result of your test before I submit the changes.

Alan Stern
