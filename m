Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793732134;
	b=syHbvweKUvFeZZ5k1+lAWh+7MMrGyMdvuvWqSj3e5pr2K/X83n+x969FAfEsJcWz7TYq
	 EnytgdKwvyBgj7FNaItH744HgdEAbW3MahbceqmVVoBLk+Au0maewouc9AelFgSbiBv7m
	 ZFP1vrEOw1or15/K2ahgVi2bJf4dRYqmRBztqkcNQOGWz+2aCGKTuOaetqfV2sI2PZ5rl
	 arTacR8dXTynHCj9219rSHHq5rJu6OGhoW91AzIq4alw5JZq6rLOR2xLKcLlNepou8nPy
	 gDQxEqfqM6NjdYOIphJMQExuNISeiUjc5S6KkZTkfL/gcj33VsjJ7xBrh7vrL1Td9eA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793732134;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Q52uD5mO5l7I73CKeFvIMYM58IICKJHs7MHknkb2HSk=;
	b=ueOZ9fNjWP1H2CNaTtAilmGl/UHaPpnw9lIaSJK1ZclK03OMDkG5KCUzQHC0DasF/T7t
	 1MAh6TMK5G6Rels+rtBNsk/1II41KkLEuJyCt4gjhQkbadnxjQNXc1R2MDfXJJUwQldCj
	 7pf3Hjg5IdENHQlUKviHznvTNwM0kIghh1J3r45IjWYmijpFxObb0ivLeM7x/YGS3WcYb
	 PP9FbwOA2voC3kZlWfM3sOpJiZXUWVRhX+Gqr+8kQlZq1KZXdZXm+EjPAifPBnpNbRA9r
	 VH9oUhdxvokMJGO1kc1M/p8o3hIQaLRU2ZgrUkPCo1LQ+G5NeT1clxos5UTBiAnT5tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=syg6yrif;
	arc=none smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9E8606A326
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 18:55:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE9E8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=syg6yrif
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b0d126f631so44959767b3.2
        for <linux-usb@vger.kernel.org>; Tue, 03 Nov 2026 10:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793732133; x=1794336933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q52uD5mO5l7I73CKeFvIMYM58IICKJHs7MHknkb2HSk=;
        b=syg6yrifhO5FTvdzlCEBvgnMjoFlztt1yUAw6S7eTwC9mV5HKfSS4MR8FKC4czBFHG
         6xs1rkdd7ydVYl+mog73EOkUDiSCMZK0ULtxNLHv+IyYqzDOfqq8v2C3fVtch9yQYiec
         VN9WXayjq5nFdA1VK5ngCZ0JjXCCusjw3SRrYmj+Z9ZZ4g1iYEhesbZ6QP29LpZlcpoO
         spx32SIImKCS9MgneH5mH3qGEBhlHKRHdh7RY+ujLpIzWYW8mLaPMEDcluMik4vY5lhi
         jJTy9H7PB2Dr6SsB/PwUyzigFVjRzhchE5jRD/STHi8T1Bahm69tZAJqtIq0vr/5+gVV
         FeJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793732133; x=1794336933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q52uD5mO5l7I73CKeFvIMYM58IICKJHs7MHknkb2HSk=;
        b=LTysXf0oLX+oxGGlV+YgmleBIiX/z3rcoUz/pqulD8X30EKCkB7v8VYFQ+hjfoHej/
         NMzGe5Rwmqt3rT1CBvEtBKdwQN8EnloR/Flv5HrMUHj+bykUX9EpNBNH1xBbenlg6iVV
         4nAvUZokDGrsGCqkb6aHCCp2Vau3lUpvPQMrS4gpFv13MsSZZ1/KMp8ac1aZHrKbelFf
         7Ogaaq46O7OhFwQSYvUzmcjklWEeYZcmSX3UL93H5aIDbKE/PPmIyztbXxbbLA/yVqf7
         ZIN2X1yo5TaP3gyIMtJzw6YOiPeh4pS5Q5wenhpXW9sHt6ElWIM13sbm7+B2wsCocDDu
         RBug==
X-Gm-Message-State: APuU4Z8re8hUSYIGDCgUubG90IXd41spB8cpi/go1M3wW6KouRhR3NFo
	AFKShUsyN4+iZorfDvmX7rMv/TmGrXv7vpC9wK/1XV7y3EzOUCAzyfbp
X-Gm-Gg: AYBFou0DSb2agGoTTQ8CXlLtmmyzkOXPq4ovq/IqwF1gnJAJ3bWp36xy5RdOLoGRXDG
	gs/r9E/7lIjnRNCRdSzzu5sOfcn6LUIzezgJ7EJP9wAwIEC4yPxMBY6qjo8Jo3Dx1Rt6wAtcMJN
	RFG+ZtOSY2lVBWvqREMveyjcXiDRkkLKwvorsJXUxVMHBlDdftuSj0SwOIC5EEayZX0ln3Wu769
	uwBwUrrB6d3ADi9P2XRURNfjrG20MvFWcaDfgW7nrTgT+nYjqMOoRk5QUuhIWeAAxn6sf32hxej
	yh6R4i6+ZwYUUyCHUSgM+PiXgfpVTIP1JwyHKkvdXtRho/UGYR4acGVJapKjl+6jZnN9IYY7zh9
	2LZjsey0vnPPDC3A9QhfHpRNkdk8QuTjLyMdxM0WHZHU4fRUMGQp3jFBxwbZAiuBltoiZcy5jkT
	Go0Ie+XhLgoturP6zrLGXhwAPd8xJi1wkS7ijP/Ql2zGliOuoBALcC3jbQct/no83E1ByxTqnvw
	Sbrapi6eS+7decftKtfyuW32qlG+vm5ED0YbNRcxbgFJv+sPDKPOuMBtsqFJAysOzDD/lN9YwFy
	QlnicRyPzFf0clJasNOtYLA1QhwoSiNpcXHWZcNU88GgmlHHP8M=
X-Received: by 2002:a05:690c:68a:b0:8b0:aba3:a3e2 with SMTP id 00721157ae682-8b2b671ae36mr104605737b3.37.1793732132595;
        Tue, 03 Nov 2026 10:55:32 -0800 (PST)
Received: from Abelha2665.autotrac.corp ([149.78.105.186])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b30992b0aasm2880387b3.17.2026.11.03.10.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:55:32 -0800 (PST)
From: Jhon Wilker Rodrigues Aquino <jhonwilker0112@gmail.com>
To: Richard Leitner <richard.leitner@linux.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jhon Wilker Rodrigues Aquino <jhon.aquino@autotrac.com.br>
Subject: [PATCH 1/2] dt-bindings: usb: microchip,usb251xb: add battery-charging-enable property
Date: Tue,  3 Nov 2026 15:55:13 -0300
Message-ID: <20261103185514.72144-2-jhonwilker0112@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103185514.72144-1-jhonwilker0112@gmail.com>
References: <20261103185514.72144-1-jhonwilker0112@gmail.com>
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

From: Jhon Wilker Rodrigues Aquino <jhon.aquino@autotrac.com.br>

Describe the battery-charging-enable property as a list of downstream ports in the USB251x device tree binding.

Add an example that enables charging on ports 1 and 2.

Signed-off-by: Jhon Wilker Rodrigues Aquino <jhon.aquino@autotrac.com.br>
---
 Documentation/devicetree/bindings/usb/usb251xb.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/usb251xb.yaml b/Documentation/devicetree/bindings/usb/usb251xb.yaml
index 0329a6aaaa928..0eb3035553c37 100644
--- a/Documentation/devicetree/bindings/usb/usb251xb.yaml
+++ b/Documentation/devicetree/bindings/usb/usb251xb.yaml
@@ -230,6 +230,12 @@ properties:
       Specifies the time it takes from the time the host initiates the
       power-on sequence to a port until the port has adequate power.
 
+  battery-charging-enable:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: |
+      Specifies the downstream ports which will have battery charging enabled.
+      Battery charging is disabled on all ports by default.
+
   swap-dx-lanes:
     $ref: /schemas/types.yaml#/definitions/uint32-array
     description: |
@@ -264,6 +270,7 @@ examples:
         manufacturer = "Foo";
         product = "Foo-Bar";
         serial = "1234567890A";
+        battery-charging-enable = <1 2>;
         /* correct misplaced usb connectors on port 1,2 */
         swap-dx-lanes = <1 2>;
       };
-- 
2.43.0

