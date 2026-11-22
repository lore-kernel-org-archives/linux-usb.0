Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795348610;
	b=OJac3hUCixkbubfOWowZ8nIt3YDYlLgRKq67EmsmJH1rM6r6plMpNdXitdutPbnZQifN
	 nIdNbOs6TPpTAcbmm8W8d3aIYAoWeEPeWT1hwzl1DN/I9CgVsmLk/SjX5eIquQfJ2BwGJ
	 yw98LqxVm7Dos9w+H3iixSSL0DmV6jx1Hdtv55IVcEdrNIQJFKW/4s/QDbQcJ5lpnoIWR
	 qI4b44VRauy649BmNLpQqBh5HHtnpXko7uEoZHy1X2tSc0YJNzyl6Ky5sYyjiYMaRghhZ
	 LLgANeapT7Nk72hvjqwL8WgMixqUa79RKjVkEfw0BGmFj6q3enPKjNEAxF7mO4ISvDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795348610;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KD9ED2MqTv4/+phnYY6+icCa/NG3RCXJ1b2cfyWY1jo=;
	b=q2E3HL2hjFQr2orH9gm0ALFlHQCzGKTHE9YEQqDu4/yN7kghd4bnaUIWDJ1dDnxmY09l
	 yGHgXiN5++Lj8FbCRQ4c7q3PkGR5CbQx1l3OaJWuEOmOGgTnTwcSX7adTnmC1tjJYvgvH
	 zIdy0DHzia/FlZxi+c4y5UPIniyuMHYUVLH+A2l0ZMnlgkoJzEu4RkLJVLQ6EM9pLbzcz
	 RmpiXnXOrp7zocx3K70Gc+5GY/jk+KLDxJmlFrQqNMGvdraw/T8wUVgWz4tCyUgI19Tz2
	 pFTZam3YJ/x8VKZTATZaSrdTbeZLkQHF1YUggr3awJY3fq9+ZhKWtVY+uSBG6Q2WHtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LVZYJPUy;
	arc=none smtp.remote-ip=74.125.228.135
Received: from mail-ej2-f7.google.com (mail-ej2-f7.google.com [74.125.228.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC738606A32A
	for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 11:56:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC738606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LVZYJPUy
Received: by mail-ej2-f7.google.com with SMTP id a640c23a62f3a-c516a1622b7so50646966b.1
        for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 03:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795348608; x=1795953408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KD9ED2MqTv4/+phnYY6+icCa/NG3RCXJ1b2cfyWY1jo=;
        b=LVZYJPUyG66DPQyzdEv+7OKR8xiAXQqwH14IETsmnMqd6e/C4uASMjQeJInqJhn5XG
         q/e6YUjWlf+7hgHSUZehItWpgyUyZS+p4KPndeFw3aGaDW8WO5gWERrxInbsLqLI534b
         HMd+TfWM7AJ0Z6bNhGUII4audziihOGylEaTHct9/HOcJciuHtB4rE9YoVip4wN78604
         0rO9Wj9GzxmnQM/QBmP4gHB8IUAtAnwWOjM7g4aMRUGeYkSO21P8LQd3XV0ORYivpx6M
         SXv9uHMJnlIF/zsYrbx5AdVdA/+37T90H9En3meR/o4gb63QVp2cZqwCLCgn2+gZ9eZS
         Jkbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795348608; x=1795953408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KD9ED2MqTv4/+phnYY6+icCa/NG3RCXJ1b2cfyWY1jo=;
        b=fRWgXG6jUA3AKfbBo0U6Y/cpNfYudO/S6i4DQYKnWBay6B7PVGBqnNUPGM+7qTbYtV
         jKl2/9PRhoFG5vR18UAcw00l02s39Vc8uz5aTxr468X/Yi2kp8ylR1QrYzIIru/Hx0Dm
         VWsdjQdmrAfev52nW9pKbfxzKXm4FX2QJ7a64UpZDxRgbjsEXoY0nxPZiiRPbGs5uIGG
         /PQuQAIQPH55WCklqBQcT5ARGuMYYQ0N54IPG7Wlh77TN3xu+8P7O7ndj71vwXQcIMrX
         pGnUlzDYZS0cXwPWMk/xSjyHyqzAiXE53iAwmjito3GCxmsMkL5eO3qNVCoFc3eyWFM6
         dfTg==
X-Forwarded-Encrypted: i=1; AL+hErGP8IvUGzGO7nHOXE51EhP1kmsDiUfUXo7ZjVVqEtHvVEtv2dMn7Qguzfqz1p+N3bN2tYta3FzNWfY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sqAwEmUK0xR1leIkMNFD0Xr2em4AmcJbwv/Ys6emGx6tyr36V
	Sqq9n9BLN9/afcelJad6hjL4kcpekX7vxHs47a91g5UrbGV9dJf4DVQ=
X-Gm-Gg: AZFdTZfGVl8Z7d9JQNzqpS5J1hmnz/DealcbpxO9OiytgucEU4Em1Zhz4OLWLf38aWO
	Bx8gqwGjUbt+NuSsZpTtrPhwvfglHQdpjIcvyHoMYv3b3Y02El7MbI+s2fSmXybvBeyehglRjCJ
	bZuigyxvfKf0q69h8z8eWiwt9hkUu1zlBKTLB0xoctCVbhKDz4Zt7zuGzZLuI/ukoqlVQUHEoy6
	kE/7cSzQ1JWcqcZXqdfHEt77Rxgov4uuemCvL3mgWVnCUCIdVsJC/lC4K0t9++yeu6l+h80kUhE
	HUOdBud4+UB3rBRTWul9e8xqikutptgS+qcD6s4DE6oQTqcy6NEy0/qG25aUFJzexfvUUewcsPI
	gnRxvYnJ211Aew23s/Lxy2JyzwPtuu6OzNDLJQPxUes0bX6+J766AwcclFtFc/SFZYz9Cj62Xpf
	48DqRx0JBxOJ1uGEtc9XiGyQ3QDViJPnKQsNqPd+zw4vQJbpLB61Wb/yJKNJ1dhvmghSAd7HxKO
	+FEOSrRQtUzEsVE5i1tF5Bn7OgizUzJFg27ln8TJx9VIn+uzwEN6k87H5gw3ToPqKD2obVQ3xvY
	tnRRRYL0q/89EsxAJaO/4utUvT9nTexj/pPtAwr3ARVy
X-Received: by 2002:aa7:c148:0:b0:6b7:8444:a44e with SMTP id 4fb4d7f45d1cf-6ba37cc0b7cmr4214881a12.4.1795348608196;
        Sun, 22 Nov 2026 03:56:48 -0800 (PST)
Received: from llm-01.drunkbatya.int ([80.251.127.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba36e362bdsm3932556a12.5.2026.11.22.03.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 03:56:47 -0800 (PST)
From: Max Andreev <drunkbatya.js@gmail.com>
To: Badhri Jagan Sridharan <badhri@google.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kyle Tso <kyletso@google.com>
Cc: Max Andreev <drunkbatya.js@gmail.com>,
	stable@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] usb: typec: tcpm: fix missed frs_sourcing_vbus() call during FRS
Date: Sun, 22 Nov 2026 11:56:38 +0000
Message-ID: <20261122115639.2912666-1-drunkbatya.js@gmail.com>
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

Fixes: 0908c5aca31e ("usb: typec: tcpm: AMS and Collision Avoidance")
Cc: stable@vger.kernel.org
Signed-off-by: Max Andreev <drunkbatya.js@gmail.com>

---
v2: moved the trailers above the --- line

I'm not test theese changes on mainline, but tested on Pixel 11 Pro XL
vendor kernel 6.1 with the same _tcpm_pd_vbus_on() code, as i see
mainline tcpm.c is identical in this area.

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

