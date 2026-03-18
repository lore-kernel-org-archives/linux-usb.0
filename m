Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016A23A9D9C
	for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 09:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773825845; cv=none; b=HZ/FnMua/NS4t+Qx1nW9fYH4u17tX4+dnCXyDIg5e/gky8EdJjTJ26UuUcNej4CJSSC5MhJ249/cV+yCpJiF+SEIPFuuyuwo5SQ/9O6n6qVJVwqmbli2PIHuqJSwxdfUp/bkewU8KGinpTub6ojzhV3TkyO2tYvsf3DIbz2N07I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773825845; c=relaxed/simple;
	bh=T+J1OY8trN/7RzkbAWgyzywsuUmbTSqBleeNAx93u6E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZITkJlwmw2p6u0NB/eeFh+AnkVCNNFzIQybTsgmJunW48FrtjeI7CNg4JnCOOe9YQspbDyqpl4a2CmddrlAGODdpKAvuwddU2pvaiG9V6lmpi/ien9iOsbX140K1BKf6vgNz4ePiFVWliJqZT0D6Q/Cq6Wf50exxjaAGO2LZPrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=OJhjC7fb; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="OJhjC7fb"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6670ba39400so3330279a12.3
        for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 02:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1773825842; x=1774430642; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S9sCFNxATE1UQcKX1OKooIck8dS1xOFB94Y0TqD1Dbc=;
        b=OJhjC7fbkuMrHPhZAevh5QbspRtSKQRKjQhe/twBuQ21a8iD8t7qggNE6sQgCANlRZ
         NaslCEnGs8iQbbH3t+kUj+GFmd6G+n5jcvr+WrbefcLiUhhW+BfwX8unAgbkD8fhVdX8
         Rl57fsg1NevLo6NMjYwZd2HtAai8HN4ac7VRdZUN/7tOQURxYdBweSM63VV7bGJL3GzX
         RcmxMJwK8eL4i7qMcYInRDNpR6bnGmjvnqzAjaVQH3eczpjJtv9oDVxgiUYBw3ju3Jps
         FMAT4idJct1WvpxP454/ynvE8sn1y5NVzjHtP01IYsnjVlDClBuXcWJwpLHrGKfqpQ+r
         4VNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773825842; x=1774430642;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S9sCFNxATE1UQcKX1OKooIck8dS1xOFB94Y0TqD1Dbc=;
        b=JCqmZhSg6uBvKbCgrynUY4rgv0yozOftgFNrPjCWOXQJKc0/pTY5zM7W+s/iIejCVm
         Zcxx+oCe06tuANAz9+aB7rWjAhKGdi/0+W4CSkhMG9BE+B558TdAeQXwCj25ZSJGx0V+
         W/jsL8EFzBgqgpu9XdXfdGQyLgzIIieUHzh0SkwVSX9v7F2FficL+llBxBEQj2RtGeMJ
         Xmk1q5Rm/Se3mA7Xje+mJqGBqvkZmio7k+fGwMzaN2tuMKdk9Caih0RtG9NAdi8dOjYi
         RzZxgWyonoIOjb74IMmYmm81NwQc1ZUA+1kcZR4Xwimw3BMChmwQrYTnHyUnN6TiRi55
         qR5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUjZGVu5AbaVOHq+rEe50vzzXvVnYvM5gB/cqOcogiiF4FPpQz9ut5z4zTNvizAsvHrs3gLilTcQfE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk8KDaymFwhZby1vqBhtFYoPzdjjGm8KjXT+A9+EAA1qEi30aB
	56hvY9LqEsZA7aCPd+o711qBpn2r5XKsdMTfHaXGNLycvDkNTHNwGaP+gowkbaRJnhY=
X-Gm-Gg: ATEYQzzeFaQ5yCW5C0hBlR4xpHS+H37vZayPG2sgSccjcJZIlnAuEY0qKZ8vRregT0F
	4AG7q1QCMAI1RjVvodycZXpFIrKOuiuJQ4rM/S/R9O25uV+KmbN3j8f5w4eHo81oCSG6bf9sSSR
	Trdyfm7WtwVX+P7sQ3KVB6zGtOYS8flKn0MaRQhIzH28Zah9OhF7bnraazSo6Y6c3DWGJ8Tj+oG
	ZY47lC3iSAeYmECVj47q7TIpQlNwmiOrzGwlyCd3Q/S0BqGwb74o14woQwjmRXn2RfqfwFKuwMp
	4/ivXy+LGJL5tGimW5G49KeEDlac/UMgoeG2LN7uzQXqeEZT4et6OoIDqhUmtds2n1kKsnQbJnd
	YLM60DcIvvJVKoy9QNnebooqFxmyYqma3yhPZQJoWop2KpFjfvhVQfa6422ZA5tSoFiUV0fL8cy
	JpZdGgL0qlrnXxkLZIzhUFGbY7SqKZChvyWDFkGioMwq4=
X-Received: by 2002:a05:6402:2810:b0:662:b884:d1c with SMTP id 4fb4d7f45d1cf-667b253300fmr1975302a12.10.1773825841765;
        Wed, 18 Mar 2026 02:24:01 -0700 (PDT)
Received: from alchark-surface.localdomain ([193.32.126.212])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-667afb4cf11sm1309970a12.13.2026.03.18.02.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 02:24:01 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 18 Mar 2026 13:23:43 +0400
Subject: [PATCH v3 1/4] dt-bindings: vendor-prefixes: Add Hynetek
 Semiconductor Co., Ltd.
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-husb311-v3-1-2b32e6192b9c@flipper.net>
References: <20260318-husb311-v3-0-2b32e6192b9c@flipper.net>
In-Reply-To: <20260318-husb311-v3-0-2b32e6192b9c@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Gene Chen <gene_chen@richtek.com>, Yuanshen Cao <alex.caoys@gmail.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Alexey Charkov <alchark@flipper.net>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1010; i=alchark@flipper.net;
 h=from:subject:message-id; bh=T+J1OY8trN/7RzkbAWgyzywsuUmbTSqBleeNAx93u6E=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTuytfIO7fhvNKcjyW3Sl7ck52wqXjeg/uHJibk3DrBL
 nDUaYmfU8dEFgYxLgZLMUWWud+W2E414pu1y8PjK8wcViaQIdIiDQxAwMLAl5uYV2qkY6Rnqm2o
 Z2ioY6xjxMDFKQBTXcbJ8D+hVfBe7M0n9qL2B8y0mhxqDylFyah/+7B+x7qytZPr2DUZGSZ8e6p
 xveiO467K1J5nDwLvbvPzlvbquC7xZtXb4IWp2WwA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Hynetek Semiconductor Co., Ltd. focuses on intelligent energy control
technology, mainly for the intelligent fast charging and digital energy
fields.

Link: https://en.hynetek.com/
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5a806faf7170..3ffb1a8e24af 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -747,6 +747,8 @@ patternProperties:
     description: Hycon Technology Corp.
   "^hydis,.*":
     description: Hydis Technologies
+  "^hynetek,.*":
+    description: Hynetek Semiconductor Co., Ltd.
   "^hynitron,.*":
     description: Shanghai Hynitron Microelectronics Co. Ltd.
   "^hynix,.*":

-- 
2.52.0

