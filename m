Return-Path: <SRS0=hlyZ=2L=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A7CCC43603
	for <linux-usb@archiver.kernel.org>; Sat, 21 Dec 2019 06:50:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 35B1B2070B
	for <linux-usb@archiver.kernel.org>; Sat, 21 Dec 2019 06:50:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725997AbfLUGuT (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 21 Dec 2019 01:50:19 -0500
Received: from [167.172.186.51] ([167.172.186.51]:39588 "EHLO shell.v3.sk"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725838AbfLUGuT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 21 Dec 2019 01:50:19 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id F3BBFDFCC8;
        Sat, 21 Dec 2019 06:50:20 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id puEEto27kgsw; Sat, 21 Dec 2019 06:50:20 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 50B6CDFCB0;
        Sat, 21 Dec 2019 06:50:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id jLvPNWMTRI6U; Sat, 21 Dec 2019 06:50:20 +0000 (UTC)
Received: from furthur.lan (unknown [109.183.109.54])
        by zimbra.v3.sk (Postfix) with ESMTPSA id C70B1DFC8A;
        Sat, 21 Dec 2019 06:50:19 +0000 (UTC)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] USB: EHCI: ehci-mv: make HSIC work
Date:   Sat, 21 Dec 2019 07:50:05 +0100
Message-Id: <20191221065008.266445-1-lkundrak@v3.sk>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

please have a look at the three patches chained to this message. They
are independent of each other and can be applied iny any order.

My main objective was to make HSIC work on MMP3. The PHY patch is
loosely related to that (there's no MMP3 HSIC PHY driver, but the NOP
is sufficient). The last one is a cosmetic thing.

Compared to first submission, the patches are now submitted as series
and the wording of the third one's commit message has been changed.

Thank you,
Lubo


