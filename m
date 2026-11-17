Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794914130;
	b=adAt67cuBnneKg4Xgj7c3yJQoEe8WAqBHKg/ToLTqySwEj0XZXEJErsJIkahOccCTE1d
	 Uk4Ws7oRsPqSFg7bNet7eAnE1Ub4D9mBJIjLNfa+rUYnzKQVPSLCiN6bsU/1ZU66iar52
	 Mk/FZ7HxlVE8H/RkQhCwEd2rSaWJTGiw7DQrEFfUCj6kXek+ZXduwhmQFVRknE+dPOkzt
	 wwN/749X8eon6DLtHf5GdTS+IR7bc90ol0ryavMNpQeOtvbn5EmJxOBCxj/1Mu1+kN6ui
	 UH6k3aAMlX2FEwG8sRttTlmL4ffYLvjvm8T//9HUQCrIddPnZxThmwHraahx2WfKg+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794914130;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=9J3okju34MNnR27FDiPAaP7UT0/s47A9W6uHOHJn+uc=;
	b=tl49GxOi63xkbWiTnxAtrqkq4PRZz8/16EWNlfW2YwU5jhoBqr4l9ONxUcBGEytOZr4V
	 zNySwDjmlF0yao/5Ksg2j54SNF9moSmWSJacCv2PNnwBHZ2tQMXHvxFA1K7C4eEeMiZbN
	 m+xNmjU1iQP+Z5iRfM2TT6PirOinA+qPYOyYtFctlNG51YfKdYuYkJcESF3BnfOqAEzQo
	 eicZf488xW5UujT7apzpcsnS5/ep07nGU3zmdP+wX/4MCeBE7LNRNLK8cDfWRGiDO+jv1
	 XnpAUPl1Wy6OY4rK3perGVI4J/mTmRXGYrZaE8Mi38nBTyeX3AUxdsU4jCN0jLMD6vQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=CBz74zaC;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB79606A334
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 11:15:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BB79606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=CBz74zaC
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4b467581b98so41319695e9.0
        for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 03:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794914129; x=1795518929; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9J3okju34MNnR27FDiPAaP7UT0/s47A9W6uHOHJn+uc=;
        b=CBz74zaCPQeAfGLV4TbDZ+4TFW4hj7UsHko7rb3gYFQTHdjD+QfOv9Rj9HCaXnEqGH
         +XIVedkLIMeW5zp7xTNk/hjaBXQ8fCvjOBThBVoE/F3wQXZTRIa+pasmFLg8my8d3deB
         VL4xtZ+eZtBGni5pQ4buRdH7nfnOzXHgFR7SQV76JoC6ly474ep9653PCXcAGQAT/TRN
         HPY6nG8F0P8zLOTCL5Kw4m9Oo6EQfVfEjOJrSJNQdp/pcgHAPnAipU61cTA/hHHP0O4T
         BW+tMUPA4yQgnG4vWk+t+vpeHTslYrLUMNz5nOjVSFEavfTMN7Eu6g2mtGMtIlSbG3IY
         OLsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794914129; x=1795518929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9J3okju34MNnR27FDiPAaP7UT0/s47A9W6uHOHJn+uc=;
        b=GTeXmp8P6d/59ouC6XvAYYEred9koYzxlkBz5hLFBwHN5XUDhQwCNCbuRRX+d9KxmF
         bPvTeZ6tuxIVilsGX9dms3x2WG3QOf5R2ebFWoL6Ktln7dF54Fxn0QagVx6evfT9l2vj
         HbJCC3jckG9exh31GeolwJlBfuGPVX5dxCuPXNrmvgZ8treNdMQqX0gp5zk0hnVHgoXG
         euDQ2V9UMyKybhmgah1owDQkhNlUtvtbEYM3seJ+JmAdsjcj2lRsMjy8SKJ7LI6jD3oH
         Jh1iQBdubU9AgwQKzUVS5zLsJqqndlo9rc3Zz82Ya66t1kW3iXJ1/ZJfaprq9SQx6vio
         G7eg==
X-Forwarded-Encrypted: i=1; AL+hErEDUgRu9yuBjltLJ/3pl26LppNg/gSElOU+OmDt2kRHNLNL0l9zMVzUQFuE2ZvZeBAIzuG8sQke7D4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xWVV0tP+litPhyHpXTTf4P22ai4gfNHCILd3j2EE58qfPeHTa
	cdm0m5dofOzmDVXqcP/B5KiqqHllT1i7Gj/AxgVdNroVsJK9Cb8EDZPpPhPS7YSBS40=
X-Gm-Gg: AYBFou2UfK5/1h/Mz/o/PPDuKaPd8hIB+tAnDYEoE8Z/bp+5HRIezsY1Lki1KWS/wvV
	cbM+ltXe921/HV95FBGbJEPQpJIEWwjYemo6is35bXKDWA8tT98PxmMy687gzRcaWuo3Oiq2FnX
	IvJpDLXTG+Ta894nGMDJ7+of2sTuRXAKNGjnaQ+k7XBAs2b2k/L7YWJmv/8HrDv/F/f8FlJqpar
	6ptb50MNs5MB5/xt8PrulelmAxJxJMz8CBka+gGWyoJrNt/j8WxYcrKSD6sn3jdd322SUrI91Gu
	2Qf9BTLAXI+IP/4lBzrTjYPRuf+1IUrDN726cY8gFy5HvO9dbSZAxXGuMdvnHsTi5V6dmxsvfkK
	KKwghEYCcxzX67+XPmj1cvj12Rn9uxsHlPog3MYdV2ht7OVzy32YrxX/GMJZT33b01Bhk5NsBHq
	zQ6dZlmHg9eMCZCXz28Bdiq/G6hl2z/syVpksHqidh/1Vt2Zws32oA+kvD8ydagn1DBvP55X+WH
	TwQuRUWQUY2ad/uX/U/CwM2n2aYyJBhrG3d1KDZIaxhjavY/VHMypLOnDuyrJkX5DOmLlGn8Hh2
	5TaAIuE65DcwmpYCIjdpeCVb89UIOqapOdyuEZvVjNjwyMJYM1Kc3zycXrlyntJXgVFeD5uS0xN
	vXrIGzDGkiA==
X-Received: by 2002:a05:600c:8b56:b0:4a6:44b:2593 with SMTP id 5b1f17b1804b1-4bb55ad0711mr284989995e9.29.1794914128746;
        Tue, 17 Nov 2026 03:15:28 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f8220sm59773745e9.5.2026.11.17.03.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:15:28 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 17 Nov 2026 15:15:16 +0400
Subject: [PATCH 2/3] usb: typec: tcpm: Leave SRC_VDM_IDENTITY_REQUEST
 whatever the cable answers
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-tcpm-soft-reset-sop-v1-2-c7e1543828c0@flipper.net>
References: <20261117-tcpm-soft-reset-sop-v1-0-c7e1543828c0@flipper.net>
In-Reply-To: <20261117-tcpm-soft-reset-sop-v1-0-c7e1543828c0@flipper.net>
To: Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 RD Babiera <rdbabiera@google.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-usb@vger.kernel.org, Alexey Charkov <alchark@flipper.net>, 
 stable@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1956; i=alchark@flipper.net;
 h=from:subject:message-id; bh=GcD+2Vp+u0FkZkbqOsmPAdEh3rJkylbYEoZ9S0w4x4U=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWT9MfcydXcz60u8f7Oh0rO+JiJtmfe0ApPHqSksR1qc7
 83b+nJxx0QWBjEuBksxRZa535bYTjXim7XLw+MrzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFO9Q5uR4Y71dIXi93fuJYuzyQcmpCgv6rNelPRNQ3rxo1Py1d+maTD8Yl6xY+G
 cHX/+CxqrJE4VW5QtfWNyIn9djMPejUEef+onMQAA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

When its first Source_Capabilities goes unacknowledged, a source that is
the VCONN source asks the cable plug for its identity in
SRC_VDM_IDENTITY_REQUEST. Entering that state sets upcoming_state to
SRC_SEND_CAPABILITIES, but the ACK and send error paths go there
directly and leave upcoming_state set, so the first SRC_READY after the
contract sends Source_Capabilities again. The second negotiation can cut
into the sink's own Discover Identity, and once ended in a Hard Reset
between two FUSB302B ports. If the cable plug acknowledges the request
but never answers, or NAKs it, nothing leaves the state at all: the
source sends no Source_Capabilities until the sink gives up with a Hard
Reset, which cycles VBUS.

Schedule the move to SRC_SEND_CAPABILITIES on entering the state, after
tTypeCSendSourceCap, the interval between Source_Capabilities, instead of
setting upcoming_state. Keep the ACK and send error paths moving on at
once, and a message from the sink interrupting as before.

Fixes: af8b627046bc ("usb: typec: tcpm: add state machine support for SRC_VDM_IDENTITY_REQUEST")
Cc: stable@vger.kernel.org
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/usb/typec/tcpm/tcpm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 8c5be904d772..947fca918414 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -6553,7 +6553,11 @@ static void run_state_machine(struct tcpm_port *port)
 	/* Cable states */
 	case SRC_VDM_IDENTITY_REQUEST:
 		mod_vdm_discovery_delayed_work(port, 0);
-		port->upcoming_state = SRC_SEND_CAPABILITIES;
+		/*
+		 * Go on with Source_Capabilities whatever becomes of Discover
+		 * Identity, unless the cable plug answers sooner
+		 */
+		tcpm_set_state(port, SRC_SEND_CAPABILITIES, PD_T_SEND_SOURCE_CAP);
 		break;
 
 	default:

-- 
2.56.0

