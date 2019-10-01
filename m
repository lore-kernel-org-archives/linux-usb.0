Return-Path: <SRS0=EQXy=X2=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 289E2C388F3
	for <linux-usb@archiver.kernel.org>; Tue,  1 Oct 2019 10:29:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E71D921924
	for <linux-usb@archiver.kernel.org>; Tue,  1 Oct 2019 10:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1569925793;
	bh=KbjfnxWu0tC3Wz95YA+IZV06qZh/7c7tQuKZDDUZI2g=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=EfqMX0ilWa6t4t0XaJYvdV8z5ZOKqejiM5kYLM1KG7+6CWvPdOXayqBBSsPZIRYUZ
	 egXGeELyJGb675vT/hqbnA+aTAsb3g2YCmjAspGwOUNsjS3hgimOLxVa0WoV25R16P
	 6+QGZnkAuBImZDK/SPuwOsSJLk87fkQtmQkTUlag=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730861AbfJAK3w (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 1 Oct 2019 06:29:52 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:44267 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730596AbfJAK3l (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Oct 2019 06:29:41 -0400
Received: by mail-lj1-f193.google.com with SMTP id m13so12723432ljj.11;
        Tue, 01 Oct 2019 03:29:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RoOu79csZ7AqaXDAqptQ6zp2k96qP4QNOgQPeyZoDFU=;
        b=cgGcquKF1cfyWqEb9ldWejkaQT6zudCzEaGNI+vUHfEMQhhAkfuFDYgVyoMc9JtQ2+
         KKbqDJfQz9LTLIXWy/Hm5EKq5SRr/+C2xqxXbnls5zcAoxT9aBgVSvYq0TGCYI23gTMP
         3HaNlpQZNwumwdEPhKQkAP1KfUenFUlWeMcLah+XYIymewDXKPpST9vdnigh3MvkMjUI
         IzeR0ajNnOg1qfohQtNILehWi2Dt0Qu1itA3PtyjGwrfCCAoNVLa7uDWb/wtnA7PNo79
         Q7YbxYk3bWpqdqxd0wnGUZY5v13WTu5lTO3utfcSO/b1l6Law15gHiMGhIzzRYu26yvN
         h6/Q==
X-Gm-Message-State: APjAAAUBN8urKuaCnifJsh15z3FcKcwnIbAQQZ7RYtUzZ6S/UrkHmhdA
        TxFGsijYAIukkQw5rLJ8GZAjBRzc
X-Google-Smtp-Source: APXvYqy54GRLDR5EEHOlj/ts7fyXJ1b7P32u2lWL1YXUKM8Is2BNjEzZ/abrty6SnVfrkSVKNGC1hw==
X-Received: by 2002:a2e:58a:: with SMTP id 132mr14673453ljf.132.1569925778036;
        Tue, 01 Oct 2019 03:29:38 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id 196sm3881434ljj.76.2019.10.01.03.29.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Oct 2019 03:29:37 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
        (envelope-from <johan@xi.terra>)
        id 1iFFPd-000361-5P; Tue, 01 Oct 2019 12:29:45 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Wolfgang Grandegger <wg@grandegger.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>
Cc:     "David S. Miller" <davem@davemloft.net>, linux-can@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/2] can: fix use-after-free on USB disconnect
Date:   Tue,  1 Oct 2019 12:29:12 +0200
Message-Id: <20191001102914.4567-1-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Syzbot reported a use-after-free on disconnect in mcba_usb and a quick
grep revealed a similar issue in usb_8dev.

Compile-tested only.

Johan


Johan Hovold (2):
  can: mcba_usb: fix use-after-free on disconnect
  can: usb_8dev: fix use-after-free on disconnect

 drivers/net/can/usb/mcba_usb.c | 3 +--
 drivers/net/can/usb/usb_8dev.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

-- 
2.23.0

