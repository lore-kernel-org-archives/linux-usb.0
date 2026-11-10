Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285021;
	b=AT6kIbf0j+YVAHXHKjn/p5GYKXYZht9hCRAxXGImZLSYP0mvGh0a48KXu2tmucZDnxff
	 LhyBCRsa57SYEBQGERSrYgUCPzpkfsFBNd94jSAYEp2wmm8n8gJihyGee7+HJ8oIghIZ6
	 ZjyD/JGKFDWrAHiurVMT2xLvLNyp76q3j+syrqBogsmfy+gVHEoRm2AGjCuP1b7RnCViJ
	 aRLLOPTm3AoNlwr/254huniTDwG6CMeyxc5siC1sEenFZWvV+iZsmoamzt9pz3JM57eTX
	 dAJij3sNC5cFpCXAIqaWSH4iy7Itok3ZDD1LOdi4FyLESO/F7/Uh1vRHigAA3xi/66A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285021;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=lyxNlKJrr7VosEoWkysr9zOPM5Qv8W1t3PwxQZCtDdg=;
	b=Thz8zN4/Ak1YgO3H1MRxcqWyhYzv0y8U3160YTvod/x7vCPicx8AXXABfAiTBmi98Tyo
	 7XQjNO+jGp5lUP9w1M7Wb5GlUW5mTewj9LN9VkSPGnktU5AEzSYOBSmOkAyvE7x39jmqS
	 MAh1C5c93gEoj7z+LWqpJVdLRKfOtkv9iJAt6s32OhgNXaXgObmV8zgqA0fLpNrkZXQG2
	 b69NctmnIQYQFCTOg/d14/ingR8wRGWOaL2kHZeWt92XRskH0VJ6svskNz+OOurGMN5p0
	 hqAbGg6q5vVKh6NyBqGTEvU/zrobFsri5ozc1CvPVLyf5xS56QPXX48JaAoy6KOJ2hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yhLF37tq;
	arc=none smtp.remote-ip=209.85.222.174
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D309F60A2616
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 04:30:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D309F60A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yhLF37tq
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-93e6eb77f0bso138105885a.3
        for <linux-usb@vger.kernel.org>; Mon, 09 Nov 2026 20:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794285020; x=1794889820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lyxNlKJrr7VosEoWkysr9zOPM5Qv8W1t3PwxQZCtDdg=;
        b=yhLF37tqJVy0RfoNOIf341vWvPM2VDB5/dEMhzJJI3vGi5Rv89+jEKjPQLGvAd9+EE
         B136HDRR2rEQSDkoJEXw3SjIp/h8jyoz7IFvxJ/N7oaaNQvJfagJt0d6CcURrIi/LlRZ
         ggYx0BKb8mxQ0nYbwkFgg9+sEBPGIt7Iy9c9Obg0g+ARQKLkJ0qiSHKMBiTJt3vDA0Ze
         b3vh6CD1rRKiF0Qx6tPeGkb1QYRW4fwGtemv/fN4QLEr+SBoI+1gGK6ihzmqSAw33wKk
         nzRkugrVd25XwNdm+pPLt7n60ejuUE924YhaGX1QAsI4vl4RZza8hQKR3UMfrV0h/uyl
         d/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794285020; x=1794889820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lyxNlKJrr7VosEoWkysr9zOPM5Qv8W1t3PwxQZCtDdg=;
        b=FVME+4LxNt9U2PENoTSMBxpTu0aE+IPGw2W3L6a0p8Be/toElLXyBi5iSnZPYnwCTV
         +4oSKDhHzkzy+9aZ0iy2pE2g3DwbbIiOzjapoZc2rqZZNrYgmaBSpK1RfU4FkXEweuCl
         I1TDC/KIn+ydA2K2nTIFDgg9Ty9/BKpfUjwSKR/iuXp4K0Ujv/dgZ1eeRGQ5tXDAv5Wq
         Z0F09daUZ/dbMSIh0NcOPKSfGxyHdE1c9lgPv0ruEuIZgekXNyEXXtlE7VXXFyu6QZoV
         AwfI7uGig/pFj3tlIQMWGehQoYc7xguFZE0T1AugkZzh2So5oqGbhAtWEpky5eLlWm2Z
         6Rfg==
X-Gm-Message-State: APuU4Z+7ykOPO+qzxX//GLi1NK0tqBQDCgiss38z3IueSXgH/WuYvik+
	gmUL67jv+PZYlJkrouJM4IuberHF1zVeSwL3fyGCE5WH2t/DwIM9kcQ=
X-Gm-Gg: AYBFou0jNihCdK/tmNYj/ZDJXlgp07neyg+RLAmZuvFy5Gx+Imo9UoZ1dA+uIwWso1r
	jpFL48t9F+OACxFP6wlTJX0Ae/7bNgf20ssZxszBybvcFzSSM1BZV1wk3eQoLyq8kpAUWKVTtY9
	Q04vPL9mcHR7Fva+tCZRW1/t+zu5idlpRWukIgqbvk2zKIYFV8kuvb3pTLHr9GVhMm7HDePSTm1
	JS9O1GBXepNdnfrXjEH4D7pDGp9Vps72d7cJju0me+QVGNRqp7ZOwb8rPqVW12rGYUH1oEzd2zF
	gcDo66DAkHEO3TceSPvBN9Wj4JaI18V3uA06VIf6qkOb5dlKkWXVE780DtUO6zekwbH8QCs3M5r
	z3hnAn/Vd31NcRB4uaGWT/tAGGoh4SuzLqB826kVGhqTD7jk49VnvwCq3Hk3v3p5E13QyCH1GWz
	YmHhx7D3ngS8JA6SIR9aGphgWgIKA5guYK8/iAmOOsDxbNc/ughL9AWs26MCDm25oA/mXBfRMx3
	N/t25JdAZlAt0PjH8ePE/Kwgb0wnS2Yqa5NHXDBs2IIlIMxcy3vhIfsjreOKb7yjqeYXiSdDueU
	aZ8kF3593dSRJ8yEFHXEGnYWtfqNYSxhSQHGG7zvRinzTguzwsDBQ3B7CuRZGlIlpqUcjpTbsPp
	Arf8ut9fDpjOrr3AWpOqLwa4qtjRVeF6jMXnggGOCdUR6r7kPsXK3DS2sk+Bam5Ry
X-Received: by 2002:a05:620a:2a08:b0:93e:c12c:9b6b with SMTP id af79cd13be357-9479f3e4359mr239464285a.70.1794285019816;
        Mon, 09 Nov 2026 20:30:19 -0800 (PST)
Received: from localhost.localdomain ([104.39.152.7])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e619affsm136779285a.4.2026.11.09.20.30.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 20:30:19 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: Petko Manolov <petkan@nucleusys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH net] net: usb: rtl8150: fix rx tasklet use-after-free on disconnect
Date: Mon,  9 Nov 2026 23:30:16 -0500
Message-ID: <20261110043016.56986-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtl8150_disconnect() kills the RX tasklet before killing the URBs.
Endpoint flushing does not wait for completion handlers: a
read_bulk_callback() that passed the unplug check can still schedule
the tasklet after the first kill. During driver unbind, disabled
endpoints make RX resubmissions fail, so rx_fixup() can keep
rescheduling itself and access freed driver data after free_netdev().

Kill the tasklet again after unlink_all_urbs() has waited for all
completion handlers. tasklet_kill() drains any late tasklet and prevents
self-rescheduling; disabled endpoints prevent it from leaving an RX
URB in flight. Keep the first kill to stop an existing reschedule loop
before unregister_netdev().

Found by a static analysis tool under development.

Fixes: eff674a514bd ("USB: rtl8150_disconnect() needs tasklet_kill()")
Cc: stable@vger.kernel.org
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

---

 drivers/net/usb/rtl8150.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
index d51e43170e03..98c36c377956 100644
--- a/drivers/net/usb/rtl8150.c
+++ b/drivers/net/usb/rtl8150.c
@@ -971,6 +971,8 @@ static void rtl8150_disconnect(struct usb_interface *intf)
 		tasklet_kill(&dev->tl);
 		unregister_netdev(dev->netdev);
 		unlink_all_urbs(dev);
+		/* A completion may have scheduled it after the first kill. */
+		tasklet_kill(&dev->tl);
 		free_all_urbs(dev);
 		free_skb_pool(dev);
 		dev_kfree_skb(dev->rx_skb);

base-commit: 0edbc945eb9edd0086f25b151a79cfe4adc0dfa8
-- 
2.43.0

