Return-Path: <SRS0=JkLY=DB=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 981F8C4346E
	for <linux-usb@archiver.kernel.org>; Thu, 24 Sep 2020 08:21:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3DFCD23772
	for <linux-usb@archiver.kernel.org>; Thu, 24 Sep 2020 08:21:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Sz0zblRG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727219AbgIXIVN (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 24 Sep 2020 04:21:13 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:40330 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727089AbgIXIVN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Sep 2020 04:21:13 -0400
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 66ABE401F1;
        Thu, 24 Sep 2020 08:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1600935673; bh=XO1+clz4tmxQ06UH29VrqFZFjojZxuZbRowFWFCju+o=;
        h=Date:From:Subject:To:Cc:From;
        b=Sz0zblRG65EDAlDjePkLUcO2ZINh2Hb2zqLfJEqo1j/yTRXScJ9HdEx1LosLmtNvP
         bkO7VnhmqVE56XcfhSnrRcQy4CzbbqTF6bpFLzn8KW4DciY4Dtg+67M/j2uSazffMH
         Yx92ElxdiDv4GxI3nvYju1r4dSRN0Zabm/dosIxI39VshFC2FmG3bbDnCqeVMSXj+k
         4L6xvb9o90miJVYK3clOFIh6xXETrY3d0lr3VcG1VTI1PrESohAKPGeS/QrlYBIRbK
         1vku1g+0xeRc4V/ooROlLlBkeg7De2WfCrKARu1AwS7kV8p1cR372O93D2nTLEm0td
         CNkawMIy2fzNA==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 1DCE0A0096;
        Thu, 24 Sep 2020 08:21:12 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Thu, 24 Sep 2020 01:21:11 -0700
Date:   Thu, 24 Sep 2020 01:21:11 -0700
Message-Id: <cover.1600935293.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 00/10] usb: dwc3: gadget: Revise preparation for extra TRBs
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>, stable@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series resolves various issues with ZLP handling and refactor handling of
TRBs. This series has too many changes comparing to the "[PATCH v3 0/4] usb:
dwc3: gadget: Fix TRB preparation" series so I created different series
instead.


Thinh Nguyen (10):
  usb: dwc3: gadget: Check MPS of the request length
  usb: dwc3: gadget: Reclaim extra TRBs after request completion
  usb: dwc3: gadget: Refactor preparing extra TRB
  usb: dwc3: gadget: Improve TRB ZLP setup
  usb: dwc3: ep0: Fix ZLP for OUT ep0 requests
  usb: dwc3: gadget: Return the number of prepared TRBs
  usb: dwc3: gadget: Check for number of TRBs prepared
  usb: dwc3: gadget: Set IOC if not enough for extra TRBs
  usb: dwc3: gadget: Refactor preparing last TRBs
  usb: dwc3: gadget: Rename misleading function names

 drivers/usb/dwc3/ep0.c    |  11 +-
 drivers/usb/dwc3/gadget.c | 262 +++++++++++++++++---------------------
 2 files changed, 124 insertions(+), 149 deletions(-)


base-commit: 2f45af92722ee6e78f12037af1870117bcae00d1
-- 
2.28.0

