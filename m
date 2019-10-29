Return-Path: <SRS0=3MAM=YW=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2EF5CA9EAE
	for <linux-usb@archiver.kernel.org>; Tue, 29 Oct 2019 10:26:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B59842087E
	for <linux-usb@archiver.kernel.org>; Tue, 29 Oct 2019 10:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572344783;
	bh=6PHyrGgO1xdkX2IhY+5fqzsNW8lqS7hEOD3HaHMW1Jc=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=iNhm8/SnQR4EZ65yhf4/O+wyElBjQ+R5DmtGHb8yaOd2vR2dlg+ffUWFapJXMNfoM
	 tnuzn5kDNTIL84VgEf3cnyzIU3Zys3wv19at4CdQTD52HkMO5ur6rZ/51ElMhX29Sy
	 S8a0yuK5gk4q6fpPeYkZar2PhEP39o8eyeBMfQ1Q=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730237AbfJ2K0X (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 29 Oct 2019 06:26:23 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:54955 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726071AbfJ2K0W (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Oct 2019 06:26:22 -0400
Received: by mail-wm1-f65.google.com with SMTP id g7so1914853wmk.4
        for <linux-usb@vger.kernel.org>; Tue, 29 Oct 2019 03:26:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=maMmhAKWfYgGqUBMyOkkmron/Ce8MhKYUinnMLaiUfk=;
        b=HQVxQolFe8VtouzHCw1TmUyFZ8n+SW2xJ8FA8U+QENmkENsKeNYfYiW4P+A80PdyKt
         X+Ht2pZvr3oPIgOd3tRfhv1ne0IvjJP13aGBiXeNu0S3hAHrc66mHdoQrWUh+2DMZgt7
         SMWbqvHA5KAbuaB44tee7Lu05xRBhsh4xHHjQqRD/TZm6eFGt087Xw7MKQPu3a/YwcG5
         Ay6F+1m8QpHSVGUoF14p7h0tA5/RXZvsNXBPP96amKc0JL8SUiw8WVHTyFicsxoT+qsb
         tYNtXwlwZZAVFh94aNbPDl5Kc4zCJAfGhyYsTInG0WWQgH9XVvZTqeniorhaQQSj+x0k
         e1zA==
X-Gm-Message-State: APjAAAXfwm4cSo3tGSxWD8HejK27Kwjy1YfwNVQ+ABJlsPh6K0YhVgVf
        am/47fX8KbRH/cl+YQHiFQ0=
X-Google-Smtp-Source: APXvYqzBi7Ud0r8GBhuM/rKMYZCo2b3ckkrhLXumVue62fxuKIiqgfl+wY1GnJ8IGVxA1Aj5FWugtw==
X-Received: by 2002:a7b:c302:: with SMTP id k2mr3444569wmj.81.1572344781109;
        Tue, 29 Oct 2019 03:26:21 -0700 (PDT)
Received: from pi (100.50.158.77.rev.sfr.net. [77.158.50.100])
        by smtp.gmail.com with ESMTPSA id w17sm16228035wra.34.2019.10.29.03.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 03:26:20 -0700 (PDT)
Received: from johan by pi with local (Exim 4.92.2)
        (envelope-from <johan@pi>)
        id 1iPOgQ-0002pn-CD; Tue, 29 Oct 2019 11:25:02 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 0/2] USB: serial: whiteheat: fix slab corruption and endianness bug
Date:   Tue, 29 Oct 2019 11:23:52 +0100
Message-Id: <20191029102354.2733-1-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

These patches fix a user-controlled slab buffer corruption, and adds a
missing endianess conversion when setting the line speed.

Greg, feel free to pick up the first one directly if you want.

Johan


Johan Hovold (2):
  USB: serial: whiteheat: fix potential slab corruption
  USB: serial: whiteheat: fix line-speed endianness

 drivers/usb/serial/whiteheat.c | 13 ++++++++++---
 drivers/usb/serial/whiteheat.h |  2 +-
 2 files changed, 11 insertions(+), 4 deletions(-)

-- 
2.23.0

