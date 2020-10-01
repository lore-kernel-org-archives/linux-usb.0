Return-Path: <SRS0=7R6y=DI=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4289C4363D
	for <linux-usb@archiver.kernel.org>; Thu,  1 Oct 2020 00:44:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E9C22137B
	for <linux-usb@archiver.kernel.org>; Thu,  1 Oct 2020 00:44:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="jho3l8x8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731604AbgJAAoP (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 30 Sep 2020 20:44:15 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:55864 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731339AbgJAAoP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Sep 2020 20:44:15 -0400
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id CC322C07AC;
        Thu,  1 Oct 2020 00:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1601513055; bh=9VITStDmWK9WFlwqZXsHf+HhPvq9JsNuOaVA6ZZ1eeU=;
        h=Date:From:Subject:To:Cc:From;
        b=jho3l8x8od3TY3Ns90r//Ghh4kULZPBC2/efV8hIcX2QIAbMvyAthCvVxoZ1wKEQS
         PyZjQaNJ6aPAWOjlGhSchINqatpaY55toxi4c2E4XXIlVmwAeh5dsV6xqJw8JaYHTj
         4MFD0F7FaouNTVxMh+Th7MQE0o8AgKMJQ2PpfpzsAjSXZitKjdDA869arw247xuyc+
         eWtxg/KICgeV5vu9vITNSQxQj3ku94MXZzW4GFLHZCMnQUsSQdcOyzN+ACxOeJ73Vc
         bO5Czesj/LOHGt9EaFx5uoOpTY09JtZxg4DW6OSTYqjmxUUhfVxkCkLParFMVnkrJs
         o56jYyRVSCGbg==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id D6B60A0096;
        Thu,  1 Oct 2020 00:44:12 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 30 Sep 2020 17:44:12 -0700
Date:   Wed, 30 Sep 2020 17:44:12 -0700
Message-Id: <cover.1601511883.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 0/4] usb: dwc3: gadget: More TRB handling cleanup
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This short series further improves the TRB handling logic and resolves some
more corner cases. The changes are verfied with the USB IF compliance
verification (running Chp.9, MSC, and UASP CV) and our verification
environment.


Thinh Nguyen (4):
  usb: dwc3: gadget: Look ahead when setting IOC
  usb: dwc3: gadget: Revise setting IOC when no TRB left
  usb: dwc3: gadget: Keep TRBs in request order
  usb: dwc3: gadget: Return early if no TRB update

 drivers/usb/dwc3/gadget.c | 93 +++++++++++++++++++++++----------------
 1 file changed, 55 insertions(+), 38 deletions(-)


base-commit: 8e9f3908b995a33443821dc3a977277f69a4adc3
-- 
2.28.0

