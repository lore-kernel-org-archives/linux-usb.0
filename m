Return-Path: <SRS0=u5rC=SN=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43155C10F13
	for <linux-usb@archiver.kernel.org>; Thu, 11 Apr 2019 20:03:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 026C720850
	for <linux-usb@archiver.kernel.org>; Thu, 11 Apr 2019 20:03:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hznqk+8v"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726655AbfDKUDZ (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 11 Apr 2019 16:03:25 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:38480 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726577AbfDKUDY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 11 Apr 2019 16:03:24 -0400
Received: by mail-pg1-f196.google.com with SMTP id j26so4018123pgl.5
        for <linux-usb@vger.kernel.org>; Thu, 11 Apr 2019 13:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=NYvxXHNbI2VfXyyeyhD+QHtOouWjbgtDj05bSAxMh+Q=;
        b=hznqk+8vovGR/gOyT0LShyTCdaYQ7bnpXBDbLQ5t9sfG7I2oqOiabqQvHUPCmdcNL7
         ARVNwnk/N93amfGj5ardpdoEM5UReca9hF6bsjG7HlKoO+nphdtUI9oxVOWfd3Wvw4f9
         KAuoqkoBqfQ22/+HMe/i8xvuIr7U8rHm4K12vP2/8v24dGfAU4tE+kI3xBy5bdWtAOB9
         T9lefKSwatwjk1qO/VcupMNF4sckkHxr/9pMwQtclGqLGjL5vfDwO1RRF/0pegaC9Cr2
         Vf4JXscJjHegwg0hKW5RJmkmGlrFlZEKr5fIUtfkEv2qfbW+3DgPeqTV/+OEwbgJlXsi
         kTZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=NYvxXHNbI2VfXyyeyhD+QHtOouWjbgtDj05bSAxMh+Q=;
        b=EGa46F8lMJrp+vw4QZb4KeY5cTqu03P1t3Krr4sGlWBL0fvnMePbtT6gFYTwJnM7It
         61C+Rdj71VzFQMv/fx22yl6G4d2i6eUTkj6YJzgtFtWFy7bHo8z9zysnkb38CQQ4DVeP
         7SUo92DBxVJXlqzoTRWVcStx710cWQcdsVzQhbm5k9EjbUFdaQZ7gkqNP2IlS1I9axMP
         gR39N9KQuiVEUuqW+ZBhsTD/UaW7y+nplxV8SU/C31hOYKWwxLWDYtU5dRLwOXW4DAHN
         McWzPssCRDMWCDv3cgpGbtpVwgHQ8lwjx370FG925Xd/EbtU70QLsBCUNDX9YoMbp6Vd
         Jg8g==
X-Gm-Message-State: APjAAAXu8bQtg1FaIveZbAYnRLrQfvA+My2Z+YEpgcFWdsaVuCRKOSSF
        POasPi2zrvwIpfO7EzV28fk=
X-Google-Smtp-Source: APXvYqxrvmhVg8+ce09trYUZKSEQTYTHM2rsl7JZApAfzI3/dTMBYz52OzIe+aj5vuph3sHkpHj/jQ==
X-Received: by 2002:a65:62d2:: with SMTP id m18mr49192385pgv.122.1555013004059;
        Thu, 11 Apr 2019 13:03:24 -0700 (PDT)
Received: from ajayg.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
        by smtp.gmail.com with ESMTPSA id n26sm107920326pfi.165.2019.04.11.13.03.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Apr 2019 13:03:23 -0700 (PDT)
From:   Ajay Gupta <ajaykuee@gmail.com>
X-Google-Original-From: Ajay Gupta <ajayg@nvidia.com>
To:     heikki.krogerus@linux.intel.com
Cc:     linux-usb@vger.kernel.org, Ajay Gupta <ajayg@nvidia.com>
Subject: [PATCH v6 0/2] Add support for firmware update on Cypres CCGx
Date:   Thu, 11 Apr 2019 13:03:08 -0700
Message-Id: <20190411200310.9775-1-ajayg@nvidia.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki

These changes adds support for updating firmware on Cypress CCGx
controller. New version (v6) fixes sparse warning as reported at [1].

I have tested them on NVIDIA GPU card.

Firmware binary is already merged. Details are at [2].

Please help review this set.

Thanks
Ajay

[1] https://marc.info/?l=linux-usb&m=155491396220133&w=2
[2] https://marc.info/?l=linux-usb&m=155006182508289&w=2


Ajay Gupta (2):
  usb: typec: ucsi: ccg: add get_fw_info function
  usb: typec: ucsi: ccg: add firmware flashing support

 drivers/usb/typec/ucsi/ucsi_ccg.c | 887 +++++++++++++++++++++++++++++-
 1 file changed, 877 insertions(+), 10 deletions(-)

-- 
2.17.1

