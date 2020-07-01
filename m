Return-Path: <SRS0=oYLI=AM=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E1D1C433DF
	for <linux-usb@archiver.kernel.org>; Wed,  1 Jul 2020 16:54:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3CDC320748
	for <linux-usb@archiver.kernel.org>; Wed,  1 Jul 2020 16:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1593622456;
	bh=130fQtESFUNRwA/n8ykQCryX3y00FnyFRdc1v9eYQzk=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=SahghJySIWEbY4Fd1HPNpQuWlwRuugmjYKlxeo5Fl3NWtKjekX2gH/os5o1vASeA6
	 DcYhFGoiEYE8J7vql2eyngpqmefHNssrkjafEIGnO0hreemK3kXYRKPkKmy6fEFPcb
	 ZRqhAnL9rhQdn7hUzXSwZLtQQxOi2h55K/LzqHxw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732804AbgGAQyP (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 1 Jul 2020 12:54:15 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:35761 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732478AbgGAQyN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Jul 2020 12:54:13 -0400
Received: by mail-lf1-f65.google.com with SMTP id t74so14121562lff.2
        for <linux-usb@vger.kernel.org>; Wed, 01 Jul 2020 09:54:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RgjIPROVVqlOoO/ODLyJMay9x5hDMzAcfHiBGRdOPzQ=;
        b=e5rMtqQdyTQTv6d13yzfJYP5CSfF9RFqxaFTDdvEZOZSEK1IFAN3qdMQNytH7buk71
         2meAfXzzMFCKaw3+rDUz47Ube8IUzrp4QXDAjqsAanJNbbHRZDUpRavqMBD5KX2VAkY/
         IDojlKnuUy2ELk6W0egWtudmIa/VH36Bu89luILPlJrYdcW8vl4dfuy/mAmIEn0DPirT
         RqX1CiD0qrYA4kuQPUULq/8EHCWqq73E5oDutIXuczuRh3yvkbWJUZrI/a9F3GxCrmbp
         bSk1ApVYfygnPnsQimQSmLY31Ke/pitP1LzE9VSicpnnPFO2bhGdd8D6aHl9sM5G/qel
         L9og==
X-Gm-Message-State: AOAM531+tAtlRvzPImn7AwdQ7AYnJUbKQKgaI4zSPS+hRmZRQwpRMBxL
        trJMUrqYR2Eyjyfn9j3zin0bpvhqOUo=
X-Google-Smtp-Source: ABdhPJzIjPNkOEeGQA23cUr0nzru3fLr2F2WWhUW0oAzZstGOOa91x7Letu8cRqfs4tScoZxLmThVg==
X-Received: by 2002:a05:6512:3150:: with SMTP id s16mr4687882lfi.47.1593622450878;
        Wed, 01 Jul 2020 09:54:10 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id y18sm1996236ljn.62.2020.07.01.09.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2020 09:54:10 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1jqfzq-000421-93; Wed, 01 Jul 2020 18:54:06 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 0/5] USB: serial: W=1 related cleanups
Date:   Wed,  1 Jul 2020 18:53:37 +0200
Message-Id: <20200701165342.15448-1-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

People have started submitting patches to "fix" W=1 warning (some even
reported by bots). Let's just address the remaining ones in USB serial
to avoid having to spend more time on this.

Johan


Johan Hovold (5):
  USB: serial: garmin_gps: don't compile unused packet definitions
  USB: serial: iuu_phoenix: drop unused URB submission results
  USB: serial: keyspan_pda: drop unused firmware reset status
  USB: serial: kobil_sct: log failure to update line settings
  USB: serial: quatech2: drop two stub functions

 drivers/usb/serial/garmin_gps.c  | 13 ++++++++-----
 drivers/usb/serial/iuu_phoenix.c | 12 ++++--------
 drivers/usb/serial/keyspan_pda.c |  3 +--
 drivers/usb/serial/kobil_sct.c   |  4 ++++
 drivers/usb/serial/quatech2.c    | 18 +-----------------
 5 files changed, 18 insertions(+), 32 deletions(-)

-- 
2.26.2

