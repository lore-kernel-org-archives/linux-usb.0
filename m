Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793785907;
	b=RZiS1OceKY51FlIJlfoHwJqB8UFxapM2xzeXSsd0omriX2ROoT/+jOLMfF/G9DBGEHew
	 rtkfrqLtsBBmm14WJRRQA89UwR5Kahj5tnpCXrPInjvtlMX4eJ3lY+8wfCRnRTl9Br2Kd
	 MAZduzSXHu0At530hvNz9JQSfqRyJD8gXmjdKXQP3rzfjQIu++5G/YMzcMFjIpZ3sFYwO
	 tpX7w6wv/yeUdF5ZZyeBN3bS0VgCdt7PhmOo0gXK/O8sJR84lG93aHfq4z8atFuKfiK9A
	 9BysFF52ETpHZo0UWd+x26goJX2yOYFTmNSWNBrGB3K766bNChzHK7WNjAYz8Ze/k/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793785907;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:Message-ID:To:Cc;
	bh=ud2XCQBjp5pAckzKdyOgUkreuRmllKlNATcLGMEq2ZU=;
	b=B9I4HxWlLqKbY1+kv/opkG1LlznrwMXuB1sV/t7EWqvfJkBLLCB1hxR9jNa6fzk9996i
	 jvKMzP/czbXeSuvOHUYU/vLjd/kBxzajo2OUHZc+8CtxY1WNbHHsuFO1r4nSC3V01q7N/
	 E7RsuTZk5udUaSLseuELsP4LlMdNWWBAMLgWORdJH2wzp7SGTKmEJqFCiuyZD893a9+q2
	 sJCBYBxfzF50p6i1E3Mg4qy0G4dv6OJnYey4yxJsajEX9+WkxXasVQee43ZD0ectG0ie9
	 SkD+7N9ne8Tfd+Krm+d7bHSy1dVYLytmHX7KoPyFydLo7uxbtFvR9fKyrkm45RzWXSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DvzAi1k2;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5E3606A32C
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 09:51:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE5E3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DvzAi1k2
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-15ea896ddc8so917488c88.0
        for <linux-usb@vger.kernel.org>; Wed, 04 Nov 2026 01:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793785906; x=1794390706; darn=vger.kernel.org;
        h=cc:to:message-id:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ud2XCQBjp5pAckzKdyOgUkreuRmllKlNATcLGMEq2ZU=;
        b=DvzAi1k2XvBMsf8SAbcekaQNAsxBrdwwVvAUCPoqFhD8kyZ/3yIpeiWwIwZCUke8Ox
         cAKXVq94JjFzYEMN/wT681fVcm2XmEn6WPZrcqxQO8SHuv1Xpz2dMQgkJppuPhBtgvAv
         Vj+DEJktSrAtpRNh1H25LQvBOgt6VhCXwRuXHMyrl/pMJGsp/LPuXxz3bK0V6dd+6XM0
         1J6ZWC9g8jSR0EE7QBmcR/p2INFRW6p9CkL17Q8oHcfoXul0el+wLV3xJPhV0ZSuFjey
         tPds4gZiP0f98je3sd8U4R+a2s+3IuraTonHATGqi3mnxAGN9cZXTFVdOL5kVb1xW1TO
         LCQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793785906; x=1794390706;
        h=cc:to:message-id:subject:date:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ud2XCQBjp5pAckzKdyOgUkreuRmllKlNATcLGMEq2ZU=;
        b=eRwAXbqwHhkE1L/BPzTjkW2Jc3Q5eDXq/28sbWqFE73UoCvM4OtetYmkh25T8taobO
         Sc9RYA/2X9TAgwJSmK6pVQgC4MLZMeWF460jH44Ta8PqvnvnaRD+oJiX+o1IheXHxb6c
         HuD56sIRBpGD6JbVNh9BaaBwvJlY+nSdtwoOGlk71HSsUHMVUn4MLtwUBkTcxc9+rWkG
         u80bPfwA8hKNWrn5jZl1kE1DT/hNccYsdiUHyx1+B7VKbSa28O0pc2Npgw+uiAxyJ4V7
         2r7hzPQJqdfW9qmqo1a5Daqaj8FZvVbBeou5N93Nw/cYXaE3QE2EsVpYr1fca38j3kF7
         ZzaA==
X-Forwarded-Encrypted: i=1; AKwUvBzCSNeHgWEbqwUxe5zhFEpAvG545JTQNs/sClZPBCIuh6oJ48Z8P9zX5zqm+IuHA+2bX4g2y8t8qhg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XYXwC6a1O/9u9Du2CF9hrlM4p3HpwrzCg494BXHbVZcSfKRnZ
	F5i/yP82az1UcwsaoOFqKg3qoAI/llCVyOvATw4YnyU4mJ3LmG5eRc0R
X-Gm-Gg: AYBFou1/7Gcy+g5fY3FTFWFA6Ap9JNNsr0pW84TvnwZlJ0alEBcEaJLA+k0tqAGlPR5
	CNdLiIp4N4VJjMUP9ShvRqX5+b+m+OANswNVGZL0/TnLZojPz7eHp8LvfmcM/0QvepNvlYZ+S7T
	KTCJ1yfTVgfSjeZHBn1O4zZ+02gxkT9526a++GNA7VsMe8fG+7heD4LLUiyE6S2H3L+B2NN2693
	nq4eJt39nBnzBueLgUM4e6I0+c0KFxPAPIrqNzAd8UbVa52TzqLcxnrQtCZRdmoEO4tJobGxH+T
	i7mj9CBG9jGn8TttaLzdQo+lU8cjl2X2230GpwdHKwVQR3t+aGIF6vlUIEPadtEMAikj+tO7b9w
	CxwcsYMMsfjDG6+AdWwUNr2T4LNsJxxTMrXt9KQy8DT2HDEy9y/x8jjOExgK4IJxhq2QIP8rprA
	d4vKq1+EEOYMTi+qWtdn//BL3HZZ3UYZtoGOqqD0pcWNRP8pWomaIWUvhldMshIdf1+eZeFZngP
	FvevrKZQQ20ZLeWT6E1pPMp/FLevQvFnKsb79+Hf1kcI6f1MQVPzla4UDxU3gyzqzwudue5S4Cg
	VgrzrFVGBOZvK3qZn6uVTrSMjJOzeifQ043LIsftO8hJwd6SAT+todFSgtlniId8y00=
X-Received: by 2002:a05:7022:ea86:b0:19a:20d3:a3d6 with SMTP id a92af1059eb24-1ac55774fc7mr23215496c88.1.1793785905823;
        Wed, 04 Nov 2026 01:51:45 -0800 (PST)
Received: from [127.0.1.1] ([23.247.137.158])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c65194sm6044757c88.19.2026.11.04.01.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:51:45 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
Date: Wed, 04 Nov 2026 17:51:32 +0800
Subject: [PATCH] usb: typec: tcpci: free IRQ before unregistering TCPM port
Message-ID: <179378589227.74015.8259496684787732118@gmail.com>
To: badhri@google.com, heikki.krogerus@linux.intel.com,
 gregkh@linuxfoundation.org
Cc:
 linux@roeck-us.net, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

tcpci_remove() unregisters the TCPM port before the managed threaded
IRQ has been released. The IRQ handler can still queue work on the
TCPM port worker after unregister has destroyed that worker, causing
a use-after-free.

Free and synchronize the managed IRQ before calling
tcpci_unregister_port(). This ensures no new alert callback can
queue work after the TCPM worker has been torn down.

A KASAN test using a simulated I2C TCPCI device reproduced the
race while unregistering the port. The corresponding teardown
sequence produced no report after the change.

Fixes: ae8a2ca8a2215 ("usb: typec: Group all TCPCI/TCPM code together")
Assisted-by: ZCode:GLM-4
Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
---
 drivers/usb/typec/tcpm/tcpci.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index 6717ac914c6a6..580dd5256d0a3 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -993,6 +993,15 @@ static void tcpci_remove(struct i2c_client *client)
 	if (err < 0)
 		dev_warn(&client->dev, "Failed to disable irqs (%pe)\n", ERR_PTR(err));
 
+	/*
+	 * The port's kthread worker is freed by tcpci_unregister_port()
+	 * below, and the threaded IRQ handler queues work on it without
+	 * any port-registered check. Free the IRQ (which also waits for
+	 * an in-flight handler) before the port is unregistered: the devm
+	 * cleanup would only run after .remove() has returned.
+	 */
+	devm_free_irq(&client->dev, client->irq, chip);
+
 	tcpci_unregister_port(chip->tcpci);
 }
 
-- 
2.34.1

