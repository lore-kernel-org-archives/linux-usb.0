Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513404;
	b=vHxdklvx7ZpnK7J8fr/+1CO1VLBDHVJ4thtBrmIhZUZK7IUWPS2OhAVXvVwSl5vHrjb9
	 UJmQhB667igwPR6tJ54NIdBunVP3Y8nWCQFSUsGjlQ/4oaDV9FVkHURfrMZ4ERZugI7RL
	 Z1t9DsUhtmQYPpHuYorRqxOtbksVPXQfgS8R2RDhT2ZOvZ0j5hcOGuVn4cDQ9JULZicDe
	 vF0kCbawFFFghXxPQtjwg0jl14aUeDlL9wB/hDKOl/EmNGTE9EvTo66pb9vTHeZ3CNqAR
	 poR3CqS8g6OnyLTDhsHIUdB839q9f/MjnEd8AseOtEIIM2UfFcA75aulgdxRnCtHi1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513404;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Cys2vr4FxOC2wy4EP90QfgsL/al4QuIPLlm3DrOvvqI=;
	b=Ew5Y85/UnH7bJF8gPzPznRfF+OZhpXRyadK71E5UQUFh2C/UWLgzfs0jehWyQmEzXVYa
	 vPpTbloRYxyYGaqTlNKm3yAxrvrhdBeUJEh2glRA2+ft+sQpmqvKir1i9x8q72GWSFBdF
	 96RiRCZOlrrvr70Sn1D117BHZk4Qjc5r3cfp8cJxSmbNqtFlwv30IpMWor72L8QEBDepK
	 UQ9IzAg2LQBLAP8nGvRpAcv5cQoUiEQvnQAneJbh8EHnCmwAFf+QGmUBZjeaWcQXAldwG
	 luUkypoIvu+MOkUDESZ2b1fhfAZrbP2K0jrQ7/Ma14IV9XhZpCcag63+qoQoQd2WCLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="m5ZrE/oW";
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0756D606A6A3
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 09:43:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0756D606A6A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=m5ZrE/oW
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cde84cb8803so870851a12.1
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 01:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795513396; x=1796118196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cys2vr4FxOC2wy4EP90QfgsL/al4QuIPLlm3DrOvvqI=;
        b=m5ZrE/oWTcngpvpsna2vU20ifvNeL/BZ0WaB/4dRujJ22EPG9MehITuesH1T0KvJxN
         cX09heNyEpIl/dR4PmP7cIz9nJK29KDfFGF+5CpFo9xLuinJ8/k0ApAOpG/A0Q6boSYi
         Ku6wmZLuAsj+yvUvGh0HIpPX7Pjv5OXiOJ8+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795513396; x=1796118196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cys2vr4FxOC2wy4EP90QfgsL/al4QuIPLlm3DrOvvqI=;
        b=X1/hjwqu5moIEIqHnjhWB8PMP7YZgcEkBOfOk/6Ud+gMpC14PECgx2g8YpEoRhzKoQ
         XT1cmN0QKFXYniPKXfoWKLkrgPrkS+Itl8B9En6lPoqVqNLumMe8Gyf54YDuJAoijZDg
         Ta9AnCYpVgn2i3t+0u101Llvj64X6iYFueDU5VmVNDCUHFpkr4ea4NefFoRGrb2hjrPm
         veR3PBixFDU/+TejBwiMwbgevcR44v9tyQC4y7F/EP+q5NhF2k0poA44nnAY/7e45LVK
         vdwX3qP8SUTzfbmawneHoha8YLdb3kjqiPQyCp3ksuEuzl1pFbVpnQ0ZTy4PxCo6NAVm
         CHNA==
X-Forwarded-Encrypted: i=1; AL+hErFATIOW0zw8Vj4k4lpqLXdrQ3rgc8f8GZ+o5TrX/h95jOumktyerJwLxBtnIbTjBRcCsGeqCfqLAU4=@vger.kernel.org
X-Gm-Message-State: APuU4Z80Udq/PxAxW4zBWAGGEGzSFwAiBow1NuyMmqhq8V0SgkzQlHDX
	KpGlQsEP/9+uOBV4eEq/nJ4RwQf+HwKqpkF77UGAbo3ebEGaL3YaJN+2KRuswyhYO9wnNMPxM+8
	BcPMRRA==
X-Gm-Gg: AZFdTZeB4SSAwkm2n9oIaCJ06rOqwp5Ig22+T1I2XaP2CiKaDgGFn2Ur4nwN9F1GEDX
	cphrRyR24dElcQvVyUpt+vMAIpAuZmWViIhlQNGBODOtBhQDo0cRCxnQN8AFk6Rpf/TzJQsC0AF
	UHeQAJ6Qj+xpQhs2g3JR5XDfxy4jbtdk4qFxRw+r8r6LGKYbIJeSzoPENQ7VwxoUyWhbUzjqC2x
	NAHTeh0ELXegypn2nqx2/yt3Wp5GBNp9acywnnMoLvWPNf3Y0r/QX+ngMDJbQzmEzOT4m9g33/z
	gbua5Ai3UWHpOgn4jEgL7l4gpjuueIp2YiYuBbbfomprct35NgwIMddy+oykzbqcBZ1rTTjJc/r
	E9t9HfUw0wEDXEM7AjwuT0utMuzw+QrlxfAK4IFDgDIRw/NaNUUCVohPbXlgtJXIzLQOEretGZ4
	Uy351zRgyenzZl6txDN+QKKL4XmXqPQSoiZLJzLiYoLBjgrkz9Yt2U/Lv9lRbbu1VD805N497VN
	S50Y7UEZIDpZYwVwTu9yxHiWFkn/SupAzoeqMHsMZF6YUPtkdJXee/c0b/463NMexK6q6zvJZwy
	HCmHOOyjM4KlLR6HW26uS8A6usCaft3uZqhneF3JRZNdWa4o5QDJ/HAgntnYd5H0Ai5zWCR02lO
	nVTWBaw==
X-Received: by 2002:a17:90b:3a4d:b0:3b0:9882:9e5e with SMTP id 98e67ed59e1d1-3b41c8d488cmr13754267a91.18.1795513396398;
        Tue, 24 Nov 2026 01:43:16 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:8f32:8910:4727:ea03])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3b4b3c71192sm5790650a91.5.2026.11.24.01.43.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 01:43:16 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v5] usb: hub: Set proper message when usb_hub_create_port_device() fails
Date: Tue, 24 Nov 2026 17:43:05 +0800
Message-ID: <20261124094306.563401-1-wenst@chromium.org>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
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

Right now when usb_hub_create_port_device() fails, it prints a separate
error message to say which port failed, but otherwise leaves |message|
set to the default "out of memory", which is somewhat misleading.

Set |message| to an error message that is more specific to this error
path instead of using the default "out of memory" message, and also
print it as part of the custom error message that says which port
failed.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v4:
- Use generic error message as part of custom error message (Andy)
- Update commit message
- Drop Assisted-by tag
- Link to v4:
  https://lore.kernel.org/all/20261012092725.575885-1-wenst@chromium.org/

Changes since v3:
- Print custom error message directly and use generic error message for
  later, instead of using more stack space

Changes since v2:
- Simplify to just using a small buffer on the stack (Alan)

Changes since v1:
- Explicitly track and free the allocated custom error message instead
  of using devm_kasprintf()
- Link to v1:
  https://lore.kernel.org/all/20260728100005.413868-1-wenst@chromium.org/
---
 drivers/usb/core/hub.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 199d3f535a89..878d229085f3 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1743,8 +1743,8 @@ static int hub_configure(struct usb_hub *hub,
 	for (i = 0; i < maxchild; i++) {
 		ret = usb_hub_create_port_device(hub, i + 1);
 		if (ret < 0) {
-			dev_err(hub->intfdev,
-				"couldn't create port%d device.\n", i + 1);
+			message = "couldn't create port device";
+			dev_err(hub->intfdev, "%s %d.\n", message, i + 1);
 			break;
 		}
 	}
-- 
2.56.1.809.ga0b61035b5-goog

