Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795348511;
	b=mdWbfIFQ24Q5mtPA5HGboZk15sK30aEShRodQqmoH3CUexeLG2bNBXCek1845mhwIGpf
	 D1jIo2Q/mv8tQmSZJzmZAVJI9bzQ6nU9HvLv9uOH7vT20jLMq1b+VI5pKaYf5iW2gb6WB
	 JzG9jyNpX2L20BPWXLt6RPqnr9rTwcajgESZeQ2XbNUpGZCjWh0w5mDN/xRUGOJrZPJKK
	 g4s+TOuOp/JNZ84Tw1GNwEzo47PeP3u8ZS4KKxK6qDMJBuQGZ0h8rj+YZWCs6F8rszoOV
	 Le+u+6Uk6E1qbZL9WAwROH+8AHvsBKlc8YLL/CB9p0pOL8JJNAK473F+3i21ngZRRwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795348511;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RZ0O0POJrr0conSKv7mDqlSwmUjcS392Zlp+KvMCf14=;
	b=gudG9tIG+oKgVjRXlI9L9JCcqi2+mWEGTVsHaQeempCtAb8eDnb88nMfInIl17bGeXre
	 YW9aDbZMb96xQyfCIYMC8h7WeAhDjW018VIXIHwZ7/hCfOeEJ55nrMrJAWGyzjpGl72hf
	 8QkwqcUYqOC5JOfo9O5niS2S0osRSUt3i4zSoUz4dlknd26qwPePdJkXL3LoVCX+z9OpC
	 hiFiWGJQzpnpVml29wo2gV7RENbMivVpmU/jah31ObhbjMDdf+F+jQknTrJBwwC4LJkop
	 VSwestg/ccP67LtJKphyNqzZJIEjUvbWNrTMUUD60jZ5SVUDWLFMaZDG5UyyOU00yIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZN2r74KI;
	arc=none smtp.remote-ip=74.125.228.134
Received: from mail-ej2-f6.google.com (mail-ej2-f6.google.com [74.125.228.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9BF606A32C
	for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 11:55:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C9BF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZN2r74KI
Received: by mail-ej2-f6.google.com with SMTP id a640c23a62f3a-c5055590e0cso118326166b.0
        for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 03:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795348510; x=1795953310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RZ0O0POJrr0conSKv7mDqlSwmUjcS392Zlp+KvMCf14=;
        b=ZN2r74KIziq21AkKRBZLDJ7DvPxD7SBxD19TzD7BUqNDbo2zoEoww15mGDen6YvL1h
         zwLAajjPeQcRT/hPlTmh/eQGAn5KKB2wx2KYWpQ3FWE6CV5UpyHuWeDQI8+xswW4UFpG
         p4hWKBucX9xkypVNyEG/2rgeTSej6yYeOlCCnD0rT0C+ya5haMNRyHZMhU/QrGjQGH7/
         Sb44uYB9E9sjmlNdWR2oLooBJzHv5YmquQi+5sgywXCS+a9FvJdk5cgK3nHYl+Er/8BK
         RpqUoIcLBNxfp8ZxfKUHaYdZIl4AMtR6xIZGE6v9KWJrDzyBy1H6aE0RQ6b1BxqpXhyG
         u47A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795348510; x=1795953310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RZ0O0POJrr0conSKv7mDqlSwmUjcS392Zlp+KvMCf14=;
        b=DNshZhq+UCOM4i355Q0NMm/bInm2HvzzI+9M6uvYDiJfzc5ry7eBK7mSni0JhlJvDH
         tjAHoJpCK2MGnt8uqWo9ee1Sb94oFVJRtdaklI7fRl39H/vQ19qo4v0eoT8WlcxQty9W
         F7PS9ySMtA1XapKjg+PK1LTTUfDC4Asa8PWL9ZPTBgMlV2ObsrXW5dMfLcWtCpDTeWhC
         FvbugrZqLFNql/QLiW/m40bZmXvO5+nfAloV9ue8gX43uBJEBFWSHJYtW580D8OAMV90
         tOLkHR+di8M6YkdSe5Qs8wbXfqsyQcY2MRsVhrUWn/vuafMPidtsScK7VTzsjwQM6IIw
         1StA==
X-Forwarded-Encrypted: i=1; AL+hErGgjibX36kGewvjgv1ucfxHB5YreOhuwvSy9Rl2+FhlMQgg2XeQD/thqYXkQqPoLKpzeExwm90AqZE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qljasr7idwl/VJXuTUGH12kjs3kU1xM/loL/Ri8RtavYhxt6F
	5ko+w2tcruomH6IZnCSSKh71/AnX3uUXDDGk8vVxNBbBr2Yrc9TKk2M=
X-Gm-Gg: AZFdTZeR/ASBpmnpTD8h2q46tQ7tQNuQfMVBGEQq+yNIuvyHvmXUuQ5K5L3yMJFMWee
	X1mKhLLImwqMrzHdbMrCtOHimszjMtik6lxDU0z4QHJssFg2HD/+wsqM7b3zFlPSBICA/znXSxs
	Svf4eeUfdTzFflYr7uoZGT+lf1IQBojIBCugJPyyfKKHOBK2xYDeqbT4jLWLbvk/D3fNArm1G8F
	R1vQR3XxWhSksWKjA2kSgUGsuw5oPYZkd6m5tPmcFO6JMJupIPs3E6JRgTjm9mlzhxZLXtKQgPD
	DmgWCPQ13yGmD2plU6Jnd/OoJldvhmYGOAV9VFCGgp3VafNkutXzZ1UOVUIxwhmC81uDZaQNPqD
	cMUsGipR8BHu7tCjPIij7p11emJyrENbEKQ6VSL7XHXei0/XSbqlVCdopTZlbnPTxS2ZlDTpAyP
	vQzCFUGrs8iJY/kIqLnL5P3+5BG6XfOvjW7caK0vSNI0Dv/eFw12Mxcr3haczmBXpYz1VMRrd/1
	ZHLB7KDKaoza8YDwVzRGJzD4PrRoEkARFswFHZV8rHMh1rN/XdpXUZ/inEr+iDZE6jr71vWmbZ/
	VPZ26v3o0Q4zsxlZjiBUj0WPMFwttJv3mP9gPXreM5vE
X-Received: by 2002:a17:907:6ea8:b0:c4d:4d5b:849b with SMTP id a640c23a62f3a-c513a8069bcmr771965866b.19.1795348509787;
        Sun, 22 Nov 2026 03:55:09 -0800 (PST)
Received: from llm-01.drunkbatya.int ([80.251.127.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae67bd3sm299486666b.27.2026.11.22.03.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 03:55:09 -0800 (PST)
From: Max Andreev <drunkbatya.js@gmail.com>
To: Badhri Jagan Sridharan <badhri@google.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kyle Tso <kyletso@google.com>
Cc: Max Andreev <drunkbatya.js@gmail.com>,
	stable@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: typec: tcpm: fix missed frs_sourcing_vbus() call during FRS
Date: Sun, 22 Nov 2026 11:54:53 +0000
Message-ID: <20261122115454.2912448-1-drunkbatya.js@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <2026112206-lapped-unvalued-8696@gregkh>
References: <2026112206-lapped-unvalued-8696@gregkh>
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

Since commit 0908c5aca31e ("usb: typec: tcpm: AMS and Collision
Avoidance") the TCPC reports sourcing vbus while the port is still in
AMS_START with FR_SWAP_SEND as the upcoming state. Because of
_tcpm_pd_vbus_on() ignores this state, frs_sourcing_vbus() is never called
during FRS.

On Pixel 11 Pro XL after an FRS from sink to source the phone keeps
showing the charging indicator, and about 20 seconds later VBUS drops
and the attached device reboots.

Call frs_sourcing_vbus() from AMS_START when the upcoming state is
FR_SWAP_SEND.

---
I'm not test theese changes on mainline, but tested on Pixel 11 Pro XL
vendor kernel 6.1 with the same _tcpm_pd_vbus_on() code, as i see
mainline tcpm.c is identical in this area.

Fixes: 0908c5aca31e ("usb: typec: tcpm: AMS and Collision Avoidance")
Cc: stable@vger.kernel.org
Signed-off-by: Max Andreev <drunkbatya.js@gmail.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 51e5c72799f2..5caa649a92f1 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -6889,6 +6889,11 @@ static void _tcpm_pd_vbus_on(struct tcpm_port *port)
 			port->tcpc->frs_sourcing_vbus(port->tcpc);
 		tcpm_set_state(port, FR_SWAP_SNK_SRC_SOURCE_VBUS_APPLIED, 0);
 		break;
+	case AMS_START:
+		if (port->upcoming_state == FR_SWAP_SEND &&
+		    port->tcpc->frs_sourcing_vbus)
+			port->tcpc->frs_sourcing_vbus(port->tcpc);
+		break;
 
 	case PORT_RESET:
 	case PORT_RESET_WAIT_OFF:
-- 
2.47.3

