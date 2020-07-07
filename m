Return-Path: <SRS0=ACcI=AS=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48F22C433DF
	for <linux-usb@archiver.kernel.org>; Tue,  7 Jul 2020 06:06:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2217820773
	for <linux-usb@archiver.kernel.org>; Tue,  7 Jul 2020 06:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594101976;
	bh=5S0rSB5uS9hCqjPAOCcw/OjWAs81VwSNMCse+ZiOHf4=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=IA3qbp0UV273vJsiuCPsflQpxsv76P14YnlLvMkcF8nTW0823LNtRt8LqpEJlklvF
	 0qymYgoe2BYqbkm+8H7Iev/7BqQhKEK20zGo1kDY48aBvJU+eCpdgBhLEOzd/7jbMF
	 K/r4VhKFFEsqQYkHVQGV6zZDam35hmLCjpCmOOGQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725941AbgGGGGP (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 7 Jul 2020 02:06:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:53998 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725874AbgGGGGP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 7 Jul 2020 02:06:15 -0400
Received: from localhost.localdomain (unknown [222.67.222.179])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6FC9220758;
        Tue,  7 Jul 2020 06:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594101975;
        bh=5S0rSB5uS9hCqjPAOCcw/OjWAs81VwSNMCse+ZiOHf4=;
        h=From:To:Cc:Subject:Date:From;
        b=QBifxQkyWYrTzcjgNOlW2WI8umuJyZ3pjJi7pb63reQKTKLtbvrtUsFdg6Yw4bBW5
         VMQhbnFD28l/JIxDWnlvQdrJB5tZWnrsqNVWr0L3INfQIhzJ1tw36DMd+e65PfyWVq
         a68raxsEEUsBlPQODRnGZNEUZqZPgNXUpU/qMoAI=
From:   Peter Chen <peter.chen@kernel.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 0/1] usb: chipidea: fixes for usb-linus
Date:   Tue,  7 Jul 2020 14:06:00 +0800
Message-Id: <20200707060601.31907-1-peter.chen@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Peter Chen <peter.chen@nxp.com>

Peter Chen (1):
  usb: chipidea: core: add wakeup support for extcon

 drivers/usb/chipidea/core.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

-- 
2.17.1

