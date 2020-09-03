Return-Path: <SRS0=pd4M=CM=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D560DC433E2
	for <linux-usb@archiver.kernel.org>; Thu,  3 Sep 2020 02:06:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B0D2C2078E
	for <linux-usb@archiver.kernel.org>; Thu,  3 Sep 2020 02:06:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="GhGVX66u"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726586AbgICCGI (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 2 Sep 2020 22:06:08 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:51378 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726177AbgICCGH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Sep 2020 22:06:07 -0400
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1F81BC00B2;
        Thu,  3 Sep 2020 02:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1599098767; bh=aSGQZVSoxm2Ozo5l7KtHaR4SIPy6RfxdwFDKGyUCzlE=;
        h=Date:From:Subject:To:Cc:From;
        b=GhGVX66ur1xPWa5cE/Meg3VRsbpcQfp+3CVlF2gI4a1fAusDZ0O6rR7AB1plwNs7S
         zQ3s0TfADCfyk80H0I3L8/ykQWV8IHYwumUu0AQrmg2PfREvzgAPGgv5ApiZRuOXBm
         GQl+XZLOFj8uJe0TyRk6TjRNC0bNs/WMM6RVzO9Tq4sb2Tw9xPSX7wv4he32anTXFQ
         Mrju4z/b5pRcs0KuaanMUB+gQHSj6RhyZfbt/rZP2+376gKoi4Jk40F2bMdlwQFAC9
         /0tMAcIaAetmcXBHjizq2lBOCA0ZbNggYG7KZXch3LadpN2kliYBH1bXRRtw26/9K2
         XbChtjdpb1QaA==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id D46B5A006D;
        Thu,  3 Sep 2020 02:06:05 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 02 Sep 2020 19:06:05 -0700
Date:   Wed, 02 Sep 2020 19:06:05 -0700
Message-Id: <cover.1599098161.git.thinhn@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v3 0/4] usb: dwc3: gadget: Fix TRB preparation
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There are a few issues in DWC3 driver when preparing for TRB.
The driver needs to account the following:

* MPS alignment for ZLP OUT direction
* Extra TRBs when checking for available TRBs
* SG entries size > request length

Along with these fixes, there are some cleanup/refactoring patches in this
series.

Changes in v3:
- Rebase on Felipe's testing/next branch with the remaining patches of this
  series

Changes in v2:
- Update remaining length when resume request
- Remove unused variables
- Add a missing "return 0" for dwc3_prepare_trbs()
- Update doc indicating dwc3_prepare_trbs() can return other -errno


Thinh Nguyen (4):
  usb: dwc3: gadget: Refactor preparing TRBs
  usb: dwc3: gadget: Account for extra TRB
  usb: dwc3: gadget: Rename misleading function names
  usb: dwc3: ep0: Skip ZLP setup for OUT

 drivers/usb/dwc3/ep0.c    |   2 +-
 drivers/usb/dwc3/gadget.c | 246 +++++++++++++++++---------------------
 2 files changed, 112 insertions(+), 136 deletions(-)


base-commit: 8bc2602e7a402664131d79251d59b262b896ca37
-- 
2.28.0

