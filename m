Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDE7379991
	for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2026 09:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785146317; cv=none; b=dwCDhSWDozsYNjfzBb2ADI4Owpbo76yoiG3yX9LsgwY9nCnh8tdIfo365919FNIX20hk0XdPmZEpLDQFlr58gAZIQA4vD6VT7+PN2JIlgft8EjIfTsOdR9+CSYiQ71nmFuSlWt5ihv8VN7kWOj6elUVVgi+cNq2dvRWwd4t9Sns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785146317; c=relaxed/simple;
	bh=CK19sufOPrVyDUGtt9TbvFfXeouakW4R/XyeqbRqgWs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qwq9MviPRcqYHciuH6/62Gtb8LRBuAiUAt2MyKn8XQvj0jhMdXtwuW7YLhHV2ukuQekxW7pAIrlKiMtRF7esyslFAlBlrHoy1XRHr5/8nN2aRlXnMQ3x/kWlzTv8y6/AAiIpggZpPbQjpG23TdvhmgEoD8iZdX5PxaFTchrhk8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JGiRLQU+; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JGiRLQU+"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c981c2c37cbso1842052a12.0
        for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2026 02:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785146315; x=1785751115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wR6uYvZxPPYYkNgZGPv+6qRyWQW12k+GSH5fqM2frck=;
        b=JGiRLQU+xTbOaL4WwvDntYNlitdnTYllwpbzx3f33NsWA19L5sOcMr9WI1/Vw4b1b6
         eF01y9VNoh2i6dGdshh8JXqVQFV9t7Vf2jH2KHqz+Ei3fB1rw+P/KO9k4HIGR77x7kEj
         XuzdcQUqnbvDHzHcKvErQWu3wTkc6wc9SREgz9gZP9FXEFzheBoGbE7SI1k+dbEHJKKx
         aBxXH4PP4H0fcs1UpKqFTPZNPwue06urbJSzZgqP7MMIUs0o6skJhcbqsIYfYrIBLsts
         grwokLFs1I8DPPPdqlTz7uA7UwgZyNSONU686jRAFT17pVgjmjO/thJ0IzpuW61p9UyR
         5XVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785146315; x=1785751115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wR6uYvZxPPYYkNgZGPv+6qRyWQW12k+GSH5fqM2frck=;
        b=l0dPT0Em+NhYWoAgGIyOAG6mYvy/XqvjLsQwsHKf4sxMpQYJROmz0Ok8kG8eCE9Ggc
         EO5rBW3IVSF5qTSs4btuNXK0Y5U1q1I2+3lLyMsh6IworCO9bpkL983s4cuyXR5i0UZB
         D3snz2MXFa64RydcsQFI4E1h+DIhqeRbrrOuu+sxTDNKfr43IibCMxaj0Z0XgXWLkHXn
         SAsqOxgHiVuyAuyXuhSJBcQUppbRHmkw4u8yuV1GVDemQi72T6EMUpZXeg4P4LErEFzf
         o8xB7xyXPUKAFGWFl1D7o5lnCsgu9UW9IeQFfUB8sQNcqkS/MxAPUw+PQsfORuvPn75A
         yYGg==
X-Forwarded-Encrypted: i=1; AHgh+Rqc8x3piPOQeS5EjzShPuwpET3H5ViySzz/KI7NC6DWIP52TBspqNGcgavhQiJYmlppowbRsDncfuc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4pH+k4Q3j9SUQtY9gcGdIzB1mjkjzd9V5HVkSc7ManGOOf96q
	7YAF5cI+Qsz2acSpadC9/RldYY9ubXGXtux988qVy7YddPcIxxoUL76r
X-Gm-Gg: AR+sD11+zc452JVufrPYcvXaUnHbB+1Iw1j/ep4bSkqDX9pfzPr1Vp6SH/DC+UO7lZp
	4Gu5FhpImZUd3uijhADHn81PmLYQ6KZsYzfUIwIPrNF5A04tUafVBq/g4anBPfOW1P0WmeQ4HcX
	mdJ6i+Rz//Cten7xtRLNj4lBGhtJDW7Vw2AlNSAaNVqsT0N21c2zJugRUAcdgRCYgnff9eRzl2R
	WjTFN4a4D5eUDfnWnOyClpfRvUuqGwBhc2WTixsa8TlDp2s8smWs9vhBVio8qhkBTxMOIyZ/qic
	JEGZAqRvPpD+gg8uBd6MqvPemdZT58BWuhw/EiPkHOkTxL0Ctzxzxq7brG1RdVfWw45IfIxyvid
	ilaK2q+gMqbflH/8C0PSTAPt54+kjcQMW8uCr8WnXAq/tyV0Vj7Lpat7ya7uytwacqjqbxZvhx6
	FW0u6y/z1gBZk4wLm+WJJxoVInDPW487PQXTlejQArlf2Kpq3H7fxe80KsmV/oAIxcdv/Yi0nQD
	GnTfdTN4V66rfI74w3o
X-Received: by 2002:a05:6a20:4323:b0:3bf:6011:53b with SMTP id adf61e73a8af0-3c67df1ffe9mr7420999637.38.1785146315325;
        Mon, 27 Jul 2026 02:58:35 -0700 (PDT)
Received: from 7cf34ddc0813.ant.amazon.com ([54.222.46.32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb66dcd38sm3014786a12.29.2026.07.27.02.58.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 27 Jul 2026 02:58:34 -0700 (PDT)
From: Jiazi Liu <jiazi.liu1984@gmail.com>
X-Google-Original-From: Jiazi Liu <liujiazi@amazon.com>
To: Thinh.Nguyen@synopsys.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiazi Liu <liujiazi@amazon.com>
Subject: [PATCH 1/1] usb: dwc3: ep0: skip CLEAR_HALT on non-stalled endpoints
Date: Mon, 27 Jul 2026 17:58:27 +0800
Message-ID: <20260727095827.11807-1-liujiazi@amazon.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mac hosts send CLEAR_FEATURE(HALT) to all endpoints immediately after
SET_CONFIGURATION, even when no endpoint is actually stalled. This
causes __dwc3_gadget_ep_set_halt() to be called unnecessarily, which
can disrupt ongoing transfers on active endpoints.

Fix this by checking the DWC3_EP_STALL flag before processing
CLEAR_FEATURE(HALT). If the endpoint is not stalled, simply acknowledge
the host request without calling into the endpoint halt path.

Signed-off-by: Jiazi Liu <liujiazi@amazon.com>
---
 drivers/usb/dwc3/ep0.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/dwc3/ep0.c b/drivers/usb/dwc3/ep0.c
index bfe616194dfa..b577a1b764fc 100644
--- a/drivers/usb/dwc3/ep0.c
+++ b/drivers/usb/dwc3/ep0.c
@@ -554,6 +554,9 @@ static int dwc3_ep0_handle_endpoint(struct dwc3 *dwc,
 		if (set == 0 && (dep->flags & DWC3_EP_WEDGE))
 			break;
 
+		if (set == 0 && !(dep->flags & DWC3_EP_STALL))
+			break;
+
 		ret = __dwc3_gadget_ep_set_halt(dep, set, true);
 		if (ret)
 			return -EINVAL;
-- 
2.50.1 (Apple Git-155)

