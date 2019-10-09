Return-Path: <SRS0=ivde=YC=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37E51ECE58D
	for <linux-usb@archiver.kernel.org>; Wed,  9 Oct 2019 15:38:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 02C802190F
	for <linux-usb@archiver.kernel.org>; Wed,  9 Oct 2019 15:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570635535;
	bh=QlJQmut5iI8R6n9jJ4vjlePNVvjuMmJmwR7iyx/1MFA=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=H0BbsD9SpKaUiGQl6hTYq+uFWhhanVSCZBD7g1KekAVkHp/I4tom0Wkklpaq/08g9
	 dnsBT35NceYcHxTwx9N4ClZUI6ggJZmygUy0a62yqAf4hQVX0D+cPqp5gt0xP955si
	 nNKohr6PqxlPuDV827NmU/e500MaBXC8ZgSCSeY0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731144AbfJIPiy (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 9 Oct 2019 11:38:54 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:39030 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728804AbfJIPiy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Oct 2019 11:38:54 -0400
Received: by mail-lf1-f68.google.com with SMTP id 72so2018326lfh.6
        for <linux-usb@vger.kernel.org>; Wed, 09 Oct 2019 08:38:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KNwQuy/qjCD2TjI8KL8/lMEdqtih09iWsjOUr6FCork=;
        b=byIfWUTO2QXgnt0ueM/yARuFkk6xOimyIsXxFDCbunRsUU+TbzLsw1fVcHhbq8NgBJ
         IDnX7ouRDd5ggM5aplClNG0aBpaw27ZAJm116LozD13/8pbS2LPN/g95lbuqOPrqPCjr
         eFSALuvWiYVwbJR4PhJ/FPEGuQy6DaIL5OMRNRHHT9RaznCyprN71jVumDfKQgNjY1o3
         qrEjxO5pk8XIKSYHFoiWOd6QoWOCEzMkd3enbAv1fS3BK71Wrx+PasYSCB2rUlvJCXv5
         4N4A7MmQMczEtg1M+DckTG+bPKBOboqUPep8yyDEuVl/Lk5qx3x7tcbP3UYCRSC84hTx
         Y/fw==
X-Gm-Message-State: APjAAAVMCIumcMzV4wa4MHzCrcHvs5x2fn397uTnP7UyxcVaE9s+ydfu
        NWGEa4KeEqh0kqiAKzEZ44Y=
X-Google-Smtp-Source: APXvYqxkLZxWSSqMSVcIyFCjgnrC//FylPhtRtoQfe/MOo971t+rYSOY6tLOfrMfwlHRMokAQYtb0w==
X-Received: by 2002:ac2:44c3:: with SMTP id d3mr2416630lfm.109.1570635532438;
        Wed, 09 Oct 2019 08:38:52 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id h3sm542764lfc.26.2019.10.09.08.38.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Oct 2019 08:38:51 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
        (envelope-from <johan@xi.terra>)
        id 1iIE3J-0002Go-6o; Wed, 09 Oct 2019 17:39:01 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Keith Packard <keithp@keithp.com>,
        Juergen Stuber <starblue@users.sourceforge.net>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/5] USB: misc: fix disconnect bugs
Date:   Wed,  9 Oct 2019 17:38:43 +0200
Message-Id: <20191009153848.8664-1-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series fixes a number of issues introduced primarily with the
conversion to dev_err() and dev_dbg(), which failed to notice that the
drivers where using their USB interface and device pointers as
disconnected flags (leading to NULL derefs) and that they did not hold
references to the structures (leading to use-after-free on release()).

I've already fixed up a few of these USB character device drivers
separately, and the uss720 driver has similar bugs that remain to be
fixed.

Johan


Johan Hovold (5):
  USB: adutux: fix use-after-free on release
  USB: chaoskey: fix use-after-free on release
  USB: ldusb: fix NULL-derefs on driver unbind
  USB: legousbtower: fix use-after-free on release
  USB: yurex: fix NULL-derefs on disconnect

 drivers/usb/misc/adutux.c       |  3 ++-
 drivers/usb/misc/chaoskey.c     |  5 +++--
 drivers/usb/misc/ldusb.c        | 24 ++++++++++++------------
 drivers/usb/misc/legousbtower.c |  3 ++-
 drivers/usb/misc/yurex.c        | 11 +++++++----
 5 files changed, 26 insertions(+), 20 deletions(-)

-- 
2.23.0

