Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B693EC2F8
	for <linux-usb@vger.kernel.org>; Tue, 30 Jun 2026 10:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782814358; cv=none; b=FgUciskb4flyG1+xHHms7mjtw/H0+ZLsHs56gCF8FpbuaCYK/ZRTh1ZcKdJ0sDF6S/ep63lfKGifbeW1QmzcYohXkCgvvmrJSzUrIcWc0oeRJGxLvj3wSseIz69TZy+mOGneq3VO75eIM4v+tBZ7dYlJoXcRVmk6AMMVoWLKI7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782814358; c=relaxed/simple;
	bh=fpVV70lRt6gaxeu9NgkMR0EjFnDbIYv9+3uh2IF88IA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RuHFMsB1uO9gipCycAkaJuQOLHvvC0LCfnBF6CEkULSQKeKZHtDXK2C9+gzreF2Fg0DyIHujLBzZSMOJPcuoqZkv1EW3E+/OqMsoc/DKG6SfL8w/9sgga0ivGJBxpbVFiaJceS2IzUqNrugshM6RYp94+qyE8epD0Z/F602d3Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ahCmdf53; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ahCmdf53"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-664cdeab266so2175391d50.3
        for <linux-usb@vger.kernel.org>; Tue, 30 Jun 2026 03:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782814355; x=1783419155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ME3E5bLTc9knmTM+lqxIbMll01z0y4z3RLqE7f/es5c=;
        b=ahCmdf53tcQpDbVjnO6xYQeZqIqITEqGnTKbGSPt6OQUlf/x7W3ZMm2L5mgjrcE5Ho
         fIPTFoxDwA806NuteKa23Thn6h/8G/Cr5LUpPyvPu/d3LOWrXv18eD86LnF8GiOwHd5m
         5J1murSrwPBT8cEuf7Mq/8dxcEeaUkGOITZ2VE8ftuUXxqvcBimd3KgFzW4jVxHFwVBX
         LvduVyzK41DOiCU8WQXY/glowyhOpDKZa/8QixhaIGjsVBTyj4gifJLZFo4lYP13jEm2
         Ko910SOyuHj8CX4LyVh66XcUgH+5pOdJew3p/bBKjO14hrkfLaxCvtLnjBLT44nEt7KA
         v3Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782814355; x=1783419155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ME3E5bLTc9knmTM+lqxIbMll01z0y4z3RLqE7f/es5c=;
        b=bVA4BMe+3p2jgnYIEL5VTt+df0Iz2Ij0/iMd4Deis7dSDqFQE4L82G1rUFMUdi57jp
         hgdb/Eyx1Q/vdZiSdpXUtvh0axjdvij619HaYry3M7TS0PFXFWep691rkA78WdVhvsco
         I1SferpI28JAiMCOHcJYCKzkDNRTPhFpmrG2yGl1b2dnHv6Z1SBfwiA8pfgM8GEs43zY
         nkGHMmZp/moJtFC3OpKPELlp97pFryWuntzWDrgsBMb4Is4ltd94VjJ9nE3FiUxgPXr9
         46z+gnHxrz9o4sPlssA0RJVU1+5quX7MvSEFTkKE5C/OVGVoyJOZtlEj0WtvSr4igb15
         g4wQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpj7TWSaAAURPf7O4bUCAAX95ZNB0ohVf345yu0iosIvBgR5a/DIrRtibZnkm/iCWCRXedasFqURo4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4wftnRjuDNqYeoUcM1pQLTrS2RJVYSNUVKtd0f/LC07bdaIKF
	VRLoWH2fplVqqQPCQkMewrQDzmqKHfm6u3DcUP34zpSThMJqx4NuULWY
X-Gm-Gg: AfdE7cntWjfL/SxNqEKC0OlJ50sE33GvJBAa8uxwY6aP6nOaBuAh0MeikrJzAfHa9f2
	qN9poEfIArFNnJKEBJP8PJFqYX7cAlBVf6KfRS+KWzOjk/J4Lmnr0ATViq2+bf1kk8g+yJiWYPE
	32VTrSjVxdK+WtBwQOFm1AhLXXHABOXtnWMQLcDGY+qNhUcjtL1ek1VBMavGhIEfR0UJfQI5jDH
	gUtv17DCRnCMgEW/m+W5RwoeOBp6QZXglccgdJF1VaF1ISwVx3tLBvLUO7Q1OpiTkyAvlvtX9bN
	oaJs4QAX8HueUcISPYHPwt8o00sFAmLsm7mpOJ3wu4P1HkUccgpmrQxeEvNMwqq576zkLEELpgf
	Yl8jvqUm6dInsC4DYFui6L2omlx+D+Cib5zsMV6Z1oj2Zd+j3CT6gHUYhaKL4NVPI2sKUdBWzQn
	Ib67qw8/pGqNc9WCP2/F5UAAcrMA==
X-Received: by 2002:a05:690e:140a:b0:664:deaf:b25e with SMTP id 956f58d0204a3-664f940be22mr2947968d50.0.1782814354875;
        Tue, 30 Jun 2026 03:12:34 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6650053f901sm725450d50.1.2026.06.30.03.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 03:12:34 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Petko Manolov <petkan@nucleusys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yousef Alhouseen <alhouseenyousef@gmail.com>,
	syzbot+9db6c624635564ad813c@syzkaller.appspotmail.com
Subject: [PATCH net-next v4] net: usb: rtl8150: handle link status read failures
Date: Tue, 30 Jun 2026 12:12:16 +0200
Message-ID: <20260630101216.10365-1-alhouseenyousef@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

set_carrier() ignores the result of the USB control transfer and tests
the stack variable supplied as its receive buffer. If the device rejects
or aborts the request, that variable remains uninitialized and the driver
chooses an arbitrary carrier state.

Leave the existing carrier state unchanged when the link status cannot be
read. A transient USB error should not be treated as link loss.

Reported-by: syzbot+9db6c624635564ad813c@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=9db6c624635564ad813c
Suggested-by: Petko Manolov <petkan@nucleusys.com>
Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
Changes in v4:
- Target net-next and drop the Fixes tag as requested.
- Rebase onto current net-next after the 24-hour repost interval.

 drivers/net/usb/rtl8150.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
index c880c95c41a5..d51e43170e03 100644
--- a/drivers/net/usb/rtl8150.c
+++ b/drivers/net/usb/rtl8150.c
@@ -732,7 +732,9 @@ static void set_carrier(struct net_device *netdev)
 	rtl8150_t *dev = netdev_priv(netdev);
 	short tmp;
 
-	get_registers(dev, CSCR, 2, &tmp);
+	if (get_registers(dev, CSCR, 2, &tmp))
+		return;
+
 	if (tmp & CSCR_LINK_STATUS)
 		netif_carrier_on(netdev);
 	else
-- 
2.54.0
