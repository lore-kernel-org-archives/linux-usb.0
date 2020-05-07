Return-Path: <SRS0=qVei=6V=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39BD3C28CBC
	for <linux-usb@archiver.kernel.org>; Thu,  7 May 2020 00:49:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 106EE20747
	for <linux-usb@archiver.kernel.org>; Thu,  7 May 2020 00:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1588812574;
	bh=c51TV4I/knyr/1I1QPyDI0eqGYlxvYAMQpFxMAw1NIo=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=CU6UqP+8e7F7BkW1JFPk0RrSOGvSlaPHvSGq0pjrVIcyfwL/OgPq23q5NHguzd7Pp
	 D01p8EHBWT1jkc+vaY8JtfIoZiaxnqADMYMcT3sPz2keeuVuwNebq9hNPMZArbzwfK
	 nqsEPROPGO3sxrN51j/2GmvEEcBbO0h1cCVlhEsM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726807AbgEGAtd (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 6 May 2020 20:49:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:45818 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725887AbgEGAtd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 6 May 2020 20:49:33 -0400
Received: from localhost.localdomain (unknown [180.171.74.255])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A2AF420708;
        Thu,  7 May 2020 00:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588812572;
        bh=c51TV4I/knyr/1I1QPyDI0eqGYlxvYAMQpFxMAw1NIo=;
        h=From:To:Cc:Subject:Date:From;
        b=PVTFNkG6rLnKZE5esN3P8xOaUvH/ZTDYdNKkN39j1ihLObZyqLvS6c/WKjaKxUVLp
         8+TGg94LfT0nU+KuKTZSB9IdN/QcUxXTEBRztvCuC9X8NqqEpnEKSaDJSE3SBhKw8J
         sPl6+gV9P8GwDEdWN2Y5+iEiWj/MSKiQSHo7lX64=
From:   Peter Chen <peter.chen@kernel.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 0/1] usb: chipidea: fixes for v5.7
Date:   Thu,  7 May 2020 08:49:17 +0800
Message-Id: <20200507004918.25975-1-peter.chen@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Peter Chen <peter.chen@nxp.com>

Bryan O'Donoghue (1):
  usb: chipidea: msm: Ensure proper controller reset using role switch
    API

 drivers/usb/chipidea/ci_hdrc_msm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.17.1

