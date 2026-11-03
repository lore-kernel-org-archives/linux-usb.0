Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736126;
	b=VDlvxmlznCNUoSMswohepz05nRjo3KcRsuMov4Q4AHKrUMUzENEvTHbwFaoi+kiN/LlQ
	 E7ksx3YgvGhLMJlT5cg36TNosQSUPpmPUV6HSQzu7PAs4d0md5TtrQsD7wTrZwkmJntIi
	 bnGoM49SsGkZ/lLgDdyYzXPLejOixXb07kA2H0YUt5qhr8JpB5mQfCbxj/yg+FtrirlMl
	 A0N++GrwSJdPYVkPdNCWyFNGQP51ZXyK2H4woy0p2E9s85NsEQ0BaSgRI/Y6bJyoStppQ
	 RGVFVQrOBNEjzZuaxb2doEGdKIKBKlP58ck6/VMO2Vh74XUso19K+3hdvzNbTSOtXdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=E2l2TOZJTANmK27Z5fkp2kfkOwSwxws+BNcI1S5L/F4=;
	b=3U63w87xVoSzt6e5BrC5Y7Sy7H+/n6AI4w2lX/DK/BgqS1DNlyYhqDME0yVctAID/oyo
	 CaXtoScMBv+gFLWQG4y2aQGMxSO9AHW+RSPiTQj+3TMwqUcqmZzYnqTJV7M4WnhqbxIt8
	 mybbAhVBr8BYqS/25eF36zhma9/orp/eD9PYDKHoG9QYZ/hEc6asIiVoozNWxLfngi9MA
	 PxWjNgdPzPr0BbocE8zmM2o06X0ylUOBzH32qEm+hYpy4W5a2attc4qnDu1IvLRwUSpze
	 81K4gUWmfGkA5SoH1ZIuA75/eKPW9gV47m0kGWsjFfRRpJhLJ6eKLl1rFo0thCK4+hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eXFt6lcX;
	arc=none smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174F0606A31B
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 20:02:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 174F0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eXFt6lcX
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b125371596so9976427b3.0
        for <linux-usb@vger.kernel.org>; Tue, 03 Nov 2026 12:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793736124; x=1794340924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E2l2TOZJTANmK27Z5fkp2kfkOwSwxws+BNcI1S5L/F4=;
        b=eXFt6lcXyY3xz3GUePc/hTpzjE21KaHxC9VhQ4OjdgZ7mu6xqRudA6K0t6Kan9O05l
         Uh5wT4aIBZubCXlCChyNxfv9Pdmx/AHENFxOoXsPtGyRNFxdHLsVyA4SsI++ytX5uH1W
         L2Sr/4gU5IzOAOuScDzrw1AGuwADoaGly6TQFASZJF6R5hC43vh6WyJlhD3gm9YWZzMo
         7dC5X52Hn/hBKMm0+fbSvmZMMapPJbUCVhu4+gKoP7Jc1aulmoXw84Tc4hPdkOyCNTOK
         WTmfR0m/wgCVKW7hPxnzqT/1qneSgNTgr6s9oFm9pCYJDo7zBJgInnXpY0dUCvs69jrV
         m/mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793736124; x=1794340924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E2l2TOZJTANmK27Z5fkp2kfkOwSwxws+BNcI1S5L/F4=;
        b=mprMgzbNDprb6NAbtVe0xiTTkiQtxabD0eSxa5HZDuhp/vMhKUBPhw2JhEIDH7XbSS
         F2cn/V4/y1ji6z8br1m//NwlEhoesqOlTRjc7jZGHvVAOV2TBlfVJqAR87DYoPLs9QkY
         K+/eKmepuxs094PfDzet2MroJuFD2SrWLcrC2gU/kX5/FvuNokt56chORz5hccYP57fC
         vRceph+MmaAS3LeGEJn0Q1Le2E1C/ezNXmdvLKNqRSxogP6RtvaDHpI3liuP8LY165sO
         kDwF+1q45vN//0QjhWRvgokVQxuipKHsJeATDeSo26yTJGOORAHTJYvs2GrebzCYK9IN
         fsGA==
X-Gm-Message-State: APuU4Z+uHWbZMJgKyr9gq0ZkKGO1Ibz+5Hrh4Uedsd6Tin2wystD8Aly
	oH9yfKTYBIqxzcXih2qsr83a9PsiytpP4qO537kL6y2IMK+TkLB22EGB
X-Gm-Gg: AYBFou1Hlaijw+8Is/ToIy5TM4YlEL1zjhojSvz1RFpOpWEdhv2CYvJudAvVfmGZRzw
	7Iz7e5bIeqXQUPPuItIf1HePdChmDc48t4qgKujNhKU72M5sLQUUCqDCLKaRw/GG958mHRKYal1
	n4/4urikYyrnIzrni/OMBwpm8BahE43yaDq2RjT3+hXMwi7FkU3nCrm6f5et79LwP9ZVO/AoNta
	g3JCquUkDrVT1MHrFiH5i8QjqfAlT3E+d854M0qdz+D0PVcO8ZlYEGEuHIOm8YHEAAS3DTNRPiK
	GelT0AOGgea85r0kufzq+XP1oR9B7EZHgb4A1vvhj6jZiTFnDcDd4ZZGnvD1LsEY0iL5ziveJCU
	cGDiMww8M8rLAPZ5vnxSz2ANlEKNq/q19HG+qV+34anKL4YuPK47DwaFY/3zU+S+zP5Gx1cRI3L
	TgGKm0oZik3g2/JnnVDTf9wKx1iv4u6Q/so5vOi/ClCta8wfivSCjfzWQbJkBXTG+a/e7EpjP9l
	2TeIrEQCHBm7FcOG2A94bcLRFvMC1b5NnoLbZ3h/UW65DEJFmqQpsA+KJWhL4PDf+ybF7mH8x/N
	laevtLI4FxAl6louc2sQQxwiW9gFDORmfZPWL3+M+RitxfgDhtqu/zIqcahhd/f6Ashg7e5e
X-Received: by 2002:a53:d585:0:b0:677:d023:49c5 with SMTP id 956f58d0204a3-67ba4f07d96mr7810553d50.13.1793736124116;
        Tue, 03 Nov 2026 12:02:04 -0800 (PST)
Received: from Abelha2665.autotrac.corp ([149.78.105.186])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67bee245f70sm92764d50.11.2026.11.03.12.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:02:02 -0800 (PST)
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
Subject: [PATCH v2 0/2] usb: misc: usb251xb: add DT battery charging configuration
Date: Tue,  3 Nov 2026 17:01:52 -0300
Message-ID: <20261103200154.125681-1-jhonwilker0112@gmail.com>
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

Add a Device Tree property to configure battery charging on selected downstream
ports of Microchip USB251x hubs.

The first patch documents the battery-charging-enable property and adds an
example enabling charging on ports 1 and 2. The second parses the port list and
sets the corresponding hub configuration bits. Charging remains disabled on
all ports when the property is omitted.

Changes in v2:
- Only parse battery-charging-enable when the chip variant supports battery charging.

Jhon Wilker Rodrigues Aquino (2):
  dt-bindings: usb: microchip,usb251xb: add battery-charging-enable
    property
  usb: misc: usb251xb: configure battery charging from DT

 Documentation/devicetree/bindings/usb/usb251xb.yaml | 7 +++++++
 drivers/usb/misc/usb251xb.c                         | 6 +++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

--
2.43.0

