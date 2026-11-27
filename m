Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795785906;
	b=CQBhR1zdG2wte16nywEJ9/5DE86MFfhrOKmTtQxy5yhv3dUf7yoS6JLTzS3gXE/m3JHg
	 +mUy4jiERnJVVb4xd9ElBk3IaVF9QdAv/lLocAuUSFifNM6ZBlJ2dTBUOf7UuGbNFIBSS
	 19hf0nDcPAfkICoWbWKDnq2OQya60EndBv10Um6e7hzBqJoEVMNJXv8RuksqBes7dqpCa
	 +xxJB2JLQ1X+cjxwKUEiXByg87jXuDqxdS2k5cJA1OP6+lb9YkEi+DdAAUdeBhZGDezvl
	 YzdIe4kDMBLe11bECVsPFl9w98aWuQXY32BZc4z2Xeb+Hjzo0OS0ZgrJxivyKbULCow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795785906;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LwhKEHOyEO9+u42//0OCYUbCH+AxqOH0RbDIKj60/dQ=;
	b=zXvWQsSNla1Y2Wt3m8gJyFcoPDbqOW17AO+nr5HnTIZ6c08DrjcLX9hhF3fbdpVVj3Qf
	 8iB9oCFL2oxsFa5D/NphkfKXqNWhSwSRLx9uME2hUTGDEIzkm9ccRmQoCAbycJF7kBxl5
	 enAuVWwuXPe9ZetRZ9FCNHRkuTBT6JkT9fkVyNfvgxiQisuZ8ZBDKoH9ddciEsM6Y10Jq
	 guZZXquUFsONwLc+g68jlFfuJyB9MjC2fU+cDdwOd/+cbipQvm1+AFOQsk8UWjKWW31kQ
	 8r0eRqMnfh4yrlizy8YohmEFdHXO9OqcjXoTF+ePV/H50smho5u+FtWHz+R8cH4ds5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ASRq3L8l;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8778606A334
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 13:25:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8778606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ASRq3L8l
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3863db981d4so11384439eec.0
        for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 05:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795785905; x=1796390705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LwhKEHOyEO9+u42//0OCYUbCH+AxqOH0RbDIKj60/dQ=;
        b=ASRq3L8l9m3LcjNpF0t+eQQPUJ9Fwq8EvMwI0BCwjgm3gdwZXYXEOjfQMTMWra9hL0
         8xz3OMkXgnsoDvetucfD9dY+3JNOzS2JndsgC9nZ40RTewuWaG1GIPQuulocrlONEYvY
         aCDXfa9qMYpHATNUIfUftcvdb9G57omxSKu+LkTEArByW0vbZAg7A3DzhXNpkSmi2hbX
         IjOLD14TmMQHkU7la0SUtLfkmt2vsMhcpNqaPBgvvP1MuSb+R8Rc5pdnchJiD0tK+yRe
         FQ+6a5jX8pvoRDPRC5HmnxJkjfgGqqbw65ngjT0En8kdYFjSMES0sLeUKDp1hd9AbonI
         4VIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795785905; x=1796390705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LwhKEHOyEO9+u42//0OCYUbCH+AxqOH0RbDIKj60/dQ=;
        b=wJU4Wd8cIW1DW9CZbiA45uj4/IKdJwwGQ7zlk+SM6VHfY3oHASoD/wniYAO2YbnR1Q
         0HkAg2PCP1FQWnViqOAx1WGeq2DNK5QHNb7dLcYPYBD0rJBCNFHRMMBumTCvF38VJnWT
         0cc+/piMQoI/5+Iy/Io01BlhAbPDdF74PeRy+CNUN+Ws7sttYTrpmye+ntpSZ8InghkL
         IuAShOhI+usLki2CtncTOcc8L/BZZxIoE6lEEvBncG4Vr87jgxpUp/1QEc73yVU64Asq
         9mdYtWp6FGxo4iqxkUbn/qdEnBG+rCBp/lL4uewPMhUFlS/IsDMpToYaYgANzH2T/m4O
         D20g==
X-Forwarded-Encrypted: i=1; AL+hErFPA182WDrUMS0uzU1paZAQ6ANWNb4LF6SvuYfTI/keur3rc041nOOUin7YFtgnmDKAbIAUZuhu+yE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+L8kgvubutMtZUQf3Ehbh0axMimxoEy9JGnEBI/LuRSg/L22kG
	X5qcKynnN/MZuKQA2m63EYBcn/NAwZcyYQiOym34MGUEwUGYUuOuq0Zr
X-Gm-Gg: AZFdTZcIvOVv5mdd6SU4EpNZWUujPo2/c0ovPV9NPDIe7Fdwi66RWWx+PcCRMSdYfd6
	cF+oONDXZATbDmCJ0xfMqbcZCXWlCZSMSao5Am4q4E7psaj2vuhINOPt4DyQ6JQZQyvGcvcBFSg
	gSM/PvhBXKpKxLeBaOeEqqlTKB1Trm11y3Kw5Ii4WX74Vhn/ZQqitwuNfnBKAUc4dI4M0maCcHM
	uNYJbkjbXc+77Uaml4rLGXKht1VSBKFkoYZtVqpqSN1IF0JDcWDaaIL4FjHylIsml8ME4aJkRpL
	alJsaNtWBkVCPlcNAXREDWevu+2ayFcTiLQLM7vVOZw5PCOsX28mOp7jxf7wLyKZjQb9lqF1ui1
	p4xsspei4odZU83KXO/ytTReYvIZnrucSMAfMSdF7mqfivBeq8bIOQsjvJMRtHVuF7QOSJPvyqN
	Um9Ho/IpIv6ty++UgU8r1AaTzmO8CRpLxIWHttri8oQV9WaGL8NdQeShaTI90zzCQj0Kx4GjK9K
	4T9+48YE0mrFN7oGCwAebLUAMECENCLONahkrvGCSui8vpab4CKUex4VT7Q9IxnLqKAgL0gt6r/
	wZPB9mPScgao/w4ryZP1r5i6J2vbS0utbde3btVz5IaxrzNqINv1
X-Received: by 2002:a05:7300:a506:b0:386:c960:278 with SMTP id 5a478bee46e88-386c9600557mr13797608eec.17.1795785905017;
        Fri, 27 Nov 2026 05:25:05 -0800 (PST)
Received: from 192.168.1.36 ([2402:a00:163:2ce9:b15c:e4fe:6de1:494a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386992b404bsm59082431eec.1.2026.11.27.05.25.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 05:25:04 -0800 (PST)
From: Ajit Singh <blfizzyy@gmail.com>
To: romain.gantois@bootlin.com
Cc: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heikki.krogerus@linux.intel.com,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: usb: ti,tusb1046: Document no-hpd
Date: Fri, 27 Nov 2026 18:54:48 +0530
Message-ID: <20261127132449.89081-2-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261127132449.89081-1-blfizzyy@gmail.com>
References: <20261127132449.89081-1-blfizzyy@gmail.com>
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

Describe boards where the TUSB1046 HPD_IN pin is not connected to a
usable HPD signal.

Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
---
 Documentation/devicetree/bindings/usb/ti,tusb1046.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/ti,tusb1046.yaml b/Documentation/devicetree/bindings/usb/ti,tusb1046.yaml
index e1501ea6b50b..8d09c98ecd42 100644
--- a/Documentation/devicetree/bindings/usb/ti,tusb1046.yaml
+++ b/Documentation/devicetree/bindings/usb/ti,tusb1046.yaml
@@ -20,6 +20,11 @@ properties:
   reg:
     maxItems: 1
 
+  no-hpd:
+    type: boolean
+    description:
+      The HPD_IN pin is not connected to a usable HPD signal.
+
 required:
   - compatible
   - reg
-- 
2.50.1 (Apple Git-155)

