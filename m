Return-Path: <SRS0=mrYY=5D=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A560EC5ACD6
	for <linux-usb@archiver.kernel.org>; Wed, 18 Mar 2020 08:43:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7814420753
	for <linux-usb@archiver.kernel.org>; Wed, 18 Mar 2020 08:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584521019;
	bh=i8+iAO7W49505WYSx6ePICPLH1zWAhRJHAR8RgVB28c=;
	h=Date:From:To:Cc:Subject:List-ID:From;
	b=tZukFKr4OcDQ40uK+XZogrjVmrzdEyRMjSDRalpVYZXZegIgq0Et23WNA+7Q9OL3E
	 aOVuJFVEpWFXPQ2AhZFecWHN849vu9eWwMHx+xubji2GWqmFr8rFrWGHPLzdjdPxNb
	 Up/EV9Zx8V2Y8igHQwcyKV2Qpvo2SS9waUT27A5U=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726713AbgCRIni (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 18 Mar 2020 04:43:38 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:35021 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726390AbgCRIni (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 18 Mar 2020 04:43:38 -0400
Received: by mail-lj1-f196.google.com with SMTP id u12so26044533ljo.2
        for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2020 01:43:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=DGwvFD5ewTEdjn6kK7yQj7Dpa/TWJGzhqdQ7l6roOVs=;
        b=D9rLSnf8e+B+CisusnWDAJI6NYymcMTR3u/I+WR7sknBDpQxu6iF81qQa1M0F2M8H4
         zW46dc35HPdDOv8qoVntJuKKUoP5mnLEn3whcIuWR+PZv+fdIHEk30HUw+ygXzJaEzSL
         ATZouqZe4+jQwo+3r+7LVx3YfXHGclvMg3JQQmr5ZVGl8gI3M5HVFbssLAXC3F3hTmnF
         s4vggNthfsrrrBTw47cEjNyhIVsl83FAR/chgvfNG12fdhoMU1G7xrIz1apqD6CCpTlH
         swv7AJBhKgXwCuXROLEMDxGUR+eD1ObJa7ovtvdT4xOzt3sYqyDQ6tFA+BuxV6lUplGY
         e5UQ==
X-Gm-Message-State: ANhLgQ1EjAU07reXsO5U0igLA3cJrURlgjMw+y6Ld64wOSTG2vFFo1S/
        AhYpY5X/O/nyGUAEjBfU950=
X-Google-Smtp-Source: ADFU+vtdhDlMlRq4GwLM3mBBXjucOheGVApDfJWYVS0RmagUKvaRvwMJECXGyHOtSKopLoPs7iDJsA==
X-Received: by 2002:a05:651c:103b:: with SMTP id w27mr1767250ljm.245.1584521016312;
        Wed, 18 Mar 2020 01:43:36 -0700 (PDT)
Received: from xi.terra (c-12aae455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.170.18])
        by smtp.gmail.com with ESMTPSA id p14sm3898049ljn.80.2020.03.18.01.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2020 01:43:35 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1jEUIH-00057X-0T; Wed, 18 Mar 2020 09:43:17 +0100
Date:   Wed, 18 Mar 2020 09:43:17 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] USB-serial fixes for 5.6-rc7
Message-ID: <20200318084317.GA19665@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The following changes since commit 2c523b344dfa65a3738e7039832044aa133c75fb:

  Linux 5.6-rc5 (2020-03-08 17:44:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.6-rc7

for you to fetch changes up to cecc113c1af0dd41ccf265c1fdb84dbd05e63423:

  USB: serial: pl2303: add device-id for HP LD381 (2020-03-12 12:31:01 +0100)

----------------------------------------------------------------
USB-serial fixes for 5.6-rc7

Here are a couple of new device ids for 5.6-rc.

All have been in linux-next with no reported issues.

----------------------------------------------------------------
Daniele Palmas (1):
      USB: serial: option: add ME910G1 ECM composition 0x110b

Scott Chen (1):
      USB: serial: pl2303: add device-id for HP LD381

 drivers/usb/serial/option.c | 2 ++
 drivers/usb/serial/pl2303.c | 1 +
 drivers/usb/serial/pl2303.h | 1 +
 3 files changed, 4 insertions(+)
