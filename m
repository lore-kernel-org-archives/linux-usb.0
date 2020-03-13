Return-Path: <SRS0=ZUM+=46=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9600EC10DCE
	for <linux-usb@archiver.kernel.org>; Fri, 13 Mar 2020 02:18:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6D348206E7
	for <linux-usb@archiver.kernel.org>; Fri, 13 Mar 2020 02:18:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Tm16Zohk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726230AbgCMCSa (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 12 Mar 2020 22:18:30 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:34218 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726114AbgCMCSa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 Mar 2020 22:18:30 -0400
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D8D31401E0;
        Fri, 13 Mar 2020 02:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1584065910; bh=8Y/D1tPJSESZ20pMokyiqX+tuudLpoNBNhLtXUtlGTk=;
        h=Date:From:Subject:To:Cc:From;
        b=Tm16ZohkLsqvM2IezA0lajbRAIMfvjeLgOBFzCd1CEN562D29cPrWt6v8QxfY4Vv6
         682Uii+5sG3p6xvz2NFJtmFKpdBI8KydbkqGgIUK78GDJ0DmQaIVfwy8iqGvVs/gRI
         /3MAUnvanuTxg4TNUTqP7Xwd9YVB3xq4cj/Rp1rvkqd0bN2BsCJEwSGKbomQF5zzZP
         3de1yIosNEUja49x3R4aP1r7UtHVIRK9aq4mXLR/8m7W+PhxhJ5EE5ga9u6DOrCYI4
         38eQlajUUuTrsZ+aDJPIQ5I3jNhfQMOTMI7h8IPngLNi9xncLAjdXHHKhEiOOP6Bfq
         zB54GzYMhSymQ==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 43E32A00C3;
        Fri, 13 Mar 2020 02:18:28 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Thu, 12 Mar 2020 19:18:27 -0700
Date:   Thu, 12 Mar 2020 19:18:27 -0700
Message-Id: <cover.1584065705.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 0/3] usb: dwc3: gadget: Improve isoc starting mechanism
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Currently we use the "retry" method to issue START_TRANSFER command multiple
times, each with a next interval. There's been report that 5 number of retries
may not be enough. See https://lkml.org/lkml/2019/11/11/535

We could increase the number of retries. However, that also may not be enough
depending on different system latency. It is not often that the latency is
higher than 5 isoc intervals. If it goes beyond 5 intervals, let's restart the
whole process again.



Thinh Nguyen (3):
  usb: dwc3: gadget: Properly handle failed kick_transfer
  ute: dwc3: gadget: Store resource index of start cmd
  usb: dwc3: gadget: Issue END_TRANSFER to retry isoc transfer

 drivers/usb/dwc3/gadget.c | 69 ++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 57 insertions(+), 12 deletions(-)

-- 
2.11.0

