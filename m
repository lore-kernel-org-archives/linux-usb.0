Return-Path: <SRS0=vzMr=SX=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ABB5C10F14
	for <linux-usb@archiver.kernel.org>; Sun, 21 Apr 2019 12:22:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2B7C120859
	for <linux-usb@archiver.kernel.org>; Sun, 21 Apr 2019 12:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555849324;
	bh=PokM204nuNECq8832ACoeCca1ao8W8MvbUjfCFG4a+w=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=VRqOOcBzyecGnHQRmR67AurQqmYK5r49DKuhTnpFWCJoWTBFDEE01IhZVCH6pnvil
	 9iSx5+FlVjO2aIrIwwF2Y0Bo5TF/LiGr2P9RXycIdoQZle8JqfLZCLH9frpLjRYwQs
	 UWKmAGSGT65TfejSwjONHZZ6adIC/ffKon6mr+vE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727494AbfDUMWC (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 21 Apr 2019 08:22:02 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:36048 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727395AbfDUMWB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 21 Apr 2019 08:22:01 -0400
Received: by mail-lj1-f194.google.com with SMTP id r24so8196842ljg.3
        for <linux-usb@vger.kernel.org>; Sun, 21 Apr 2019 05:22:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5DkDW6SbNK5EKHDNifOFjN3gc0DDOLciSSwYorFUw7Q=;
        b=KoIXvcAI8Asl8b8fW8TEDqUgOtnxjYNSq7B6NOSV0OKL7cGrGHp1rX3cBBhvdEpS42
         xyEa3HWiER4e9zDKjn4ubQsKgLTTfnTeYaO5Pgg1tUEIaQgdNzqB+FaxjBl0qI1BFNa/
         sSO8HLGdPAOfiIYKJULgbnQ2UkMz1H2B/SvcYqLB0rhMN4kcgToY0aOozLc+F87r3SDz
         aZWdy54BPeoFmX/98V3HGs8TYslp2D4uSbfzIO4yreJLaGnLqzO0B9YUgAYhvD8650CC
         FNdas9S8DF12fh0CSaOGK/YWfmZW2Y6ierNzEcPWLAuVSqt+Vk29qmwks0uQ7NYmIisZ
         tnpA==
X-Gm-Message-State: APjAAAUXsG9bXmLFNjVi4u36VIks1y8Uxi0mhs7YGMGOyVG6NFJv4Rt1
        CyURNB8/syFU7Xm4AJQj9I+Dfi5f
X-Google-Smtp-Source: APXvYqxBewDOQ+V2X/Ers9gcghteLg1XhIlBQj9WAaISvWB0P+i7nR5cd9bFacasWIIj0z+E/4+AgA==
X-Received: by 2002:a2e:b016:: with SMTP id y22mr7472174ljk.133.1555849319097;
        Sun, 21 Apr 2019 05:21:59 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id x72sm2447768lfa.58.2019.04.21.05.21.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 21 Apr 2019 05:21:55 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.91)
        (envelope-from <johan@xi.terra>)
        id 1hIBTs-0006th-3L; Sun, 21 Apr 2019 14:22:00 +0200
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/9] USB: serial: fix initial-termios handling
Date:   Sun, 21 Apr 2019 14:21:45 +0200
Message-Id: <20190421122154.26465-1-johan@kernel.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A few drivers override the default initial termios settings provided by
USB serial core, but due to a long-standing bug, the terminal settings
were being reset on every (first) open rather than on first use after
probe as intended.

This series fixes the bug and cleans up the various init_termios
implementations somewhat.

Johan


Johan Hovold (9):
  USB: serial: fix initial-termios handling
  USB: serial: ark3116: drop redundant init_termios
  USB: serial: cypress_m8: drop unused driver data flag
  USB: serial: cypress_m8: drop unused termios
  USB: serial: cypress_m8: clean up initial-termios handling
  USB: serial: iuu_phoenix: drop bogus initial cflag
  USB: serial: iuu_phoenix: simplify init_termios
  USB: serial: oti6858: simplify init_termios
  USB: serial: spcp8x5: simplify init_termios

 drivers/usb/serial/ark3116.c     | 11 -------
 drivers/usb/serial/cypress_m8.c  | 49 ++++++--------------------------
 drivers/usb/serial/iuu_phoenix.c |  4 +--
 drivers/usb/serial/oti6858.c     |  5 +---
 drivers/usb/serial/spcp8x5.c     |  5 +---
 drivers/usb/serial/usb-serial.c  | 11 ++++---
 6 files changed, 18 insertions(+), 67 deletions(-)

-- 
2.21.0

