Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E1CAC433EF
	for <linux-usb@archiver.kernel.org>; Fri, 10 Sep 2021 12:12:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C4BD611C8
	for <linux-usb@archiver.kernel.org>; Fri, 10 Sep 2021 12:12:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233051AbhIJMN0 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 10 Sep 2021 08:13:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:41922 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232954AbhIJMNZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 10 Sep 2021 08:13:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D2CF5611CA;
        Fri, 10 Sep 2021 12:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631275934;
        bh=RKmdETPSsxWeVIvn7/yhxi2WRQdN2DlSgvZA9UKyG8Y=;
        h=From:To:Cc:Subject:Date:From;
        b=By3Bs7kIs5Fcyac4aNRXKBsZwTcLD4PogNBS38ZSxeuBZ399Zw/JIkIQWreGt8vmQ
         Shr/FFe46GC1HLPu6LhwPltsdveZuiVAIlxUsiriKhBomkGfGXJXphuFlmZ3zEXUTH
         2a8UD8ukoed+S7bPhmJjx70xCgihAuyKD/rFrMAY6BiZEhobGGnHacoFAd7Wq9ihYI
         dnKLGOrmNm8gi3D8WE5WllorzB2EHC6K8eqlwgY0eiBqAiUHWTq/0F2c+2bPI46U+K
         HhckCNwwKmpv04Hu133uCUzpz53hm6epKUKYhMB875LGLqSz9LV1XOTu2g+X1xMtsF
         ykUCJH0j4OUAQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1mOfO1-0004rx-Cg; Fri, 10 Sep 2021 14:12:06 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] USB: serial: allow hung up ports to be suspended
Date:   Fri, 10 Sep 2021 14:11:26 +0200
Message-Id: <20210910121128.18664-1-johan@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

User space can keep a tty open indefinitely and that should not prevent
a hung up port and its USB device from being runtime suspended.

Also clean up a few related error labels in a preparatory patch.

Johan


Johan Hovold (2):
  USB: serial: clean up core error labels
  USB: serial: allow hung up ports to be suspended

 drivers/usb/serial/usb-serial.c | 59 +++++++++++++++++----------------
 1 file changed, 30 insertions(+), 29 deletions(-)

-- 
2.32.0

