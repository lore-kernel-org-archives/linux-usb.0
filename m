Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1C53BBA09
	for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 07:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786953582; cv=none; b=Z30rZLW0vDPa9/rl9t6A2G8oRfRSiJHCeQb3Kjvz2hu+NS0t+YZoXwvcHot5lhbwWAlFK3Xrl/k3/O1hGq1fc5rQKYqR90QOrLKsDY+bhtA6zoNXtSThb0DLbubzjB7RTKnKAGK/3olb3y9RfIGgupSS0JJV675k1ntlya7RIDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786953582; c=relaxed/simple;
	bh=KnBW8BLS6aQlEY6jL+vlcu3zyeVwk4M6Nt4RWQK7XAg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t4xsV5fOFZ3FCNaUCxU9bWuQFHUUWB2bDKiRPiIiAH34oFQn9ttDHF79KeYj1PiQHraz7FZkoHhGoawPBtXASMqZ4q1+CqrdVsHT8i3X3y86WYVZhDfAQ1rf85jLXyz6kNOituuBiTBqU4wBbydD0Mn+j9X56LvAZkyCoKZ/6OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UXLntF7G; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UXLntF7G"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cedda2ce6fso19429245ad.1
        for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 00:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786953580; x=1787558380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=24LNF4yUAGl/6XkYdvHOmG1PacVwjVePKHp8geKkeik=;
        b=UXLntF7GROAfeSHN/+96yTrECJac+5LW3vjofbmAVS6v8r/U9hGhp5X39iWqDZoyOB
         LW0AQM3CdrXm/KPJknakRLLPGvUX/6WiM7crRtPj94I9cns1u6FLVwXoT4kK69HU949o
         MNZJxsolmC5sIyfLqnt5OfrDtJeBD7TIPdUM7phYnIe2wI6kHYmUhFusj2FaTqMBs4PN
         ItMQ/eczHSZdjIuyADzzu/TcWUIv9/vCSWKYqvvSh/luykd8+iyVJIY0J/5l4ZgQ1JAu
         rhVrah/kEc9Kt255cZ5koDRXX6aMA+e74aJpZGf+5XC3Irw5eqT6savtpWdS3Z8Qy9xH
         PBbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786953580; x=1787558380;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=24LNF4yUAGl/6XkYdvHOmG1PacVwjVePKHp8geKkeik=;
        b=Q0+RtT00hQ8VQrHyXuGQtVBp9lh82cB9LqWbwwJg8u6LhUaQqnS4rfBtPuko4hwL1/
         RFSrP6dhpb57wCkGNssEogb8JcmrqI4sOQDOkZMJnY/Hi/FkiHiq7bZ3Uyg8e23lCu3K
         M7wHKzJzL/gLuuI/NLTerpUPCxvmuD6TYLVRb1mEdQhPPCgF+a3KJTsd3uvDJQMDY+za
         kKDkDmsUUWDWA+jrXjptKDSUuH+2Axt0j6NU05tC9fqkMvsJ/YJD60Ce6NImpyhSU4nN
         f7iUOku4mH++yoICm8sa/V7xm6oFIBnw8v9dBQF0IHmmqN+edP2xFeLch65T+PriGVsh
         S24Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqg4lx/uXmrcKBKtJSIv86frHFyo7Rxn50Z6fC/CYCSblXGlF7nxSvE5qY0AQ3eS6k9xVXOJXyuJXQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwafQZ3zySlheq6ZfvywfPjareV6tYSunxVLRU6m9AL1jRAT/KT
	uz+6fF84iD9Uk9I8GNzZ8ekJ5EshW3utypIk9Iv+3ruHcfqmElVQkmg=
X-Gm-Gg: AR+sD123jgQlcBaKvp2n2jZQho6g5kjmVa/zsav4Axvz2vo50IXh/xKvKvMTcYJ+eG9
	rNvXZaO4cUyaHgRhj3RSJPascR9RkvOEWwxkvhA+Kt58bODxcFu8MGgHHcJvf806i4GL+XwSXGI
	pJ3/j6TxOUkUQbVGQqlH4vu1rTKxgQ3Iuj4WfpTujdI0o9q6r/wVkWtqzF13U8ULV7fBKIr+1aJ
	WFXSCM7iwUYiQ830jPPyIYnclwmyFFMGptR+B8Pu5tckQpKSg+RO7mgiXhuTljWD0IXCJJXcndI
	KUSETApFzM7dm4CB9f/J3QOy/eUs/maQKbuR2nPnYPef7p3Ito5N7g0i2OaOQlM0PVefUfvXP2Y
	HBuuNESUQ2qHVUaK+FlXDm9NLfaDiYOh6hEdBJjrm80UrkrcUAlQBh0mA0dL6yD11OBnHOBpuXM
	7uBXZ60Zp8rN4ANOy4FX9R8Uw1nCYKHcIh9TA1r8ANHT90EkSV8lPV3UwFlDg=
X-Received: by 2002:a17:902:d4c5:b0:2cf:8131:75e8 with SMTP id d9443c01a7336-2d3b0c813f6mr243010235ad.13.1786953579729;
        Mon, 17 Aug 2026 00:59:39 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5bb499e07sm2036765ad.15.2026.08.17.00.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 00:59:39 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: peter.chen@kernel.org
Cc: pawell@cadence.com,
	rogerq@kernel.org,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Triet Hoang <triet.hoang.dev@gmail.com>
Subject: [PATCH] usb: cdns3: Handle ZLP request allocation failure
Date: Mon, 17 Aug 2026 14:59:29 +0700
Message-ID: <20260817075929.899795-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check the return value of cdns3_gadget_ep_alloc_request() before
dereferencing the returned request.

Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
---
 drivers/usb/cdns3/cdns3-gadget.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/cdns3/cdns3-gadget.c b/drivers/usb/cdns3/cdns3-gadget.c
index 42311c1bfada..6211e1f2c0c1 100644
--- a/drivers/usb/cdns3/cdns3-gadget.c
+++ b/drivers/usb/cdns3/cdns3-gadget.c
@@ -2662,6 +2662,11 @@ static int cdns3_gadget_ep_queue(struct usb_ep *ep, struct usb_request *request,
 		struct cdns3_request *priv_req;
 
 		zlp_request = cdns3_gadget_ep_alloc_request(ep, GFP_ATOMIC);
+		if (!zlp_request) {
+			ret = -ENOMEM;
+			goto out;
+		}
+
 		zlp_request->buf = priv_dev->zlp_buf;
 		zlp_request->length = 0;
 
@@ -2673,6 +2678,7 @@ static int cdns3_gadget_ep_queue(struct usb_ep *ep, struct usb_request *request,
 		ret = __cdns3_gadget_ep_queue(ep, zlp_request, gfp_flags);
 	}
 
+out:
 	spin_unlock_irqrestore(&priv_dev->lock, flags);
 	return ret;
 }
-- 
2.53.0

