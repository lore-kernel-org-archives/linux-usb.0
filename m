Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793732125;
	b=WRdaOUjOfY0pqJTqro1yNrwO2XV08nPhkzn/7MHCuZEl7Gu8JRXvMGSaBOsbYMtfg5Hk
	 yG3XdtVUb2M87DJP8nyl2zWF3O2rhW4IZg35A36YR+YmDW8VBZaY3LFSDmmMthIlV12kZ
	 KrLsQdGG6qfY7dFAqTcN1MfdWCWhDS/DpZcILelDYZeccRZK7G1xG25aeHt6T/QDycs6s
	 GELQnvMgNOCAR755aUb3tH/jLw/zzpAg237fRwFMHI7ibHwSANg+h/bFT79ZRzRsA3HrR
	 gXaeQMKB2kIVKos+XW3FBDMgT/eJsZG1kDQIY293I1P1gzI/vqkJriprySQMRvN+tcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793732125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=laaIitkwtRfz/Rs2RC4H6OGZqHzByif505hVOcpyuGs=;
	b=NlT4mj4UU0mNMzQ1mM0XsIuLd8trlQ95cts9QrcHXNPK9KSuFJMfvc5xGdRLZDTM8LCQ
	 ItiwEXZjCZfOcicHAz+Zue43DspaGlBC9EeMIyjBYCQ0e4liLgIcx6BpbiV7x40Nqfnyy
	 caUHN22Ke4RxleFAB+hv6oVSBwSsfeUvbsz3sC72uyIz9p723futwoY6UtRBtAdS6cO1J
	 qRa/HT23vTs/hni0dO34sxmRQQ4S5XimxCwX6z1x2yl6A6nMXk4kewuFe89q/Xv+hky0k
	 1bCppfGZ6Kp1GYeFRuajy4Sf6pEcluZQ5uatnxQyeP65+/z2fj62A4OTkxLGMqBoJYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tkdbF0z4;
	arc=none smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039D3606A31B
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 18:55:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 039D3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tkdbF0z4
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b0f59a5fdaso42374127b3.3
        for <linux-usb@vger.kernel.org>; Tue, 03 Nov 2026 10:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793732124; x=1794336924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=laaIitkwtRfz/Rs2RC4H6OGZqHzByif505hVOcpyuGs=;
        b=tkdbF0z4yZRft389WuN/ZrjOIuPjxAA9Ugq9HfjOgx4SmV3kmI+0ffJv3VFnc1nLZc
         VKTaE+c2sgiJ9f6myskdGVQhcmvy2HvtyiA2EvYOZ1no19s4vdg5vMx+aSB2WTPefTho
         7UWiwz3Yl9xe0DEG8xG6yBQjf7AqIT878JCdFVQSppfAxRLn3OglXfeykQLFrUx5SrpR
         33FmvT2PDbmQECyw5w/4uIKABDEKSXWTlEo+tsblMVqWxNKmu0jNN10K27q6DfW/YpV4
         umEZnXeBV9HCT0lEmCItrcfTr5DGq9phvLog7+BERbaRauigtS/dN9ZWTWsPlodlANVf
         Ga2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793732124; x=1794336924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=laaIitkwtRfz/Rs2RC4H6OGZqHzByif505hVOcpyuGs=;
        b=RVVIxDIRl0Rt2l5OcCG2rPM4IcowdJWKmlgmhdVtCWaRtRYogp8YQNw+CPIPYATUh6
         rbhG+yAz+o/tXwFFxHxyDJSiJY/J6WGEu8cu56F0CynNNcg3APvWhldWfrzUymBxsC9Z
         DcipxetnClz55RQJOwb4fMz+h8XLzfoejn9SUOMDk1fV+wrXKapwQBNQugeUzwDkywrq
         UR93yRYYIeZl2HEhvnKdrBwvQEhupYbb/GvLvdctac4BvH+CP3kixCgSFleTM5D7NRKC
         HbriBZlwtwvArQL1TNNkqLJm50zL6g+eT7uqVlBXX3395NbpIxO0wUCYZDGbp/wWlxw4
         0M3A==
X-Gm-Message-State: APuU4Z8ekOdIrnwvb7xRqG+XYL/SCHerFheYX0hV3Oah4MBkzW5ntyB2
	fIVRQCOqsquJ6iNJPgLQxoPO5GL3tLJHdzR0uccB9matFG8qGlFzK1sE
X-Gm-Gg: AYBFou0Uh+Bx6Trc4YyD5ltZq8SPynATO0Kc8F929I+/Dua3Nyx8LFqanUVrd+pMICR
	Fa8aBJNWaVphnCxCRhxsjfYpAx23YqbakirT6NieI43qxL2QRY7QijOEfEWwfgv9d6oMvOfQYz/
	mfAfUSf8U9b6hDxkMYebxk+B18I9SG+c6bgUZhUiQnYrs7flDpoJf/wpwsbLMkD9brvptOfQVKs
	zohPz+99PSPMM3m+/g2WnDyRa+IsLTNmA4yon+rPJ1eF9hDJYz1n14R5yTdKLoGdTxmZ+lDfJGC
	Tut1IC6J/CzTnzfJut5l6LIZ1i7brZZ6gNJLmVefOUDETayhp2pb7cVIUWZypzoUnGHLt8uR+s2
	s+bTo3DINqp8RaraeKn6Gc2xf0lx9xyjhAAzb685W3j0Npu3wib06uAm17eJm2QENeIpnL2ByhY
	+yCUzW7COlxC8Ru1IjP5jIuyOqdxa6xkvlj5Ak4g57DK4Mx8A3w0xou2aHZ2iLtcCOsDmD9ETps
	JWinlo52aergutkZtq4gZ8Vyy/6lv4SEavoEpj/Y0kCAAbU+rcQoNADE3tjL7ju++SkvDf6zi/j
	Ox6hRLFLtPi+UQ56V7T+XHoXl8lRhP4lxx+ZBH17nSegH8ZaYfygzqtK9jP0tP5LeP6B2YQ6DA=
	=
X-Received: by 2002:a05:690c:f82:b0:8b2:edac:7a63 with SMTP id 00721157ae682-8b2edac7b42mr47668977b3.58.1793732124079;
        Tue, 03 Nov 2026 10:55:24 -0800 (PST)
Received: from Abelha2665.autotrac.corp ([149.78.105.186])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b30992b0aasm2880387b3.17.2026.11.03.10.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:55:21 -0800 (PST)
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
Subject: [PATCH 0/2] usb: misc: usb251xb: add DT battery charging configuration
Date: Tue,  3 Nov 2026 15:55:12 -0300
Message-ID: <20261103185514.72144-1-jhonwilker0112@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Add a Device Tree property to configure battery charging on selected downstream
ports of Microchip USB251x hubs.

The first patch documents the battery-charging-enable property and adds an
example enabling charging on ports 1 and 2. The second parses the port list and
sets the corresponding hub configuration bits. Charging remains disabled on
all ports when the property is omitted.

Jhon Wilker Rodrigues Aquino (2):
  dt-bindings: usb: microchip,usb251xb: add battery-charging-enable
    property
  usb: misc: usb251xb: configure battery charging from DT

 Documentation/devicetree/bindings/usb/usb251xb.yaml | 7 +++++++
 drivers/usb/misc/usb251xb.c                         | 5 ++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

--
2.43.0

