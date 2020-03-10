Return-Path: <SRS0=lIXa=43=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E60CC10F27
	for <linux-usb@archiver.kernel.org>; Tue, 10 Mar 2020 06:59:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EDBD02467D
	for <linux-usb@archiver.kernel.org>; Tue, 10 Mar 2020 06:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583823582;
	bh=bWhE5Bxoq9g4W0AAV2mbJSilFTMyYlZqUmD6XocJT5E=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=T1soW/7Br9qLiGItjFjTCpkpHeHlspaBcKuUO8Ef+qKtA5aiJ0r8dbWGc3lm2h4Zx
	 msQ3nNf/9hkmAXtosI9HoOn8BwAV0JlpG8S8VHObcluFIIrjKl8alxYyVZbFg5QS52
	 O9ZW2Ecn1g2r8rbaQ+Tt1OnEz/eBsrozlrLOxJM4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726195AbgCJG7l (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 10 Mar 2020 02:59:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:35738 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725919AbgCJG7l (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 10 Mar 2020 02:59:41 -0400
Received: from localhost.localdomain (unknown [180.171.74.255])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 823AB24673;
        Tue, 10 Mar 2020 06:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583823580;
        bh=bWhE5Bxoq9g4W0AAV2mbJSilFTMyYlZqUmD6XocJT5E=;
        h=From:To:Cc:Subject:Date:From;
        b=v6EAoXOCF4Py/Ych+nAdKg5qt4Zz0jSPTO7+Ev2/K1UddOv5bXWmYlRwq7Ptzop4O
         PjzyC80n1Jp5Wi1+KzXEzcdhqf9wnhEGruV3pOXAuu2Ox5jG31K0eQ58OiZPmOtYi4
         jc6JZL70f/vU1foFDmOYIlUnvXZNY/w+4ir5YQKI=
From:   Peter Chen <peter.chen@kernel.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 0/1] usb: chipidea: fixes for usb-linus
Date:   Tue, 10 Mar 2020 14:59:25 +0800
Message-Id: <20200310065926.17746-1-peter.chen@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Peter Chen <peter.chen@nxp.com>

Peter Chen (1):
  usb: chipidea: udc: fix sleeping function called from invalid context

 drivers/usb/chipidea/udc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
2.17.1

